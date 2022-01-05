	.file	"impl_compact.c"
# GNU C17 (GCC) version 11.2.1 20211203 (Red Hat 11.2.1-7) (x86_64-redhat-linux)
#	compiled by GNU C version 11.2.1 20211203 (Red Hat 11.2.1-7), GMP version 6.2.0, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g
	.text
.Ltext0:
	.file 0 "/home/michiel/Documents/RU/Thesis/Parser/src" "impl_compact.c"
	.globl	byte_count
	.type	byte_count, @function
byte_count:
.LFB6:
	.file 1 "impl_compact.c"
	.loc 1 26 54
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$120, %rsp	#,
	movq	%rsi, -240(%rbp)	# dim, dim
	movq	%rdx, -160(%rbp)	#,
	movq	%rcx, -152(%rbp)	#,
	movq	%r8, -144(%rbp)	#,
	movq	%r9, -136(%rbp)	#,
	testb	%al, %al	#
	je	.L2	#,
	movaps	%xmm0, -128(%rbp)	#,
	movaps	%xmm1, -112(%rbp)	#,
	movaps	%xmm2, -96(%rbp)	#,
	movaps	%xmm3, -80(%rbp)	#,
	movaps	%xmm4, -64(%rbp)	#,
	movaps	%xmm5, -48(%rbp)	#,
	movaps	%xmm6, -32(%rbp)	#,
	movaps	%xmm7, -16(%rbp)	#,
.L2:
	movl	%edi, %eax	# tmp97, tmp98
	movb	%al, -228(%rbp)	# tmp98, num_bits
# impl_compact.c:27:   size_t size = 1;
	.loc 1 27 10
	movq	$1, -184(%rbp)	#, size
# impl_compact.c:30:   va_start(argp, dim);
	.loc 1 30 3
	movl	$16, -216(%rbp)	#, MEM[(struct [1] *)&argp].gp_offset
	movl	$48, -212(%rbp)	#, MEM[(struct [1] *)&argp].fp_offset
	leaq	16(%rbp), %rax	#, tmp105
	movq	%rax, -208(%rbp)	# tmp105, MEM[(struct [1] *)&argp].overflow_arg_area
	leaq	-176(%rbp), %rax	#, tmp106
	movq	%rax, -200(%rbp)	# tmp106, MEM[(struct [1] *)&argp].reg_save_area
.LBB2:
# impl_compact.c:31:   for (int d = 0; d < dim; ++d)
	.loc 1 31 12
	movl	$0, -188(%rbp)	#, d
# impl_compact.c:31:   for (int d = 0; d < dim; ++d)
	.loc 1 31 3
	jmp	.L3	#
.L6:
# impl_compact.c:32:     size *= va_arg(argp, size_t);
	.loc 1 32 13
	movl	-216(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3315
	cmpl	$47, %eax	#, D.3315
	ja	.L4	#,
	movq	-200(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3317
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3318
	movl	%edx, %edx	# D.3318, D.3319
	addq	%rdx, %rax	# D.3319, D.3322
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3320
	addl	$8, %edx	#, D.3321
	movl	%edx, -216(%rbp)	# D.3321, MEM[(struct  *)&argp].gp_offset
	jmp	.L5	#
.L4:
	movq	-208(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3322
	leaq	8(%rax), %rdx	#, D.3323
	movq	%rdx, -208(%rbp)	# D.3323, MEM[(struct  *)&argp].overflow_arg_area
.L5:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.7_22], _18
# impl_compact.c:32:     size *= va_arg(argp, size_t);
	.loc 1 32 10
	movq	-184(%rbp), %rdx	# size, tmp101
	imulq	%rdx, %rax	# tmp101, tmp100
	movq	%rax, -184(%rbp)	# tmp100, size
# impl_compact.c:31:   for (int d = 0; d < dim; ++d)
	.loc 1 31 28
	addl	$1, -188(%rbp)	#, d
.L3:
# impl_compact.c:31:   for (int d = 0; d < dim; ++d)
	.loc 1 31 21 discriminator 1
	movl	-188(%rbp), %eax	# d, tmp102
	cltq
	cmpq	%rax, -240(%rbp)	# _1, dim
	ja	.L6	#,
.LBE2:
# impl_compact.c:35:   return (num_bits * size + 63) >> 3;
	.loc 1 35 20
	movzbl	-228(%rbp), %eax	# num_bits, _2
	imulq	-184(%rbp), %rax	# size, _3
# impl_compact.c:35:   return (num_bits * size + 63) >> 3;
	.loc 1 35 27
	addq	$63, %rax	#, _4
# impl_compact.c:35:   return (num_bits * size + 63) >> 3;
	.loc 1 35 33
	shrq	$3, %rax	#, _15
# impl_compact.c:36: }
	.loc 1 36 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	byte_count, .-byte_count
	.globl	alloc_desc
	.type	alloc_desc, @function
alloc_desc:
.LFB7:
	.loc 1 38 58
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$256, %rsp	#,
	movq	%rsi, -256(%rbp)	# dim, dim
	movq	%rdx, -160(%rbp)	#,
	movq	%rcx, -152(%rbp)	#,
	movq	%r8, -144(%rbp)	#,
	movq	%r9, -136(%rbp)	#,
	testb	%al, %al	#
	je	.L9	#,
	movaps	%xmm0, -128(%rbp)	#,
	movaps	%xmm1, -112(%rbp)	#,
	movaps	%xmm2, -96(%rbp)	#,
	movaps	%xmm3, -80(%rbp)	#,
	movaps	%xmm4, -64(%rbp)	#,
	movaps	%xmm5, -48(%rbp)	#,
	movaps	%xmm6, -32(%rbp)	#,
	movaps	%xmm7, -16(%rbp)	#,
.L9:
	movl	%edi, %eax	# tmp102, tmp103
	movb	%al, -244(%rbp)	# tmp103, num_bits
# impl_compact.c:39:   size_t *sizes = malloc(dim * sizeof(size_t)), size = 1;
	.loc 1 39 19
	movq	-256(%rbp), %rax	# dim, tmp104
	salq	$3, %rax	#, _1
	movq	%rax, %rdi	# _1,
	call	malloc	#
	movq	%rax, -200(%rbp)	# tmp105, sizes
# impl_compact.c:39:   size_t *sizes = malloc(dim * sizeof(size_t)), size = 1;
	.loc 1 39 49
	movq	$1, -184(%rbp)	#, size
# impl_compact.c:42:   va_start(argp, dim);
	.loc 1 42 3
	movl	$16, -232(%rbp)	#, MEM[(struct [1] *)&argp].gp_offset
	movl	$48, -228(%rbp)	#, MEM[(struct [1] *)&argp].fp_offset
	leaq	16(%rbp), %rax	#, tmp127
	movq	%rax, -224(%rbp)	# tmp127, MEM[(struct [1] *)&argp].overflow_arg_area
	leaq	-176(%rbp), %rax	#, tmp128
	movq	%rax, -216(%rbp)	# tmp128, MEM[(struct [1] *)&argp].reg_save_area
.LBB3:
# impl_compact.c:43:   for (int d = 0; d < dim; ++d)
	.loc 1 43 12
	movl	$0, -188(%rbp)	#, d
# impl_compact.c:43:   for (int d = 0; d < dim; ++d)
	.loc 1 43 3
	jmp	.L10	#
.L13:
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 19 discriminator 3
	movl	-188(%rbp), %eax	# d, tmp107
	cltq
	leaq	0(,%rax,8), %rdx	#, _3
	movq	-200(%rbp), %rax	# sizes, tmp108
	addq	%rax, %rdx	# tmp108, _4
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 25 discriminator 3
	movl	-232(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3329
	cmpl	$47, %eax	#, D.3329
	ja	.L11	#,
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 25 is_stmt 0
	movq	-216(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3331
	movl	-232(%rbp), %ecx	# MEM[(struct  *)&argp].gp_offset, D.3332
	movl	%ecx, %ecx	# D.3332, D.3333
	addq	%rcx, %rax	# D.3333, D.3336
	movl	-232(%rbp), %ecx	# MEM[(struct  *)&argp].gp_offset, D.3334
	addl	$8, %ecx	#, D.3335
	movl	%ecx, -232(%rbp)	# D.3335, MEM[(struct  *)&argp].gp_offset
	jmp	.L12	#
.L11:
	movq	-224(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3336
	leaq	8(%rax), %rcx	#, D.3337
	movq	%rcx, -224(%rbp)	# D.3337, MEM[(struct  *)&argp].overflow_arg_area
.L12:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.8_40], _5
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 23 is_stmt 1
	movq	%rax, (%rdx)	# _5, *_4
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 19
	movq	(%rdx), %rax	# *_4, _36
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 10
	movq	-184(%rbp), %rdx	# size, tmp110
	imulq	%rdx, %rax	# tmp110, tmp109
	movq	%rax, -184(%rbp)	# tmp109, size
# impl_compact.c:43:   for (int d = 0; d < dim; ++d)
	.loc 1 43 28
	addl	$1, -188(%rbp)	#, d
.L10:
# impl_compact.c:43:   for (int d = 0; d < dim; ++d)
	.loc 1 43 21 discriminator 1
	movl	-188(%rbp), %eax	# d, tmp111
	cltq
	cmpq	%rax, -256(%rbp)	# _6, dim
	ja	.L13	#,
.LBE3:
# impl_compact.c:47:   ArrayDesc *out = malloc(sizeof(ArrayDesc));
	.loc 1 47 20
	movl	$48, %edi	#,
	call	malloc	#
	movq	%rax, -208(%rbp)	# tmp112, out
# impl_compact.c:50:     out->num_bits = num_bits;
	.loc 1 50 19
	movq	-208(%rbp), %rax	# out, tmp113
	movzbl	-244(%rbp), %edx	# num_bits, tmp114
	movb	%dl, (%rax)	# tmp114, out_22->num_bits
# impl_compact.c:56:   out->dim = dim;
	.loc 1 56 12
	movq	-208(%rbp), %rax	# out, tmp115
	movq	-256(%rbp), %rdx	# dim, tmp116
	movq	%rdx, 8(%rax)	# tmp116, out_22->dim
# impl_compact.c:57:   out->sizes = sizes;
	.loc 1 57 14
	movq	-208(%rbp), %rax	# out, tmp117
	movq	-200(%rbp), %rdx	# sizes, tmp118
	movq	%rdx, 16(%rax)	# tmp118, out_22->sizes
# impl_compact.c:58:   out->size = size;
	.loc 1 58 13
	movq	-208(%rbp), %rax	# out, tmp119
	movq	-184(%rbp), %rdx	# size, tmp120
	movq	%rdx, 24(%rax)	# tmp120, out_22->size
# impl_compact.c:59:   out->mask = bit_mask(num_bits);
	.loc 1 59 15
	movzbl	-244(%rbp), %eax	# num_bits, _7
	movl	%eax, %edi	# _7,
	call	bit_mask	#
# impl_compact.c:59:   out->mask = bit_mask(num_bits);
	.loc 1 59 13
	movq	-208(%rbp), %rdx	# out, tmp121
	movq	%rax, 32(%rdx)	# _8, out_22->mask
# impl_compact.c:61:   out->bulk_op_offset = calloc(dim, sizeof(size_t));
	.loc 1 61 25
	movq	-256(%rbp), %rax	# dim, tmp122
	movl	$8, %esi	#,
	movq	%rax, %rdi	# tmp122,
	call	calloc	#
	movq	%rax, %rdx	# tmp123, _9
# impl_compact.c:61:   out->bulk_op_offset = calloc(dim, sizeof(size_t));
	.loc 1 61 23
	movq	-208(%rbp), %rax	# out, tmp124
	movq	%rdx, 40(%rax)	# _9, out_22->bulk_op_offset
# impl_compact.c:63:   return out;
	.loc 1 63 10
	movq	-208(%rbp), %rax	# out, _32
# impl_compact.c:64: }
	.loc 1 64 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	alloc_desc, .-alloc_desc
	.globl	alloc_array
	.type	alloc_array, @function
alloc_array:
.LFB8:
	.loc 1 66 36
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# desc, desc
# impl_compact.c:67:   return malloc((desc->num_bits * desc->size + 63) >> 3); // Make sure it's padded to 8 bytes
	.loc 1 67 22
	movq	-8(%rbp), %rax	# desc, tmp90
	movzbl	(%rax), %eax	# desc_8(D)->num_bits, _1
	movzbl	%al, %edx	# _1, _2
# impl_compact.c:67:   return malloc((desc->num_bits * desc->size + 63) >> 3); // Make sure it's padded to 8 bytes
	.loc 1 67 39
	movq	-8(%rbp), %rax	# desc, tmp91
	movq	24(%rax), %rax	# desc_8(D)->size, _3
# impl_compact.c:67:   return malloc((desc->num_bits * desc->size + 63) >> 3); // Make sure it's padded to 8 bytes
	.loc 1 67 33
	imulq	%rdx, %rax	# _2, _4
# impl_compact.c:67:   return malloc((desc->num_bits * desc->size + 63) >> 3); // Make sure it's padded to 8 bytes
	.loc 1 67 46
	addq	$63, %rax	#, _5
# impl_compact.c:67:   return malloc((desc->num_bits * desc->size + 63) >> 3); // Make sure it's padded to 8 bytes
	.loc 1 67 10
	shrq	$3, %rax	#, _6
	movq	%rax, %rdi	# _6,
	call	malloc	#
# impl_compact.c:68: }
	.loc 1 68 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	alloc_array, .-alloc_array
	.globl	desc_mask
	.type	desc_mask, @function
desc_mask:
.LFB9:
	.loc 1 70 43
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# desc, desc
# impl_compact.c:71:   return desc->mask;
	.loc 1 71 14
	movq	-8(%rbp), %rax	# desc, tmp84
	movq	32(%rax), %rax	# desc_2(D)->mask, _3
# impl_compact.c:72: }
	.loc 1 72 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	desc_mask, .-desc_mask
	.globl	bit_count
	.type	bit_count, @function
bit_count:
.LFB10:
	.loc 1 74 41
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# desc, desc
# impl_compact.c:75:   return desc->num_bits;
	.loc 1 75 14
	movq	-8(%rbp), %rax	# desc, tmp85
	movzbl	(%rax), %eax	# desc_3(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _4
# impl_compact.c:76: }
	.loc 1 76 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	bit_count, .-bit_count
	.globl	dim_count
	.type	dim_count, @function
dim_count:
.LFB11:
	.loc 1 78 41
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# desc, desc
# impl_compact.c:79:   return desc->dim;
	.loc 1 79 14
	movq	-8(%rbp), %rax	# desc, tmp84
	movq	8(%rax), %rax	# desc_2(D)->dim, _3
# impl_compact.c:80: }
	.loc 1 80 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	dim_count, .-dim_count
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB12:
	.loc 1 82 32
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# a, a
	movq	%rsi, -16(%rbp)	# b, b
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 21
	cmpq	$0, -8(%rbp)	#, a
	je	.L24	#,
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 34 discriminator 1
	cmpq	$0, -16(%rbp)	#, b
	je	.L25	#,
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 47 discriminator 3
	movq	-8(%rbp), %rax	# a, tmp86
	cmpq	-16(%rbp), %rax	# b, tmp86
	je	.L26	#,
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 69 discriminator 5
	movq	-8(%rbp), %rax	# a, tmp87
	cmpq	-16(%rbp), %rax	# b, tmp87
	jbe	.L27	#,
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 57 discriminator 7
	movq	-8(%rbp), %rax	# a, tmp88
	subq	-16(%rbp), %rax	# b, _1
	movq	-16(%rbp), %rdx	# b, tmp89
	movq	%rdx, %rsi	# tmp89,
	movq	%rax, %rdi	# _1,
	call	gcd	#
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 21 discriminator 7
	jmp	.L32	#
.L27:
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 71 discriminator 8
	movq	-16(%rbp), %rax	# b, tmp90
	subq	-8(%rbp), %rax	# a, tmp90
	movq	%rax, %rdx	# tmp90, _2
	movq	-8(%rbp), %rax	# a, tmp91
	movq	%rdx, %rsi	# _2,
	movq	%rax, %rdi	# tmp91,
	call	gcd	#
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 21 discriminator 8
	jmp	.L32	#
.L26:
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 47 discriminator 6
	movq	-8(%rbp), %rax	# a, iftmp.3_6
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 21 discriminator 6
	jmp	.L32	#
.L25:
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 34 discriminator 4
	movq	-8(%rbp), %rax	# a, iftmp.3_6
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 21 discriminator 4
	jmp	.L32	#
.L24:
# impl_compact.c:83:   return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
	.loc 1 83 21 is_stmt 0 discriminator 2
	movq	-16(%rbp), %rax	# b, iftmp.3_6
.L32:
# impl_compact.c:84: }
	.loc 1 84 1 is_stmt 1 discriminator 17
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	gcd, .-gcd
	.globl	lcm
	.type	lcm, @function
lcm:
.LFB13:
	.loc 1 86 32
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)	# a, a
	movq	%rsi, -32(%rbp)	# b, b
# impl_compact.c:87:   return a * b / gcd(a, b);
	.loc 1 87 12
	movq	-24(%rbp), %rax	# a, tmp86
	imulq	-32(%rbp), %rax	# b, tmp86
	movq	%rax, %rbx	# tmp86, _1
# impl_compact.c:87:   return a * b / gcd(a, b);
	.loc 1 87 18
	movq	-32(%rbp), %rdx	# b, tmp87
	movq	-24(%rbp), %rax	# a, tmp88
	movq	%rdx, %rsi	# tmp87,
	movq	%rax, %rdi	# tmp88,
	call	gcd	#
	movq	%rax, %rcx	#, _2
# impl_compact.c:87:   return a * b / gcd(a, b);
	.loc 1 87 16
	movq	%rbx, %rax	# _1, _1
	movl	$0, %edx	#, tmp90
	divq	%rcx	# _2
# impl_compact.c:88: }
	.loc 1 88 1
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	lcm, .-lcm
	.globl	get_spread
	.type	get_spread, @function
get_spread:
.LFB14:
	.loc 1 90 42
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# desc, desc
# impl_compact.c:91:   size_t b = desc->num_bits;
	.loc 1 91 18
	movq	-24(%rbp), %rax	# desc, tmp90
	movzbl	(%rax), %eax	# desc_9(D)->num_bits, _1
# impl_compact.c:91:   size_t b = desc->num_bits;
	.loc 1 91 10
	movzbl	%al, %eax	# _1, tmp91
	movq	%rax, -8(%rbp)	# tmp91, b
# impl_compact.c:92:   if (b <= 8)
	.loc 1 92 6
	cmpq	$8, -8(%rbp)	#, b
	ja	.L36	#,
# impl_compact.c:93:     b = 8;
	.loc 1 93 7
	movq	$8, -8(%rbp)	#, b
	jmp	.L37	#
.L36:
# impl_compact.c:94:   else if (b <= 16)
	.loc 1 94 11
	cmpq	$16, -8(%rbp)	#, b
	ja	.L38	#,
# impl_compact.c:95:     b = 16;
	.loc 1 95 7
	movq	$16, -8(%rbp)	#, b
	jmp	.L37	#
.L38:
# impl_compact.c:96:   else if (b <= 32)
	.loc 1 96 11
	cmpq	$32, -8(%rbp)	#, b
	ja	.L39	#,
# impl_compact.c:97:     b = 32;
	.loc 1 97 7
	movq	$32, -8(%rbp)	#, b
	jmp	.L37	#
.L39:
# impl_compact.c:99:     b = 64;
	.loc 1 99 7
	movq	$64, -8(%rbp)	#, b
.L37:
# impl_compact.c:101:   return lcm(desc->num_bits, b) / desc->num_bits;
	.loc 1 101 18
	movq	-24(%rbp), %rax	# desc, tmp92
	movzbl	(%rax), %eax	# desc_9(D)->num_bits, _2
# impl_compact.c:101:   return lcm(desc->num_bits, b) / desc->num_bits;
	.loc 1 101 10
	movzbl	%al, %eax	# _2, _3
	movq	-8(%rbp), %rdx	# b, tmp93
	movq	%rdx, %rsi	# tmp93,
	movq	%rax, %rdi	# _3,
	call	lcm	#
# impl_compact.c:101:   return lcm(desc->num_bits, b) / desc->num_bits;
	.loc 1 101 39
	movq	-24(%rbp), %rdx	# desc, tmp94
	movzbl	(%rdx), %edx	# desc_9(D)->num_bits, _5
	movzbl	%dl, %ecx	# _5, _6
# impl_compact.c:101:   return lcm(desc->num_bits, b) / desc->num_bits;
	.loc 1 101 33
	movl	$0, %edx	#, tmp96
	divq	%rcx	# _6
# impl_compact.c:102: }
	.loc 1 102 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	get_spread, .-get_spread
	.globl	get_size
	.type	get_size, @function
get_size:
.LFB15:
	.loc 1 104 40
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# desc, desc
# impl_compact.c:105:   return desc->size;
	.loc 1 105 14
	movq	-8(%rbp), %rax	# desc, tmp84
	movq	24(%rax), %rax	# desc_2(D)->size, _3
# impl_compact.c:106: }
	.loc 1 106 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	get_size, .-get_size
	.globl	dim_size
	.type	dim_size, @function
dim_size:
.LFB16:
	.loc 1 108 52
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# desc, desc
	movq	%rsi, -16(%rbp)	# dim, dim
# impl_compact.c:109:   return desc->sizes[dim];
	.loc 1 109 14
	movq	-8(%rbp), %rax	# desc, tmp87
	movq	16(%rax), %rdx	# desc_5(D)->sizes, _1
# impl_compact.c:109:   return desc->sizes[dim];
	.loc 1 109 21
	movq	-16(%rbp), %rax	# dim, tmp88
	salq	$3, %rax	#, _2
	addq	%rdx, %rax	# _1, _3
	movq	(%rax), %rax	# *_3, _7
# impl_compact.c:110: }
	.loc 1 110 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	dim_size, .-dim_size
	.globl	byte_size
	.type	byte_size, @function
byte_size:
.LFB17:
	.loc 1 112 41
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# desc, desc
# impl_compact.c:113:   return (desc->num_bits * desc->size + 63) >> 3;
	.loc 1 113 15
	movq	-8(%rbp), %rax	# desc, tmp89
	movzbl	(%rax), %eax	# desc_7(D)->num_bits, _1
	movzbl	%al, %edx	# _1, _2
# impl_compact.c:113:   return (desc->num_bits * desc->size + 63) >> 3;
	.loc 1 113 32
	movq	-8(%rbp), %rax	# desc, tmp90
	movq	24(%rax), %rax	# desc_7(D)->size, _3
# impl_compact.c:113:   return (desc->num_bits * desc->size + 63) >> 3;
	.loc 1 113 26
	imulq	%rdx, %rax	# _2, _4
# impl_compact.c:113:   return (desc->num_bits * desc->size + 63) >> 3;
	.loc 1 113 39
	addq	$63, %rax	#, _5
# impl_compact.c:113:   return (desc->num_bits * desc->size + 63) >> 3;
	.loc 1 113 45
	shrq	$3, %rax	#, _8
# impl_compact.c:114: }
	.loc 1 114 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	byte_size, .-byte_size
	.globl	get_index
	.type	get_index, @function
get_index:
.LFB18:
	.loc 1 116 46
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$120, %rsp	#,
	movq	%rdi, -232(%rbp)	# desc, desc
	movq	%rsi, -168(%rbp)	#,
	movq	%rdx, -160(%rbp)	#,
	movq	%rcx, -152(%rbp)	#,
	movq	%r8, -144(%rbp)	#,
	movq	%r9, -136(%rbp)	#,
	testb	%al, %al	#
	je	.L56	#,
	movaps	%xmm0, -128(%rbp)	#,
	movaps	%xmm1, -112(%rbp)	#,
	movaps	%xmm2, -96(%rbp)	#,
	movaps	%xmm3, -80(%rbp)	#,
	movaps	%xmm4, -64(%rbp)	#,
	movaps	%xmm5, -48(%rbp)	#,
	movaps	%xmm6, -32(%rbp)	#,
	movaps	%xmm7, -16(%rbp)	#,
.L56:
# impl_compact.c:118:   va_start(argp, desc);
	.loc 1 118 3
	movl	$8, -216(%rbp)	#, MEM[(struct [1] *)&argp].gp_offset
	movl	$48, -212(%rbp)	#, MEM[(struct [1] *)&argp].fp_offset
	leaq	16(%rbp), %rax	#, tmp119
	movq	%rax, -208(%rbp)	# tmp119, MEM[(struct [1] *)&argp].overflow_arg_area
	leaq	-176(%rbp), %rax	#, tmp120
	movq	%rax, -200(%rbp)	# tmp120, MEM[(struct [1] *)&argp].reg_save_area
# impl_compact.c:119:   size_t bit = va_arg(argp, size_t);
	.loc 1 119 10
	movl	-216(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3344
	cmpl	$47, %eax	#, D.3344
	ja	.L49	#,
	movq	-200(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3346
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3347
	movl	%edx, %edx	# D.3347, D.3348
	addq	%rdx, %rax	# D.3348, D.3351
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3349
	addl	$8, %edx	#, D.3350
	movl	%edx, -216(%rbp)	# D.3350, MEM[(struct  *)&argp].gp_offset
	jmp	.L50	#
.L49:
	movq	-208(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3351
	leaq	8(%rax), %rdx	#, D.3352
	movq	%rdx, -208(%rbp)	# D.3352, MEM[(struct  *)&argp].overflow_arg_area
.L50:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.9_28], tmp111
	movq	%rax, -184(%rbp)	# tmp111, bit
.LBB4:
# impl_compact.c:120:   for (int d = 0; d + 1 < desc->dim; ++d)
	.loc 1 120 12
	movl	$0, -188(%rbp)	#, d
# impl_compact.c:120:   for (int d = 0; d + 1 < desc->dim; ++d)
	.loc 1 120 3
	jmp	.L51	#
.L54:
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 21 discriminator 3
	movq	-232(%rbp), %rax	# desc, tmp112
	movq	16(%rax), %rdx	# desc_19(D)->sizes, _1
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 28 discriminator 3
	movl	-188(%rbp), %eax	# d, tmp113
	cltq
	salq	$3, %rax	#, _3
	addq	%rdx, %rax	# _1, _4
	movq	(%rax), %rax	# *_4, _5
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 15 discriminator 3
	imulq	-184(%rbp), %rax	# bit, _5
	movq	%rax, %rcx	# _5, _6
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 34 discriminator 3
	movl	-216(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3356
	cmpl	$47, %eax	#, D.3356
	ja	.L52	#,
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 34 is_stmt 0
	movq	-200(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3358
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3359
	movl	%edx, %edx	# D.3359, D.3360
	addq	%rdx, %rax	# D.3360, D.3363
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3361
	addl	$8, %edx	#, D.3362
	movl	%edx, -216(%rbp)	# D.3362, MEM[(struct  *)&argp].gp_offset
	jmp	.L53	#
.L52:
	movq	-208(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3363
	leaq	8(%rax), %rdx	#, D.3364
	movq	%rdx, -208(%rbp)	# D.3364, MEM[(struct  *)&argp].overflow_arg_area
.L53:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.10_29], _7
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 9 is_stmt 1
	addq	%rcx, %rax	# _6, tmp114
	movq	%rax, -184(%rbp)	# tmp114, bit
# impl_compact.c:120:   for (int d = 0; d + 1 < desc->dim; ++d)
	.loc 1 120 38
	addl	$1, -188(%rbp)	#, d
.L51:
# impl_compact.c:120:   for (int d = 0; d + 1 < desc->dim; ++d)
	.loc 1 120 21 discriminator 1
	movl	-188(%rbp), %eax	# d, tmp115
	addl	$1, %eax	#, _8
	movslq	%eax, %rdx	# _8, _9
# impl_compact.c:120:   for (int d = 0; d + 1 < desc->dim; ++d)
	.loc 1 120 31 discriminator 1
	movq	-232(%rbp), %rax	# desc, tmp116
	movq	8(%rax), %rax	# desc_19(D)->dim, _10
# impl_compact.c:120:   for (int d = 0; d + 1 < desc->dim; ++d)
	.loc 1 120 25 discriminator 1
	cmpq	%rax, %rdx	# _10, _9
	jb	.L54	#,
.LBE4:
# impl_compact.c:124:   return bit;
	.loc 1 124 10
	movq	-184(%rbp), %rax	# bit, _21
# impl_compact.c:125: }
	.loc 1 125 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE18:
	.size	get_index, .-get_index
	.globl	bit_index
	.type	bit_index, @function
bit_index:
.LFB19:
	.loc 1 127 62
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# desc, desc
	movq	%rsi, -48(%rbp)	# index, index
# impl_compact.c:128:   size_t out = index[0], dim = desc->dim;
	.loc 1 128 10
	movq	-48(%rbp), %rax	# index, tmp106
	movq	(%rax), %rax	# *index_26(D), tmp107
	movq	%rax, -8(%rbp)	# tmp107, out
# impl_compact.c:128:   size_t out = index[0], dim = desc->dim;
	.loc 1 128 26
	movq	-40(%rbp), %rax	# desc, tmp108
	movq	8(%rax), %rax	# desc_28(D)->dim, tmp109
	movq	%rax, -24(%rbp)	# tmp109, dim
.LBB5:
# impl_compact.c:130:   for (size_t d = 1; d + 1 < dim; ++d)
	.loc 1 130 15
	movq	$1, -16(%rbp)	#, d
# impl_compact.c:130:   for (size_t d = 1; d + 1 < dim; ++d)
	.loc 1 130 3
	jmp	.L58	#
.L59:
# impl_compact.c:131:     out = out * desc->sizes[d] + index[d];
	.loc 1 131 21 discriminator 3
	movq	-40(%rbp), %rax	# desc, tmp110
	movq	16(%rax), %rdx	# desc_28(D)->sizes, _1
# impl_compact.c:131:     out = out * desc->sizes[d] + index[d];
	.loc 1 131 28 discriminator 3
	movq	-16(%rbp), %rax	# d, tmp111
	salq	$3, %rax	#, _2
	addq	%rdx, %rax	# _1, _3
	movq	(%rax), %rax	# *_3, _4
# impl_compact.c:131:     out = out * desc->sizes[d] + index[d];
	.loc 1 131 15 discriminator 3
	imulq	-8(%rbp), %rax	# out, _4
	movq	%rax, %rdx	# _4, _5
# impl_compact.c:131:     out = out * desc->sizes[d] + index[d];
	.loc 1 131 39 discriminator 3
	movq	-16(%rbp), %rax	# d, tmp112
	leaq	0(,%rax,8), %rcx	#, _6
	movq	-48(%rbp), %rax	# index, tmp113
	addq	%rcx, %rax	# _6, _7
	movq	(%rax), %rax	# *_7, _8
# impl_compact.c:131:     out = out * desc->sizes[d] + index[d];
	.loc 1 131 9 discriminator 3
	addq	%rdx, %rax	# _5, tmp114
	movq	%rax, -8(%rbp)	# tmp114, out
# impl_compact.c:130:   for (size_t d = 1; d + 1 < dim; ++d)
	.loc 1 130 35 discriminator 3
	addq	$1, -16(%rbp)	#, d
.L58:
# impl_compact.c:130:   for (size_t d = 1; d + 1 < dim; ++d)
	.loc 1 130 24 discriminator 1
	movq	-16(%rbp), %rax	# d, tmp115
	addq	$1, %rax	#, _9
# impl_compact.c:130:   for (size_t d = 1; d + 1 < dim; ++d)
	.loc 1 130 28 discriminator 1
	cmpq	%rax, -24(%rbp)	# _9, dim
	ja	.L59	#,
.LBE5:
# impl_compact.c:133:   return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
	.loc 1 133 16
	movq	-40(%rbp), %rax	# desc, tmp116
	movq	16(%rax), %rdx	# desc_28(D)->sizes, _10
	movq	-24(%rbp), %rax	# dim, tmp117
	salq	$3, %rax	#, _11
	subq	$8, %rax	#, _12
	addq	%rdx, %rax	# _10, _13
	movq	(%rax), %rax	# *_13, _14
# impl_compact.c:133:   return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
	.loc 1 133 14
	imulq	-8(%rbp), %rax	# out, _14
	movq	%rax, %rdx	# _14, _15
# impl_compact.c:133:   return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
	.loc 1 133 70
	movq	-24(%rbp), %rax	# dim, tmp118
	salq	$3, %rax	#, _16
	leaq	-8(%rax), %rcx	#, _17
	movq	-48(%rbp), %rax	# index, tmp119
	addq	%rcx, %rax	# _17, _18
	movq	(%rax), %rax	# *_18, _19
# impl_compact.c:133:   return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
	.loc 1 133 63
	addq	%rax, %rdx	# _19, _20
# impl_compact.c:133:   return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
	.loc 1 133 16
	movq	-40(%rbp), %rax	# desc, tmp120
	movzbl	(%rax), %eax	# desc_28(D)->num_bits, _21
	movzbl	%al, %eax	# _21, _22
# impl_compact.c:133:   return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
	.loc 1 133 63
	imulq	%rdx, %rax	# _20, _31
# impl_compact.c:134: }
	.loc 1 134 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE19:
	.size	bit_index, .-bit_index
	.globl	bit_index_offset
	.type	bit_index_offset, @function
bit_index_offset:
.LFB20:
	.loc 1 136 91
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# desc, desc
	movq	%rsi, -48(%rbp)	# index, index
	movq	%rdx, -56(%rbp)	# offset, offset
# impl_compact.c:137:   size_t out = 0, max_d = desc->dim - 1;
	.loc 1 137 10
	movq	$0, -8(%rbp)	#, out
# impl_compact.c:137:   size_t out = 0, max_d = desc->dim - 1;
	.loc 1 137 31
	movq	-40(%rbp), %rax	# desc, tmp120
	movq	8(%rax), %rax	# desc_44(D)->dim, _1
# impl_compact.c:137:   size_t out = 0, max_d = desc->dim - 1;
	.loc 1 137 19
	subq	$1, %rax	#, tmp121
	movq	%rax, -32(%rbp)	# tmp121, max_d
# impl_compact.c:139:   if (offset == NULL)
	.loc 1 139 6
	cmpq	$0, -56(%rbp)	#, offset
	jne	.L62	#,
.LBB6:
# impl_compact.c:140:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 140 17
	movq	$0, -16(%rbp)	#, d
# impl_compact.c:140:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 140 5
	jmp	.L63	#
.L64:
# impl_compact.c:141:       out = out * desc->sizes[d] + index[d];
	.loc 1 141 23 discriminator 3
	movq	-40(%rbp), %rax	# desc, tmp122
	movq	16(%rax), %rdx	# desc_44(D)->sizes, _2
# impl_compact.c:141:       out = out * desc->sizes[d] + index[d];
	.loc 1 141 30 discriminator 3
	movq	-16(%rbp), %rax	# d, tmp123
	salq	$3, %rax	#, _3
	addq	%rdx, %rax	# _2, _4
	movq	(%rax), %rax	# *_4, _5
# impl_compact.c:141:       out = out * desc->sizes[d] + index[d];
	.loc 1 141 17 discriminator 3
	imulq	-8(%rbp), %rax	# out, _5
	movq	%rax, %rdx	# _5, _6
# impl_compact.c:141:       out = out * desc->sizes[d] + index[d];
	.loc 1 141 41 discriminator 3
	movq	-16(%rbp), %rax	# d, tmp124
	leaq	0(,%rax,8), %rcx	#, _7
	movq	-48(%rbp), %rax	# index, tmp125
	addq	%rcx, %rax	# _7, _8
	movq	(%rax), %rax	# *_8, _9
# impl_compact.c:141:       out = out * desc->sizes[d] + index[d];
	.loc 1 141 11 discriminator 3
	addq	%rdx, %rax	# _6, tmp126
	movq	%rax, -8(%rbp)	# tmp126, out
# impl_compact.c:140:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 140 35 discriminator 3
	addq	$1, -16(%rbp)	#, d
.L63:
# impl_compact.c:140:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 140 26 discriminator 1
	movq	-16(%rbp), %rax	# d, tmp127
	cmpq	-32(%rbp), %rax	# max_d, tmp127
	jb	.L64	#,
	jmp	.L65	#
.L62:
.LBE6:
.LBB7:
# impl_compact.c:143:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 143 17
	movq	$0, -24(%rbp)	#, d
# impl_compact.c:143:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 143 5
	jmp	.L66	#
.L67:
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 23 discriminator 3
	movq	-40(%rbp), %rax	# desc, tmp128
	movq	16(%rax), %rdx	# desc_44(D)->sizes, _10
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 30 discriminator 3
	movq	-24(%rbp), %rax	# d, tmp129
	salq	$3, %rax	#, _11
	addq	%rdx, %rax	# _10, _12
	movq	(%rax), %rax	# *_12, _13
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 17 discriminator 3
	imulq	-8(%rbp), %rax	# out, _13
	movq	%rax, %rdx	# _13, _14
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 41 discriminator 3
	movq	-24(%rbp), %rax	# d, tmp130
	leaq	0(,%rax,8), %rcx	#, _15
	movq	-48(%rbp), %rax	# index, tmp131
	addq	%rcx, %rax	# _15, _16
	movq	(%rax), %rax	# *_16, _17
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 34 discriminator 3
	addq	%rax, %rdx	# _17, _18
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 53 discriminator 3
	movq	-24(%rbp), %rax	# d, tmp132
	leaq	0(,%rax,8), %rcx	#, _19
	movq	-56(%rbp), %rax	# offset, tmp133
	addq	%rcx, %rax	# _19, _20
	movq	(%rax), %rax	# *_20, _21
# impl_compact.c:144:       out = out * desc->sizes[d] + index[d] + offset[d];
	.loc 1 144 11 discriminator 3
	addq	%rdx, %rax	# _18, tmp134
	movq	%rax, -8(%rbp)	# tmp134, out
# impl_compact.c:143:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 143 35 discriminator 3
	addq	$1, -24(%rbp)	#, d
.L66:
# impl_compact.c:143:     for (size_t d = 0; d < max_d; ++d)
	.loc 1 143 26 discriminator 1
	movq	-24(%rbp), %rax	# d, tmp135
	cmpq	-32(%rbp), %rax	# max_d, tmp135
	jb	.L67	#,
.L65:
.LBE7:
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 16
	movq	-40(%rbp), %rax	# desc, tmp136
	movq	16(%rax), %rdx	# desc_44(D)->sizes, _22
	movq	-32(%rbp), %rax	# max_d, tmp137
	salq	$3, %rax	#, _23
	addq	%rdx, %rax	# _22, _24
	movq	(%rax), %rax	# *_24, _25
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 14
	imulq	-8(%rbp), %rax	# out, _25
	movq	%rax, %rdx	# _25, _26
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 69
	movq	-32(%rbp), %rax	# max_d, tmp138
	leaq	0(,%rax,8), %rcx	#, _27
	movq	-48(%rbp), %rax	# index, tmp139
	addq	%rcx, %rax	# _27, _28
	movq	(%rax), %rcx	# *_28, _29
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 99
	cmpq	$0, -56(%rbp)	#, offset
	je	.L68	#,
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 107 discriminator 1
	movq	-32(%rbp), %rax	# max_d, tmp140
	leaq	0(,%rax,8), %rsi	#, _30
	movq	-56(%rbp), %rax	# offset, tmp141
	addq	%rsi, %rax	# _30, _31
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 99 discriminator 1
	movq	(%rax), %rax	# *_31, iftmp.4_41
	jmp	.L69	#
.L68:
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 99 is_stmt 0 discriminator 2
	movl	$0, %eax	#, iftmp.4_41
.L69:
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 77 is_stmt 1 discriminator 4
	addq	%rcx, %rax	# _29, _32
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 61 discriminator 4
	addq	%rax, %rdx	# _32, _33
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 16 discriminator 4
	movq	-40(%rbp), %rax	# desc, tmp142
	movzbl	(%rax), %eax	# desc_44(D)->num_bits, _34
	movzbl	%al, %eax	# _34, _35
# impl_compact.c:146:   return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
	.loc 1 146 61 discriminator 4
	imulq	%rdx, %rax	# _33, _56
# impl_compact.c:147: }
	.loc 1 147 1 discriminator 4
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE20:
	.size	bit_index_offset, .-bit_index_offset
	.globl	array_get8
	.type	array_get8, @function
array_get8:
.LFB21:
	.loc 1 175 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
# impl_compact.c:175: array_get(array_get8, uint8_t, 8)
	.loc 1 175 1
	movq	-24(%rbp), %rax	# desc, tmp105
	movzbl	(%rax), %eax	# desc_24(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp107
	imulq	%rdx, %rax	# tmp107, tmp106
	movq	%rax, -40(%rbp)	# tmp106, index
	movq	-40(%rbp), %rax	# index, tmp108
	shrq	$3, %rax	#, tmp108
	movq	%rax, %rdx	# tmp108, _3
	movq	-32(%rbp), %rax	# data, tmp112
	addq	%rdx, %rax	# _3, tmp111
	movq	%rax, -16(%rbp)	# tmp111, data_
	andq	$7, -40(%rbp)	#, index
	movq	-16(%rbp), %rax	# data_, tmp113
	movzbl	(%rax), %eax	# *data__28, _4
	movzbl	%al, %eax	# _4, _5
	movq	-40(%rbp), %rdx	# index, tmp114
	movl	%edx, %ecx	# _6, tmp124
	sarl	%cl, %eax	# tmp124, _7
	movb	%al, -1(%rbp)	# _7, out
	movq	-24(%rbp), %rax	# desc, tmp115
	movzbl	(%rax), %eax	# desc_24(D)->num_bits, _8
	movzbl	%al, %edx	# _8, _9
	movq	-40(%rbp), %rax	# index, tmp116
	addq	%rdx, %rax	# _9, _10
	cmpq	$8, %rax	#, _10
	jbe	.L72	#,
# impl_compact.c:175: array_get(array_get8, uint8_t, 8)
	.loc 1 175 1 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax	# data_, tmp117
	addq	$1, %rax	#, _11
	movzbl	(%rax), %eax	# *_11, _12
	movzbl	%al, %edx	# _12, _13
	movq	-40(%rbp), %rax	# index, tmp118
	movl	%eax, %ecx	# tmp118, _14
	movl	$8, %eax	#, tmp119
	subl	%ecx, %eax	# _14, _15
	movl	%eax, %ecx	# _15, tmp126
	sall	%cl, %edx	# tmp126, _13
	movl	%edx, %eax	# _13, _16
	movl	%eax, %edx	# _16, _17
	movzbl	-1(%rbp), %eax	# out, out.5_18
	orl	%edx, %eax	# _17, _19
	movb	%al, -1(%rbp)	# _19, out
.L72:
# impl_compact.c:175: array_get(array_get8, uint8_t, 8)
	.loc 1 175 1 discriminator 3
	movq	-24(%rbp), %rax	# desc, tmp120
	movq	32(%rax), %rax	# desc_24(D)->mask, _20
	andb	-1(%rbp), %al	# out, _32
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE21:
	.size	array_get8, .-array_get8
	.globl	array_get16
	.type	array_get16, @function
array_get16:
.LFB22:
	.loc 1 176 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
# impl_compact.c:176: array_get(array_get16, uint16_t, 16)
	.loc 1 176 1
	movq	-24(%rbp), %rax	# desc, tmp105
	movzbl	(%rax), %eax	# desc_24(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp107
	imulq	%rdx, %rax	# tmp107, tmp106
	movq	%rax, -40(%rbp)	# tmp106, index
	movq	-40(%rbp), %rax	# index, tmp108
	shrq	$3, %rax	#, tmp108
	movq	%rax, %rdx	# tmp108, _3
	movq	-32(%rbp), %rax	# data, tmp112
	addq	%rdx, %rax	# _3, tmp111
	movq	%rax, -16(%rbp)	# tmp111, data_
	andq	$7, -40(%rbp)	#, index
	movq	-16(%rbp), %rax	# data_, tmp113
	movzwl	(%rax), %eax	# *data__28, _4
	movzwl	%ax, %eax	# _4, _5
	movq	-40(%rbp), %rdx	# index, tmp114
	movl	%edx, %ecx	# _6, tmp124
	sarl	%cl, %eax	# tmp124, _7
	movw	%ax, -2(%rbp)	# _7, out
	movq	-24(%rbp), %rax	# desc, tmp115
	movzbl	(%rax), %eax	# desc_24(D)->num_bits, _8
	movzbl	%al, %edx	# _8, _9
	movq	-40(%rbp), %rax	# index, tmp116
	addq	%rdx, %rax	# _9, _10
	cmpq	$16, %rax	#, _10
	jbe	.L75	#,
# impl_compact.c:176: array_get(array_get16, uint16_t, 16)
	.loc 1 176 1 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax	# data_, tmp117
	addq	$2, %rax	#, _11
	movzwl	(%rax), %eax	# *_11, _12
	movzwl	%ax, %edx	# _12, _13
	movq	-40(%rbp), %rax	# index, tmp118
	movl	%eax, %ecx	# tmp118, _14
	movl	$16, %eax	#, tmp119
	subl	%ecx, %eax	# _14, _15
	movl	%eax, %ecx	# _15, tmp126
	sall	%cl, %edx	# tmp126, _13
	movl	%edx, %eax	# _13, _16
	movl	%eax, %edx	# _16, _17
	movzwl	-2(%rbp), %eax	# out, out.6_18
	orl	%edx, %eax	# _17, _19
	movw	%ax, -2(%rbp)	# _19, out
.L75:
# impl_compact.c:176: array_get(array_get16, uint16_t, 16)
	.loc 1 176 1 discriminator 3
	movq	-24(%rbp), %rax	# desc, tmp120
	movq	32(%rax), %rax	# desc_24(D)->mask, _20
	andw	-2(%rbp), %ax	# out, _32
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE22:
	.size	array_get16, .-array_get16
	.globl	array_get32
	.type	array_get32, @function
array_get32:
.LFB23:
	.loc 1 177 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
# impl_compact.c:177: array_get(array_get32, uint32_t, 32)
	.loc 1 177 1
	movq	-24(%rbp), %rax	# desc, tmp99
	movzbl	(%rax), %eax	# desc_18(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp101
	imulq	%rdx, %rax	# tmp101, tmp100
	movq	%rax, -40(%rbp)	# tmp100, index
	movq	-40(%rbp), %rax	# index, tmp102
	shrq	$3, %rax	#, tmp102
	movq	%rax, %rdx	# tmp102, _3
	movq	-32(%rbp), %rax	# data, tmp106
	addq	%rdx, %rax	# _3, tmp105
	movq	%rax, -16(%rbp)	# tmp105, data_
	andq	$7, -40(%rbp)	#, index
	movq	-16(%rbp), %rax	# data_, tmp107
	movl	(%rax), %eax	# *data__22, _4
	movq	-40(%rbp), %rdx	# index, tmp108
	movl	%edx, %ecx	# _5, tmp119
	shrl	%cl, %eax	# tmp119, tmp109
	movl	%eax, -4(%rbp)	# tmp109, out
	movq	-24(%rbp), %rax	# desc, tmp110
	movzbl	(%rax), %eax	# desc_18(D)->num_bits, _6
	movzbl	%al, %edx	# _6, _7
	movq	-40(%rbp), %rax	# index, tmp111
	addq	%rdx, %rax	# _7, _8
	cmpq	$32, %rax	#, _8
	jbe	.L78	#,
# impl_compact.c:177: array_get(array_get32, uint32_t, 32)
	.loc 1 177 1 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax	# data_, tmp112
	addq	$4, %rax	#, _9
	movl	(%rax), %edx	# *_9, _10
	movq	-40(%rbp), %rax	# index, tmp113
	movl	%eax, %ecx	# tmp113, _11
	movl	$32, %eax	#, tmp114
	subl	%ecx, %eax	# _11, _12
	movl	%eax, %ecx	# _12, tmp121
	sall	%cl, %edx	# tmp121, _10
	movl	%edx, %eax	# _10, _13
	orl	%eax, -4(%rbp)	# _13, out
.L78:
# impl_compact.c:177: array_get(array_get32, uint32_t, 32)
	.loc 1 177 1 discriminator 3
	movq	-24(%rbp), %rax	# desc, tmp115
	movq	32(%rax), %rax	# desc_18(D)->mask, _14
	andl	-4(%rbp), %eax	# out, _26
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE23:
	.size	array_get32, .-array_get32
	.globl	array_get64
	.type	array_get64, @function
array_get64:
.LFB24:
	.loc 1 178 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
# impl_compact.c:178: array_get(array_get64, uint64_t, 64)
	.loc 1 178 1
	movq	-24(%rbp), %rax	# desc, tmp98
	movzbl	(%rax), %eax	# desc_17(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp100
	imulq	%rdx, %rax	# tmp100, tmp99
	movq	%rax, -40(%rbp)	# tmp99, index
	movq	-40(%rbp), %rax	# index, tmp101
	shrq	$3, %rax	#, tmp101
	movq	%rax, %rdx	# tmp101, _3
	movq	-32(%rbp), %rax	# data, tmp105
	addq	%rdx, %rax	# _3, tmp104
	movq	%rax, -16(%rbp)	# tmp104, data_
	andq	$7, -40(%rbp)	#, index
	movq	-16(%rbp), %rax	# data_, tmp106
	movq	(%rax), %rax	# *data__21, _4
	movq	-40(%rbp), %rdx	# index, tmp107
	movl	%edx, %ecx	# _5, tmp118
	shrq	%cl, %rax	# tmp118, tmp108
	movq	%rax, -8(%rbp)	# tmp108, out
	movq	-24(%rbp), %rax	# desc, tmp109
	movzbl	(%rax), %eax	# desc_17(D)->num_bits, _6
	movzbl	%al, %edx	# _6, _7
	movq	-40(%rbp), %rax	# index, tmp110
	addq	%rdx, %rax	# _7, _8
	cmpq	$64, %rax	#, _8
	jbe	.L81	#,
# impl_compact.c:178: array_get(array_get64, uint64_t, 64)
	.loc 1 178 1 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax	# data_, tmp111
	addq	$8, %rax	#, _9
	movq	(%rax), %rdx	# *_9, _10
	movq	-40(%rbp), %rax	# index, tmp112
	movl	%eax, %ecx	# tmp112, _11
	movl	$64, %eax	#, tmp113
	subl	%ecx, %eax	# _11, _12
	movl	%eax, %ecx	# _12, tmp120
	salq	%cl, %rdx	# tmp120, _10
	movq	%rdx, %rax	# _10, _13
	orq	%rax, -8(%rbp)	# _13, out
.L81:
# impl_compact.c:178: array_get(array_get64, uint64_t, 64)
	.loc 1 178 1 discriminator 3
	movq	-24(%rbp), %rax	# desc, tmp114
	movq	32(%rax), %rax	# desc_17(D)->mask, _14
	andq	-8(%rbp), %rax	# out, _25
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE24:
	.size	array_get64, .-array_get64
	.globl	array_set8
	.type	array_set8, @function
array_set8:
.LFB25:
	.loc 1 180 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
	movl	%ecx, %eax	# val, tmp118
	movb	%al, -44(%rbp)	# tmp119, val
# impl_compact.c:180: array_set(array_set8, uint8_t, 8)
	.loc 1 180 1
	movq	-24(%rbp), %rax	# desc, tmp120
	movzbl	(%rax), %eax	# desc_37(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp122
	imulq	%rdx, %rax	# tmp122, tmp121
	movq	%rax, -40(%rbp)	# tmp121, index
	movq	-40(%rbp), %rax	# index, tmp123
	shrq	$3, %rax	#, tmp123
	movq	%rax, %rdx	# tmp123, _3
	movq	-32(%rbp), %rax	# data, tmp127
	addq	%rdx, %rax	# _3, tmp126
	movq	%rax, -8(%rbp)	# tmp126, data_
	andq	$7, -40(%rbp)	#, index
	movq	-24(%rbp), %rax	# desc, tmp128
	movq	32(%rax), %rax	# desc_37(D)->mask, _4
	andb	%al, -44(%rbp)	# _5, val
	movq	-8(%rbp), %rax	# data_, tmp129
	movzbl	(%rax), %esi	# *data__41, _6
	movq	-24(%rbp), %rax	# desc, tmp130
	movq	32(%rax), %rax	# desc_37(D)->mask, _7
	movq	-40(%rbp), %rdx	# index, tmp131
	movl	%edx, %ecx	# _8, tmp148
	salq	%cl, %rax	# tmp148, _9
	notl	%eax	# _11
	andl	%eax, %esi	# _11, _12
	movzbl	-44(%rbp), %eax	# val, _13
	movq	-40(%rbp), %rdx	# index, tmp132
	movl	%edx, %ecx	# _14, tmp149
	sall	%cl, %eax	# tmp149, _15
	orl	%eax, %esi	# _16, _12
	movl	%esi, %edx	# _12, _17
	movq	-8(%rbp), %rax	# data_, tmp133
	movb	%dl, (%rax)	# _17, *data__41
	movq	-24(%rbp), %rax	# desc, tmp134
	movzbl	(%rax), %eax	# desc_37(D)->num_bits, _18
	movzbl	%al, %edx	# _18, _19
	movq	-40(%rbp), %rax	# index, tmp135
	addq	%rdx, %rax	# _19, _20
	cmpq	$8, %rax	#, _20
	jbe	.L84	#,
# impl_compact.c:180: array_set(array_set8, uint8_t, 8)
	.loc 1 180 1 is_stmt 0 discriminator 1
	movl	$8, %eax	#, tmp139
	subq	-40(%rbp), %rax	# index, tmp138
	movq	%rax, -40(%rbp)	# tmp138, index
	movq	-8(%rbp), %rax	# data_, tmp140
	addq	$1, %rax	#, _21
	movzbl	(%rax), %esi	# *_21, _22
	movq	-24(%rbp), %rax	# desc, tmp141
	movq	32(%rax), %rax	# desc_37(D)->mask, _23
	movq	-40(%rbp), %rdx	# index, tmp142
	movl	%edx, %ecx	# _24, tmp151
	shrq	%cl, %rax	# tmp151, _25
	notl	%eax	# _27
	andl	%eax, %esi	# _27, _28
	movzbl	-44(%rbp), %eax	# val, _29
	movq	-40(%rbp), %rdx	# index, tmp143
	movl	%edx, %ecx	# _30, tmp152
	sarl	%cl, %eax	# tmp152, _31
	movl	%eax, %edx	# _31, _32
	movq	-8(%rbp), %rax	# data_, tmp144
	addq	$1, %rax	#, _33
	orl	%esi, %edx	# _28, _34
	movb	%dl, (%rax)	# _34, *_33
.L84:
# impl_compact.c:180: array_set(array_set8, uint8_t, 8)
	.loc 1 180 1 discriminator 3
	movzbl	-44(%rbp), %eax	# val, _48
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE25:
	.size	array_set8, .-array_set8
	.globl	array_set16
	.type	array_set16, @function
array_set16:
.LFB26:
	.loc 1 181 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
	movl	%ecx, %eax	# val, tmp118
	movw	%ax, -44(%rbp)	# tmp119, val
# impl_compact.c:181: array_set(array_set16, uint16_t, 16)
	.loc 1 181 1
	movq	-24(%rbp), %rax	# desc, tmp120
	movzbl	(%rax), %eax	# desc_37(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp122
	imulq	%rdx, %rax	# tmp122, tmp121
	movq	%rax, -40(%rbp)	# tmp121, index
	movq	-40(%rbp), %rax	# index, tmp123
	shrq	$3, %rax	#, tmp123
	movq	%rax, %rdx	# tmp123, _3
	movq	-32(%rbp), %rax	# data, tmp127
	addq	%rdx, %rax	# _3, tmp126
	movq	%rax, -8(%rbp)	# tmp126, data_
	andq	$7, -40(%rbp)	#, index
	movq	-24(%rbp), %rax	# desc, tmp128
	movq	32(%rax), %rax	# desc_37(D)->mask, _4
	andw	%ax, -44(%rbp)	# _5, val
	movq	-8(%rbp), %rax	# data_, tmp129
	movzwl	(%rax), %esi	# *data__41, _6
	movq	-24(%rbp), %rax	# desc, tmp130
	movq	32(%rax), %rax	# desc_37(D)->mask, _7
	movq	-40(%rbp), %rdx	# index, tmp131
	movl	%edx, %ecx	# _8, tmp148
	salq	%cl, %rax	# tmp148, _9
	notl	%eax	# _11
	andl	%eax, %esi	# _11, _12
	movzwl	-44(%rbp), %eax	# val, _13
	movq	-40(%rbp), %rdx	# index, tmp132
	movl	%edx, %ecx	# _14, tmp149
	sall	%cl, %eax	# tmp149, _15
	orl	%eax, %esi	# _16, _12
	movl	%esi, %edx	# _12, _17
	movq	-8(%rbp), %rax	# data_, tmp133
	movw	%dx, (%rax)	# _17, *data__41
	movq	-24(%rbp), %rax	# desc, tmp134
	movzbl	(%rax), %eax	# desc_37(D)->num_bits, _18
	movzbl	%al, %edx	# _18, _19
	movq	-40(%rbp), %rax	# index, tmp135
	addq	%rdx, %rax	# _19, _20
	cmpq	$16, %rax	#, _20
	jbe	.L87	#,
# impl_compact.c:181: array_set(array_set16, uint16_t, 16)
	.loc 1 181 1 is_stmt 0 discriminator 1
	movl	$16, %eax	#, tmp139
	subq	-40(%rbp), %rax	# index, tmp138
	movq	%rax, -40(%rbp)	# tmp138, index
	movq	-8(%rbp), %rax	# data_, tmp140
	addq	$2, %rax	#, _21
	movzwl	(%rax), %esi	# *_21, _22
	movq	-24(%rbp), %rax	# desc, tmp141
	movq	32(%rax), %rax	# desc_37(D)->mask, _23
	movq	-40(%rbp), %rdx	# index, tmp142
	movl	%edx, %ecx	# _24, tmp151
	shrq	%cl, %rax	# tmp151, _25
	notl	%eax	# _27
	andl	%eax, %esi	# _27, _28
	movzwl	-44(%rbp), %eax	# val, _29
	movq	-40(%rbp), %rdx	# index, tmp143
	movl	%edx, %ecx	# _30, tmp152
	sarl	%cl, %eax	# tmp152, _31
	movl	%eax, %edx	# _31, _32
	movq	-8(%rbp), %rax	# data_, tmp144
	addq	$2, %rax	#, _33
	orl	%esi, %edx	# _28, _34
	movw	%dx, (%rax)	# _34, *_33
.L87:
# impl_compact.c:181: array_set(array_set16, uint16_t, 16)
	.loc 1 181 1 discriminator 3
	movzwl	-44(%rbp), %eax	# val, _48
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE26:
	.size	array_set16, .-array_set16
	.globl	array_set32
	.type	array_set32, @function
array_set32:
.LFB27:
	.loc 1 182 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
	movl	%ecx, -44(%rbp)	# val, val
# impl_compact.c:182: array_set(array_set32, uint32_t, 32)
	.loc 1 182 1
	movq	-24(%rbp), %rax	# desc, tmp114
	movzbl	(%rax), %eax	# desc_33(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp116
	imulq	%rdx, %rax	# tmp116, tmp115
	movq	%rax, -40(%rbp)	# tmp115, index
	movq	-40(%rbp), %rax	# index, tmp117
	shrq	$3, %rax	#, tmp117
	movq	%rax, %rdx	# tmp117, _3
	movq	-32(%rbp), %rax	# data, tmp121
	addq	%rdx, %rax	# _3, tmp120
	movq	%rax, -8(%rbp)	# tmp120, data_
	andq	$7, -40(%rbp)	#, index
	movq	-24(%rbp), %rax	# desc, tmp122
	movq	32(%rax), %rax	# desc_33(D)->mask, _4
	andl	%eax, -44(%rbp)	# _5, val
	movq	-8(%rbp), %rax	# data_, tmp123
	movl	(%rax), %esi	# *data__37, _6
	movq	-24(%rbp), %rax	# desc, tmp124
	movq	32(%rax), %rax	# desc_33(D)->mask, _7
	movq	-40(%rbp), %rdx	# index, tmp125
	movl	%edx, %ecx	# _8, tmp144
	salq	%cl, %rax	# tmp144, _9
	notl	%eax	# _11
	andl	%eax, %esi	# _11, _12
	movq	-40(%rbp), %rax	# index, tmp126
	movl	%eax, %edx	# tmp126, _13
	movl	-44(%rbp), %eax	# val, tmp127
	movl	%edx, %ecx	# _13, tmp145
	sall	%cl, %eax	# tmp145, _14
	orl	%eax, %esi	# _14, _12
	movl	%esi, %edx	# _12, _15
	movq	-8(%rbp), %rax	# data_, tmp128
	movl	%edx, (%rax)	# _15, *data__37
	movq	-24(%rbp), %rax	# desc, tmp129
	movzbl	(%rax), %eax	# desc_33(D)->num_bits, _16
	movzbl	%al, %edx	# _16, _17
	movq	-40(%rbp), %rax	# index, tmp130
	addq	%rdx, %rax	# _17, _18
	cmpq	$32, %rax	#, _18
	jbe	.L90	#,
# impl_compact.c:182: array_set(array_set32, uint32_t, 32)
	.loc 1 182 1 is_stmt 0 discriminator 1
	movl	$32, %eax	#, tmp134
	subq	-40(%rbp), %rax	# index, tmp133
	movq	%rax, -40(%rbp)	# tmp133, index
	movq	-8(%rbp), %rax	# data_, tmp135
	addq	$4, %rax	#, _19
	movl	(%rax), %esi	# *_19, _20
	movq	-24(%rbp), %rax	# desc, tmp136
	movq	32(%rax), %rax	# desc_33(D)->mask, _21
	movq	-40(%rbp), %rdx	# index, tmp137
	movl	%edx, %ecx	# _22, tmp147
	shrq	%cl, %rax	# tmp147, _23
	notl	%eax	# _25
	andl	%eax, %esi	# _25, _26
	movq	-40(%rbp), %rax	# index, tmp138
	movl	%eax, %edx	# tmp138, _27
	movl	-44(%rbp), %eax	# val, tmp139
	movl	%edx, %ecx	# _27, tmp149
	shrl	%cl, %eax	# tmp149, tmp139
	movl	%eax, %edx	# tmp139, _28
	movq	-8(%rbp), %rax	# data_, tmp140
	addq	$4, %rax	#, _29
	orl	%esi, %edx	# _26, _30
	movl	%edx, (%rax)	# _30, *_29
.L90:
# impl_compact.c:182: array_set(array_set32, uint32_t, 32)
	.loc 1 182 1 discriminator 3
	movl	-44(%rbp), %eax	# val, _44
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE27:
	.size	array_set32, .-array_set32
	.globl	array_set64
	.type	array_set64, @function
array_set64:
.LFB28:
	.loc 1 183 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# desc, desc
	movq	%rsi, -32(%rbp)	# data, data
	movq	%rdx, -40(%rbp)	# index, index
	movq	%rcx, -48(%rbp)	# val, val
# impl_compact.c:183: array_set(array_set64, uint64_t, 64)
	.loc 1 183 1
	movq	-24(%rbp), %rax	# desc, tmp111
	movzbl	(%rax), %eax	# desc_30(D)->num_bits, _1
	movzbl	%al, %eax	# _1, _2
	movq	-40(%rbp), %rdx	# index, tmp113
	imulq	%rdx, %rax	# tmp113, tmp112
	movq	%rax, -40(%rbp)	# tmp112, index
	movq	-40(%rbp), %rax	# index, tmp114
	shrq	$3, %rax	#, tmp114
	movq	%rax, %rdx	# tmp114, _3
	movq	-32(%rbp), %rax	# data, tmp118
	addq	%rdx, %rax	# _3, tmp117
	movq	%rax, -8(%rbp)	# tmp117, data_
	andq	$7, -40(%rbp)	#, index
	movq	-24(%rbp), %rax	# desc, tmp119
	movq	32(%rax), %rax	# desc_30(D)->mask, _4
	andq	%rax, -48(%rbp)	# _4, val
	movq	-8(%rbp), %rax	# data_, tmp120
	movq	(%rax), %rsi	# *data__34, _5
	movq	-24(%rbp), %rax	# desc, tmp121
	movq	32(%rax), %rax	# desc_30(D)->mask, _6
	movq	-40(%rbp), %rdx	# index, tmp122
	movl	%edx, %ecx	# _7, tmp141
	salq	%cl, %rax	# tmp141, _8
	notq	%rax	# _9
	andq	%rax, %rsi	# _9, _10
	movq	-40(%rbp), %rax	# index, tmp123
	movl	%eax, %edx	# tmp123, _11
	movq	-48(%rbp), %rax	# val, tmp124
	movl	%edx, %ecx	# _11, tmp142
	salq	%cl, %rax	# tmp142, _12
	orq	%rax, %rsi	# _12, _10
	movq	%rsi, %rdx	# _10, _13
	movq	-8(%rbp), %rax	# data_, tmp125
	movq	%rdx, (%rax)	# _13, *data__34
	movq	-24(%rbp), %rax	# desc, tmp126
	movzbl	(%rax), %eax	# desc_30(D)->num_bits, _14
	movzbl	%al, %edx	# _14, _15
	movq	-40(%rbp), %rax	# index, tmp127
	addq	%rdx, %rax	# _15, _16
	cmpq	$64, %rax	#, _16
	jbe	.L93	#,
# impl_compact.c:183: array_set(array_set64, uint64_t, 64)
	.loc 1 183 1 is_stmt 0 discriminator 1
	movl	$64, %eax	#, tmp131
	subq	-40(%rbp), %rax	# index, tmp130
	movq	%rax, -40(%rbp)	# tmp130, index
	movq	-8(%rbp), %rax	# data_, tmp132
	addq	$8, %rax	#, _17
	movq	(%rax), %rsi	# *_17, _18
	movq	-24(%rbp), %rax	# desc, tmp133
	movq	32(%rax), %rax	# desc_30(D)->mask, _19
	movq	-40(%rbp), %rdx	# index, tmp134
	movl	%edx, %ecx	# _20, tmp144
	shrq	%cl, %rax	# tmp144, _21
	notq	%rax	# _22
	andq	%rax, %rsi	# _22, _23
	movq	-40(%rbp), %rax	# index, tmp135
	movl	%eax, %edx	# tmp135, _24
	movq	-48(%rbp), %rax	# val, tmp136
	movl	%edx, %ecx	# _24, tmp146
	shrq	%cl, %rax	# tmp146, tmp136
	movq	%rax, %rdx	# tmp136, _25
	movq	-8(%rbp), %rax	# data_, tmp137
	addq	$8, %rax	#, _26
	orq	%rsi, %rdx	# _23, _27
	movq	%rdx, (%rax)	# _27, *_26
.L93:
# impl_compact.c:183: array_set(array_set64, uint64_t, 64)
	.loc 1 183 1 discriminator 3
	movq	-48(%rbp), %rax	# val, _41
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE28:
	.size	array_set64, .-array_set64
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stddef.h"
	.file 3 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stdarg.h"
	.file 4 "<built-in>"
	.file 5 "/usr/include/bits/types.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/bits/stdint-uintn.h"
	.file 8 "../include/types.h"
	.file 9 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa26
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x12
	.long	.LASF64
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.long	.LASF2
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x3f
	.uleb128 0xf
	.long	0x2e
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF3
	.byte	0x3
	.byte	0x28
	.byte	0x1b
	.long	0x52
	.uleb128 0x13
	.long	.LASF65
	.long	0x5b
	.uleb128 0x14
	.long	0x6b
	.long	0x6b
	.uleb128 0x15
	.long	0x3f
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	.LASF66
	.byte	0x18
	.byte	0x4
	.byte	0
	.long	0xa0
	.uleb128 0xb
	.long	.LASF4
	.long	0xa0
	.byte	0
	.uleb128 0xb
	.long	.LASF5
	.long	0xa0
	.byte	0x4
	.uleb128 0xb
	.long	.LASF6
	.long	0xa7
	.byte	0x8
	.uleb128 0xb
	.long	.LASF7
	.long	0xa7
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x17
	.byte	0x8
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF10
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF11
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x5
	.long	.LASF13
	.byte	0x5
	.byte	0x26
	.byte	0x17
	.long	0xa9
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF14
	.uleb128 0x5
	.long	.LASF15
	.byte	0x5
	.byte	0x28
	.byte	0x1c
	.long	0xb0
	.uleb128 0x18
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF16
	.byte	0x5
	.byte	0x2a
	.byte	0x16
	.long	0xa0
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF17
	.uleb128 0x5
	.long	.LASF18
	.byte	0x5
	.byte	0x2d
	.byte	0x1b
	.long	0x3f
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x5
	.long	.LASF20
	.byte	0x6
	.byte	0x34
	.byte	0x18
	.long	0x46
	.uleb128 0x5
	.long	.LASF21
	.byte	0x7
	.byte	0x18
	.byte	0x13
	.long	0xbe
	.uleb128 0x5
	.long	.LASF22
	.byte	0x7
	.byte	0x19
	.byte	0x14
	.long	0xd1
	.uleb128 0x5
	.long	.LASF23
	.byte	0x7
	.byte	0x1a
	.byte	0x14
	.long	0xe4
	.uleb128 0x5
	.long	.LASF24
	.byte	0x7
	.byte	0x1b
	.byte	0x14
	.long	0xf7
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF25
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF26
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF27
	.uleb128 0x8
	.long	0x160
	.uleb128 0x19
	.uleb128 0x5
	.long	.LASF28
	.byte	0x8
	.byte	0xa
	.byte	0x1b
	.long	0x172
	.uleb128 0xf
	.long	0x161
	.uleb128 0x1a
	.long	.LASF67
	.byte	0x30
	.byte	0x1
	.byte	0x8
	.byte	0x8
	.long	0x1c9
	.uleb128 0x9
	.long	.LASF29
	.byte	0x9
	.byte	0xb
	.long	0x116
	.byte	0
	.uleb128 0x1b
	.string	"dim"
	.byte	0x1
	.byte	0xa
	.byte	0xa
	.long	0x2e
	.byte	0x8
	.uleb128 0x9
	.long	.LASF30
	.byte	0xa
	.byte	0x10
	.long	0x1c9
	.byte	0x10
	.uleb128 0x9
	.long	.LASF31
	.byte	0xa
	.byte	0x17
	.long	0x2e
	.byte	0x18
	.uleb128 0x9
	.long	.LASF32
	.byte	0xb
	.byte	0xc
	.long	0x13a
	.byte	0x20
	.uleb128 0x9
	.long	.LASF33
	.byte	0xd
	.byte	0xb
	.long	0x1c9
	.byte	0x28
	.byte	0
	.uleb128 0x8
	.long	0x2e
	.uleb128 0x10
	.long	.LASF34
	.value	0x21e
	.long	0xa7
	.long	0x1e8
	.uleb128 0xc
	.long	0x2e
	.uleb128 0xc
	.long	0x2e
	.byte	0
	.uleb128 0x1c
	.long	.LASF35
	.byte	0x8
	.byte	0xc
	.byte	0xa
	.long	0x13a
	.long	0x1fe
	.uleb128 0xc
	.long	0x116
	.byte	0
	.uleb128 0x10
	.long	.LASF36
	.value	0x21b
	.long	0xa7
	.long	0x213
	.uleb128 0xc
	.long	0x2e
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0xb7
	.byte	0x1
	.long	0x13a
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x27b
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb7
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb7
	.byte	0x1
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb7
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.string	"val"
	.byte	0xb7
	.byte	0x1
	.long	0x13a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb7
	.byte	0x1
	.long	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0x16d
	.uleb128 0x8
	.long	0x13a
	.uleb128 0x2
	.long	.LASF41
	.byte	0xb6
	.byte	0x1
	.long	0x12e
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ed
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb6
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb6
	.byte	0x1
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb6
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.string	"val"
	.byte	0xb6
	.byte	0x1
	.long	0x12e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb6
	.byte	0x1
	.long	0x2ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0x12e
	.uleb128 0x2
	.long	.LASF43
	.byte	0xb5
	.byte	0x1
	.long	0x122
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x35a
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb5
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb5
	.byte	0x1
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb5
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.string	"val"
	.byte	0xb5
	.byte	0x1
	.long	0x122
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb5
	.byte	0x1
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0x122
	.uleb128 0x2
	.long	.LASF44
	.byte	0xb4
	.byte	0x1
	.long	0x116
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c7
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb4
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb4
	.byte	0x1
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb4
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.string	"val"
	.byte	0xb4
	.byte	0x1
	.long	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb4
	.byte	0x1
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0x116
	.uleb128 0x2
	.long	.LASF45
	.byte	0xb2
	.byte	0x1
	.long	0x13a
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x434
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb2
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb2
	.byte	0x1
	.long	0x15b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb2
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb2
	.byte	0x1
	.long	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0xb2
	.byte	0x1
	.long	0x13a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.long	.LASF46
	.byte	0xb1
	.byte	0x1
	.long	0x12e
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x49c
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb1
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb1
	.byte	0x1
	.long	0x15b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb1
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb1
	.byte	0x1
	.long	0x2ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0xb1
	.byte	0x1
	.long	0x12e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2
	.long	.LASF47
	.byte	0xb0
	.byte	0x1
	.long	0x122
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x504
	.uleb128 0x1
	.long	.LASF37
	.byte	0xb0
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xb0
	.byte	0x1
	.long	0x15b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xb0
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF42
	.byte	0xb0
	.byte	0x1
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0xb0
	.byte	0x1
	.long	0x122
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x2
	.long	.LASF48
	.byte	0xaf
	.byte	0x1
	.long	0x116
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x56c
	.uleb128 0x1
	.long	.LASF37
	.byte	0xaf
	.byte	0x1
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF38
	.byte	0xaf
	.byte	0x1
	.long	0x15b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF39
	.byte	0xaf
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF42
	.byte	0xaf
	.byte	0x1
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0xaf
	.byte	0x1
	.long	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x2
	.long	.LASF49
	.byte	0x88
	.byte	0x8
	.long	0x2e
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x615
	.uleb128 0x1
	.long	.LASF37
	.byte	0x88
	.byte	0x2a
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF39
	.byte	0x88
	.byte	0x3e
	.long	0x615
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF50
	.byte	0x88
	.byte	0x53
	.long	0x615
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x3
	.string	"out"
	.byte	0x89
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.long	.LASF51
	.byte	0x89
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x5f6
	.uleb128 0x3
	.string	"d"
	.byte	0x8c
	.byte	0x11
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xa
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x3
	.string	"d"
	.byte	0x8f
	.byte	0x11
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	0x3a
	.uleb128 0x2
	.long	.LASF52
	.byte	0x7f
	.byte	0x8
	.long	0x2e
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x692
	.uleb128 0x1
	.long	.LASF37
	.byte	0x7f
	.byte	0x23
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF39
	.byte	0x7f
	.byte	0x37
	.long	0x615
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3
	.string	"out"
	.byte	0x80
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.string	"dim"
	.byte	0x80
	.byte	0x1a
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x3
	.string	"d"
	.byte	0x82
	.byte	0xf
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF53
	.byte	0x74
	.byte	0x8
	.long	0x2e
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x701
	.uleb128 0x1
	.long	.LASF37
	.byte	0x74
	.byte	0x23
	.long	0x27b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0xd
	.uleb128 0x4
	.long	.LASF54
	.byte	0x75
	.byte	0xb
	.long	0x10a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x3
	.string	"bit"
	.byte	0x77
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0xa
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x3
	.string	"d"
	.byte	0x78
	.byte	0xc
	.long	0xdd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF55
	.byte	0x70
	.byte	0x8
	.long	0x2e
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x731
	.uleb128 0x1
	.long	.LASF37
	.byte	0x70
	.byte	0x23
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.long	.LASF56
	.byte	0x6c
	.byte	0x8
	.long	0x2e
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x76f
	.uleb128 0x1
	.long	.LASF37
	.byte	0x6c
	.byte	0x22
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.string	"dim"
	.byte	0x6c
	.byte	0x2f
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x2
	.long	.LASF57
	.byte	0x68
	.byte	0x8
	.long	0x2e
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x79f
	.uleb128 0x1
	.long	.LASF37
	.byte	0x68
	.byte	0x22
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	.LASF58
	.byte	0x5a
	.byte	0x8
	.long	0x2e
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x7db
	.uleb128 0x1
	.long	.LASF37
	.byte	0x5a
	.byte	0x24
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"b"
	.byte	0x5b
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.string	"lcm"
	.byte	0x56
	.long	0x2e
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x814
	.uleb128 0x7
	.string	"a"
	.byte	0x56
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.string	"b"
	.byte	0x56
	.byte	0x1d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x11
	.string	"gcd"
	.byte	0x52
	.long	0x2e
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x84d
	.uleb128 0x7
	.string	"a"
	.byte	0x52
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.string	"b"
	.byte	0x52
	.byte	0x1d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x2
	.long	.LASF59
	.byte	0x4e
	.byte	0x8
	.long	0x2e
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x87d
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4e
	.byte	0x23
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.long	.LASF60
	.byte	0x4a
	.byte	0x8
	.long	0x2e
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ad
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4a
	.byte	0x23
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.long	.LASF61
	.byte	0x46
	.byte	0xa
	.long	0x13a
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x8dd
	.uleb128 0x1
	.long	.LASF37
	.byte	0x46
	.byte	0x25
	.long	0x27b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	.LASF62
	.byte	0x42
	.byte	0x7
	.long	0xa7
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x90d
	.uleb128 0x1
	.long	.LASF37
	.byte	0x42
	.byte	0x1e
	.long	0x90d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0x161
	.uleb128 0xe
	.long	.LASF63
	.byte	0x26
	.byte	0xc
	.long	0x90d
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x9ae
	.uleb128 0x1
	.long	.LASF29
	.byte	0x26
	.byte	0x1f
	.long	0x116
	.uleb128 0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x7
	.string	"dim"
	.byte	0x26
	.byte	0x30
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0xd
	.uleb128 0x4
	.long	.LASF30
	.byte	0x27
	.byte	0xb
	.long	0x1c9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x4
	.long	.LASF31
	.byte	0x27
	.byte	0x31
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x4
	.long	.LASF54
	.byte	0x29
	.byte	0xb
	.long	0x10a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x3
	.string	"out"
	.byte	0x2f
	.byte	0xe
	.long	0x90d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0xa
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x3
	.string	"d"
	.byte	0x2b
	.byte	0xc
	.long	0xdd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF68
	.byte	0x1
	.byte	0x1a
	.byte	0x8
	.long	0x2e
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF29
	.byte	0x1a
	.byte	0x1b
	.long	0x116
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x7
	.string	"dim"
	.byte	0x1a
	.byte	0x2c
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0xd
	.uleb128 0x4
	.long	.LASF31
	.byte	0x1b
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x4
	.long	.LASF54
	.byte	0x1d
	.byte	0xb
	.long	0x10a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0xa
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x3
	.string	"d"
	.byte	0x1f
	.byte	0xc
	.long	0xdd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x34
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
.LASF36:
	.string	"malloc"
.LASF46:
	.string	"array_get32"
.LASF2:
	.string	"size_t"
.LASF24:
	.string	"uint64_t"
.LASF13:
	.string	"__uint8_t"
.LASF4:
	.string	"gp_offset"
.LASF20:
	.string	"va_list"
.LASF27:
	.string	"long long unsigned int"
.LASF61:
	.string	"desc_mask"
.LASF25:
	.string	"long long int"
.LASF12:
	.string	"signed char"
.LASF67:
	.string	"ARRAY_DESC"
.LASF56:
	.string	"dim_size"
.LASF17:
	.string	"long int"
.LASF62:
	.string	"alloc_array"
.LASF65:
	.string	"__builtin_va_list"
.LASF22:
	.string	"uint16_t"
.LASF64:
	.string	"GNU C17 11.2.1 20211203 (Red Hat 11.2.1-7) -mtune=generic -march=x86-64 -g"
.LASF63:
	.string	"alloc_desc"
.LASF16:
	.string	"__uint32_t"
.LASF32:
	.string	"mask"
.LASF51:
	.string	"max_d"
.LASF43:
	.string	"array_set16"
.LASF9:
	.string	"unsigned int"
.LASF6:
	.string	"overflow_arg_area"
.LASF8:
	.string	"long unsigned int"
.LASF44:
	.string	"array_set8"
.LASF48:
	.string	"array_get8"
.LASF38:
	.string	"data"
.LASF31:
	.string	"size"
.LASF11:
	.string	"short unsigned int"
.LASF59:
	.string	"dim_count"
.LASF45:
	.string	"array_get64"
.LASF35:
	.string	"bit_mask"
.LASF53:
	.string	"get_index"
.LASF33:
	.string	"bulk_op_offset"
.LASF52:
	.string	"bit_index"
.LASF26:
	.string	"long double"
.LASF49:
	.string	"bit_index_offset"
.LASF3:
	.string	"__gnuc_va_list"
.LASF37:
	.string	"desc"
.LASF58:
	.string	"get_spread"
.LASF41:
	.string	"array_set32"
.LASF55:
	.string	"byte_size"
.LASF18:
	.string	"__uint64_t"
.LASF42:
	.string	"data_"
.LASF10:
	.string	"unsigned char"
.LASF68:
	.string	"byte_count"
.LASF14:
	.string	"short int"
.LASF57:
	.string	"get_size"
.LASF29:
	.string	"num_bits"
.LASF7:
	.string	"reg_save_area"
.LASF60:
	.string	"bit_count"
.LASF23:
	.string	"uint32_t"
.LASF19:
	.string	"char"
.LASF47:
	.string	"array_get16"
.LASF15:
	.string	"__uint16_t"
.LASF39:
	.string	"index"
.LASF50:
	.string	"offset"
.LASF34:
	.string	"calloc"
.LASF21:
	.string	"uint8_t"
.LASF5:
	.string	"fp_offset"
.LASF30:
	.string	"sizes"
.LASF54:
	.string	"argp"
.LASF40:
	.string	"array_set64"
.LASF28:
	.string	"ArrayDesc"
.LASF66:
	.string	"__va_list_tag"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"impl_compact.c"
.LASF1:
	.string	"/home/michiel/Documents/RU/Thesis/Parser/src"
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
