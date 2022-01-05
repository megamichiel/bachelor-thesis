	.file	"types.c"
# GNU C17 (GCC) version 11.2.1 20211203 (Red Hat 11.2.1-7) (x86_64-redhat-linux)
#	compiled by GNU C version 11.2.1 20211203 (Red Hat 11.2.1-7), GMP version 6.2.0, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g
	.text
.Ltext0:
	.file 0 "/home/michiel/Documents/RU/Thesis/Parser/src" "types.c"
	.globl	bit_mask
	.type	bit_mask, @function
bit_mask:
.LFB6:
	.file 1 "types.c"
	.loc 1 7 37
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# num_bits, tmp87
	movb	%al, -20(%rbp)	# tmp88, num_bits
# types.c:8:   uint64_t out = 0;
	.loc 1 8 12
	movq	$0, -8(%rbp)	#, out
.LBB2:
# types.c:9:   for (uint8_t b = 0; b < num_bits; ++b)
	.loc 1 9 16
	movb	$0, -9(%rbp)	#, b
# types.c:9:   for (uint8_t b = 0; b < num_bits; ++b)
	.loc 1 9 3
	jmp	.L2	#
.L3:
# types.c:10:     out |= 1 << b;
	.loc 1 10 14 discriminator 3
	movzbl	-9(%rbp), %eax	# b, _1
	movl	$1, %edx	#, tmp89
	movl	%eax, %ecx	# _1, tmp94
	sall	%cl, %edx	# tmp94, tmp89
	movl	%edx, %eax	# tmp89, _2
	cltq
# types.c:10:     out |= 1 << b;
	.loc 1 10 9 discriminator 3
	orq	%rax, -8(%rbp)	# _3, out
# types.c:9:   for (uint8_t b = 0; b < num_bits; ++b)
	.loc 1 9 37 discriminator 3
	addb	$1, -9(%rbp)	#, b
.L2:
# types.c:9:   for (uint8_t b = 0; b < num_bits; ++b)
	.loc 1 9 25 discriminator 1
	movzbl	-9(%rbp), %eax	# b, tmp90
	cmpb	-20(%rbp), %al	# num_bits, tmp90
	jb	.L3	#,
.LBE2:
# types.c:11:   return out;
	.loc 1 11 10
	movq	-8(%rbp), %rax	# out, _9
# types.c:12: }
	.loc 1 12 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	bit_mask, .-bit_mask
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/stdint-uintn.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x109
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x4
	.long	.LASF17
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x2e
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.long	.LASF10
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.long	0x51
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x1b
	.byte	0x14
	.long	0x72
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF15
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF16
	.uleb128 0x6
	.long	.LASF18
	.byte	0x1
	.byte	0x7
	.byte	0xa
	.long	0x91
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF19
	.byte	0x1
	.byte	0x7
	.byte	0x1b
	.long	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.string	"out"
	.byte	0x8
	.byte	0xc
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x3
	.string	"b"
	.byte	0x9
	.byte	0x10
	.long	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
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
	.uleb128 0x3
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
.LASF14:
	.string	"long long int"
.LASF19:
	.string	"num_bits"
.LASF4:
	.string	"unsigned int"
.LASF5:
	.string	"long unsigned int"
.LASF16:
	.string	"long long unsigned int"
.LASF9:
	.string	"__uint8_t"
.LASF13:
	.string	"uint64_t"
.LASF12:
	.string	"uint8_t"
.LASF2:
	.string	"unsigned char"
.LASF11:
	.string	"char"
.LASF8:
	.string	"long int"
.LASF17:
	.string	"GNU C17 11.2.1 20211203 (Red Hat 11.2.1-7) -mtune=generic -march=x86-64 -g"
.LASF3:
	.string	"short unsigned int"
.LASF6:
	.string	"signed char"
.LASF15:
	.string	"long double"
.LASF7:
	.string	"short int"
.LASF18:
	.string	"bit_mask"
.LASF10:
	.string	"__uint64_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"types.c"
.LASF1:
	.string	"/home/michiel/Documents/RU/Thesis/Parser/src"
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
