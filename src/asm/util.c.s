	.file	"util.c"
# GNU C17 (GCC) version 11.2.1 20211203 (Red Hat 11.2.1-7) (x86_64-redhat-linux)
#	compiled by GNU C version 11.2.1 20211203 (Red Hat 11.2.1-7), GMP version 6.2.0, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g
	.text
.Ltext0:
	.file 0 "/home/michiel/Documents/RU/Thesis/Parser/src" "util.c"
	.section	.rodata
.LC0:
	.string	"%02x"
	.text
	.globl	hex_dump
	.type	hex_dump, @function
hex_dump:
.LFB0:
	.file 1 "util.c"
	.loc 1 8 41
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# arr, arr
	movq	%rsi, -32(%rbp)	# len, len
.LBB2:
# util.c:9:   for (size_t i = 0; i < len; ++i)
	.loc 1 9 15
	movq	$0, -8(%rbp)	#, i
# util.c:9:   for (size_t i = 0; i < len; ++i)
	.loc 1 9 3
	jmp	.L2	#
.L3:
# util.c:10:     printf("%02x", arr[i]);
	.loc 1 10 23 discriminator 3
	movq	-24(%rbp), %rdx	# arr, tmp85
	movq	-8(%rbp), %rax	# i, tmp86
	addq	%rdx, %rax	# tmp85, _1
	movzbl	(%rax), %eax	# *_1, _2
# util.c:10:     printf("%02x", arr[i]);
	.loc 1 10 5 discriminator 3
	movzbl	%al, %eax	# _2, _3
	movl	%eax, %esi	# _3,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
# util.c:9:   for (size_t i = 0; i < len; ++i)
	.loc 1 9 31 discriminator 3
	addq	$1, -8(%rbp)	#, i
.L2:
# util.c:9:   for (size_t i = 0; i < len; ++i)
	.loc 1 9 24 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp87
	cmpq	-32(%rbp), %rax	# len, tmp87
	jb	.L3	#,
.LBE2:
# util.c:11: }
	.loc 1 11 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	hex_dump, .-hex_dump
	.section	.rodata
.LC1:
	.string	"%u "
	.text
	.globl	dump
	.type	dump, @function
dump:
.LFB1:
	.loc 1 13 37
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# arr, arr
	movq	%rsi, -32(%rbp)	# len, len
.LBB3:
# util.c:14:   for (size_t i = 0; i < len; ++i)
	.loc 1 14 15
	movq	$0, -8(%rbp)	#, i
# util.c:14:   for (size_t i = 0; i < len; ++i)
	.loc 1 14 3
	jmp	.L5	#
.L6:
# util.c:15:     printf("%u ", arr[i]);
	.loc 1 15 22 discriminator 3
	movq	-24(%rbp), %rdx	# arr, tmp85
	movq	-8(%rbp), %rax	# i, tmp86
	addq	%rdx, %rax	# tmp85, _1
	movzbl	(%rax), %eax	# *_1, _2
# util.c:15:     printf("%u ", arr[i]);
	.loc 1 15 5 discriminator 3
	movzbl	%al, %eax	# _2, _3
	movl	%eax, %esi	# _3,
	movl	$.LC1, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
# util.c:14:   for (size_t i = 0; i < len; ++i)
	.loc 1 14 31 discriminator 3
	addq	$1, -8(%rbp)	#, i
.L5:
# util.c:14:   for (size_t i = 0; i < len; ++i)
	.loc 1 14 24 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp87
	cmpq	-32(%rbp), %rax	# len, tmp87
	jb	.L6	#,
.LBE3:
# util.c:16: }
	.loc 1 16 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	dump, .-dump
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stddef.h"
	.file 3 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stdint-gcc.h"
	.file 4 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x163
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x7
	.long	.LASF14
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.long	.LASF12
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x41
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF5
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x9
	.long	0x80
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x2e
	.byte	0x18
	.long	0x64
	.uleb128 0xa
	.long	.LASF15
	.byte	0x4
	.value	0x15e
	.byte	0xc
	.long	0x48
	.long	0xb0
	.uleb128 0xb
	.long	0xb0
	.uleb128 0xc
	.byte	0
	.uleb128 0x4
	.long	0x87
	.uleb128 0xd
	.long	.LASF16
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x10d
	.uleb128 0x2
	.string	"arr"
	.byte	0xd
	.byte	0x14
	.long	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"len"
	.byte	0xd
	.byte	0x20
	.long	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x6
	.string	"i"
	.byte	0xe
	.long	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x8c
	.uleb128 0xe
	.long	.LASF17
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.string	"arr"
	.byte	0x8
	.byte	0x18
	.long	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"len"
	.byte	0x8
	.byte	0x24
	.long	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x6
	.string	"i"
	.byte	0x9
	.long	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF4:
	.string	"long long int"
.LASF12:
	.string	"size_t"
.LASF3:
	.string	"long unsigned int"
.LASF17:
	.string	"hex_dump"
.LASF13:
	.string	"uint8_t"
.LASF7:
	.string	"unsigned char"
.LASF11:
	.string	"char"
.LASF2:
	.string	"long int"
.LASF14:
	.string	"GNU C17 11.2.1 20211203 (Red Hat 11.2.1-7) -mtune=generic -march=x86-64 -g"
.LASF8:
	.string	"short unsigned int"
.LASF15:
	.string	"printf"
.LASF5:
	.string	"long double"
.LASF16:
	.string	"dump"
.LASF10:
	.string	"short int"
.LASF6:
	.string	"unsigned int"
.LASF9:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"util.c"
.LASF1:
	.string	"/home/michiel/Documents/RU/Thesis/Parser/src"
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
