import re
from enum import IntEnum
from typing import List, Optional, Tuple, Dict, Set

from pycparser import c_generator, CParser
from pycparser.c_ast import *

import generator
from generator import EmptyLine

import os
from pathlib import Path

import subprocess

from optparse import OptionParser


class ArrayDesc:
    name: str
    desc_name: str
    unsigned: bool
    bits: int
    dims: List[Node]
    ptrs: int
    tp: IdentifierType
    is_global: bool

    def __init__(self, name: str, unsigned: bool, bits: int, dims: List[Node], ptrs: int, tp: IdentifierType):
        self.name = name
        # self.is_global = ptrs > 0 or len(dims) <= 1
        self.is_global = False
        self.desc_name = ('int' + str(bits) if self.is_global else name) + '__desc'
        self.unsigned = unsigned
        self.bits = bits
        self.dims = dims
        self.ptrs = ptrs
        self.tp = tp


class ContextType(IntEnum):
    NOTHING = 0
    FUNCTION = 1
    LOOP = 2


class ParserContext:
    parent = None
    lines = None
    which: ContextType

    ignored_paths: Set[str]
    types: Dict[str, str]
    arrays: Dict[str, ArrayDesc]
    globals: Set[int]

    def __init__(self, parent, which: ContextType):
        self.parent = parent
        self.lines = None if parent is None else parent.lines
        self.which = which

        self.ignored_paths = set()
        self.types = {}
        self.arrays = {}
        self.globals = set()

    def extend(self, which: ContextType):
        return ParserContext(self, which)

    def close(self, nodes: List[Node]):
        if len(nodes) > 0 and isinstance(nodes[-1], (Break, Continue, Return)):
            return

        for name in self.arrays:
            arr = self.arrays[name]
            if not arr.is_global:
                nodes.append(FuncCall(
                    name=ID(name='free'),
                    args=ExprList(exprs=[ID(name=arr.desc_name)])
                ))

            if arr.ptrs == 0:
                nodes.append(FuncCall(
                    name=ID(name='free'),
                    args=ExprList(exprs=[ID(name=name)])
                ))

    def free(self, nodes: List[Node], until: ContextType = None):
        if self.which is not until and self.parent is not None:
            self.parent.free(nodes, until)

        self.close(nodes)

    def lookup(self, name: str) -> Optional[str]:
        if name in self.types:
            return self.types[name]
        return None if self.parent is None else self.parent.lookup(name)

    def bit_count(self, tp: Node) -> Optional[Tuple[bool, int]]:
        while tp is not None:
            if isinstance(tp, IdentifierType):
                match = re.match('^(u?)int([1-3]?[0-9])$', tp.names[0])
                if match is not None:
                    i = int(match.group(2))
                    return match.group(1) == 'u', i if 1 <= i <= 32 else None

                tp = self.lookup(tp.names[0])
            else:
                break

        return None

    def get_array(self, name: str) -> Optional[ArrayDesc]:
        if name in self.arrays:
            return self.arrays[name]

        return None if self.parent is None else self.parent.get_array(name)

    def add_global(self, bits: int):
        if self.parent is not None:
            self.parent.add_global(bits)
        else:
            self.globals.add(bits)


def alloc_array(name: str, desc: ArrayDesc, node: Decl) -> List[Decl]:
    dims = desc.dims if desc.ptrs == 0 else []

    stmt = node if desc.ptrs > 0 else \
        Decl(name=name, quals=[], storage=[], funcspec=[],
             type=PtrDecl(
                 quals=[],
                 type=TypeDecl(
                     declname=name, quals=[],
                     type=desc.tp
                 )),
             init=FuncCall(
                 name=ID(name='alloc_array'),
                 args=ExprList(exprs=[ID(name=desc.desc_name)])
             ) if node.init is None else node.init, bitsize=None)

    return [stmt] if desc.is_global else \
        [Decl(name=desc.desc_name, quals=[], storage=[], funcspec=[],
              type=PtrDecl(
                  quals=[],
                  type=TypeDecl(
                      declname=desc.desc_name, quals=[],
                      type=IdentifierType(names=['ArrayDesc'])
                  )),
              init=FuncCall(
                  name=ID(name='alloc_desc'),
                  args=ExprList(
                      exprs=[Constant(type='int', value=str(desc.bits)),
                             Constant(type='int', value=str(len(dims))),
                             *dims]
                  )), bitsize=None),
         stmt]


def nearest_num(bits: int) -> int:
    for b in [8, 16, 32]:
        if bits <= b:
            return b

    return 64


def array_get(arr: ArrayDesc, indices: List[Node]) -> Node:
    return FuncCall(
        name=ID(name='array_get' + str(nearest_num(arr.bits))),
        args=ExprList(exprs=[
            ID(name=arr.desc_name), ID(name=arr.name),
            indices[0] if len(indices) == 1 else FuncCall(
                name=ID(name='get_index'),
                args=ExprList(exprs=[
                    ID(name=arr.desc_name),
                    *indices
                ])
            )
        ])
    )


def array_set(arr: ArrayDesc, indices: [Node], val: Node) -> Node:
    return FuncCall(
        name=ID(name='array_set' + str(nearest_num(arr.bits))),
        args=ExprList(exprs=[
            ID(name=arr.desc_name), ID(name=arr.name),
            indices[0] if len(indices) == 1 else FuncCall(
                name=ID(name='get_index'),
                args=ExprList(exprs=[
                    ID(name=arr.desc_name), *indices
                ])
            ), val
        ])
    )


def convert_array(ctx: ParserContext, node: Decl) -> Optional[List[Decl]]:
    dims = []
    ptrs = 0
    arr: Node = node.type
    # TODO handle quals
    while isinstance(arr, ArrayDecl):
        dims.append(arr.dim)
        arr = arr.type

    if len(dims) == 1 and dims[0] is None:
        dims[0] = Constant(type='int', value='0')

    while isinstance(arr, PtrDecl):
        ptrs += 1
        arr = arr.type

    if isinstance(arr, TypeDecl):
        # TODO handle quals as well
        name = arr.declname
        # quals = arr.quals
        # type = arr.type

        bit_count = ctx.bit_count(arr.type)
        if bit_count is not None:
            unsigned, bits = bit_count

            desc = ArrayDesc(name, unsigned, bits, dims, ptrs, arr.type)
            if desc.is_global:
                ctx.add_global(bits)
            ctx.arrays[name] = desc

            return alloc_array(name, desc, node)

    return None


def process_list(ctx: ParserContext, nodes: List[Node]) -> List[Node]:
    out = []
    if nodes is None:
        return out

    prev = None

    for node in nodes:
        path: str = node.coord.file
        if True in [path.startswith(p) for p in ctx.ignored_paths]:
            print(f"Skipping {node.name}")
            continue

        if prev is not None and node.coord.line - prev.coord.line > 1:
            # out.extend(map(EmptyLine, ctx.lines[prev.coord.line + 1:node.coord.line]))
            out.append(EmptyLine(''))

        if isinstance(node, Decl):
            if isinstance(node.type, (ArrayDecl, PtrDecl)):
                out.extend(convert_array(ctx, node) or [node])
                continue
        elif isinstance(node, With):
            name = node.arr.name

            for decl in node.decls.decls:
                start = decl.start.indices.exprs
                val = decl.val.indices.exprs
                end = decl.end.indices.exprs

                count = len(start)

                lvalue = name

                for i in range(count - 1, -1, -1):
                    lvalue = ArrayRef(name=lvalue, subscript=val[i])

                expr = Assignment(op='=', lvalue=lvalue, rvalue=decl.expr)

                for i in range(count - 1, -1, -1):
                    s, v, e = start[i], val[i], end[i]

                    expr = For(
                        init=Decl(name=v, quals=[], storage=[], funcspec=[],
                                  type=TypeDecl(declname=v.name, quals=[], type=IdentifierType(names=['size_t'])),
                                  init=s,
                                  bitsize=None),
                        cond=BinaryOp(op=decl.rop, left=v, right=e),
                        next=UnaryOp(op='p++', expr=v),
                        stmt=expr
                    )

                out.append(process(ctx, expr))

            continue
        elif isinstance(node, Return):
            ctx.free(out, ContextType.FUNCTION)
        elif isinstance(node, (Break, Continue)):
            ctx.free(out, ContextType.LOOP)

        out.append(process(ctx, node))

        prev = node

    return out


def process_params(ctx: ParserContext, params: List[Decl]) -> Tuple[List[Decl], List[Decl]]:
    out = []
    static = []
    for param in params:
        if isinstance(param.type, (ArrayDecl, PtrDecl)):
            converted = convert_array(ctx, param)
            if converted is not None:
                converted[-1].init = None
                out.append(converted[-1])
                if len(converted) > 1:
                    # converted[0].storage = ['static']
                    static.append(converted[0])

                continue

        out.append(param)

    if len(static) > 0:
        static.append(EmptyLine(''))

    return out, static


def array_info(ctx: ParserContext, node: Node) -> Optional[Tuple[List[Node], str, ArrayDesc, bool]]:
    if isinstance(node, ArrayRef):
        indices = []
        while isinstance(node, ArrayRef):
            indices.append(node.subscript)
            node = node.name

        if isinstance(node, ID):
            arr = ctx.get_array(node.name)

            if arr is not None:
                indices.reverse()

                return indices, node.name, arr, len(indices) == len(arr.dims) + arr.ptrs

    return None


class ParseError(RuntimeError):

    def __init__(self, *args):
        RuntimeError.__init__(self, *args)


def parse_fail(node: Node, msg: str):
    raise ParseError(f"{msg} in: {c_generator.CGenerator().visit(node)}")


def process(ctx: ParserContext, node: Node) -> Optional[Node]:
    if node is None:
        return node
    elif isinstance(node, ArrayDecl):
        print("Unhandled " + str(node))
    elif isinstance(node, ArrayRef):
        info = array_info(ctx, node)

        if info is not None:
            indices, name, arr, match = info

            if match:
                return array_get(arr, indices)

        node.name = process(ctx, node.name)
        node.subscript = process(ctx, node.subscript)
    elif isinstance(node, Assignment):
        info = array_info(ctx, node.lvalue)

        if info is not None:
            indices, name, arr, match = info

            if match:
                if node.op != '=':
                    parse_fail(node, "Unsupported operator")

                return array_set(arr, indices, process(ctx, node.rvalue))
            else:
                return node

        node.lvalue = process(ctx, node.lvalue)
        node.rvalue = process(ctx, node.rvalue)
    elif isinstance(node, BinaryOp):
        node.left = process(ctx, node.left)
        node.right = process(ctx, node.right)
    elif isinstance(node, Break):
        print("Unhandled " + str(node))
    elif isinstance(node, Case):
        print("Unhandled " + str(node))
    elif isinstance(node, Cast):
        node.expr = process(ctx, node.expr)
    elif isinstance(node, Compound):
        extended = ctx.extend(ContextType.NOTHING)
        node.block_items = process_list(extended, node.block_items)
        extended.close(node.block_items)
    elif isinstance(node, CompoundLiteral):
        print("Unhandled " + str(node))
    elif isinstance(node, Constant):
        pass
    elif isinstance(node, Continue):
        pass
    elif isinstance(node, Decl):
        node.type = process(ctx, node.type)
        node.init = process(ctx, node.init)
        node.bitsize = process(ctx, node.bitsize)
    elif isinstance(node, DeclList):
        node.decls = process_list(ctx, node.decls)
    elif isinstance(node, Default):
        print("Unhandled " + str(node))
    elif isinstance(node, DoWhile):
        node.cond = process(ctx, node.cond)
        node.stmt = process(ctx.extend(ContextType.LOOP), node.stmt)
    elif isinstance(node, EllipsisParam):
        pass
    elif isinstance(node, EmptyStatement):
        pass
    elif isinstance(node, Enum):
        node.values = process_list(ctx, node.values)
    elif isinstance(node, Enumerator):
        node.value = process(ctx, node.value)
    elif isinstance(node, EnumeratorList):
        node.enumerators = process_list(ctx, node.enumerators)
    elif isinstance(node, ExprList):
        node.exprs = process_list(ctx, node.exprs)
    elif isinstance(node, FileAST):
        node.ext = process_list(ctx, node.ext)
    elif isinstance(node, For):
        node.init = process(ctx, node.init)
        node.cond = process(ctx, node.cond)
        node.next = process(ctx, node.next)
        node.stmt = process(ctx.extend(ContextType.LOOP), node.stmt)
    elif isinstance(node, FuncCall):
        node.args = process(ctx, node.args)
    elif isinstance(node, FuncDecl):
        node.args = process(ctx, node.args)
        node.type = process(ctx, node.type)
    elif isinstance(node, FuncDef):
        args = node.decl.type.args

        static = None
        ctx = ctx.extend(ContextType.NOTHING)

        if args is not None:
            args.params, static = process_params(ctx, args.params)

        node.param_decls = None if node.param_decls is None else process_list(ctx, node.param_decls)
        node.body = process(ctx.extend(ContextType.FUNCTION), node.body)
        if isinstance(node.body, Compound) and static is not None:
            node.body.block_items[:0] = static

    elif isinstance(node, Goto):
        pass
    elif isinstance(node, ID):
        pass
    elif isinstance(node, IdentifierType):
        print("Unhandled " + str(node))
    elif isinstance(node, If):
        node.cond = process(ctx, node.cond)
        node.iftrue = process(ctx.extend(ContextType.NOTHING), node.iftrue)
        node.iffalse = process(ctx.extend(ContextType.NOTHING), node.iffalse)
    elif isinstance(node, InitList):
        print("Unhandled " + str(node))
    elif isinstance(node, Label):
        node.stmt = process(ctx, node.stmt)
    elif isinstance(node, NamedInitializer):
        print("Unhandled " + str(node))
    elif isinstance(node, ParamList):
        node.params = process_list(ctx, node.params)
    elif isinstance(node, PtrDecl):
        node.type = process(ctx, node.type)
    elif isinstance(node, Return):
        node.expr = process(ctx, node.expr)
    elif isinstance(node, Struct):
        node.decls = process_list(ctx.extend(ContextType.NOTHING), node.decls)
    elif isinstance(node, StructRef):
        print("Unhandled " + str(node))
    elif isinstance(node, Switch):
        node.cond = process(ctx, node.cond)
        node.stmt = process(ctx, node.stmt)
    elif isinstance(node, TernaryOp):
        node.cond = process(ctx, node.cond)
        node.iftrue = process(ctx, node.iftrue)
        node.iffalse = process(ctx, node.iffalse)
    elif isinstance(node, TypeDecl):
        # print("Unhandled " + str(node))
        pass
    elif isinstance(node, Typedef):
        n = node
        ptrs = []
        while isinstance(n.type, PtrDecl):
            ptrs.append(n.type.quals)
            n = n.type

        if isinstance(n.type, TypeDecl):
            name = n.type.declname
            n = n.type.type
            for quals in ptrs:
                n = PtrDecl(quals, n)

            ctx.types[name] = n
    elif isinstance(node, Typename):
        print("Unhandled " + str(node))
    elif isinstance(node, UnaryOp):
        if node.op in ['++', 'p++', '--', 'p--']:
            info = array_info(ctx, node.expr)

            if info is not None:
                indices, name, arr, match = info

                if match:
                    parse_fail(node, "Unsupported operator")

        node.expr = process(ctx, node.expr)
    elif isinstance(node, Union):
        print("Unhandled " + str(node))
    elif isinstance(node, While):
        node.cond = process(ctx, node.cond)
        node.stmt = process(ctx.extend(ContextType.LOOP), node.stmt)
    elif isinstance(node, Pragma):
        pass
    else:
        print("Unhandled " + str(node))

    return node


def main() -> int:
    # import pycparser
    # from pycparser import ply
    #
    # lexer = ply.lex.lex(module=pycparser.c_lexer)
    #
    # print(f"Lexer is {lexer}")

    opt_parser = OptionParser()
    opt_parser.add_option("-o", dest="output", help="Place output into <file>")

    (options, in_files) = opt_parser.parse_args()

    path = Path(os.path.realpath(__file__)).parent
    libc_path = path / 'pycparser_data' / 'utils' / 'fake_libc_include'
    include_path = path / 'include'
    src_path = path / 'src'

    args = ["gcc", "-x", "c", "-E", "-nostdinc", f"-I{libc_path.absolute()}", f"-I{include_path.absolute()}", *in_files]

    p = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    err = p.stderr.read()

    if len(err) > 0:
        sys.stderr.write(err.decode('utf-8'))
        return 1

    code = p.stdout.read().decode('utf-8')
    lines = code.split('\n')

    with open("intermediate.sc", "w") as f:
        f.write(code)

    parser = CParser(lextab=None, yacctab=None)
    ctx = ParserContext(None, ContextType.NOTHING)
    ctx.lines = lines
    ctx.ignored_paths.add(str(libc_path.absolute()))

    ast = parser.parse(code, 'input.c')
    ast = process(ctx, ast)

    global_header = '\n'.join([
        '#include "types.h"',
        '',
        *[f'ArrayDesc *int{g}__desc = alloc_desc({g}, 0);' for g in ctx.globals],
    ]) + '\n'

    with open("array_desc.c", "w") as f:
        f.write(global_header)

    gen = generator.ExtendedCGenerator()
    generated = gen.visit(ast)

    with open("preprocessed.c", "w") as f:
        f.write(generated)

    args = [
        'gcc',
        '-x', 'c',
        '-o', options.output,
        '-Wno-implicit',
        '-Wno-builtin-declaration-mismatch',
        f"-I{include_path.absolute()}",
        *[src_path / f for f in ['types.c', 'impl_compact.c']],
        # 'array_desc.c',
        'preprocessed.c'
    ]

    p = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    err = p.stderr.read()

    if len(err) > 0:
        sys.stderr.write(err.decode('utf-8'))
        return 1

    output = p.stdout.read().decode('utf-8')

    print(output)

    return 0


if __name__ == "__main__":
    main()
