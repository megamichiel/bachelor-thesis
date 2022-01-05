	.file	"ops_seq.c"
# GNU C17 (GCC) version 11.2.1 20211203 (Red Hat 11.2.1-7) (x86_64-redhat-linux)
#	compiled by GNU C version 11.2.1 20211203 (Red Hat 11.2.1-7), GMP version 6.2.0, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g
	.text
.Ltext0:
	.file 0 "/home/michiel/Documents/RU/Thesis/Parser/src" "ops_seq.c"
	.globl	not
	.type	not, @function
not:
.LFB6:
	.file 1 "ops_seq.c"
	.loc 1 9 57
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	#,
	movq	%rdi, -104(%rbp)	# desc, desc
	movq	%rsi, -112(%rbp)	# x, x
	movq	%rdx, -120(%rbp)	# y, y
# ops_seq.c:10:   size_t raw = byte_size(desc), i = 0, n;
	.loc 1 10 16
	movq	-104(%rbp), %rax	# desc, tmp104
	movq	%rax, %rdi	# tmp104,
	call	byte_size	#
	movq	%rax, -16(%rbp)	# tmp105, raw
# ops_seq.c:10:   size_t raw = byte_size(desc), i = 0, n;
	.loc 1 10 33
	movq	$0, -8(%rbp)	#, i
.LBB2:
# ops_seq.c:12:   un_op(uint64_t, 3, ~)
	.loc 1 12 3
	movq	-112(%rbp), %rax	# x, tmp106
	movq	%rax, -24(%rbp)	# tmp106, x_
	movq	-120(%rbp), %rax	# y, tmp107
	movq	%rax, -32(%rbp)	# tmp107, y_
	movq	-16(%rbp), %rax	# raw, tmp111
	shrq	$3, %rax	#, tmp110
	movq	%rax, -40(%rbp)	# tmp110, n
	salq	-8(%rbp)	# i
	jmp	.L2	#
.L3:
# ops_seq.c:12:   un_op(uint64_t, 3, ~)
	.loc 1 12 3 is_stmt 0 discriminator 3
	movq	-8(%rbp), %rax	# i, tmp112
	leaq	0(,%rax,8), %rdx	#, _1
	movq	-24(%rbp), %rax	# x_, tmp113
	addq	%rdx, %rax	# _1, _2
	movq	(%rax), %rdx	# *_2, _3
	movq	-8(%rbp), %rax	# i, tmp114
	leaq	0(,%rax,8), %rcx	#, _4
	movq	-32(%rbp), %rax	# y_, tmp115
	addq	%rcx, %rax	# _4, _5
	notq	%rdx	# _6
	movq	%rdx, (%rax)	# _6, *_5
	addq	$1, -8(%rbp)	#, i
.L2:
# ops_seq.c:12:   un_op(uint64_t, 3, ~)
	.loc 1 12 3 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp116
	cmpq	-40(%rbp), %rax	# n, tmp116
	jb	.L3	#,
.LBE2:
.LBB3:
# ops_seq.c:13:   un_op(uint32_t, 2, ~)
	.loc 1 13 3 is_stmt 1
	movq	-112(%rbp), %rax	# x, tmp117
	movq	%rax, -48(%rbp)	# tmp117, x_
	movq	-120(%rbp), %rax	# y, tmp118
	movq	%rax, -56(%rbp)	# tmp118, y_
	movq	-16(%rbp), %rax	# raw, tmp122
	shrq	$2, %rax	#, tmp121
	movq	%rax, -40(%rbp)	# tmp121, n
	salq	-8(%rbp)	# i
	jmp	.L4	#
.L5:
# ops_seq.c:13:   un_op(uint32_t, 2, ~)
	.loc 1 13 3 is_stmt 0 discriminator 3
	movq	-8(%rbp), %rax	# i, tmp123
	leaq	0(,%rax,4), %rdx	#, _7
	movq	-48(%rbp), %rax	# x_, tmp124
	addq	%rdx, %rax	# _7, _8
	movl	(%rax), %edx	# *_8, _9
	movq	-8(%rbp), %rax	# i, tmp125
	leaq	0(,%rax,4), %rcx	#, _10
	movq	-56(%rbp), %rax	# y_, tmp126
	addq	%rcx, %rax	# _10, _11
	notl	%edx	# _12
	movl	%edx, (%rax)	# _12, *_11
	addq	$1, -8(%rbp)	#, i
.L4:
# ops_seq.c:13:   un_op(uint32_t, 2, ~)
	.loc 1 13 3 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp127
	cmpq	-40(%rbp), %rax	# n, tmp127
	jb	.L5	#,
.LBE3:
.LBB4:
# ops_seq.c:14:   un_op(uint16_t, 1, ~)
	.loc 1 14 3 is_stmt 1
	movq	-112(%rbp), %rax	# x, tmp128
	movq	%rax, -64(%rbp)	# tmp128, x_
	movq	-120(%rbp), %rax	# y, tmp129
	movq	%rax, -72(%rbp)	# tmp129, y_
	movq	-16(%rbp), %rax	# raw, tmp133
	shrq	%rax	# tmp132
	movq	%rax, -40(%rbp)	# tmp132, n
	salq	-8(%rbp)	# i
	jmp	.L6	#
.L7:
# ops_seq.c:14:   un_op(uint16_t, 1, ~)
	.loc 1 14 3 is_stmt 0 discriminator 3
	movq	-8(%rbp), %rax	# i, tmp134
	leaq	(%rax,%rax), %rdx	#, _13
	movq	-64(%rbp), %rax	# x_, tmp135
	addq	%rdx, %rax	# _13, _14
	movzwl	(%rax), %edx	# *_14, _15
	movq	-8(%rbp), %rax	# i, tmp136
	leaq	(%rax,%rax), %rcx	#, _16
	movq	-72(%rbp), %rax	# y_, tmp137
	addq	%rcx, %rax	# _16, _17
	notl	%edx	# _18
	movw	%dx, (%rax)	# _18, *_17
	addq	$1, -8(%rbp)	#, i
.L6:
# ops_seq.c:14:   un_op(uint16_t, 1, ~)
	.loc 1 14 3 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp138
	cmpq	-40(%rbp), %rax	# n, tmp138
	jb	.L7	#,
.LBE4:
.LBB5:
# ops_seq.c:15:   un_op(uint8_t, 0, ~)
	.loc 1 15 3 is_stmt 1
	movq	-112(%rbp), %rax	# x, tmp139
	movq	%rax, -80(%rbp)	# tmp139, x_
	movq	-120(%rbp), %rax	# y, tmp140
	movq	%rax, -88(%rbp)	# tmp140, y_
	movq	-16(%rbp), %rax	# raw, tmp141
	movq	%rax, -40(%rbp)	# tmp141, n
	salq	-8(%rbp)	# i
	jmp	.L8	#
.L9:
# ops_seq.c:15:   un_op(uint8_t, 0, ~)
	.loc 1 15 3 is_stmt 0 discriminator 3
	movq	-80(%rbp), %rdx	# x_, tmp142
	movq	-8(%rbp), %rax	# i, tmp143
	addq	%rdx, %rax	# tmp142, _19
	movzbl	(%rax), %edx	# *_19, _20
	movq	-88(%rbp), %rcx	# y_, tmp144
	movq	-8(%rbp), %rax	# i, tmp145
	addq	%rcx, %rax	# tmp144, _21
	notl	%edx	# _22
	movb	%dl, (%rax)	# _22, *_21
	addq	$1, -8(%rbp)	#, i
.L8:
# ops_seq.c:15:   un_op(uint8_t, 0, ~)
	.loc 1 15 3 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp146
	cmpq	-40(%rbp), %rax	# n, tmp146
	jb	.L9	#,
.LBE5:
# ops_seq.c:16: }
	.loc 1 16 1 is_stmt 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	not, .-not
	.globl	and
	.type	and, @function
and:
.LFB7:
	.loc 1 33 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$160, %rsp	#,
	movq	%rdi, -136(%rbp)	# desc, desc
	movq	%rsi, -144(%rbp)	# x, x
	movq	%rdx, -152(%rbp)	# y, y
	movq	%rcx, -160(%rbp)	# z, z
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1
	movq	-136(%rbp), %rax	# desc, tmp115
	movq	%rax, %rdi	# tmp115,
	call	byte_size	#
	movq	%rax, -16(%rbp)	# tmp116, raw
	movq	$0, -8(%rbp)	#, i
.LBB6:
	movq	-144(%rbp), %rax	# x, tmp117
	movq	%rax, -24(%rbp)	# tmp117, x_
	movq	-152(%rbp), %rax	# y, tmp118
	movq	%rax, -32(%rbp)	# tmp118, y_
	movq	-160(%rbp), %rax	# z, tmp119
	movq	%rax, -40(%rbp)	# tmp119, z_
	movq	-16(%rbp), %rax	# raw, tmp123
	shrq	$3, %rax	#, tmp122
	movq	%rax, -48(%rbp)	# tmp122, n
	salq	-8(%rbp)	# i
	jmp	.L11	#
.L12:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 is_stmt 0 discriminator 3
	movq	-8(%rbp), %rax	# i, tmp124
	leaq	0(,%rax,8), %rdx	#, _1
	movq	-24(%rbp), %rax	# x_, tmp125
	addq	%rdx, %rax	# _1, _2
	movq	(%rax), %rcx	# *_2, _3
	movq	-8(%rbp), %rax	# i, tmp126
	leaq	0(,%rax,8), %rdx	#, _4
	movq	-32(%rbp), %rax	# y_, tmp127
	addq	%rdx, %rax	# _4, _5
	movq	(%rax), %rdx	# *_5, _6
	movq	-8(%rbp), %rax	# i, tmp128
	leaq	0(,%rax,8), %rsi	#, _7
	movq	-40(%rbp), %rax	# z_, tmp129
	addq	%rsi, %rax	# _7, _8
	andq	%rcx, %rdx	# _3, _9
	movq	%rdx, (%rax)	# _9, *_8
	addq	$1, -8(%rbp)	#, i
.L11:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp130
	cmpq	-48(%rbp), %rax	# n, tmp130
	jb	.L12	#,
.LBE6:
.LBB7:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 4
	movq	-144(%rbp), %rax	# x, tmp131
	movq	%rax, -56(%rbp)	# tmp131, x_
	movq	-152(%rbp), %rax	# y, tmp132
	movq	%rax, -64(%rbp)	# tmp132, y_
	movq	-160(%rbp), %rax	# z, tmp133
	movq	%rax, -72(%rbp)	# tmp133, z_
	movq	-16(%rbp), %rax	# raw, tmp137
	shrq	$2, %rax	#, tmp136
	movq	%rax, -48(%rbp)	# tmp136, n
	salq	-8(%rbp)	# i
	jmp	.L13	#
.L14:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 7
	movq	-8(%rbp), %rax	# i, tmp138
	leaq	0(,%rax,4), %rdx	#, _10
	movq	-56(%rbp), %rax	# x_, tmp139
	addq	%rdx, %rax	# _10, _11
	movl	(%rax), %ecx	# *_11, _12
	movq	-8(%rbp), %rax	# i, tmp140
	leaq	0(,%rax,4), %rdx	#, _13
	movq	-64(%rbp), %rax	# y_, tmp141
	addq	%rdx, %rax	# _13, _14
	movl	(%rax), %edx	# *_14, _15
	movq	-8(%rbp), %rax	# i, tmp142
	leaq	0(,%rax,4), %rsi	#, _16
	movq	-72(%rbp), %rax	# z_, tmp143
	addq	%rsi, %rax	# _16, _17
	andl	%ecx, %edx	# _12, _18
	movl	%edx, (%rax)	# _18, *_17
	addq	$1, -8(%rbp)	#, i
.L13:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 5
	movq	-8(%rbp), %rax	# i, tmp144
	cmpq	-48(%rbp), %rax	# n, tmp144
	jb	.L14	#,
.LBE7:
.LBB8:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 8
	movq	-144(%rbp), %rax	# x, tmp145
	movq	%rax, -80(%rbp)	# tmp145, x_
	movq	-152(%rbp), %rax	# y, tmp146
	movq	%rax, -88(%rbp)	# tmp146, y_
	movq	-160(%rbp), %rax	# z, tmp147
	movq	%rax, -96(%rbp)	# tmp147, z_
	movq	-16(%rbp), %rax	# raw, tmp151
	shrq	%rax	# tmp150
	movq	%rax, -48(%rbp)	# tmp150, n
	salq	-8(%rbp)	# i
	jmp	.L15	#
.L16:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 11
	movq	-8(%rbp), %rax	# i, tmp152
	leaq	(%rax,%rax), %rdx	#, _19
	movq	-80(%rbp), %rax	# x_, tmp153
	addq	%rdx, %rax	# _19, _20
	movzwl	(%rax), %ecx	# *_20, _21
	movq	-8(%rbp), %rax	# i, tmp154
	leaq	(%rax,%rax), %rdx	#, _22
	movq	-88(%rbp), %rax	# y_, tmp155
	addq	%rdx, %rax	# _22, _23
	movzwl	(%rax), %edx	# *_23, _24
	movq	-8(%rbp), %rax	# i, tmp156
	leaq	(%rax,%rax), %rsi	#, _25
	movq	-96(%rbp), %rax	# z_, tmp157
	addq	%rsi, %rax	# _25, _26
	andl	%ecx, %edx	# _21, _27
	movw	%dx, (%rax)	# _27, *_26
	addq	$1, -8(%rbp)	#, i
.L15:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 9
	movq	-8(%rbp), %rax	# i, tmp158
	cmpq	-48(%rbp), %rax	# n, tmp158
	jb	.L16	#,
.LBE8:
.LBB9:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 12
	movq	-144(%rbp), %rax	# x, tmp159
	movq	%rax, -104(%rbp)	# tmp159, x_
	movq	-152(%rbp), %rax	# y, tmp160
	movq	%rax, -112(%rbp)	# tmp160, y_
	movq	-160(%rbp), %rax	# z, tmp161
	movq	%rax, -120(%rbp)	# tmp161, z_
	movq	-16(%rbp), %rax	# raw, tmp162
	movq	%rax, -48(%rbp)	# tmp162, n
	salq	-8(%rbp)	# i
	jmp	.L17	#
.L18:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 15
	movq	-104(%rbp), %rdx	# x_, tmp163
	movq	-8(%rbp), %rax	# i, tmp164
	addq	%rdx, %rax	# tmp163, _28
	movzbl	(%rax), %ecx	# *_28, _29
	movq	-112(%rbp), %rdx	# y_, tmp165
	movq	-8(%rbp), %rax	# i, tmp166
	addq	%rdx, %rax	# tmp165, _30
	movzbl	(%rax), %edx	# *_30, _31
	movq	-120(%rbp), %rsi	# z_, tmp167
	movq	-8(%rbp), %rax	# i, tmp168
	addq	%rsi, %rax	# tmp167, _32
	andl	%ecx, %edx	# _29, _33
	movb	%dl, (%rax)	# _33, *_32
	addq	$1, -8(%rbp)	#, i
.L17:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1 discriminator 13
	movq	-8(%rbp), %rax	# i, tmp169
	cmpq	-48(%rbp), %rax	# n, tmp169
	jb	.L18	#,
.LBE9:
# ops_seq.c:33: bin_op_func(and, &)
	.loc 1 33 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	and, .-and
	.globl	or
	.type	or, @function
or:
.LFB8:
	.loc 1 34 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$160, %rsp	#,
	movq	%rdi, -136(%rbp)	# desc, desc
	movq	%rsi, -144(%rbp)	# x, x
	movq	%rdx, -152(%rbp)	# y, y
	movq	%rcx, -160(%rbp)	# z, z
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1
	movq	-136(%rbp), %rax	# desc, tmp115
	movq	%rax, %rdi	# tmp115,
	call	byte_size	#
	movq	%rax, -16(%rbp)	# tmp116, raw
	movq	$0, -8(%rbp)	#, i
.LBB10:
	movq	-144(%rbp), %rax	# x, tmp117
	movq	%rax, -24(%rbp)	# tmp117, x_
	movq	-152(%rbp), %rax	# y, tmp118
	movq	%rax, -32(%rbp)	# tmp118, y_
	movq	-160(%rbp), %rax	# z, tmp119
	movq	%rax, -40(%rbp)	# tmp119, z_
	movq	-16(%rbp), %rax	# raw, tmp123
	shrq	$3, %rax	#, tmp122
	movq	%rax, -48(%rbp)	# tmp122, n
	salq	-8(%rbp)	# i
	jmp	.L20	#
.L21:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 is_stmt 0 discriminator 3
	movq	-8(%rbp), %rax	# i, tmp124
	leaq	0(,%rax,8), %rdx	#, _1
	movq	-24(%rbp), %rax	# x_, tmp125
	addq	%rdx, %rax	# _1, _2
	movq	(%rax), %rcx	# *_2, _3
	movq	-8(%rbp), %rax	# i, tmp126
	leaq	0(,%rax,8), %rdx	#, _4
	movq	-32(%rbp), %rax	# y_, tmp127
	addq	%rdx, %rax	# _4, _5
	movq	(%rax), %rdx	# *_5, _6
	movq	-8(%rbp), %rax	# i, tmp128
	leaq	0(,%rax,8), %rsi	#, _7
	movq	-40(%rbp), %rax	# z_, tmp129
	addq	%rsi, %rax	# _7, _8
	orq	%rcx, %rdx	# _3, _9
	movq	%rdx, (%rax)	# _9, *_8
	addq	$1, -8(%rbp)	#, i
.L20:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp130
	cmpq	-48(%rbp), %rax	# n, tmp130
	jb	.L21	#,
.LBE10:
.LBB11:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 4
	movq	-144(%rbp), %rax	# x, tmp131
	movq	%rax, -56(%rbp)	# tmp131, x_
	movq	-152(%rbp), %rax	# y, tmp132
	movq	%rax, -64(%rbp)	# tmp132, y_
	movq	-160(%rbp), %rax	# z, tmp133
	movq	%rax, -72(%rbp)	# tmp133, z_
	movq	-16(%rbp), %rax	# raw, tmp137
	shrq	$2, %rax	#, tmp136
	movq	%rax, -48(%rbp)	# tmp136, n
	salq	-8(%rbp)	# i
	jmp	.L22	#
.L23:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 7
	movq	-8(%rbp), %rax	# i, tmp138
	leaq	0(,%rax,4), %rdx	#, _10
	movq	-56(%rbp), %rax	# x_, tmp139
	addq	%rdx, %rax	# _10, _11
	movl	(%rax), %ecx	# *_11, _12
	movq	-8(%rbp), %rax	# i, tmp140
	leaq	0(,%rax,4), %rdx	#, _13
	movq	-64(%rbp), %rax	# y_, tmp141
	addq	%rdx, %rax	# _13, _14
	movl	(%rax), %edx	# *_14, _15
	movq	-8(%rbp), %rax	# i, tmp142
	leaq	0(,%rax,4), %rsi	#, _16
	movq	-72(%rbp), %rax	# z_, tmp143
	addq	%rsi, %rax	# _16, _17
	orl	%ecx, %edx	# _12, _18
	movl	%edx, (%rax)	# _18, *_17
	addq	$1, -8(%rbp)	#, i
.L22:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 5
	movq	-8(%rbp), %rax	# i, tmp144
	cmpq	-48(%rbp), %rax	# n, tmp144
	jb	.L23	#,
.LBE11:
.LBB12:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 8
	movq	-144(%rbp), %rax	# x, tmp145
	movq	%rax, -80(%rbp)	# tmp145, x_
	movq	-152(%rbp), %rax	# y, tmp146
	movq	%rax, -88(%rbp)	# tmp146, y_
	movq	-160(%rbp), %rax	# z, tmp147
	movq	%rax, -96(%rbp)	# tmp147, z_
	movq	-16(%rbp), %rax	# raw, tmp151
	shrq	%rax	# tmp150
	movq	%rax, -48(%rbp)	# tmp150, n
	salq	-8(%rbp)	# i
	jmp	.L24	#
.L25:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 11
	movq	-8(%rbp), %rax	# i, tmp152
	leaq	(%rax,%rax), %rdx	#, _19
	movq	-80(%rbp), %rax	# x_, tmp153
	addq	%rdx, %rax	# _19, _20
	movzwl	(%rax), %ecx	# *_20, _21
	movq	-8(%rbp), %rax	# i, tmp154
	leaq	(%rax,%rax), %rdx	#, _22
	movq	-88(%rbp), %rax	# y_, tmp155
	addq	%rdx, %rax	# _22, _23
	movzwl	(%rax), %edx	# *_23, _24
	movq	-8(%rbp), %rax	# i, tmp156
	leaq	(%rax,%rax), %rsi	#, _25
	movq	-96(%rbp), %rax	# z_, tmp157
	addq	%rsi, %rax	# _25, _26
	orl	%ecx, %edx	# _21, _27
	movw	%dx, (%rax)	# _27, *_26
	addq	$1, -8(%rbp)	#, i
.L24:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 9
	movq	-8(%rbp), %rax	# i, tmp158
	cmpq	-48(%rbp), %rax	# n, tmp158
	jb	.L25	#,
.LBE12:
.LBB13:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 12
	movq	-144(%rbp), %rax	# x, tmp159
	movq	%rax, -104(%rbp)	# tmp159, x_
	movq	-152(%rbp), %rax	# y, tmp160
	movq	%rax, -112(%rbp)	# tmp160, y_
	movq	-160(%rbp), %rax	# z, tmp161
	movq	%rax, -120(%rbp)	# tmp161, z_
	movq	-16(%rbp), %rax	# raw, tmp162
	movq	%rax, -48(%rbp)	# tmp162, n
	salq	-8(%rbp)	# i
	jmp	.L26	#
.L27:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 15
	movq	-104(%rbp), %rdx	# x_, tmp163
	movq	-8(%rbp), %rax	# i, tmp164
	addq	%rdx, %rax	# tmp163, _28
	movzbl	(%rax), %ecx	# *_28, _29
	movq	-112(%rbp), %rdx	# y_, tmp165
	movq	-8(%rbp), %rax	# i, tmp166
	addq	%rdx, %rax	# tmp165, _30
	movzbl	(%rax), %edx	# *_30, _31
	movq	-120(%rbp), %rsi	# z_, tmp167
	movq	-8(%rbp), %rax	# i, tmp168
	addq	%rsi, %rax	# tmp167, _32
	orl	%ecx, %edx	# _29, _33
	movb	%dl, (%rax)	# _33, *_32
	addq	$1, -8(%rbp)	#, i
.L26:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1 discriminator 13
	movq	-8(%rbp), %rax	# i, tmp169
	cmpq	-48(%rbp), %rax	# n, tmp169
	jb	.L27	#,
.LBE13:
# ops_seq.c:34: bin_op_func(or, |)
	.loc 1 34 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	or, .-or
	.globl	xor
	.type	xor, @function
xor:
.LFB9:
	.loc 1 35 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$160, %rsp	#,
	movq	%rdi, -136(%rbp)	# desc, desc
	movq	%rsi, -144(%rbp)	# x, x
	movq	%rdx, -152(%rbp)	# y, y
	movq	%rcx, -160(%rbp)	# z, z
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1
	movq	-136(%rbp), %rax	# desc, tmp115
	movq	%rax, %rdi	# tmp115,
	call	byte_size	#
	movq	%rax, -16(%rbp)	# tmp116, raw
	movq	$0, -8(%rbp)	#, i
.LBB14:
	movq	-144(%rbp), %rax	# x, tmp117
	movq	%rax, -24(%rbp)	# tmp117, x_
	movq	-152(%rbp), %rax	# y, tmp118
	movq	%rax, -32(%rbp)	# tmp118, y_
	movq	-160(%rbp), %rax	# z, tmp119
	movq	%rax, -40(%rbp)	# tmp119, z_
	movq	-16(%rbp), %rax	# raw, tmp123
	shrq	$3, %rax	#, tmp122
	movq	%rax, -48(%rbp)	# tmp122, n
	salq	-8(%rbp)	# i
	jmp	.L29	#
.L30:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 is_stmt 0 discriminator 3
	movq	-8(%rbp), %rax	# i, tmp124
	leaq	0(,%rax,8), %rdx	#, _1
	movq	-24(%rbp), %rax	# x_, tmp125
	addq	%rdx, %rax	# _1, _2
	movq	(%rax), %rcx	# *_2, _3
	movq	-8(%rbp), %rax	# i, tmp126
	leaq	0(,%rax,8), %rdx	#, _4
	movq	-32(%rbp), %rax	# y_, tmp127
	addq	%rdx, %rax	# _4, _5
	movq	(%rax), %rdx	# *_5, _6
	movq	-8(%rbp), %rax	# i, tmp128
	leaq	0(,%rax,8), %rsi	#, _7
	movq	-40(%rbp), %rax	# z_, tmp129
	addq	%rsi, %rax	# _7, _8
	xorq	%rcx, %rdx	# _3, _9
	movq	%rdx, (%rax)	# _9, *_8
	addq	$1, -8(%rbp)	#, i
.L29:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp130
	cmpq	-48(%rbp), %rax	# n, tmp130
	jb	.L30	#,
.LBE14:
.LBB15:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 4
	movq	-144(%rbp), %rax	# x, tmp131
	movq	%rax, -56(%rbp)	# tmp131, x_
	movq	-152(%rbp), %rax	# y, tmp132
	movq	%rax, -64(%rbp)	# tmp132, y_
	movq	-160(%rbp), %rax	# z, tmp133
	movq	%rax, -72(%rbp)	# tmp133, z_
	movq	-16(%rbp), %rax	# raw, tmp137
	shrq	$2, %rax	#, tmp136
	movq	%rax, -48(%rbp)	# tmp136, n
	salq	-8(%rbp)	# i
	jmp	.L31	#
.L32:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 7
	movq	-8(%rbp), %rax	# i, tmp138
	leaq	0(,%rax,4), %rdx	#, _10
	movq	-56(%rbp), %rax	# x_, tmp139
	addq	%rdx, %rax	# _10, _11
	movl	(%rax), %ecx	# *_11, _12
	movq	-8(%rbp), %rax	# i, tmp140
	leaq	0(,%rax,4), %rdx	#, _13
	movq	-64(%rbp), %rax	# y_, tmp141
	addq	%rdx, %rax	# _13, _14
	movl	(%rax), %edx	# *_14, _15
	movq	-8(%rbp), %rax	# i, tmp142
	leaq	0(,%rax,4), %rsi	#, _16
	movq	-72(%rbp), %rax	# z_, tmp143
	addq	%rsi, %rax	# _16, _17
	xorl	%ecx, %edx	# _12, _18
	movl	%edx, (%rax)	# _18, *_17
	addq	$1, -8(%rbp)	#, i
.L31:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 5
	movq	-8(%rbp), %rax	# i, tmp144
	cmpq	-48(%rbp), %rax	# n, tmp144
	jb	.L32	#,
.LBE15:
.LBB16:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 8
	movq	-144(%rbp), %rax	# x, tmp145
	movq	%rax, -80(%rbp)	# tmp145, x_
	movq	-152(%rbp), %rax	# y, tmp146
	movq	%rax, -88(%rbp)	# tmp146, y_
	movq	-160(%rbp), %rax	# z, tmp147
	movq	%rax, -96(%rbp)	# tmp147, z_
	movq	-16(%rbp), %rax	# raw, tmp151
	shrq	%rax	# tmp150
	movq	%rax, -48(%rbp)	# tmp150, n
	salq	-8(%rbp)	# i
	jmp	.L33	#
.L34:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 11
	movq	-8(%rbp), %rax	# i, tmp152
	leaq	(%rax,%rax), %rdx	#, _19
	movq	-80(%rbp), %rax	# x_, tmp153
	addq	%rdx, %rax	# _19, _20
	movzwl	(%rax), %ecx	# *_20, _21
	movq	-8(%rbp), %rax	# i, tmp154
	leaq	(%rax,%rax), %rdx	#, _22
	movq	-88(%rbp), %rax	# y_, tmp155
	addq	%rdx, %rax	# _22, _23
	movzwl	(%rax), %edx	# *_23, _24
	movq	-8(%rbp), %rax	# i, tmp156
	leaq	(%rax,%rax), %rsi	#, _25
	movq	-96(%rbp), %rax	# z_, tmp157
	addq	%rsi, %rax	# _25, _26
	xorl	%ecx, %edx	# _21, _27
	movw	%dx, (%rax)	# _27, *_26
	addq	$1, -8(%rbp)	#, i
.L33:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 9
	movq	-8(%rbp), %rax	# i, tmp158
	cmpq	-48(%rbp), %rax	# n, tmp158
	jb	.L34	#,
.LBE16:
.LBB17:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 12
	movq	-144(%rbp), %rax	# x, tmp159
	movq	%rax, -104(%rbp)	# tmp159, x_
	movq	-152(%rbp), %rax	# y, tmp160
	movq	%rax, -112(%rbp)	# tmp160, y_
	movq	-160(%rbp), %rax	# z, tmp161
	movq	%rax, -120(%rbp)	# tmp161, z_
	movq	-16(%rbp), %rax	# raw, tmp162
	movq	%rax, -48(%rbp)	# tmp162, n
	salq	-8(%rbp)	# i
	jmp	.L35	#
.L36:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 15
	movq	-104(%rbp), %rdx	# x_, tmp163
	movq	-8(%rbp), %rax	# i, tmp164
	addq	%rdx, %rax	# tmp163, _28
	movzbl	(%rax), %ecx	# *_28, _29
	movq	-112(%rbp), %rdx	# y_, tmp165
	movq	-8(%rbp), %rax	# i, tmp166
	addq	%rdx, %rax	# tmp165, _30
	movzbl	(%rax), %edx	# *_30, _31
	movq	-120(%rbp), %rsi	# z_, tmp167
	movq	-8(%rbp), %rax	# i, tmp168
	addq	%rsi, %rax	# tmp167, _32
	xorl	%ecx, %edx	# _29, _33
	movb	%dl, (%rax)	# _33, *_32
	addq	$1, -8(%rbp)	#, i
.L35:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1 discriminator 13
	movq	-8(%rbp), %rax	# i, tmp169
	cmpq	-48(%rbp), %rax	# n, tmp169
	jb	.L36	#,
.LBE17:
# ops_seq.c:35: bin_op_func(xor, ^)
	.loc 1 35 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	xor, .-xor
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/stdint-uintn.h"
	.file 4 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stddef.h"
	.file 5 "../include/types.h"
	.file 6 "../include/impl.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x6b8
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0xa
	.long	.LASF24
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x5
	.long	.LASF8
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x2e
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x5
	.long	.LASF9
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x35
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x3c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF12
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0xc
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.long	0x51
	.uleb128 0x5
	.long	.LASF15
	.byte	0x3
	.byte	0x19
	.byte	0x14
	.long	0x64
	.uleb128 0x5
	.long	.LASF16
	.byte	0x3
	.byte	0x1a
	.byte	0x14
	.long	0x77
	.uleb128 0x5
	.long	.LASF17
	.byte	0x3
	.byte	0x1b
	.byte	0x14
	.long	0x8a
	.uleb128 0x5
	.long	.LASF18
	.byte	0x4
	.byte	0xd1
	.byte	0x17
	.long	0x43
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF19
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF20
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF21
	.uleb128 0x6
	.long	0xf5
	.uleb128 0xd
	.uleb128 0x5
	.long	.LASF22
	.byte	0x5
	.byte	0xa
	.byte	0x1b
	.long	0x107
	.uleb128 0xe
	.long	0xf6
	.uleb128 0xf
	.long	.LASF25
	.uleb128 0x10
	.long	.LASF26
	.byte	0x6
	.byte	0x13
	.byte	0x8
	.long	0xcf
	.long	0x122
	.uleb128 0x11
	.long	0x122
	.byte	0
	.uleb128 0x6
	.long	0x102
	.uleb128 0x9
	.string	"xor"
	.byte	0x23
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x299
	.uleb128 0x7
	.long	.LASF23
	.byte	0x23
	.byte	0x1
	.long	0x122
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x4
	.string	"x"
	.byte	0x23
	.byte	0x1
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x4
	.string	"y"
	.byte	0x23
	.byte	0x1
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x4
	.string	"z"
	.byte	0x23
	.byte	0x1
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.string	"raw"
	.byte	0x23
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.string	"i"
	.byte	0x23
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.string	"n"
	.byte	0x23
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x1dc
	.uleb128 0x1
	.string	"x_"
	.byte	0x23
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.string	"y_"
	.byte	0x23
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.string	"z_"
	.byte	0x23
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x2
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x21c
	.uleb128 0x1
	.string	"x_"
	.byte	0x23
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.string	"y_"
	.byte	0x23
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.string	"z_"
	.byte	0x23
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x2
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x25c
	.uleb128 0x1
	.string	"x_"
	.byte	0x23
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.string	"y_"
	.byte	0x23
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.string	"z_"
	.byte	0x23
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x8
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x1
	.string	"x_"
	.byte	0x23
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.string	"y_"
	.byte	0x23
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.string	"z_"
	.byte	0x23
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0xc3
	.uleb128 0x6
	.long	0xb7
	.uleb128 0x6
	.long	0xab
	.uleb128 0x6
	.long	0x9f
	.uleb128 0x9
	.string	"or"
	.byte	0x22
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x41e
	.uleb128 0x7
	.long	.LASF23
	.byte	0x22
	.byte	0x1
	.long	0x122
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x4
	.string	"x"
	.byte	0x22
	.byte	0x1
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x4
	.string	"y"
	.byte	0x22
	.byte	0x1
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x4
	.string	"z"
	.byte	0x22
	.byte	0x1
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.string	"raw"
	.byte	0x22
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.string	"i"
	.byte	0x22
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.string	"n"
	.byte	0x22
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x361
	.uleb128 0x1
	.string	"x_"
	.byte	0x22
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.string	"y_"
	.byte	0x22
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.string	"z_"
	.byte	0x22
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x2
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x3a1
	.uleb128 0x1
	.string	"x_"
	.byte	0x22
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.string	"y_"
	.byte	0x22
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.string	"z_"
	.byte	0x22
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x2
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x3e1
	.uleb128 0x1
	.string	"x_"
	.byte	0x22
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.string	"y_"
	.byte	0x22
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.string	"z_"
	.byte	0x22
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x8
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x1
	.string	"x_"
	.byte	0x22
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.string	"y_"
	.byte	0x22
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.string	"z_"
	.byte	0x22
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.uleb128 0x9
	.string	"and"
	.byte	0x21
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x590
	.uleb128 0x7
	.long	.LASF23
	.byte	0x21
	.byte	0x1
	.long	0x122
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x4
	.string	"x"
	.byte	0x21
	.byte	0x1
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x4
	.string	"y"
	.byte	0x21
	.byte	0x1
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x4
	.string	"z"
	.byte	0x21
	.byte	0x1
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.string	"raw"
	.byte	0x21
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.string	"i"
	.byte	0x21
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.string	"n"
	.byte	0x21
	.byte	0x1
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x4d3
	.uleb128 0x1
	.string	"x_"
	.byte	0x21
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.string	"y_"
	.byte	0x21
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.string	"z_"
	.byte	0x21
	.byte	0x1
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x2
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x513
	.uleb128 0x1
	.string	"x_"
	.byte	0x21
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.string	"y_"
	.byte	0x21
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.string	"z_"
	.byte	0x21
	.byte	0x1
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x2
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x553
	.uleb128 0x1
	.string	"x_"
	.byte	0x21
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.string	"y_"
	.byte	0x21
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.string	"z_"
	.byte	0x21
	.byte	0x1
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x8
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x1
	.string	"x_"
	.byte	0x21
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.string	"y_"
	.byte	0x21
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.string	"z_"
	.byte	0x21
	.byte	0x1
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.uleb128 0x12
	.string	"not"
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF23
	.byte	0x9
	.byte	0x1b
	.long	0x122
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x4
	.string	"x"
	.byte	0x9
	.byte	0x2d
	.long	0xf0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x4
	.string	"y"
	.byte	0x9
	.byte	0x36
	.long	0x96
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.string	"raw"
	.byte	0xa
	.byte	0xa
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.string	"i"
	.byte	0xa
	.byte	0x21
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.string	"n"
	.byte	0xa
	.byte	0x28
	.long	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x629
	.uleb128 0x1
	.string	"x_"
	.byte	0xc
	.byte	0x3
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.string	"y_"
	.byte	0xc
	.byte	0x3
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x2
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x65a
	.uleb128 0x1
	.string	"x_"
	.byte	0xd
	.byte	0x3
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.string	"y_"
	.byte	0xd
	.byte	0x3
	.long	0x29e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x2
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x68c
	.uleb128 0x1
	.string	"x_"
	.byte	0xe
	.byte	0x3
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.string	"y_"
	.byte	0xe
	.byte	0x3
	.long	0x2a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x8
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1
	.string	"x_"
	.byte	0xf
	.byte	0x3
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.string	"y_"
	.byte	0xf
	.byte	0x3
	.long	0x2a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
.LASF8:
	.string	"__uint8_t"
.LASF18:
	.string	"size_t"
.LASF23:
	.string	"desc"
.LASF14:
	.string	"uint8_t"
.LASF17:
	.string	"uint64_t"
.LASF26:
	.string	"byte_size"
.LASF2:
	.string	"unsigned char"
.LASF5:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF9:
	.string	"__uint16_t"
.LASF10:
	.string	"__uint32_t"
.LASF22:
	.string	"ArrayDesc"
.LASF25:
	.string	"ARRAY_DESC"
.LASF4:
	.string	"unsigned int"
.LASF21:
	.string	"long long unsigned int"
.LASF20:
	.string	"long double"
.LASF19:
	.string	"long long int"
.LASF13:
	.string	"char"
.LASF24:
	.string	"GNU C17 11.2.1 20211203 (Red Hat 11.2.1-7) -mtune=generic -march=x86-64 -g"
.LASF7:
	.string	"short int"
.LASF12:
	.string	"__uint64_t"
.LASF15:
	.string	"uint16_t"
.LASF16:
	.string	"uint32_t"
.LASF11:
	.string	"long int"
.LASF6:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/michiel/Documents/RU/Thesis/Parser/src"
.LASF0:
	.string	"ops_seq.c"
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
