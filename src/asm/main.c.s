	.file	"main.c"
# GNU C17 (GCC) version 11.2.1 20211203 (Red Hat 11.2.1-7) (x86_64-redhat-linux)
#	compiled by GNU C version 11.2.1 20211203 (Red Hat 11.2.1-7), GMP version 6.2.0, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g
	.text
.Ltext0:
	.file 0 "/home/michiel/Documents/RU/Thesis/Parser/src" "main.c"
	.globl	bulk_add
	.type	bulk_add, @function
bulk_add:
.LFB6:
	.file 1 "ops_basic.h"
	.loc 1 8 75
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# x, x
	movq	%rsi, -32(%rbp)	# y, y
	movq	%rdx, -40(%rbp)	# carry, carry
	movq	%rcx, -48(%rbp)	# mask, mask
# ops_basic.h:9:   uint64_t z = (x + y + *carry) & mask;
	.loc 1 9 19
	movq	-24(%rbp), %rdx	# x, tmp92
	movq	-32(%rbp), %rax	# y, tmp93
	addq	%rax, %rdx	# tmp93, _1
# ops_basic.h:9:   uint64_t z = (x + y + *carry) & mask;
	.loc 1 9 25
	movq	-40(%rbp), %rax	# carry, tmp94
	movq	(%rax), %rax	# *carry_12(D), _2
# ops_basic.h:9:   uint64_t z = (x + y + *carry) & mask;
	.loc 1 9 23
	addq	%rdx, %rax	# _1, _3
# ops_basic.h:9:   uint64_t z = (x + y + *carry) & mask;
	.loc 1 9 12
	andq	-48(%rbp), %rax	# mask, tmp96
	movq	%rax, -8(%rbp)	# tmp96, z
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 27
	movq	-32(%rbp), %rax	# y, tmp97
	notq	%rax	# _4
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 75
	cmpq	%rax, -24(%rbp)	# _4, x
	ja	.L2	#,
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 35 discriminator 2
	movq	-40(%rbp), %rax	# carry, tmp98
	movq	(%rax), %rax	# *carry_12(D), _5
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 75 discriminator 2
	cmpq	$1, %rax	#, _5
	jne	.L3	#,
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 52 discriminator 3
	movq	-24(%rbp), %rdx	# x, tmp99
	movq	-32(%rbp), %rax	# y, tmp100
	addq	%rdx, %rax	# tmp99, _6
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 47 discriminator 3
	cmpq	$-1, %rax	#, _6
	jne	.L3	#,
.L2:
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 75 discriminator 5
	movl	$1, %eax	#, iftmp.0_8
	jmp	.L4	#
.L3:
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 75 is_stmt 0 discriminator 6
	movl	$0, %eax	#, iftmp.0_8
.L4:
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 75 discriminator 8
	movslq	%eax, %rdx	# iftmp.0_8, _7
# ops_basic.h:10:   *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
	.loc 1 10 10 is_stmt 1 discriminator 8
	movq	-40(%rbp), %rax	# carry, tmp101
	movq	%rdx, (%rax)	# _7, *carry_12(D)
# ops_basic.h:11:   return z;
	.loc 1 11 10 discriminator 8
	movq	-8(%rbp), %rax	# z, _18
# ops_basic.h:12: }
	.loc 1 12 1 discriminator 8
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	bulk_add, .-bulk_add
	.globl	bulk_sub
	.type	bulk_sub, @function
bulk_sub:
.LFB7:
	.loc 1 14 75
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# x, x
	movq	%rsi, -32(%rbp)	# y, y
	movq	%rdx, -40(%rbp)	# carry, carry
	movq	%rcx, -48(%rbp)	# mask, mask
# ops_basic.h:15:   uint64_t z = ((x | ~mask) - y - *carry) & mask;
	.loc 1 15 22
	movq	-48(%rbp), %rax	# mask, tmp92
	notq	%rax	# _1
# ops_basic.h:15:   uint64_t z = ((x | ~mask) - y - *carry) & mask;
	.loc 1 15 20
	orq	-24(%rbp), %rax	# x, _2
# ops_basic.h:15:   uint64_t z = ((x | ~mask) - y - *carry) & mask;
	.loc 1 15 29
	subq	-32(%rbp), %rax	# y, _2
	movq	%rax, %rdx	# _2, _3
# ops_basic.h:15:   uint64_t z = ((x | ~mask) - y - *carry) & mask;
	.loc 1 15 35
	movq	-40(%rbp), %rax	# carry, tmp93
	movq	(%rax), %rcx	# *carry_13(D), _4
# ops_basic.h:15:   uint64_t z = ((x | ~mask) - y - *carry) & mask;
	.loc 1 15 33
	movq	%rdx, %rax	# _3, _3
	subq	%rcx, %rax	# _4, _3
# ops_basic.h:15:   uint64_t z = ((x | ~mask) - y - *carry) & mask;
	.loc 1 15 12
	andq	-48(%rbp), %rax	# mask, tmp95
	movq	%rax, -8(%rbp)	# tmp95, z
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 49
	movq	-24(%rbp), %rax	# x, tmp96
	cmpq	-32(%rbp), %rax	# y, tmp96
	jb	.L7	#,
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 22 discriminator 2
	movq	-40(%rbp), %rax	# carry, tmp97
	movq	(%rax), %rax	# *carry_13(D), _6
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 49 discriminator 2
	cmpq	$1, %rax	#, _6
	jne	.L8	#,
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 34 discriminator 3
	movq	-24(%rbp), %rax	# x, tmp98
	cmpq	-32(%rbp), %rax	# y, tmp98
	jne	.L8	#,
.L7:
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 49 discriminator 5
	movl	$1, %eax	#, iftmp.1_8
	jmp	.L9	#
.L8:
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 49 is_stmt 0 discriminator 6
	movl	$0, %eax	#, iftmp.1_8
.L9:
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 49 discriminator 8
	movslq	%eax, %rdx	# iftmp.1_8, _7
# ops_basic.h:16:   *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
	.loc 1 16 10 is_stmt 1 discriminator 8
	movq	-40(%rbp), %rax	# carry, tmp99
	movq	%rdx, (%rax)	# _7, *carry_13(D)
# ops_basic.h:17:   return z;
	.loc 1 17 10 discriminator 8
	movq	-8(%rbp), %rax	# z, _18
# ops_basic.h:18: }
	.loc 1 18 1 discriminator 8
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	bulk_sub, .-bulk_sub
	.globl	bulk_and
	.type	bulk_and, @function
bulk_and:
.LFB8:
	.loc 1 20 75
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# x, x
	movq	%rsi, -16(%rbp)	# y, y
	movq	%rdx, -24(%rbp)	# carry, carry
	movq	%rcx, -32(%rbp)	# mask, mask
# ops_basic.h:21:   return x & y;
	.loc 1 21 12
	movq	-8(%rbp), %rax	# x, tmp84
	andq	-16(%rbp), %rax	# y, _3
# ops_basic.h:22: }
	.loc 1 22 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	bulk_and, .-bulk_and
	.globl	bulk_or
	.type	bulk_or, @function
bulk_or:
.LFB9:
	.loc 1 24 74
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# x, x
	movq	%rsi, -16(%rbp)	# y, y
	movq	%rdx, -24(%rbp)	# carry, carry
	movq	%rcx, -32(%rbp)	# mask, mask
# ops_basic.h:25:   return x | y;
	.loc 1 25 12
	movq	-8(%rbp), %rax	# x, tmp84
	orq	-16(%rbp), %rax	# y, _3
# ops_basic.h:26: }
	.loc 1 26 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	bulk_or, .-bulk_or
	.globl	bulk_xor
	.type	bulk_xor, @function
bulk_xor:
.LFB10:
	.loc 1 28 75
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# x, x
	movq	%rsi, -16(%rbp)	# y, y
	movq	%rdx, -24(%rbp)	# carry, carry
	movq	%rcx, -32(%rbp)	# mask, mask
# ops_basic.h:29:   return x ^ y;
	.loc 1 29 12
	movq	-8(%rbp), %rax	# x, tmp84
	xorq	-16(%rbp), %rax	# y, _3
# ops_basic.h:30: }
	.loc 1 30 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	bulk_xor, .-bulk_xor
	.globl	bulk_not
	.type	bulk_not, @function
bulk_not:
.LFB11:
	.loc 1 32 75
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# x, x
	movq	%rsi, -16(%rbp)	# y, y
	movq	%rdx, -24(%rbp)	# carry, carry
	movq	%rcx, -32(%rbp)	# mask, mask
# ops_basic.h:33:   return ~x;
	.loc 1 33 10
	movq	-8(%rbp), %rax	# x, tmp84
	notq	%rax	# _2
# ops_basic.h:34: }
	.loc 1 34 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	bulk_not, .-bulk_not
	.globl	bulk_find_value
	.type	bulk_find_value, @function
bulk_find_value:
.LFB12:
	.loc 1 36 70
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# index, index
	movq	%rsi, -16(%rbp)	# value, value
	movq	%rdx, -24(%rbp)	# arg, arg
# ops_basic.h:37:   return value == *((uint64_t *) arg);
	.loc 1 37 19
	movq	-24(%rbp), %rax	# arg, tmp85
	movq	(%rax), %rax	# MEM[(uint64_t *)arg_3(D)], _1
# ops_basic.h:37:   return value == *((uint64_t *) arg);
	.loc 1 37 16
	cmpq	%rax, -16(%rbp)	# _1, value
	sete	%al	#, _5
# ops_basic.h:38: }
	.loc 1 38 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	bulk_find_value, .-bulk_find_value
	.section	.rodata
	.align 8
.LC0:
	.string	"Starting benchmark %s (%i warmups, %i iterations)\n"
	.align 8
.LC2:
	.string	"Benchmark %s done, time taken: %fs\n"
	.text
	.globl	perform_benchmark
	.type	perform_benchmark, @function
perform_benchmark:
.LFB13:
	.file 2 "main.c"
	.loc 2 34 106
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# name, name
	movl	%esi, -28(%rbp)	# warmup, warmup
	movl	%edx, -32(%rbp)	# iterations, iterations
	movq	%rcx, -40(%rbp)	# func, func
	movq	%r8, -48(%rbp)	# args, args
# main.c:36:   printf("Starting benchmark %s (%i warmups, %i iterations)\n", name, warmup, iterations);
	.loc 2 36 3
	movl	-32(%rbp), %ecx	# iterations, tmp88
	movl	-28(%rbp), %edx	# warmup, tmp89
	movq	-24(%rbp), %rax	# name, tmp90
	movq	%rax, %rsi	# tmp90,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
# main.c:38:   while (--warmup >= 0)
	.loc 2 38 9
	jmp	.L22	#
.L23:
# main.c:39:     func(args);
	.loc 2 39 5
	movq	-48(%rbp), %rax	# args, tmp91
	movq	-40(%rbp), %rdx	# func, tmp92
	movq	%rax, %rdi	# tmp91,
	call	*%rdx	# tmp92
.LVL0:
.L22:
# main.c:38:   while (--warmup >= 0)
	.loc 2 38 19
	subl	$1, -28(%rbp)	#, warmup
	cmpl	$0, -28(%rbp)	#, warmup
	jns	.L23	#,
# main.c:41:   float start = (float) clock() / CLOCKS_PER_SEC;
	.loc 2 41 25
	call	clock	#
# main.c:41:   float start = (float) clock() / CLOCKS_PER_SEC;
	.loc 2 41 17
	pxor	%xmm0, %xmm0	# _2
	cvtsi2ssq	%rax, %xmm0	# _1, _2
# main.c:41:   float start = (float) clock() / CLOCKS_PER_SEC;
	.loc 2 41 9
	movss	.LC1(%rip), %xmm1	#, tmp94
	divss	%xmm1, %xmm0	# tmp94, tmp93
	movss	%xmm0, -4(%rbp)	# tmp93, start
# main.c:44:   while (--iterations >= 0)
	.loc 2 44 9
	jmp	.L24	#
.L25:
# main.c:45:     func(args);
	.loc 2 45 5
	movq	-48(%rbp), %rax	# args, tmp95
	movq	-40(%rbp), %rdx	# func, tmp96
	movq	%rax, %rdi	# tmp95,
	call	*%rdx	# tmp96
.LVL1:
.L24:
# main.c:44:   while (--iterations >= 0)
	.loc 2 44 23
	subl	$1, -32(%rbp)	#, iterations
	cmpl	$0, -32(%rbp)	#, iterations
	jns	.L25	#,
# main.c:47:   float time = (float) clock() / CLOCKS_PER_SEC - start;
	.loc 2 47 24
	call	clock	#
# main.c:47:   float time = (float) clock() / CLOCKS_PER_SEC - start;
	.loc 2 47 16
	pxor	%xmm0, %xmm0	# _4
	cvtsi2ssq	%rax, %xmm0	# _3, _4
# main.c:47:   float time = (float) clock() / CLOCKS_PER_SEC - start;
	.loc 2 47 32
	movss	.LC1(%rip), %xmm1	#, tmp97
	divss	%xmm1, %xmm0	# tmp97, _5
# main.c:47:   float time = (float) clock() / CLOCKS_PER_SEC - start;
	.loc 2 47 9
	subss	-4(%rbp), %xmm0	# start, tmp98
	movss	%xmm0, -8(%rbp)	# tmp98, time
# main.c:49:   printf("Benchmark %s done, time taken: %fs\n", name, time);
	.loc 2 49 3
	pxor	%xmm2, %xmm2	# _6
	cvtss2sd	-8(%rbp), %xmm2	# time, _6
	movq	%xmm2, %rdx	# _6, _6
	movq	-24(%rbp), %rax	# name, tmp99
	movq	%rdx, %xmm0	# _6,
	movq	%rax, %rsi	# tmp99,
	movl	$.LC2, %edi	#,
	movl	$1, %eax	#,
	call	printf	#
# main.c:50: }
	.loc 2 50 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	perform_benchmark, .-perform_benchmark
	.globl	test_mat_normal
	.type	test_mat_normal, @function
test_mat_normal:
.LFB14:
	.loc 2 59 35
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# args, args
# main.c:60:   uint8_t *x = args[1], *y = args[2], *z = args[3];
	.loc 2 60 12
	movq	-40(%rbp), %rax	# args, tmp99
	movq	8(%rax), %rax	# MEM[(void * *)args_23(D) + 8B], tmp100
	movq	%rax, -16(%rbp)	# tmp100, x
# main.c:60:   uint8_t *x = args[1], *y = args[2], *z = args[3];
	.loc 2 60 26
	movq	-40(%rbp), %rax	# args, tmp101
	movq	16(%rax), %rax	# MEM[(void * *)args_23(D) + 16B], tmp102
	movq	%rax, -24(%rbp)	# tmp102, y
# main.c:60:   uint8_t *x = args[1], *y = args[2], *z = args[3];
	.loc 2 60 40
	movq	-40(%rbp), %rax	# args, tmp103
	movq	24(%rax), %rax	# MEM[(void * *)args_23(D) + 24B], tmp104
	movq	%rax, -32(%rbp)	# tmp104, z
# main.c:62:   memset(z, 0, MAT_SIZE * MAT_SIZE);
	.loc 2 62 3
	movq	-32(%rbp), %rax	# z, tmp105
	movl	$64, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp105,
	call	memset	#
.LBB2:
# main.c:68:   for (int py = 0; py < MAT_SUB_SIZE; ++py)
	.loc 2 68 12
	movl	$0, -4(%rbp)	#, py
# main.c:68:   for (int py = 0; py < MAT_SUB_SIZE; ++py)
	.loc 2 68 3
	jmp	.L27	#
.L30:
.LBB3:
# main.c:69:     for (int px = 0; px < MAT_SUB_SIZE; ++px)
	.loc 2 69 14
	movl	$0, -8(%rbp)	#, px
# main.c:69:     for (int px = 0; px < MAT_SUB_SIZE; ++px)
	.loc 2 69 5
	jmp	.L28	#
.L29:
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 46 discriminator 3
	movl	-4(%rbp), %eax	# py, tmp106
	leal	0(,%rax,8), %edx	#, _1
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 57 discriminator 3
	movl	-8(%rbp), %eax	# px, tmp107
	addl	%edx, %eax	# _1, _2
	movslq	%eax, %rdx	# _2, _3
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 42 discriminator 3
	movq	-16(%rbp), %rax	# x, tmp108
	addq	%rdx, %rax	# _3, _4
	movzbl	(%rax), %ecx	# *_4, _5
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 70 discriminator 3
	movl	-4(%rbp), %eax	# py, tmp109
	leal	0(,%rax,8), %edx	#, _6
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 81 discriminator 3
	movl	-8(%rbp), %eax	# px, tmp110
	addl	%edx, %eax	# _6, _7
	movslq	%eax, %rdx	# _7, _8
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 66 discriminator 3
	movq	-24(%rbp), %rax	# y, tmp111
	addq	%rdx, %rax	# _8, _9
	movzbl	(%rax), %edx	# *_9, _10
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 13 discriminator 3
	movl	-4(%rbp), %eax	# py, tmp112
	addl	$3, %eax	#, _11
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 18 discriminator 3
	leal	0(,%rax,8), %esi	#, _12
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 29 discriminator 3
	movl	-8(%rbp), %eax	# px, tmp113
	addl	%esi, %eax	# _12, _13
	cltq
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 8 discriminator 3
	leaq	2(%rax), %rsi	#, _15
	movq	-32(%rbp), %rax	# z, tmp114
	addq	%rsi, %rax	# _15, _16
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 63 discriminator 3
	addl	%ecx, %edx	# _5, _17
# main.c:70:       z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
	.loc 2 70 39 discriminator 3
	movb	%dl, (%rax)	# _17, *_16
# main.c:69:     for (int px = 0; px < MAT_SUB_SIZE; ++px)
	.loc 2 69 41 discriminator 3
	addl	$1, -8(%rbp)	#, px
.L28:
# main.c:69:     for (int px = 0; px < MAT_SUB_SIZE; ++px)
	.loc 2 69 25 discriminator 1
	cmpl	$4, -8(%rbp)	#, px
	jle	.L29	#,
.LBE3:
# main.c:68:   for (int py = 0; py < MAT_SUB_SIZE; ++py)
	.loc 2 68 39 discriminator 2
	addl	$1, -4(%rbp)	#, py
.L27:
# main.c:68:   for (int py = 0; py < MAT_SUB_SIZE; ++py)
	.loc 2 68 23 discriminator 1
	cmpl	$4, -4(%rbp)	#, py
	jle	.L30	#,
.LBE2:
# main.c:71: }
	.loc 2 71 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	test_mat_normal, .-test_mat_normal
	.globl	test_mat_compact
	.type	test_mat_compact, @function
test_mat_compact:
.LFB15:
	.loc 2 73 36
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# args, args
# main.c:74:   ArrayDesc *desc = args[0];
	.loc 2 74 14
	movq	-40(%rbp), %rax	# args, tmp82
	movq	(%rax), %rax	# *args_2(D), tmp83
	movq	%rax, -8(%rbp)	# tmp83, desc
# main.c:75:   void *x = args[1], *y = args[2], *z = args[3];
	.loc 2 75 9
	movq	-40(%rbp), %rax	# args, tmp84
	movq	8(%rax), %rax	# MEM[(void * *)args_2(D) + 8B], tmp85
	movq	%rax, -16(%rbp)	# tmp85, x
# main.c:75:   void *x = args[1], *y = args[2], *z = args[3];
	.loc 2 75 23
	movq	-40(%rbp), %rax	# args, tmp86
	movq	16(%rax), %rax	# MEM[(void * *)args_2(D) + 16B], tmp87
	movq	%rax, -24(%rbp)	# tmp87, y
# main.c:75:   void *x = args[1], *y = args[2], *z = args[3];
	.loc 2 75 37
	movq	-40(%rbp), %rax	# args, tmp88
	movq	24(%rax), %rax	# MEM[(void * *)args_2(D) + 24B], tmp89
	movq	%rax, -32(%rbp)	# tmp89, z
# main.c:77:   memset(z, 0, MAT_SIZE * MAT_SIZE);
	.loc 2 77 3
	movq	-32(%rbp), %rax	# z, tmp90
	movl	$64, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	memset	#
# main.c:82:   bulk_op(desc, x, NULL, desc, y, NULL, desc, z, offset, count, bulk_add);
	.loc 2 82 3
	movq	-24(%rbp), %rcx	# y, tmp91
	movq	-8(%rbp), %rdx	# desc, tmp92
	movq	-16(%rbp), %rsi	# x, tmp93
	movq	-8(%rbp), %rax	# desc, tmp94
	subq	$8, %rsp	#,
	pushq	$bulk_add	#
	pushq	$count.4	#
	pushq	$offset.5	#
	pushq	-32(%rbp)	# z
	pushq	-8(%rbp)	# desc
	movl	$0, %r9d	#,
	movq	%rcx, %r8	# tmp91,
	movq	%rdx, %rcx	# tmp92,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# tmp94,
	call	bulk_op	#
	addq	$48, %rsp	#,
# main.c:83: }
	.loc 2 83 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	test_mat_compact, .-test_mat_compact
	.section	.rodata
.LC3:
	.string	"mat_normal"
.LC4:
	.string	"mat_compact"
	.text
	.globl	test_mat
	.type	test_mat, @function
test_mat:
.LFB16:
	.loc 2 85 17
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$240, %rsp	#,
# main.c:86:   ArrayDesc *desc = alloc_desc(7, 2, MAT_SIZE, MAT_SIZE);
	.loc 2 86 21
	movl	$8, %ecx	#,
	movl	$8, %edx	#,
	movl	$2, %esi	#,
	movl	$7, %edi	#,
	movl	$0, %eax	#,
	call	alloc_desc	#
	movq	%rax, -8(%rbp)	# tmp82, desc
# main.c:89:   void *args[4] = { desc, x, y, z };
	.loc 2 89 9
	movq	-8(%rbp), %rax	# desc, tmp83
	movq	%rax, -240(%rbp)	# tmp83, args[0]
	leaq	-80(%rbp), %rax	#, tmp84
	movq	%rax, -232(%rbp)	# tmp84, args[1]
	leaq	-144(%rbp), %rax	#, tmp85
	movq	%rax, -224(%rbp)	# tmp85, args[2]
	leaq	-208(%rbp), %rax	#, tmp86
	movq	%rax, -216(%rbp)	# tmp86, args[3]
# main.c:91:   bulk_fill(desc, x, NULL, NULL, 1);
	.loc 2 91 3
	leaq	-80(%rbp), %rsi	#, tmp87
	movq	-8(%rbp), %rax	# desc, tmp88
	movl	$1, %r8d	#,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# tmp88,
	call	bulk_fill	#
# main.c:92:   bulk_fill(desc, y, NULL, NULL, 2);
	.loc 2 92 3
	leaq	-144(%rbp), %rsi	#, tmp89
	movq	-8(%rbp), %rax	# desc, tmp90
	movl	$2, %r8d	#,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# tmp90,
	call	bulk_fill	#
# main.c:97:   perform_benchmark("mat_normal", MAT_WARMUPS, MAT_TEST_COUNT, test_mat_normal, args);
	.loc 2 97 3
	leaq	-240(%rbp), %rax	#, tmp91
	movq	%rax, %r8	# tmp91,
	movl	$test_mat_normal, %ecx	#,
	movl	$10000, %edx	#,
	movl	$1000, %esi	#,
	movl	$.LC3, %edi	#,
	call	perform_benchmark	#
# main.c:101:   perform_benchmark("mat_compact", MAT_WARMUPS, MAT_TEST_COUNT, test_mat_compact, args);
	.loc 2 101 3
	leaq	-240(%rbp), %rax	#, tmp92
	movq	%rax, %r8	# tmp92,
	movl	$test_mat_compact, %ecx	#,
	movl	$10000, %edx	#,
	movl	$1000, %esi	#,
	movl	$.LC4, %edi	#,
	call	perform_benchmark	#
# main.c:104: }
	.loc 2 104 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	test_mat, .-test_mat
	.globl	rnd_bool
	.type	rnd_bool, @function
rnd_bool:
.LFB17:
	.loc 2 108 52
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# index, index
	movq	%rsi, -16(%rbp)	# arg, arg
# main.c:109:   return rand() % 2;
	.loc 2 109 10
	call	rand	#
# main.c:109:   return rand() % 2;
	.loc 2 109 17
	cltd
	shrl	$31, %edx	#, tmp87
	addl	%edx, %eax	# tmp87, tmp88
	andl	$1, %eax	#, tmp89
	subl	%edx, %eax	# tmp87, tmp90
	cltq
# main.c:110: }
	.loc 2 110 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	rnd_bool, .-rnd_bool
	.globl	task_bool_compact
	.type	task_bool_compact, @function
task_bool_compact:
.LFB18:
	.loc 2 112 37
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# args, args
# main.c:113:   ArrayDesc *desc = args[0];
	.loc 2 113 14
	movq	-40(%rbp), %rax	# args, tmp82
	movq	(%rax), %rax	# *args_2(D), tmp83
	movq	%rax, -8(%rbp)	# tmp83, desc
# main.c:114:   bool *x = args[1], *y = args[2], *z = args[3];
	.loc 2 114 9
	movq	-40(%rbp), %rax	# args, tmp84
	movq	8(%rax), %rax	# MEM[(void * *)args_2(D) + 8B], tmp85
	movq	%rax, -16(%rbp)	# tmp85, x
# main.c:114:   bool *x = args[1], *y = args[2], *z = args[3];
	.loc 2 114 23
	movq	-40(%rbp), %rax	# args, tmp86
	movq	16(%rax), %rax	# MEM[(void * *)args_2(D) + 16B], tmp87
	movq	%rax, -24(%rbp)	# tmp87, y
# main.c:114:   bool *x = args[1], *y = args[2], *z = args[3];
	.loc 2 114 37
	movq	-40(%rbp), %rax	# args, tmp88
	movq	24(%rax), %rax	# MEM[(void * *)args_2(D) + 24B], tmp89
	movq	%rax, -32(%rbp)	# tmp89, z
# main.c:116:   bulk_op(desc, x, NULL, desc, y, NULL, desc, z, NULL, NULL, bulk_and);
	.loc 2 116 3
	movq	-24(%rbp), %rcx	# y, tmp90
	movq	-8(%rbp), %rdx	# desc, tmp91
	movq	-16(%rbp), %rsi	# x, tmp92
	movq	-8(%rbp), %rax	# desc, tmp93
	subq	$8, %rsp	#,
	pushq	$bulk_and	#
	pushq	$0	#
	pushq	$0	#
	pushq	-32(%rbp)	# z
	pushq	-8(%rbp)	# desc
	movl	$0, %r9d	#,
	movq	%rcx, %r8	# tmp90,
	movq	%rdx, %rcx	# tmp91,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# tmp93,
	call	bulk_op	#
	addq	$48, %rsp	#,
# main.c:117: }
	.loc 2 117 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE18:
	.size	task_bool_compact, .-task_bool_compact
	.section	.rodata
.LC5:
	.string	"bool_compact"
	.text
	.globl	test_bool_compact
	.type	test_bool_compact, @function
test_bool_compact:
.LFB19:
	.loc 2 119 26
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
# main.c:120:   static_alloc_desc(desc, 1, 1, BOOL_COUNT);
	.loc 2 120 3
	movq	desc.3(%rip), %rax	# desc, desc.2_1
	testq	%rax, %rax	# desc.2_1
	jne	.L37	#,
# main.c:120:   static_alloc_desc(desc, 1, 1, BOOL_COUNT);
	.loc 2 120 3 is_stmt 0 discriminator 1
	movl	$1000000, %edx	#,
	movl	$1, %esi	#,
	movl	$1, %edi	#,
	movl	$0, %eax	#,
	call	alloc_desc	#
	movq	%rax, desc.3(%rip)	# _2, desc
.L37:
# main.c:122:   static_alloc_array(x, desc);
	.loc 2 122 3 is_stmt 1
	movq	x.2(%rip), %rax	# x, x.3_3
	testq	%rax, %rax	# x.3_3
	jne	.L38	#,
# main.c:122:   static_alloc_array(x, desc);
	.loc 2 122 3 is_stmt 0 discriminator 1
	movq	desc.3(%rip), %rax	# desc, desc.4_4
	movq	%rax, %rdi	# desc.4_4,
	call	alloc_array	#
	movq	%rax, x.2(%rip)	# _5, x
.L38:
# main.c:123:   static_alloc_array(y, desc);
	.loc 2 123 3 is_stmt 1
	movq	y.1(%rip), %rax	# y, y.5_6
	testq	%rax, %rax	# y.5_6
	jne	.L39	#,
# main.c:123:   static_alloc_array(y, desc);
	.loc 2 123 3 is_stmt 0 discriminator 1
	movq	desc.3(%rip), %rax	# desc, desc.6_7
	movq	%rax, %rdi	# desc.6_7,
	call	alloc_array	#
	movq	%rax, y.1(%rip)	# _8, y
.L39:
# main.c:124:   static_alloc_array(z, desc);
	.loc 2 124 3 is_stmt 1
	movq	z.0(%rip), %rax	# z, z.7_9
	testq	%rax, %rax	# z.7_9
	jne	.L40	#,
# main.c:124:   static_alloc_array(z, desc);
	.loc 2 124 3 is_stmt 0 discriminator 1
	movq	desc.3(%rip), %rax	# desc, desc.8_10
	movq	%rax, %rdi	# desc.8_10,
	call	alloc_array	#
	movq	%rax, z.0(%rip)	# _11, z
.L40:
# main.c:126:   bulk_set(desc, x, NULL, NULL, NULL, rnd_bool);
	.loc 2 126 3 is_stmt 1
	movq	x.2(%rip), %rsi	# x, x.9_12
	movq	desc.3(%rip), %rax	# desc, desc.10_13
	movl	$rnd_bool, %r9d	#,
	movl	$0, %r8d	#,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# desc.10_13,
	call	bulk_set	#
# main.c:127:   bulk_set(desc, y, NULL, NULL, NULL, rnd_bool);
	.loc 2 127 3
	movq	y.1(%rip), %rsi	# y, y.11_14
	movq	desc.3(%rip), %rax	# desc, desc.12_15
	movl	$rnd_bool, %r9d	#,
	movl	$0, %r8d	#,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# desc.12_15,
	call	bulk_set	#
# main.c:132:   void *args[] = { desc, x, y, z };
	.loc 2 132 9
	movq	desc.3(%rip), %rax	# desc, desc.13_16
	movq	%rax, -32(%rbp)	# desc.13_16, args[0]
	movq	x.2(%rip), %rax	# x, x.14_17
	movq	%rax, -24(%rbp)	# x.14_17, args[1]
	movq	y.1(%rip), %rax	# y, y.15_18
	movq	%rax, -16(%rbp)	# y.15_18, args[2]
	movq	z.0(%rip), %rax	# z, z.16_19
	movq	%rax, -8(%rbp)	# z.16_19, args[3]
# main.c:134:   perform_benchmark("bool_compact", 1000, 10000, task_bool_compact, args);
	.loc 2 134 3
	leaq	-32(%rbp), %rax	#, tmp101
	movq	%rax, %r8	# tmp101,
	movl	$task_bool_compact, %ecx	#,
	movl	$10000, %edx	#,
	movl	$1000, %esi	#,
	movl	$.LC5, %edi	#,
	call	perform_benchmark	#
# main.c:137: }
	.loc 2 137 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE19:
	.size	test_bool_compact, .-test_bool_compact
	.globl	task_bool_normal
	.type	task_bool_normal, @function
task_bool_normal:
.LFB20:
	.loc 2 139 36
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# args, args
# main.c:140:   bool *x = args[0], *y = args[1], *z = args[2];
	.loc 2 140 9
	movq	-40(%rbp), %rax	# args, tmp94
	movq	(%rax), %rax	# *args_16(D), tmp95
	movq	%rax, -16(%rbp)	# tmp95, x
# main.c:140:   bool *x = args[0], *y = args[1], *z = args[2];
	.loc 2 140 23
	movq	-40(%rbp), %rax	# args, tmp96
	movq	8(%rax), %rax	# MEM[(void * *)args_16(D) + 8B], tmp97
	movq	%rax, -24(%rbp)	# tmp97, y
# main.c:140:   bool *x = args[0], *y = args[1], *z = args[2];
	.loc 2 140 37
	movq	-40(%rbp), %rax	# args, tmp98
	movq	16(%rax), %rax	# MEM[(void * *)args_16(D) + 16B], tmp99
	movq	%rax, -32(%rbp)	# tmp99, z
.LBB4:
# main.c:142:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 142 12
	movl	$0, -4(%rbp)	#, i
# main.c:142:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 142 3
	jmp	.L42	#
.L43:
# main.c:143:     z[i] = x[i] & y[i];
	.loc 2 143 13 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp100
	movslq	%eax, %rdx	# tmp100, _1
	movq	-16(%rbp), %rax	# x, tmp101
	addq	%rdx, %rax	# _1, _2
	movzbl	(%rax), %eax	# *_2, _3
	movzbl	%al, %edx	# _3, _4
# main.c:143:     z[i] = x[i] & y[i];
	.loc 2 143 20 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp102
	movslq	%eax, %rcx	# tmp102, _5
	movq	-24(%rbp), %rax	# y, tmp103
	addq	%rcx, %rax	# _5, _6
	movzbl	(%rax), %eax	# *_6, _7
	movzbl	%al, %eax	# _7, _8
# main.c:143:     z[i] = x[i] & y[i];
	.loc 2 143 17 discriminator 3
	andl	%eax, %edx	# _8, _9
# main.c:143:     z[i] = x[i] & y[i];
	.loc 2 143 6 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp104
	movslq	%eax, %rcx	# tmp104, _10
	movq	-32(%rbp), %rax	# z, tmp105
	addq	%rcx, %rax	# _10, _11
# main.c:143:     z[i] = x[i] & y[i];
	.loc 2 143 17 discriminator 3
	testl	%edx, %edx	# _9
	setne	%dl	#, _12
# main.c:143:     z[i] = x[i] & y[i];
	.loc 2 143 10 discriminator 3
	movb	%dl, (%rax)	# _12, *_11
# main.c:142:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 142 35 discriminator 3
	addl	$1, -4(%rbp)	#, i
.L42:
# main.c:142:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 142 21 discriminator 1
	cmpl	$999999, -4(%rbp)	#, i
	jle	.L43	#,
.LBE4:
# main.c:144: }
	.loc 2 144 1
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE20:
	.size	task_bool_normal, .-task_bool_normal
	.section	.rodata
.LC6:
	.string	"bool_normal"
	.text
	.globl	test_bool_normal
	.type	test_bool_normal, @function
test_bool_normal:
.LFB21:
	.loc 2 146 25
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
# main.c:147:   ArrayDesc *desc = alloc_desc(8, 1, BOOL_COUNT);
	.loc 2 147 21
	movl	$1000000, %edx	#,
	movl	$1, %esi	#,
	movl	$8, %edi	#,
	movl	$0, %eax	#,
	call	alloc_desc	#
	movq	%rax, -16(%rbp)	# tmp92, desc
# main.c:148:   bool *x = malloc(BOOL_COUNT), *y = malloc(BOOL_COUNT), *z = malloc(BOOL_COUNT);
	.loc 2 148 13
	movl	$1000000, %edi	#,
	call	malloc	#
	movq	%rax, -24(%rbp)	# tmp93, x
# main.c:148:   bool *x = malloc(BOOL_COUNT), *y = malloc(BOOL_COUNT), *z = malloc(BOOL_COUNT);
	.loc 2 148 38
	movl	$1000000, %edi	#,
	call	malloc	#
	movq	%rax, -32(%rbp)	# tmp94, y
# main.c:148:   bool *x = malloc(BOOL_COUNT), *y = malloc(BOOL_COUNT), *z = malloc(BOOL_COUNT);
	.loc 2 148 63
	movl	$1000000, %edi	#,
	call	malloc	#
	movq	%rax, -40(%rbp)	# tmp95, z
.LBB5:
# main.c:150:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 150 12
	movl	$0, -4(%rbp)	#, i
# main.c:150:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 150 3
	jmp	.L45	#
.L46:
# main.c:151:     x[i] = rand() % 2;
	.loc 2 151 12 discriminator 3
	call	rand	#
# main.c:151:     x[i] = rand() % 2;
	.loc 2 151 19 discriminator 3
	cltd
	shrl	$31, %edx	#, tmp97
	addl	%edx, %eax	# tmp97, tmp98
	andl	$1, %eax	#, tmp99
	subl	%edx, %eax	# tmp97, tmp100
	movl	%eax, %edx	# tmp100, _2
# main.c:151:     x[i] = rand() % 2;
	.loc 2 151 6 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp101
	movslq	%eax, %rcx	# tmp101, _3
	movq	-24(%rbp), %rax	# x, tmp102
	addq	%rcx, %rax	# _3, _4
# main.c:151:     x[i] = rand() % 2;
	.loc 2 151 19 discriminator 3
	testl	%edx, %edx	# _2
	setne	%dl	#, _5
# main.c:151:     x[i] = rand() % 2;
	.loc 2 151 10 discriminator 3
	movb	%dl, (%rax)	# _5, *_4
# main.c:150:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 150 35 discriminator 3
	addl	$1, -4(%rbp)	#, i
.L45:
# main.c:150:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 150 21 discriminator 1
	cmpl	$999999, -4(%rbp)	#, i
	jle	.L46	#,
.LBE5:
.LBB6:
# main.c:152:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 152 12
	movl	$0, -8(%rbp)	#, i
# main.c:152:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 152 3
	jmp	.L47	#
.L48:
# main.c:153:     y[i] = rand() % 2;
	.loc 2 153 12 discriminator 3
	call	rand	#
# main.c:153:     y[i] = rand() % 2;
	.loc 2 153 19 discriminator 3
	cltd
	shrl	$31, %edx	#, tmp104
	addl	%edx, %eax	# tmp104, tmp105
	andl	$1, %eax	#, tmp106
	subl	%edx, %eax	# tmp104, tmp107
	movl	%eax, %edx	# tmp107, _7
# main.c:153:     y[i] = rand() % 2;
	.loc 2 153 6 discriminator 3
	movl	-8(%rbp), %eax	# i, tmp108
	movslq	%eax, %rcx	# tmp108, _8
	movq	-32(%rbp), %rax	# y, tmp109
	addq	%rcx, %rax	# _8, _9
# main.c:153:     y[i] = rand() % 2;
	.loc 2 153 19 discriminator 3
	testl	%edx, %edx	# _7
	setne	%dl	#, _10
# main.c:153:     y[i] = rand() % 2;
	.loc 2 153 10 discriminator 3
	movb	%dl, (%rax)	# _10, *_9
# main.c:152:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 152 35 discriminator 3
	addl	$1, -8(%rbp)	#, i
.L47:
# main.c:152:   for (int i = 0; i < BOOL_COUNT; ++i)
	.loc 2 152 21 discriminator 1
	cmpl	$999999, -8(%rbp)	#, i
	jle	.L48	#,
.LBE6:
# main.c:155:   void *args[] = { x, y, z };
	.loc 2 155 9
	movq	-24(%rbp), %rax	# x, tmp110
	movq	%rax, -64(%rbp)	# tmp110, args[0]
	movq	-32(%rbp), %rax	# y, tmp111
	movq	%rax, -56(%rbp)	# tmp111, args[1]
	movq	-40(%rbp), %rax	# z, tmp112
	movq	%rax, -48(%rbp)	# tmp112, args[2]
# main.c:160:   perform_benchmark("bool_normal", 1000, 10000, task_bool_normal, args);
	.loc 2 160 3
	leaq	-64(%rbp), %rax	#, tmp113
	movq	%rax, %r8	# tmp113,
	movl	$task_bool_normal, %ecx	#,
	movl	$10000, %edx	#,
	movl	$1000, %esi	#,
	movl	$.LC6, %edi	#,
	call	perform_benchmark	#
# main.c:163: }
	.loc 2 163 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE21:
	.size	test_bool_normal, .-test_bool_normal
	.globl	test_bool
	.type	test_bool, @function
test_bool:
.LFB22:
	.loc 2 165 18
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# main.c:166:   test_bool_normal();
	.loc 2 166 3
	movl	$0, %eax	#,
	call	test_bool_normal	#
# main.c:167:   test_bool_compact();
	.loc 2 167 3
	movl	$0, %eax	#,
	call	test_bool_compact	#
# main.c:168: }
	.loc 2 168 1
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE22:
	.size	test_bool, .-test_bool
	.globl	main
	.type	main, @function
main:
.LFB23:
	.loc 2 170 12
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# main.c:171:   test_bool();
	.loc 2 171 3
	movl	$0, %eax	#,
	call	test_bool	#
# main.c:174:   return 0;
	.loc 2 174 10
	movl	$0, %eax	#, _3
# main.c:175: }
	.loc 2 175 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.data
	.align 16
	.type	offset.5, @object
	.size	offset.5, 16
offset.5:
	.quad	3
	.quad	2
	.align 16
	.type	count.4, @object
	.size	count.4, 16
count.4:
	.quad	5
	.quad	5
	.local	desc.3
	.comm	desc.3,8,8
	.local	x.2
	.comm	x.2,8,8
	.local	y.1
	.comm	y.1,8,8
	.local	z.0
	.comm	z.0,8,8
	.section	.rodata
	.align 4
.LC1:
	.long	1232348160
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stddef.h"
	.file 4 "/usr/include/bits/types.h"
	.file 5 "/usr/include/bits/types/clock_t.h"
	.file 6 "/usr/include/bits/stdint-uintn.h"
	.file 7 "../include/types.h"
	.file 8 "/usr/include/stdlib.h"
	.file 9 "../include/impl.h"
	.file 10 "ops.h"
	.file 11 "/usr/include/string.h"
	.file 12 "/usr/include/time.h"
	.file 13 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9e1
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x15
	.long	.LASF63
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x8
	.long	.LASF7
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x3f
	.uleb128 0xe
	.long	0x2e
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x16
	.byte	0x8
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x8
	.long	.LASF8
	.byte	0x4
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x17
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x8
	.long	.LASF11
	.byte	0x4
	.byte	0x2d
	.byte	0x1b
	.long	0x3f
	.uleb128 0x8
	.long	.LASF12
	.byte	0x4
	.byte	0x9c
	.byte	0x1b
	.long	0x7e
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0xe
	.long	0x9d
	.uleb128 0x6
	.long	0xa4
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0x7
	.byte	0x13
	.long	0x91
	.uleb128 0x8
	.long	.LASF15
	.byte	0x6
	.byte	0x18
	.byte	0x13
	.long	0x64
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.byte	0x1b
	.byte	0x14
	.long	0x85
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF17
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF18
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF19
	.uleb128 0x6
	.long	0xec
	.uleb128 0x18
	.uleb128 0x8
	.long	.LASF20
	.byte	0x7
	.byte	0xa
	.byte	0x1b
	.long	0xfe
	.uleb128 0xe
	.long	0xed
	.uleb128 0x19
	.long	.LASF64
	.uleb128 0x12
	.long	.LASF21
	.byte	0x8
	.value	0x21b
	.byte	0xe
	.long	0x4d
	.long	0x11a
	.uleb128 0x1
	.long	0x2e
	.byte	0
	.uleb128 0xf
	.long	.LASF23
	.byte	0x9
	.long	0x143
	.uleb128 0x1
	.long	0x143
	.uleb128 0x1
	.long	0x4d
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x4d
	.uleb128 0x1
	.long	0x14d
	.byte	0
	.uleb128 0x6
	.long	0xf9
	.uleb128 0x6
	.long	0x3a
	.uleb128 0x6
	.long	0x152
	.uleb128 0x13
	.long	0xc6
	.long	0x166
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x4d
	.byte	0
	.uleb128 0x10
	.long	.LASF22
	.byte	0x9
	.byte	0x8
	.byte	0x7
	.long	0x4d
	.long	0x17c
	.uleb128 0x1
	.long	0x17c
	.byte	0
	.uleb128 0x6
	.long	0xed
	.uleb128 0x1a
	.long	.LASF28
	.byte	0x8
	.value	0x1c5
	.byte	0xc
	.long	0x77
	.uleb128 0xf
	.long	.LASF24
	.byte	0x7
	.long	0x1b2
	.uleb128 0x1
	.long	0x143
	.uleb128 0x1
	.long	0x4d
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0xc6
	.byte	0
	.uleb128 0x10
	.long	.LASF25
	.byte	0x9
	.byte	0x6
	.byte	0xc
	.long	0x17c
	.long	0x1ce
	.uleb128 0x1
	.long	0xba
	.uleb128 0x1
	.long	0x2e
	.uleb128 0x14
	.byte	0
	.uleb128 0xf
	.long	.LASF26
	.byte	0x13
	.long	0x210
	.uleb128 0x1
	.long	0x143
	.uleb128 0x1
	.long	0xe7
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x143
	.uleb128 0x1
	.long	0xe7
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x143
	.uleb128 0x1
	.long	0x4d
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x148
	.uleb128 0x1
	.long	0x210
	.byte	0
	.uleb128 0x6
	.long	0x215
	.uleb128 0x13
	.long	0xc6
	.long	0x233
	.uleb128 0x1
	.long	0xc6
	.uleb128 0x1
	.long	0xc6
	.uleb128 0x1
	.long	0x233
	.uleb128 0x1
	.long	0xc6
	.byte	0
	.uleb128 0x6
	.long	0xc6
	.uleb128 0x10
	.long	.LASF27
	.byte	0xb
	.byte	0x3d
	.byte	0xe
	.long	0x4d
	.long	0x258
	.uleb128 0x1
	.long	0x4d
	.uleb128 0x1
	.long	0x77
	.uleb128 0x1
	.long	0x2e
	.byte	0
	.uleb128 0x1b
	.long	.LASF29
	.byte	0xc
	.byte	0x48
	.byte	0x10
	.long	0xae
	.uleb128 0x12
	.long	.LASF30
	.byte	0xd
	.value	0x15e
	.byte	0xc
	.long	0x77
	.long	0x27c
	.uleb128 0x1
	.long	0xa9
	.uleb128 0x14
	.byte	0
	.uleb128 0x1c
	.long	.LASF65
	.byte	0x2
	.byte	0xaa
	.byte	0x5
	.long	0x77
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.long	.LASF66
	.byte	0x2
	.byte	0xa5
	.byte	0x6
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.long	.LASF34
	.byte	0x92
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x357
	.uleb128 0x7
	.long	.LASF31
	.byte	0x93
	.byte	0xe
	.long	0x17c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x94
	.byte	0x9
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x94
	.byte	0x22
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x94
	.byte	0x3b
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF32
	.byte	0x9b
	.byte	0x9
	.long	0x363
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1e
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x337
	.uleb128 0x2
	.string	"i"
	.byte	0x2
	.byte	0x96
	.byte	0xc
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x2
	.string	"i"
	.byte	0x2
	.byte	0x98
	.byte	0xc
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x35c
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.long	.LASF33
	.uleb128 0xc
	.long	0x4d
	.long	0x373
	.uleb128 0xa
	.long	0x3f
	.byte	0x2
	.byte	0
	.uleb128 0x1f
	.long	.LASF36
	.byte	0x2
	.byte	0x8b
	.byte	0x6
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x3e7
	.uleb128 0x3
	.long	.LASF32
	.byte	0x2
	.byte	0x8b
	.byte	0x1e
	.long	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x8c
	.byte	0x9
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x8c
	.byte	0x17
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x8c
	.byte	0x25
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x2
	.string	"i"
	.byte	0x2
	.byte	0x8e
	.byte	0xc
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x4d
	.uleb128 0x11
	.long	.LASF35
	.byte	0x77
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x468
	.uleb128 0x7
	.long	.LASF31
	.byte	0x78
	.byte	0x3
	.long	0x17c
	.uleb128 0x9
	.byte	0x3
	.quad	desc.3
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x7a
	.byte	0x3
	.long	0x4d
	.uleb128 0x9
	.byte	0x3
	.quad	x.2
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x7b
	.byte	0x3
	.long	0x4d
	.uleb128 0x9
	.byte	0x3
	.quad	y.1
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x7c
	.byte	0x3
	.long	0x4d
	.uleb128 0x9
	.byte	0x3
	.quad	z.0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x84
	.byte	0x9
	.long	0x468
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0xc
	.long	0x4d
	.long	0x478
	.uleb128 0xa
	.long	0x3f
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.long	.LASF37
	.byte	0x70
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x4d9
	.uleb128 0x3
	.long	.LASF32
	.byte	0x2
	.byte	0x70
	.byte	0x1f
	.long	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF31
	.byte	0x71
	.byte	0xe
	.long	0x17c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x72
	.byte	0x9
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x72
	.byte	0x17
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x72
	.byte	0x25
	.long	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x20
	.long	.LASF52
	.byte	0x2
	.byte	0x6c
	.byte	0xa
	.long	0xc6
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x51a
	.uleb128 0x3
	.long	.LASF38
	.byte	0x2
	.byte	0x6c
	.byte	0x22
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"arg"
	.byte	0x2
	.byte	0x6c
	.byte	0x2f
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	.LASF39
	.byte	0x55
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x57e
	.uleb128 0x7
	.long	.LASF31
	.byte	0x56
	.byte	0xe
	.long	0x17c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x57
	.byte	0xb
	.long	0x57e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x57
	.byte	0x22
	.long	0x57e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x57
	.byte	0x39
	.long	0x57e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x7
	.long	.LASF32
	.byte	0x59
	.byte	0x9
	.long	0x468
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.byte	0
	.uleb128 0xc
	.long	0xba
	.long	0x594
	.uleb128 0xa
	.long	0x3f
	.byte	0x7
	.uleb128 0xa
	.long	0x3f
	.byte	0x7
	.byte	0
	.uleb128 0xd
	.long	.LASF40
	.byte	0x49
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x61f
	.uleb128 0x3
	.long	.LASF32
	.byte	0x2
	.byte	0x49
	.byte	0x1e
	.long	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF31
	.byte	0x4a
	.byte	0xe
	.long	0x17c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x4b
	.byte	0x9
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x4b
	.byte	0x17
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x4b
	.byte	0x25
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x7
	.long	.LASF41
	.byte	0x4f
	.byte	0x11
	.long	0x61f
	.uleb128 0x9
	.byte	0x3
	.quad	count.4
	.uleb128 0x7
	.long	.LASF42
	.byte	0x4f
	.byte	0x3c
	.long	0x61f
	.uleb128 0x9
	.byte	0x3
	.quad	offset.5
	.byte	0
	.uleb128 0xc
	.long	0x2e
	.long	0x62f
	.uleb128 0xa
	.long	0x3f
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.long	.LASF43
	.byte	0x3b
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x6c2
	.uleb128 0x3
	.long	.LASF32
	.byte	0x2
	.byte	0x3b
	.byte	0x1d
	.long	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"x"
	.byte	0x2
	.byte	0x3c
	.byte	0xc
	.long	0x6c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"y"
	.byte	0x2
	.byte	0x3c
	.byte	0x1a
	.long	0x6c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"z"
	.byte	0x2
	.byte	0x3c
	.byte	0x28
	.long	0x6c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x2
	.string	"py"
	.byte	0x2
	.byte	0x44
	.byte	0xc
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x2
	.string	"px"
	.byte	0x2
	.byte	0x45
	.byte	0xe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0xba
	.uleb128 0xd
	.long	.LASF44
	.byte	0x22
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x74b
	.uleb128 0x3
	.long	.LASF45
	.byte	0x2
	.byte	0x22
	.byte	0x24
	.long	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF46
	.byte	0x2
	.byte	0x22
	.byte	0x2e
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x3
	.long	.LASF47
	.byte	0x2
	.byte	0x22
	.byte	0x3a
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.long	.LASF48
	.byte	0x2
	.byte	0x22
	.byte	0x4d
	.long	0x756
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.long	.LASF32
	.byte	0x2
	.byte	0x22
	.byte	0x64
	.long	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x7
	.long	.LASF49
	.byte	0x29
	.byte	0x9
	.long	0x75b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.long	.LASF50
	.byte	0x2f
	.byte	0x9
	.long	0x75b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.long	0x756
	.uleb128 0x1
	.long	0x3e7
	.byte	0
	.uleb128 0x6
	.long	0x74b
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF51
	.uleb128 0x9
	.long	.LASF53
	.byte	0x24
	.byte	0x6
	.long	0x35c
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x7b1
	.uleb128 0x3
	.long	.LASF38
	.byte	0x1
	.byte	0x24
	.byte	0x24
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.long	.LASF54
	.byte	0x1
	.byte	0x24
	.byte	0x34
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x4
	.string	"arg"
	.byte	0x1
	.byte	0x24
	.byte	0x41
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x9
	.long	.LASF55
	.byte	0x20
	.byte	0xa
	.long	0xc6
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x80b
	.uleb128 0x4
	.string	"x"
	.byte	0x1
	.byte	0x20
	.byte	0x1c
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"y"
	.byte	0x1
	.byte	0x20
	.byte	0x28
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF56
	.byte	0x1
	.byte	0x20
	.byte	0x35
	.long	0x233
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF57
	.byte	0x1
	.byte	0x20
	.byte	0x45
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x9
	.long	.LASF58
	.byte	0x1c
	.byte	0xa
	.long	0xc6
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x865
	.uleb128 0x4
	.string	"x"
	.byte	0x1
	.byte	0x1c
	.byte	0x1c
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"y"
	.byte	0x1
	.byte	0x1c
	.byte	0x28
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF56
	.byte	0x1
	.byte	0x1c
	.byte	0x35
	.long	0x233
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF57
	.byte	0x1
	.byte	0x1c
	.byte	0x45
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x9
	.long	.LASF59
	.byte	0x18
	.byte	0xa
	.long	0xc6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x8bf
	.uleb128 0x4
	.string	"x"
	.byte	0x1
	.byte	0x18
	.byte	0x1b
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"y"
	.byte	0x1
	.byte	0x18
	.byte	0x27
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF56
	.byte	0x1
	.byte	0x18
	.byte	0x34
	.long	0x233
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF57
	.byte	0x1
	.byte	0x18
	.byte	0x44
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x9
	.long	.LASF60
	.byte	0x14
	.byte	0xa
	.long	0xc6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x919
	.uleb128 0x4
	.string	"x"
	.byte	0x1
	.byte	0x14
	.byte	0x1c
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"y"
	.byte	0x1
	.byte	0x14
	.byte	0x28
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.long	.LASF56
	.byte	0x1
	.byte	0x14
	.byte	0x35
	.long	0x233
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF57
	.byte	0x1
	.byte	0x14
	.byte	0x45
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x9
	.long	.LASF61
	.byte	0xe
	.byte	0xa
	.long	0xc6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x980
	.uleb128 0x4
	.string	"x"
	.byte	0x1
	.byte	0xe
	.byte	0x1c
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.string	"y"
	.byte	0x1
	.byte	0xe
	.byte	0x28
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.long	.LASF56
	.byte	0x1
	.byte	0xe
	.byte	0x35
	.long	0x233
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.long	.LASF57
	.byte	0x1
	.byte	0xe
	.byte	0x45
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.string	"z"
	.byte	0x1
	.byte	0xf
	.byte	0xc
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF62
	.byte	0x1
	.byte	0x8
	.byte	0xa
	.long	0xc6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.string	"x"
	.byte	0x1
	.byte	0x8
	.byte	0x1c
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.string	"y"
	.byte	0x1
	.byte	0x8
	.byte	0x28
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.long	.LASF56
	.byte	0x1
	.byte	0x8
	.byte	0x35
	.long	0x233
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.long	.LASF57
	.byte	0x1
	.byte	0x8
	.byte	0x45
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.string	"z"
	.byte	0x1
	.byte	0x9
	.byte	0xc
	.long	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.string	"clock_t"
.LASF39:
	.string	"test_mat"
.LASF26:
	.string	"bulk_op"
.LASF59:
	.string	"bulk_or"
.LASF44:
	.string	"perform_benchmark"
.LASF9:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF21:
	.string	"malloc"
.LASF65:
	.string	"main"
.LASF12:
	.string	"__clock_t"
.LASF54:
	.string	"value"
.LASF43:
	.string	"test_mat_normal"
.LASF47:
	.string	"iterations"
.LASF38:
	.string	"index"
.LASF28:
	.string	"rand"
.LASF63:
	.string	"GNU C17 11.2.1 20211203 (Red Hat 11.2.1-7) -mtune=generic -march=x86-64 -g"
.LASF52:
	.string	"rnd_bool"
.LASF6:
	.string	"signed char"
.LASF51:
	.string	"float"
.LASF61:
	.string	"bulk_sub"
.LASF48:
	.string	"func"
.LASF17:
	.string	"long long int"
.LASF23:
	.string	"bulk_set"
.LASF27:
	.string	"memset"
.LASF10:
	.string	"long int"
.LASF42:
	.string	"offset"
.LASF8:
	.string	"__uint8_t"
.LASF4:
	.string	"unsigned char"
.LASF58:
	.string	"bulk_xor"
.LASF34:
	.string	"test_bool_normal"
.LASF45:
	.string	"name"
.LASF18:
	.string	"long double"
.LASF22:
	.string	"alloc_array"
.LASF64:
	.string	"ARRAY_DESC"
.LASF66:
	.string	"test_bool"
.LASF16:
	.string	"uint64_t"
.LASF19:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF32:
	.string	"args"
.LASF24:
	.string	"bulk_fill"
.LASF50:
	.string	"time"
.LASF55:
	.string	"bulk_not"
.LASF49:
	.string	"start"
.LASF5:
	.string	"short unsigned int"
.LASF56:
	.string	"carry"
.LASF46:
	.string	"warmup"
.LASF13:
	.string	"char"
.LASF30:
	.string	"printf"
.LASF37:
	.string	"task_bool_compact"
.LASF33:
	.string	"_Bool"
.LASF41:
	.string	"count"
.LASF11:
	.string	"__uint64_t"
.LASF35:
	.string	"test_bool_compact"
.LASF2:
	.string	"long unsigned int"
.LASF29:
	.string	"clock"
.LASF60:
	.string	"bulk_and"
.LASF20:
	.string	"ArrayDesc"
.LASF62:
	.string	"bulk_add"
.LASF57:
	.string	"mask"
.LASF53:
	.string	"bulk_find_value"
.LASF15:
	.string	"uint8_t"
.LASF40:
	.string	"test_mat_compact"
.LASF25:
	.string	"alloc_desc"
.LASF36:
	.string	"task_bool_normal"
.LASF31:
	.string	"desc"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/michiel/Documents/RU/Thesis/Parser/src"
.LASF0:
	.string	"main.c"
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
