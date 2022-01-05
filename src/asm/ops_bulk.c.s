	.file	"ops_bulk.c"
# GNU C17 (GCC) version 11.2.1 20211203 (Red Hat 11.2.1-7) (x86_64-redhat-linux)
#	compiled by GNU C version 11.2.1 20211203 (Red Hat 11.2.1-7), GMP version 6.2.0, MPFR version 4.1.0-p13, MPC version 1.2.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -g
	.text
.Ltext0:
	.file 0 "/home/michiel/Documents/RU/Thesis/Parser/src" "ops_bulk.c"
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
	movl	-216(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3821
	cmpl	$47, %eax	#, D.3821
	ja	.L4	#,
	movq	-200(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3823
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3824
	movl	%edx, %edx	# D.3824, D.3825
	addq	%rdx, %rax	# D.3825, D.3828
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3826
	addl	$8, %edx	#, D.3827
	movl	%edx, -216(%rbp)	# D.3827, MEM[(struct  *)&argp].gp_offset
	jmp	.L5	#
.L4:
	movq	-208(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3828
	leaq	8(%rax), %rdx	#, D.3829
	movq	%rdx, -208(%rbp)	# D.3829, MEM[(struct  *)&argp].overflow_arg_area
.L5:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.30_22], _18
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
	movl	-232(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3835
	cmpl	$47, %eax	#, D.3835
	ja	.L11	#,
# impl_compact.c:44:     size *= (sizes[d] = va_arg(argp, size_t));
	.loc 1 44 25 is_stmt 0
	movq	-216(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3837
	movl	-232(%rbp), %ecx	# MEM[(struct  *)&argp].gp_offset, D.3838
	movl	%ecx, %ecx	# D.3838, D.3839
	addq	%rcx, %rax	# D.3839, D.3842
	movl	-232(%rbp), %ecx	# MEM[(struct  *)&argp].gp_offset, D.3840
	addl	$8, %ecx	#, D.3841
	movl	%ecx, -232(%rbp)	# D.3841, MEM[(struct  *)&argp].gp_offset
	jmp	.L12	#
.L11:
	movq	-224(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3842
	leaq	8(%rax), %rcx	#, D.3843
	movq	%rcx, -224(%rbp)	# D.3843, MEM[(struct  *)&argp].overflow_arg_area
.L12:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.31_40], _5
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
	movl	-216(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3850
	cmpl	$47, %eax	#, D.3850
	ja	.L49	#,
	movq	-200(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3852
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3853
	movl	%edx, %edx	# D.3853, D.3854
	addq	%rdx, %rax	# D.3854, D.3857
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3855
	addl	$8, %edx	#, D.3856
	movl	%edx, -216(%rbp)	# D.3856, MEM[(struct  *)&argp].gp_offset
	jmp	.L50	#
.L49:
	movq	-208(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3857
	leaq	8(%rax), %rdx	#, D.3858
	movq	%rdx, -208(%rbp)	# D.3858, MEM[(struct  *)&argp].overflow_arg_area
.L50:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.32_28], tmp111
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
	movl	-216(%rbp), %eax	# MEM[(struct  *)&argp].gp_offset, D.3862
	cmpl	$47, %eax	#, D.3862
	ja	.L52	#,
# impl_compact.c:121:     bit = bit * desc->sizes[d] + va_arg(argp, size_t);
	.loc 1 121 34 is_stmt 0
	movq	-200(%rbp), %rax	# MEM[(struct  *)&argp].reg_save_area, D.3864
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3865
	movl	%edx, %edx	# D.3865, D.3866
	addq	%rdx, %rax	# D.3866, D.3869
	movl	-216(%rbp), %edx	# MEM[(struct  *)&argp].gp_offset, D.3867
	addl	$8, %edx	#, D.3868
	movl	%edx, -216(%rbp)	# D.3868, MEM[(struct  *)&argp].gp_offset
	jmp	.L53	#
.L52:
	movq	-208(%rbp), %rax	# MEM[(struct  *)&argp].overflow_arg_area, D.3869
	leaq	8(%rax), %rdx	#, D.3870
	movq	%rdx, -208(%rbp)	# D.3870, MEM[(struct  *)&argp].overflow_arg_area
.L53:
	movq	(%rax), %rax	# MEM[(size_t * {ref-all})addr.33_29], _7
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
	.globl	bulk_fill
	.type	bulk_fill, @function
bulk_fill:
.LFB31:
	.file 2 "ops_bulk.c"
	.loc 2 17 108 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$152, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)	# desc, desc
	movq	%rsi, -128(%rbp)	# data, data
	movq	%rdx, -136(%rbp)	# offset, offset
	movq	%rcx, -144(%rbp)	# count, count
	movq	%r8, -152(%rbp)	# val, val
# ops_bulk.c:20:   if (count == NULL)
	.loc 2 20 6
	cmpq	$0, -144(%rbp)	#, count
	jne	.L96	#,
# ops_bulk.c:21:     count = desc->sizes;
	.loc 2 21 11
	movq	-120(%rbp), %rax	# desc, tmp147
	movq	16(%rax), %rax	# desc_80(D)->sizes, tmp148
	movq	%rax, -144(%rbp)	# tmp148, count
.L96:
# ops_bulk.c:23:   uint8_t bits = desc->num_bits;
	.loc 2 23 11
	movq	-120(%rbp), %rax	# desc, tmp149
	movzbl	(%rax), %eax	# desc_80(D)->num_bits, tmp150
	movb	%al, -42(%rbp)	# tmp150, bits
# ops_bulk.c:24:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 24 10
	movq	-120(%rbp), %rax	# desc, tmp151
	movq	8(%rax), %rax	# desc_80(D)->dim, tmp152
	movq	%rax, -56(%rbp)	# tmp152, dim
# ops_bulk.c:24:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 24 43
	movq	-56(%rbp), %rax	# dim, tmp153
	salq	$3, %rax	#, _1
	leaq	-8(%rax), %rdx	#, _2
	movq	-144(%rbp), %rax	# count, tmp154
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rdx	# *_3, _4
# ops_bulk.c:24:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 24 53
	movzbl	-42(%rbp), %eax	# bits, _5
# ops_bulk.c:24:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 24 27
	imulq	%rdx, %rax	# _4, tmp155
	movq	%rax, -64(%rbp)	# tmp155, row_bits
# ops_bulk.c:26:   size_t *rel_offset = desc->bulk_op_offset;
	.loc 2 26 11
	movq	-120(%rbp), %rax	# desc, tmp156
	movq	40(%rax), %rax	# desc_80(D)->bulk_op_offset, tmp157
	movq	%rax, -72(%rbp)	# tmp157, rel_offset
# ops_bulk.c:27:   memset(rel_offset, 0, dim * sizeof(size_t));
	.loc 2 27 3
	movq	-56(%rbp), %rax	# dim, tmp158
	leaq	0(,%rax,8), %rdx	#, _6
	movq	-72(%rbp), %rax	# rel_offset, tmp159
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp159,
	call	memset	#
# ops_bulk.c:34:   gen_mask(bits, val & desc->mask, &imask, &hi);
	.loc 2 34 28
	movq	-120(%rbp), %rax	# desc, tmp160
	movq	32(%rax), %rax	# desc_80(D)->mask, _7
# ops_bulk.c:34:   gen_mask(bits, val & desc->mask, &imask, &hi);
	.loc 2 34 3
	andq	-152(%rbp), %rax	# val, _7
	movq	%rax, %rsi	# _7, _8
	movzbl	-42(%rbp), %eax	# bits, _9
	leaq	-97(%rbp), %rcx	#, tmp161
	leaq	-96(%rbp), %rdx	#, tmp162
	movl	%eax, %edi	# _9,
	call	gen_mask	#
.L103:
# ops_bulk.c:38:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
	.loc 2 38 10
	movq	-136(%rbp), %rdx	# offset, tmp163
	movq	-72(%rbp), %rcx	# rel_offset, tmp164
	movq	-120(%rbp), %rax	# desc, tmp165
	movq	%rcx, %rsi	# tmp164,
	movq	%rax, %rdi	# tmp165,
	call	bit_index_offset	#
	movq	%rax, -80(%rbp)	# tmp166, iz
# ops_bulk.c:38:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
	.loc 2 38 62
	movq	-80(%rbp), %rax	# iz, tmp167
# ops_bulk.c:38:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
	.loc 2 38 57
	andl	$63, %eax	#, tmp168
	movb	%al, -41(%rbp)	# tmp168, bz
# ops_bulk.c:38:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
	.loc 2 38 79
	movzbl	-41(%rbp), %eax	# bz, tmp169
	movb	%al, -98(%rbp)	# tmp169, val_offset
# ops_bulk.c:39:     row_data = (uint64_t *) data + (iz >> 6);
	.loc 2 39 40
	movq	-80(%rbp), %rax	# iz, tmp170
	shrq	$6, %rax	#, _11
# ops_bulk.c:39:     row_data = (uint64_t *) data + (iz >> 6);
	.loc 2 39 34
	leaq	0(,%rax,8), %rdx	#, _12
# ops_bulk.c:39:     row_data = (uint64_t *) data + (iz >> 6);
	.loc 2 39 14
	movq	-128(%rbp), %rax	# data, tmp174
	addq	%rdx, %rax	# _12, tmp173
	movq	%rax, -24(%rbp)	# tmp173, row_data
# ops_bulk.c:40:     rem_bits = row_bits;
	.loc 2 40 14
	movq	-64(%rbp), %rax	# row_bits, tmp175
	movq	%rax, -32(%rbp)	# tmp175, rem_bits
# ops_bulk.c:43:     if (bz && bz + rem_bits >= 64) {
	.loc 2 43 8
	cmpb	$0, -41(%rbp)	#, bz
	je	.L98	#,
# ops_bulk.c:43:     if (bz && bz + rem_bits >= 64) {
	.loc 2 43 18 discriminator 1
	movzbl	-41(%rbp), %edx	# bz, _13
	movq	-32(%rbp), %rax	# rem_bits, tmp176
	addq	%rdx, %rax	# _13, _14
# ops_bulk.c:43:     if (bz && bz + rem_bits >= 64) {
	.loc 2 43 12 discriminator 1
	cmpq	$63, %rax	#, _14
	jbe	.L98	#,
# ops_bulk.c:44:       vz = next_mask(bits, hi, &val_offset, imask);
	.loc 2 44 12
	movq	-96(%rbp), %rcx	# imask, imask.7_15
	movzbl	-97(%rbp), %eax	# hi, hi.8_16
	movzbl	%al, %esi	# hi.8_16, _17
	movzbl	-42(%rbp), %eax	# bits, _18
	leaq	-98(%rbp), %rdx	#, tmp177
	movl	%eax, %edi	# _18,
	call	next_mask	#
	movq	%rax, -88(%rbp)	# tmp178, vz
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 19
	movq	-24(%rbp), %rax	# row_data, tmp179
	movq	(%rax), %rdx	# *row_data_95, _19
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 44
	movzbl	-41(%rbp), %eax	# bz, _20
	movq	$-1, %rsi	#, tmp180
	movl	%eax, %ecx	# _20, tmp207
	salq	%cl, %rsi	# tmp207, tmp180
	movq	%rsi, %rax	# tmp180, _21
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 31
	notq	%rax	# _22
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 29
	andq	%rax, %rdx	# _22, _23
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 69
	movzbl	-41(%rbp), %eax	# bz, _24
	movq	$-1, %rsi	#, tmp181
	movl	%eax, %ecx	# _24, tmp209
	salq	%cl, %rsi	# tmp209, tmp181
	movq	%rsi, %rax	# tmp181, _25
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 56
	andq	-88(%rbp), %rax	# vz, _26
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 51
	orq	%rax, %rdx	# _26, _27
# ops_bulk.c:45:       *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
	.loc 2 45 17
	movq	-24(%rbp), %rax	# row_data, tmp182
	movq	%rdx, (%rax)	# _27, *row_data_95
# ops_bulk.c:46:       rem_bits -= 64 - bz, ++row_data, bz = 0;
	.loc 2 46 22
	movzbl	-41(%rbp), %edx	# bz, _28
	movl	$64, %eax	#, tmp183
	subl	%edx, %eax	# _28, _29
	cltq
# ops_bulk.c:46:       rem_bits -= 64 - bz, ++row_data, bz = 0;
	.loc 2 46 16
	subq	%rax, -32(%rbp)	# _30, rem_bits
# ops_bulk.c:46:       rem_bits -= 64 - bz, ++row_data, bz = 0;
	.loc 2 46 28
	addq	$8, -24(%rbp)	#, row_data
# ops_bulk.c:46:       rem_bits -= 64 - bz, ++row_data, bz = 0;
	.loc 2 46 43
	movb	$0, -41(%rbp)	#, bz
# ops_bulk.c:50:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 50 5
	jmp	.L98	#
.L99:
# ops_bulk.c:51:       *row_data++ = next_mask(bits, hi, &val_offset, imask);
	.loc 2 51 21 discriminator 2
	movq	-96(%rbp), %rcx	# imask, imask.9_31
	movzbl	-97(%rbp), %eax	# hi, hi.10_32
	movzbl	%al, %esi	# hi.10_32, _33
	movzbl	-42(%rbp), %eax	# bits, _34
# ops_bulk.c:51:       *row_data++ = next_mask(bits, hi, &val_offset, imask);
	.loc 2 51 16 discriminator 2
	movq	-24(%rbp), %rbx	# row_data, row_data.11_35
	leaq	8(%rbx), %rdx	#, tmp184
	movq	%rdx, -24(%rbp)	# tmp184, row_data
# ops_bulk.c:51:       *row_data++ = next_mask(bits, hi, &val_offset, imask);
	.loc 2 51 21 discriminator 2
	leaq	-98(%rbp), %rdx	#, tmp185
	movl	%eax, %edi	# _34,
	call	next_mask	#
# ops_bulk.c:51:       *row_data++ = next_mask(bits, hi, &val_offset, imask);
	.loc 2 51 19 discriminator 2
	movq	%rax, (%rbx)	# _36, *row_data.11_35
# ops_bulk.c:50:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 50 37 discriminator 2
	subq	$64, -32(%rbp)	#, rem_bits
.L98:
# ops_bulk.c:50:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 50 21 discriminator 1
	cmpq	$63, -32(%rbp)	#, rem_bits
	ja	.L99	#,
# ops_bulk.c:54:     vz = next_mask(bits, hi, &val_offset, imask);
	.loc 2 54 10
	movq	-96(%rbp), %rcx	# imask, imask.12_37
	movzbl	-97(%rbp), %eax	# hi, hi.13_38
	movzbl	%al, %esi	# hi.13_38, _39
	movzbl	-42(%rbp), %eax	# bits, _40
	leaq	-98(%rbp), %rdx	#, tmp186
	movl	%eax, %edi	# _40,
	call	next_mask	#
	movq	%rax, -88(%rbp)	# tmp187, vz
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 17
	movq	-24(%rbp), %rax	# row_data, tmp188
	movq	(%rax), %rsi	# *row_data_68, _41
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 44
	movq	-32(%rbp), %rax	# rem_bits, tmp189
	movq	$-1, %rdx	#, tmp190
	movl	%eax, %ecx	# _42, tmp211
	salq	%cl, %rdx	# tmp211, tmp190
	movq	%rdx, %rax	# tmp190, _43
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 31
	notq	%rax	# _43
	movq	%rax, %rdx	# _43, _44
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 57
	movzbl	-41(%rbp), %eax	# bz, _45
	movl	%eax, %ecx	# _45, tmp214
	salq	%cl, %rdx	# tmp214, _44
	movq	%rdx, %rax	# _44, _46
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 29
	notq	%rax	# _47
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 27
	andq	%rax, %rsi	# _47, _48
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 85
	movq	-32(%rbp), %rax	# rem_bits, tmp191
	movq	$-1, %rdx	#, tmp192
	movl	%eax, %ecx	# _49, tmp216
	salq	%cl, %rdx	# tmp216, tmp192
	movq	%rdx, %rax	# tmp192, _50
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 72
	notq	%rax	# _50
	movq	%rax, %rdx	# _50, _51
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 98
	movzbl	-41(%rbp), %eax	# bz, _52
	movl	%eax, %ecx	# _52, tmp219
	salq	%cl, %rdx	# tmp219, _51
	movq	%rdx, %rax	# _51, _53
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 70
	andq	-88(%rbp), %rax	# vz, _54
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 64
	orq	%rax, %rsi	# _54, _48
	movq	%rsi, %rdx	# _48, _55
# ops_bulk.c:55:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);
	.loc 2 55 15
	movq	-24(%rbp), %rax	# row_data, tmp193
	movq	%rdx, (%rax)	# _55, *row_data_68
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 18
	movq	-56(%rbp), %rax	# dim, tmp197
	subq	$2, %rax	#, tmp196
	movq	%rax, -40(%rbp)	# tmp196, cur_dim
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 5
	jmp	.L100	#
.L102:
# ops_bulk.c:58:       rel_offset[cur_dim] = 0;
	.loc 2 58 17 discriminator 4
	movq	-40(%rbp), %rax	# cur_dim, tmp198
	leaq	0(,%rax,8), %rdx	#, _56
	movq	-72(%rbp), %rax	# rel_offset, tmp199
	addq	%rdx, %rax	# _56, _57
# ops_bulk.c:58:       rel_offset[cur_dim] = 0;
	.loc 2 58 27 discriminator 4
	movq	$0, (%rax)	#, *_57
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 93 discriminator 4
	subq	$1, -40(%rbp)	#, cur_dim
.L100:
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 49 discriminator 1
	cmpq	$-1, -40(%rbp)	#, cur_dim
	je	.L101	#,
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 64 discriminator 3
	movq	-40(%rbp), %rax	# cur_dim, tmp200
	leaq	0(,%rax,8), %rdx	#, _58
	movq	-72(%rbp), %rax	# rel_offset, tmp201
	addq	%rdx, %rax	# _58, _59
	movq	(%rax), %rdx	# *_59, _60
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 52 discriminator 3
	addq	$1, %rdx	#, _61
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 49 discriminator 3
	movq	%rdx, (%rax)	# _61, *_59
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 64 discriminator 3
	movq	(%rax), %rdx	# *_59, _62
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 82 discriminator 3
	movq	-40(%rbp), %rax	# cur_dim, tmp202
	leaq	0(,%rax,8), %rcx	#, _63
	movq	-144(%rbp), %rax	# count, tmp203
	addq	%rcx, %rax	# _63, _64
	movq	(%rax), %rax	# *_64, _65
# ops_bulk.c:57:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 57 49 discriminator 3
	cmpq	%rax, %rdx	# _65, _62
	je	.L102	#,
.L101:
# ops_bulk.c:59:   } while (cur_dim != SIZE_MAX);
	.loc 2 59 20
	cmpq	$-1, -40(%rbp)	#, cur_dim
	jne	.L103	#,
# ops_bulk.c:60: }
	.loc 2 60 1
	nop	
	nop	
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE31:
	.size	bulk_fill, .-bulk_fill
	.globl	bulk_set
	.type	bulk_set, @function
bulk_set:
.LFB33:
	.loc 2 75 148
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$152, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)	# desc, desc
	movq	%rsi, -128(%rbp)	# data, data
	movq	%rdx, -136(%rbp)	# offset, offset
	movq	%rcx, -144(%rbp)	# count, count
	movq	%r8, -152(%rbp)	# arg, arg
	movq	%r9, -160(%rbp)	# action, action
# ops_bulk.c:76:   if (count == NULL)
	.loc 2 76 6
	cmpq	$0, -144(%rbp)	#, count
	jne	.L105	#,
# ops_bulk.c:77:     count = desc->sizes;
	.loc 2 77 11
	movq	-120(%rbp), %rax	# desc, tmp139
	movq	16(%rax), %rax	# desc_72(D)->sizes, tmp140
	movq	%rax, -144(%rbp)	# tmp140, count
.L105:
# ops_bulk.c:79:   uint8_t bits = desc->num_bits;
	.loc 2 79 11
	movq	-120(%rbp), %rax	# desc, tmp141
	movzbl	(%rax), %eax	# desc_72(D)->num_bits, tmp142
	movb	%al, -49(%rbp)	# tmp142, bits
# ops_bulk.c:80:   uint64_t mask = desc->mask;
	.loc 2 80 12
	movq	-120(%rbp), %rax	# desc, tmp143
	movq	32(%rax), %rax	# desc_72(D)->mask, tmp144
	movq	%rax, -64(%rbp)	# tmp144, mask
# ops_bulk.c:81:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 81 10
	movq	-120(%rbp), %rax	# desc, tmp145
	movq	8(%rax), %rax	# desc_72(D)->dim, tmp146
	movq	%rax, -72(%rbp)	# tmp146, dim
# ops_bulk.c:81:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 81 43
	movq	-72(%rbp), %rax	# dim, tmp147
	salq	$3, %rax	#, _1
	leaq	-8(%rax), %rdx	#, _2
	movq	-144(%rbp), %rax	# count, tmp148
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rdx	# *_3, _4
# ops_bulk.c:81:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 81 53
	movzbl	-49(%rbp), %eax	# bits, _5
# ops_bulk.c:81:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 81 27
	imulq	%rdx, %rax	# _4, tmp149
	movq	%rax, -80(%rbp)	# tmp149, row_bits
# ops_bulk.c:83:   size_t *rel_offset = desc->bulk_op_offset;
	.loc 2 83 11
	movq	-120(%rbp), %rax	# desc, tmp150
	movq	40(%rax), %rax	# desc_72(D)->bulk_op_offset, tmp151
	movq	%rax, -88(%rbp)	# tmp151, rel_offset
# ops_bulk.c:84:   memset(rel_offset, 0, dim * sizeof(size_t));
	.loc 2 84 3
	movq	-72(%rbp), %rax	# dim, tmp152
	leaq	0(,%rax,8), %rdx	#, _6
	movq	-88(%rbp), %rax	# rel_offset, tmp153
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp153,
	call	memset	#
.L112:
# ops_bulk.c:94:     rel_offset[dim - 1] = 0;
	.loc 2 94 15
	movq	-72(%rbp), %rax	# dim, tmp154
	salq	$3, %rax	#, _7
	leaq	-8(%rax), %rdx	#, _8
	movq	-88(%rbp), %rax	# rel_offset, tmp155
	addq	%rdx, %rax	# _8, _9
# ops_bulk.c:94:     rel_offset[dim - 1] = 0;
	.loc 2 94 25
	movq	$0, (%rax)	#, *_9
# ops_bulk.c:95:     iz = bit_index_offset(desc, rel_offset, offset);
	.loc 2 95 10
	movq	-136(%rbp), %rdx	# offset, tmp156
	movq	-88(%rbp), %rcx	# rel_offset, tmp157
	movq	-120(%rbp), %rax	# desc, tmp158
	movq	%rcx, %rsi	# tmp157,
	movq	%rax, %rdi	# tmp158,
	call	bit_index_offset	#
	movq	%rax, -32(%rbp)	# tmp159, iz
# ops_bulk.c:96:     row_data = (uint64_t *) data + (iz >> 6);
	.loc 2 96 40
	movq	-32(%rbp), %rax	# iz, tmp160
	shrq	$6, %rax	#, _10
# ops_bulk.c:96:     row_data = (uint64_t *) data + (iz >> 6);
	.loc 2 96 34
	leaq	0(,%rax,8), %rdx	#, _11
# ops_bulk.c:96:     row_data = (uint64_t *) data + (iz >> 6);
	.loc 2 96 14
	movq	-128(%rbp), %rax	# data, tmp164
	addq	%rdx, %rax	# _11, tmp163
	movq	%rax, -40(%rbp)	# tmp163, row_data
# ops_bulk.c:97:     iz &= 63, val_offset = (int) iz;
	.loc 2 97 8
	andq	$63, -32(%rbp)	#, iz
# ops_bulk.c:97:     iz &= 63, val_offset = (int) iz;
	.loc 2 97 28
	movq	-32(%rbp), %rax	# iz, tmp165
# ops_bulk.c:97:     iz &= 63, val_offset = (int) iz;
	.loc 2 97 26
	movl	%eax, -100(%rbp)	# _12, val_offset
# ops_bulk.c:98:     rem_bits = row_bits;
	.loc 2 98 14
	movq	-80(%rbp), %rax	# row_bits, tmp166
	movq	%rax, -24(%rbp)	# tmp166, rem_bits
# ops_bulk.c:101:     if (iz && iz + rem_bits >= 64) {
	.loc 2 101 8
	cmpq	$0, -32(%rbp)	#, iz
	je	.L107	#,
# ops_bulk.c:101:     if (iz && iz + rem_bits >= 64) {
	.loc 2 101 18 discriminator 1
	movq	-32(%rbp), %rdx	# iz, tmp167
	movq	-24(%rbp), %rax	# rem_bits, tmp168
	addq	%rdx, %rax	# tmp167, _13
# ops_bulk.c:101:     if (iz && iz + rem_bits >= 64) {
	.loc 2 101 12 discriminator 1
	cmpq	$63, %rax	#, _13
	jbe	.L107	#,
# ops_bulk.c:102:       vz = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);
	.loc 2 102 12
	movzbl	-49(%rbp), %esi	# bits, _14
	movq	-88(%rbp), %rdi	# rel_offset, tmp169
	leaq	-100(%rbp), %rcx	#, tmp170
	movq	-64(%rbp), %rdx	# mask, tmp171
	movq	-72(%rbp), %rax	# dim, tmp172
	pushq	-160(%rbp)	# action
	pushq	-152(%rbp)	# arg
	movl	$64, %r9d	#,
	movq	%rdi, %r8	# tmp169,
	movq	%rax, %rdi	# tmp172,
	call	gen_values	#
	addq	$16, %rsp	#,
	movq	%rax, -96(%rbp)	# tmp173, vz
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 19
	movq	-40(%rbp), %rax	# row_data, tmp174
	movq	(%rax), %rdx	# *row_data_85, _15
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 44
	movq	-32(%rbp), %rax	# iz, tmp175
	movq	$-1, %rsi	#, tmp176
	movl	%eax, %ecx	# _16, tmp215
	salq	%cl, %rsi	# tmp215, tmp176
	movq	%rsi, %rax	# tmp176, _17
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 31
	notq	%rax	# _18
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 29
	andq	%rax, %rdx	# _18, _19
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 69
	movq	-32(%rbp), %rax	# iz, tmp177
	movq	$-1, %rsi	#, tmp178
	movl	%eax, %ecx	# _20, tmp217
	salq	%cl, %rsi	# tmp217, tmp178
	movq	%rsi, %rax	# tmp178, _21
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 56
	andq	-96(%rbp), %rax	# vz, _22
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 51
	orq	%rax, %rdx	# _22, _23
# ops_bulk.c:103:       *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
	.loc 2 103 17
	movq	-40(%rbp), %rax	# row_data, tmp179
	movq	%rdx, (%rax)	# _23, *row_data_85
# ops_bulk.c:104:       rem_bits -= 64 - iz, ++row_data, iz = 0;
	.loc 2 104 16
	movq	-32(%rbp), %rdx	# iz, tmp180
	movq	-24(%rbp), %rax	# rem_bits, tmp181
	addq	%rdx, %rax	# tmp180, _24
	subq	$64, %rax	#, tmp182
	movq	%rax, -24(%rbp)	# tmp182, rem_bits
# ops_bulk.c:104:       rem_bits -= 64 - iz, ++row_data, iz = 0;
	.loc 2 104 28
	addq	$8, -40(%rbp)	#, row_data
# ops_bulk.c:104:       rem_bits -= 64 - iz, ++row_data, iz = 0;
	.loc 2 104 43
	movq	$0, -32(%rbp)	#, iz
# ops_bulk.c:108:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 108 5
	jmp	.L107	#
.L108:
# ops_bulk.c:109:       *(row_data++) = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);
	.loc 2 109 23 discriminator 2
	movzbl	-49(%rbp), %esi	# bits, _25
# ops_bulk.c:109:       *(row_data++) = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);
	.loc 2 109 17 discriminator 2
	movq	-40(%rbp), %rbx	# row_data, row_data.14_26
	leaq	8(%rbx), %rax	#, tmp183
	movq	%rax, -40(%rbp)	# tmp183, row_data
# ops_bulk.c:109:       *(row_data++) = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);
	.loc 2 109 23 discriminator 2
	movq	-88(%rbp), %rdi	# rel_offset, tmp184
	leaq	-100(%rbp), %rcx	#, tmp185
	movq	-64(%rbp), %rdx	# mask, tmp186
	movq	-72(%rbp), %rax	# dim, tmp187
	pushq	-160(%rbp)	# action
	pushq	-152(%rbp)	# arg
	movl	$64, %r9d	#,
	movq	%rdi, %r8	# tmp184,
	movq	%rax, %rdi	# tmp187,
	call	gen_values	#
	addq	$16, %rsp	#,
# ops_bulk.c:109:       *(row_data++) = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);
	.loc 2 109 21 discriminator 2
	movq	%rax, (%rbx)	# _27, *row_data.14_26
# ops_bulk.c:108:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 108 37 discriminator 2
	subq	$64, -24(%rbp)	#, rem_bits
.L107:
# ops_bulk.c:108:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 108 21 discriminator 1
	cmpq	$63, -24(%rbp)	#, rem_bits
	ja	.L108	#,
# ops_bulk.c:112:     vz = gen_values(dim, bits, mask, &val_offset, rel_offset, iz + rem_bits, arg, action);
	.loc 2 112 66
	movq	-32(%rbp), %rax	# iz, tmp188
	movl	%eax, %edx	# tmp188, _28
	movq	-24(%rbp), %rax	# rem_bits, tmp189
	addl	%edx, %eax	# _28, _30
# ops_bulk.c:112:     vz = gen_values(dim, bits, mask, &val_offset, rel_offset, iz + rem_bits, arg, action);
	.loc 2 112 10
	movzbl	%al, %r8d	# _30, _31
	movzbl	-49(%rbp), %esi	# bits, _32
	movq	-88(%rbp), %rdi	# rel_offset, tmp190
	leaq	-100(%rbp), %rcx	#, tmp191
	movq	-64(%rbp), %rdx	# mask, tmp192
	movq	-72(%rbp), %rax	# dim, tmp193
	pushq	-160(%rbp)	# action
	pushq	-152(%rbp)	# arg
	movl	%r8d, %r9d	# _31,
	movq	%rdi, %r8	# tmp190,
	movq	%rax, %rdi	# tmp193,
	call	gen_values	#
	addq	$16, %rsp	#,
	movq	%rax, -96(%rbp)	# tmp194, vz
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 17
	movq	-40(%rbp), %rax	# row_data, tmp195
	movq	(%rax), %rsi	# *row_data_63, _33
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 44
	movq	-24(%rbp), %rax	# rem_bits, tmp196
	movq	$-1, %rdx	#, tmp197
	movl	%eax, %ecx	# _34, tmp219
	salq	%cl, %rdx	# tmp219, tmp197
	movq	%rdx, %rax	# tmp197, _35
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 31
	notq	%rax	# _35
	movq	%rax, %rdx	# _35, _36
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 57
	movq	-32(%rbp), %rax	# iz, tmp198
	movl	%eax, %ecx	# _37, tmp222
	salq	%cl, %rdx	# tmp222, _36
	movq	%rdx, %rax	# _36, _38
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 29
	notq	%rax	# _39
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 27
	andq	%rax, %rsi	# _39, _40
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 84
	movq	-24(%rbp), %rax	# rem_bits, tmp199
	movq	$-1, %rdx	#, tmp200
	movl	%eax, %ecx	# _41, tmp224
	salq	%cl, %rdx	# tmp224, tmp200
	movq	%rdx, %rax	# tmp200, _42
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 71
	notq	%rax	# _42
	movq	%rax, %rdx	# _42, _43
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 97
	movq	-32(%rbp), %rax	# iz, tmp201
	movl	%eax, %ecx	# _44, tmp227
	salq	%cl, %rdx	# tmp227, _43
	movq	%rdx, %rax	# _43, _45
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 69
	andq	-96(%rbp), %rax	# vz, _46
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 64
	orq	%rax, %rsi	# _46, _40
	movq	%rsi, %rdx	# _40, _47
# ops_bulk.c:113:     *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;
	.loc 2 113 15
	movq	-40(%rbp), %rax	# row_data, tmp202
	movq	%rdx, (%rax)	# _47, *row_data_63
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 18
	movq	-72(%rbp), %rax	# dim, tmp206
	subq	$2, %rax	#, tmp205
	movq	%rax, -48(%rbp)	# tmp205, cur_dim
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 5
	jmp	.L109	#
.L111:
# ops_bulk.c:116:       rel_offset[cur_dim] = 0;
	.loc 2 116 17 discriminator 4
	movq	-48(%rbp), %rax	# cur_dim, tmp207
	leaq	0(,%rax,8), %rdx	#, _48
	movq	-88(%rbp), %rax	# rel_offset, tmp208
	addq	%rdx, %rax	# _48, _49
# ops_bulk.c:116:       rel_offset[cur_dim] = 0;
	.loc 2 116 27 discriminator 4
	movq	$0, (%rax)	#, *_49
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 93 discriminator 4
	subq	$1, -48(%rbp)	#, cur_dim
.L109:
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 49 discriminator 1
	cmpq	$-1, -48(%rbp)	#, cur_dim
	je	.L110	#,
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 64 discriminator 3
	movq	-48(%rbp), %rax	# cur_dim, tmp209
	leaq	0(,%rax,8), %rdx	#, _50
	movq	-88(%rbp), %rax	# rel_offset, tmp210
	addq	%rdx, %rax	# _50, _51
	movq	(%rax), %rdx	# *_51, _52
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 52 discriminator 3
	addq	$1, %rdx	#, _53
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 49 discriminator 3
	movq	%rdx, (%rax)	# _53, *_51
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 64 discriminator 3
	movq	(%rax), %rdx	# *_51, _54
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 82 discriminator 3
	movq	-48(%rbp), %rax	# cur_dim, tmp211
	leaq	0(,%rax,8), %rcx	#, _55
	movq	-144(%rbp), %rax	# count, tmp212
	addq	%rcx, %rax	# _55, _56
	movq	(%rax), %rax	# *_56, _57
# ops_bulk.c:115:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 115 49 discriminator 3
	cmpq	%rax, %rdx	# _57, _54
	je	.L111	#,
.L110:
# ops_bulk.c:117:   } while (cur_dim != SIZE_MAX);
	.loc 2 117 20
	cmpq	$-1, -48(%rbp)	#, cur_dim
	jne	.L112	#,
# ops_bulk.c:118: }
	.loc 2 118 1
	nop	
	nop	
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE33:
	.size	bulk_set, .-bulk_set
	.globl	bulk_find
	.type	bulk_find, @function
bulk_find:
.LFB35:
	.loc 2 143 3
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	#,
	movq	%rdi, -88(%rbp)	# desc, desc
	movq	%rsi, -96(%rbp)	# data, data
	movq	%rdx, -104(%rbp)	# offset, offset
	movq	%rcx, -112(%rbp)	# count, count
	movq	%r8, -120(%rbp)	# arg, arg
	movq	%r9, -128(%rbp)	# action, action
# ops_bulk.c:144:   uint64_t *data64 = data;
	.loc 2 144 13
	movq	-96(%rbp), %rax	# data, tmp127
	movq	%rax, -40(%rbp)	# tmp127, data64
# ops_bulk.c:145:   if (count == NULL)
	.loc 2 145 6
	cmpq	$0, -112(%rbp)	#, count
	jne	.L114	#,
# ops_bulk.c:146:     count = desc->sizes;
	.loc 2 146 11
	movq	-88(%rbp), %rax	# desc, tmp128
	movq	16(%rax), %rax	# desc_62(D)->sizes, tmp129
	movq	%rax, -112(%rbp)	# tmp129, count
.L114:
# ops_bulk.c:148:   uint8_t bits = desc->num_bits;
	.loc 2 148 11
	movq	-88(%rbp), %rax	# desc, tmp130
	movzbl	(%rax), %eax	# desc_62(D)->num_bits, tmp131
	movb	%al, -41(%rbp)	# tmp131, bits
# ops_bulk.c:149:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 149 10
	movq	-88(%rbp), %rax	# desc, tmp132
	movq	8(%rax), %rax	# desc_62(D)->dim, tmp133
	movq	%rax, -56(%rbp)	# tmp133, dim
# ops_bulk.c:149:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 149 43
	movq	-56(%rbp), %rax	# dim, tmp134
	salq	$3, %rax	#, _1
	leaq	-8(%rax), %rdx	#, _2
	movq	-112(%rbp), %rax	# count, tmp135
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rdx	# *_3, _4
# ops_bulk.c:149:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 149 53
	movzbl	-41(%rbp), %eax	# bits, _5
# ops_bulk.c:149:   size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 149 27
	imulq	%rdx, %rax	# _4, tmp136
	movq	%rax, -64(%rbp)	# tmp136, row_bits
# ops_bulk.c:151:   size_t *rel_offset = desc->bulk_op_offset;
	.loc 2 151 11
	movq	-88(%rbp), %rax	# desc, tmp137
	movq	40(%rax), %rax	# desc_62(D)->bulk_op_offset, tmp138
	movq	%rax, -72(%rbp)	# tmp138, rel_offset
# ops_bulk.c:152:   memset(rel_offset, 0, dim * sizeof(size_t));
	.loc 2 152 3
	movq	-56(%rbp), %rax	# dim, tmp139
	leaq	0(,%rax,8), %rdx	#, _6
	movq	-72(%rbp), %rax	# rel_offset, tmp140
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp140,
	call	memset	#
.L125:
# ops_bulk.c:162:     rel_offset[dim - 1] = 0;
	.loc 2 162 15
	movq	-56(%rbp), %rax	# dim, tmp141
	salq	$3, %rax	#, _7
	leaq	-8(%rax), %rdx	#, _8
	movq	-72(%rbp), %rax	# rel_offset, tmp142
	addq	%rdx, %rax	# _8, _9
# ops_bulk.c:162:     rel_offset[dim - 1] = 0;
	.loc 2 162 25
	movq	$0, (%rax)	#, *_9
# ops_bulk.c:163:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
	.loc 2 163 10
	movq	-104(%rbp), %rdx	# offset, tmp143
	movq	-72(%rbp), %rcx	# rel_offset, tmp144
	movq	-88(%rbp), %rax	# desc, tmp145
	movq	%rcx, %rsi	# tmp144,
	movq	%rax, %rdi	# tmp145,
	call	bit_index_offset	#
	movq	%rax, -16(%rbp)	# tmp146, iz
# ops_bulk.c:163:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
	.loc 2 163 62
	movq	-16(%rbp), %rax	# iz, tmp147
# ops_bulk.c:163:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
	.loc 2 163 57
	andl	$63, %eax	#, tmp148
	movb	%al, -17(%rbp)	# tmp148, bz
# ops_bulk.c:163:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
	.loc 2 163 71
	shrq	$6, -16(%rbp)	#, iz
# ops_bulk.c:163:     iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
	.loc 2 163 89
	movzbl	-17(%rbp), %eax	# bz, _11
	movl	%eax, -76(%rbp)	# _11, val_offset
# ops_bulk.c:164:     rem_bits = row_bits;
	.loc 2 164 14
	movq	-64(%rbp), %rax	# row_bits, tmp149
	movq	%rax, -8(%rbp)	# tmp149, rem_bits
# ops_bulk.c:167:     if (bz && bz + rem_bits >= 64) {
	.loc 2 167 8
	cmpb	$0, -17(%rbp)	#, bz
	je	.L118	#,
# ops_bulk.c:167:     if (bz && bz + rem_bits >= 64) {
	.loc 2 167 18 discriminator 1
	movzbl	-17(%rbp), %edx	# bz, _12
	movq	-8(%rbp), %rax	# rem_bits, tmp150
	addq	%rdx, %rax	# _12, _13
# ops_bulk.c:167:     if (bz && bz + rem_bits >= 64) {
	.loc 2 167 12 discriminator 1
	cmpq	$63, %rax	#, _13
	jbe	.L118	#,
# ops_bulk.c:168:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 168 74
	movq	-16(%rbp), %rax	# iz, iz.15_14
	leaq	1(%rax), %rdx	#, tmp151
	movq	%rdx, -16(%rbp)	# tmp151, iz
# ops_bulk.c:168:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 168 69
	leaq	0(,%rax,8), %rdx	#, _15
	movq	-40(%rbp), %rax	# data64, tmp152
	leaq	(%rdx,%rax), %rdi	#, _16
# ops_bulk.c:168:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 168 11
	movzbl	-41(%rbp), %esi	# bits, _17
	movq	-72(%rbp), %rcx	# rel_offset, tmp153
	leaq	-76(%rbp), %rdx	#, tmp154
	movq	-56(%rbp), %rax	# dim, tmp155
	pushq	-128(%rbp)	# action
	pushq	-120(%rbp)	# arg
	movq	%rdi, %r9	# _16,
	movl	$64, %r8d	#,
	movq	%rax, %rdi	# tmp155,
	call	get_values	#
	addq	$16, %rsp	#,
# ops_bulk.c:168:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 168 10
	testb	%al, %al	# _18
	je	.L116	#,
# ops_bulk.c:169:         return rel_offset;
	.loc 2 169 16
	movq	-72(%rbp), %rax	# rel_offset, _51
	jmp	.L113	#
.L116:
# ops_bulk.c:171:       rem_bits -= 64 - bz, bz = 0;
	.loc 2 171 22
	movzbl	-17(%rbp), %edx	# bz, _19
	movl	$64, %eax	#, tmp156
	subl	%edx, %eax	# _19, _20
	cltq
# ops_bulk.c:171:       rem_bits -= 64 - bz, bz = 0;
	.loc 2 171 16
	subq	%rax, -8(%rbp)	# _21, rem_bits
# ops_bulk.c:171:       rem_bits -= 64 - bz, bz = 0;
	.loc 2 171 31
	movb	$0, -17(%rbp)	#, bz
# ops_bulk.c:175:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 175 5
	jmp	.L118	#
.L120:
# ops_bulk.c:177:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 177 74
	movq	-16(%rbp), %rax	# iz, iz.16_22
	leaq	1(%rax), %rdx	#, tmp157
	movq	%rdx, -16(%rbp)	# tmp157, iz
# ops_bulk.c:177:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 177 69
	leaq	0(,%rax,8), %rdx	#, _23
	movq	-40(%rbp), %rax	# data64, tmp158
	leaq	(%rdx,%rax), %rdi	#, _24
# ops_bulk.c:177:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 177 11
	movzbl	-41(%rbp), %esi	# bits, _25
	movq	-72(%rbp), %rcx	# rel_offset, tmp159
	leaq	-76(%rbp), %rdx	#, tmp160
	movq	-56(%rbp), %rax	# dim, tmp161
	pushq	-128(%rbp)	# action
	pushq	-120(%rbp)	# arg
	movq	%rdi, %r9	# _24,
	movl	$64, %r8d	#,
	movq	%rax, %rdi	# tmp161,
	call	get_values	#
	addq	$16, %rsp	#,
# ops_bulk.c:177:       if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
	.loc 2 177 10
	testb	%al, %al	# _26
	je	.L119	#,
# ops_bulk.c:178:         return rel_offset;
	.loc 2 178 16
	movq	-72(%rbp), %rax	# rel_offset, _51
	jmp	.L113	#
.L119:
# ops_bulk.c:175:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 175 37
	subq	$64, -8(%rbp)	#, rem_bits
.L118:
# ops_bulk.c:175:     for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
	.loc 2 175 21 discriminator 1
	cmpq	$63, -8(%rbp)	#, rem_bits
	ja	.L120	#,
# ops_bulk.c:181:     if (get_values(dim, bits, &val_offset, rel_offset, bz + rem_bits, data64 + iz, arg, action))
	.loc 2 181 78
	movq	-16(%rbp), %rax	# iz, tmp162
	leaq	0(,%rax,8), %rdx	#, _27
	movq	-40(%rbp), %rax	# data64, tmp163
	leaq	(%rdx,%rax), %r8	#, _28
# ops_bulk.c:181:     if (get_values(dim, bits, &val_offset, rel_offset, bz + rem_bits, data64 + iz, arg, action))
	.loc 2 181 59
	movq	-8(%rbp), %rax	# rem_bits, tmp164
	movl	%eax, %edx	# tmp164, _29
	movzbl	-17(%rbp), %eax	# bz, tmp165
	addl	%edx, %eax	# _29, _30
# ops_bulk.c:181:     if (get_values(dim, bits, &val_offset, rel_offset, bz + rem_bits, data64 + iz, arg, action))
	.loc 2 181 9
	movzbl	%al, %edi	# _30, _31
	movzbl	-41(%rbp), %esi	# bits, _32
	movq	-72(%rbp), %rcx	# rel_offset, tmp166
	leaq	-76(%rbp), %rdx	#, tmp167
	movq	-56(%rbp), %rax	# dim, tmp168
	pushq	-128(%rbp)	# action
	pushq	-120(%rbp)	# arg
	movq	%r8, %r9	# _28,
	movl	%edi, %r8d	# _31,
	movq	%rax, %rdi	# tmp168,
	call	get_values	#
	addq	$16, %rsp	#,
# ops_bulk.c:181:     if (get_values(dim, bits, &val_offset, rel_offset, bz + rem_bits, data64 + iz, arg, action))
	.loc 2 181 8
	testb	%al, %al	# _33
	je	.L121	#,
# ops_bulk.c:182:       return rel_offset;
	.loc 2 182 14
	movq	-72(%rbp), %rax	# rel_offset, _51
	jmp	.L113	#
.L121:
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 18
	movq	-56(%rbp), %rax	# dim, tmp172
	subq	$2, %rax	#, tmp171
	movq	%rax, -32(%rbp)	# tmp171, cur_dim
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 5
	jmp	.L122	#
.L124:
# ops_bulk.c:186:       rel_offset[cur_dim] = 0;
	.loc 2 186 17 discriminator 4
	movq	-32(%rbp), %rax	# cur_dim, tmp173
	leaq	0(,%rax,8), %rdx	#, _34
	movq	-72(%rbp), %rax	# rel_offset, tmp174
	addq	%rdx, %rax	# _34, _35
# ops_bulk.c:186:       rel_offset[cur_dim] = 0;
	.loc 2 186 27 discriminator 4
	movq	$0, (%rax)	#, *_35
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 93 discriminator 4
	subq	$1, -32(%rbp)	#, cur_dim
.L122:
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 49 discriminator 1
	cmpq	$-1, -32(%rbp)	#, cur_dim
	je	.L123	#,
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 64 discriminator 3
	movq	-32(%rbp), %rax	# cur_dim, tmp175
	leaq	0(,%rax,8), %rdx	#, _36
	movq	-72(%rbp), %rax	# rel_offset, tmp176
	addq	%rdx, %rax	# _36, _37
	movq	(%rax), %rdx	# *_37, _38
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 52 discriminator 3
	addq	$1, %rdx	#, _39
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 49 discriminator 3
	movq	%rdx, (%rax)	# _39, *_37
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 64 discriminator 3
	movq	(%rax), %rdx	# *_37, _40
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 82 discriminator 3
	movq	-32(%rbp), %rax	# cur_dim, tmp177
	leaq	0(,%rax,8), %rcx	#, _41
	movq	-112(%rbp), %rax	# count, tmp178
	addq	%rcx, %rax	# _41, _42
	movq	(%rax), %rax	# *_42, _43
# ops_bulk.c:185:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 185 49 discriminator 3
	cmpq	%rax, %rdx	# _43, _40
	je	.L124	#,
.L123:
# ops_bulk.c:187:   } while (cur_dim != SIZE_MAX);
	.loc 2 187 20
	cmpq	$-1, -32(%rbp)	#, cur_dim
	jne	.L125	#,
.L113:
# ops_bulk.c:188: }
	.loc 2 188 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE35:
	.size	bulk_find, .-bulk_find
	.globl	bulk_op
	.type	bulk_op, @function
bulk_op:
.LFB36:
	.loc 2 197 3
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$232, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -200(%rbp)	# dx, dx
	movq	%rsi, -208(%rbp)	# x, x
	movq	%rdx, -216(%rbp)	# ox, ox
	movq	%rcx, -224(%rbp)	# dy, dy
	movq	%r8, -232(%rbp)	# y, y
	movq	%r9, -240(%rbp)	# oy, oy
# ops_bulk.c:198:   if (count == NULL)
	.loc 2 198 6
	cmpq	$0, 40(%rbp)	#, count
	jne	.L128	#,
# ops_bulk.c:199:     count = dz->sizes;
	.loc 2 199 11
	movq	16(%rbp), %rax	# dz, tmp185
	movq	16(%rax), %rax	# dz_136(D)->sizes, tmp186
	movq	%rax, 40(%rbp)	# tmp186, count
.L128:
# ops_bulk.c:201:   uint8_t bits = dz->num_bits;
	.loc 2 201 11
	movq	16(%rbp), %rax	# dz, tmp187
	movzbl	(%rax), %eax	# dz_136(D)->num_bits, tmp188
	movb	%al, -113(%rbp)	# tmp188, bits
# ops_bulk.c:202:   size_t dim = dz->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 202 10
	movq	16(%rbp), %rax	# dz, tmp189
	movq	8(%rax), %rax	# dz_136(D)->dim, tmp190
	movq	%rax, -128(%rbp)	# tmp190, dim
# ops_bulk.c:202:   size_t dim = dz->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 202 41
	movq	-128(%rbp), %rax	# dim, tmp191
	salq	$3, %rax	#, _1
	leaq	-8(%rax), %rdx	#, _2
	movq	40(%rbp), %rax	# count, tmp192
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rdx	# *_3, _4
# ops_bulk.c:202:   size_t dim = dz->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 202 51
	movzbl	-113(%rbp), %eax	# bits, _5
# ops_bulk.c:202:   size_t dim = dz->dim, row_bits = count[dim - 1] * bits, rem_bits;
	.loc 2 202 25
	imulq	%rdx, %rax	# _4, tmp193
	movq	%rax, -136(%rbp)	# tmp193, row_bits
# ops_bulk.c:204:   size_t *offset = dz->bulk_op_offset;
	.loc 2 204 11
	movq	16(%rbp), %rax	# dz, tmp194
	movq	40(%rax), %rax	# dz_136(D)->bulk_op_offset, tmp195
	movq	%rax, -144(%rbp)	# tmp195, offset
# ops_bulk.c:205:   memset(offset, 0, dim * sizeof(size_t));
	.loc 2 205 3
	movq	-128(%rbp), %rax	# dim, tmp196
	leaq	0(,%rax,8), %rdx	#, _6
	movq	-144(%rbp), %rax	# offset, tmp197
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp197,
	call	memset	#
# ops_bulk.c:207:   size_t cur_dim = 0, ix, iy, iz;
	.loc 2 207 10
	movq	$0, -32(%rbp)	#, cur_dim
# ops_bulk.c:217:   gen_mask(bits, dz->mask, &imask, &hi);
	.loc 2 217 20
	movq	16(%rbp), %rax	# dz, tmp198
	movq	32(%rax), %rsi	# dz_136(D)->mask, _7
# ops_bulk.c:217:   gen_mask(bits, dz->mask, &imask, &hi);
	.loc 2 217 3
	movzbl	-113(%rbp), %eax	# bits, _8
	leaq	-185(%rbp), %rcx	#, tmp199
	leaq	-184(%rbp), %rdx	#, tmp200
	movl	%eax, %edi	# _8,
	call	gen_mask	#
# ops_bulk.c:219:   while (cur_dim != SIZE_MAX) {
	.loc 2 219 9
	jmp	.L129	#
.L142:
# ops_bulk.c:221:     ix = bit_index_offset(dx, offset, ox);
	.loc 2 221 10
	movq	-216(%rbp), %rdx	# ox, tmp201
	movq	-144(%rbp), %rcx	# offset, tmp202
	movq	-200(%rbp), %rax	# dx, tmp203
	movq	%rcx, %rsi	# tmp202,
	movq	%rax, %rdi	# tmp203,
	call	bit_index_offset	#
	movq	%rax, -40(%rbp)	# tmp204, ix
# ops_bulk.c:222:     iy = bit_index_offset(dy, offset, oy);
	.loc 2 222 10
	movq	-240(%rbp), %rdx	# oy, tmp205
	movq	-144(%rbp), %rcx	# offset, tmp206
	movq	-224(%rbp), %rax	# dy, tmp207
	movq	%rcx, %rsi	# tmp206,
	movq	%rax, %rdi	# tmp207,
	call	bit_index_offset	#
	movq	%rax, -48(%rbp)	# tmp208, iy
# ops_bulk.c:223:     iz = bit_index_offset(dz, offset, oz);
	.loc 2 223 10
	movq	32(%rbp), %rdx	# oz, tmp209
	movq	-144(%rbp), %rax	# offset, tmp210
	movq	%rax, %rsi	# tmp210,
	movq	16(%rbp), %rdi	# dz,
	call	bit_index_offset	#
	movq	%rax, -56(%rbp)	# tmp211, iz
# ops_bulk.c:226:     data_x = (uint64_t *) x + (ix >> 6);
	.loc 2 226 35
	movq	-40(%rbp), %rax	# ix, tmp212
	shrq	$6, %rax	#, _9
# ops_bulk.c:226:     data_x = (uint64_t *) x + (ix >> 6);
	.loc 2 226 29
	leaq	0(,%rax,8), %rdx	#, _10
# ops_bulk.c:226:     data_x = (uint64_t *) x + (ix >> 6);
	.loc 2 226 12
	movq	-208(%rbp), %rax	# x, tmp216
	addq	%rdx, %rax	# _10, tmp215
	movq	%rax, -64(%rbp)	# tmp215, data_x
# ops_bulk.c:227:     data_y = (uint64_t *) y + (iy >> 6);
	.loc 2 227 35
	movq	-48(%rbp), %rax	# iy, tmp217
	shrq	$6, %rax	#, _11
# ops_bulk.c:227:     data_y = (uint64_t *) y + (iy >> 6);
	.loc 2 227 29
	leaq	0(,%rax,8), %rdx	#, _12
# ops_bulk.c:227:     data_y = (uint64_t *) y + (iy >> 6);
	.loc 2 227 12
	movq	-232(%rbp), %rax	# y, tmp221
	addq	%rdx, %rax	# _12, tmp220
	movq	%rax, -72(%rbp)	# tmp220, data_y
# ops_bulk.c:228:     data_z = (uint64_t *) z + (iz >> 6);
	.loc 2 228 35
	movq	-56(%rbp), %rax	# iz, tmp222
	shrq	$6, %rax	#, _13
# ops_bulk.c:228:     data_z = (uint64_t *) z + (iz >> 6);
	.loc 2 228 29
	leaq	0(,%rax,8), %rdx	#, _14
# ops_bulk.c:228:     data_z = (uint64_t *) z + (iz >> 6);
	.loc 2 228 12
	movq	24(%rbp), %rax	# z, tmp226
	addq	%rdx, %rax	# _14, tmp225
	movq	%rax, -80(%rbp)	# tmp225, data_z
# ops_bulk.c:230:     ix &= 63, iy &= 63, iz &= 63;
	.loc 2 230 8
	andq	$63, -40(%rbp)	#, ix
# ops_bulk.c:230:     ix &= 63, iy &= 63, iz &= 63;
	.loc 2 230 18
	andq	$63, -48(%rbp)	#, iy
# ops_bulk.c:230:     ix &= 63, iy &= 63, iz &= 63;
	.loc 2 230 28
	andq	$63, -56(%rbp)	#, iz
# ops_bulk.c:232:     rem_bits = row_bits;
	.loc 2 232 14
	movq	-136(%rbp), %rax	# row_bits, tmp227
	movq	%rax, -24(%rbp)	# tmp227, rem_bits
# ops_bulk.c:234:     nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;
	.loc 2 234 18
	movq	-64(%rbp), %rax	# data_x, data_x.17_15
	leaq	8(%rax), %rdx	#, tmp228
	movq	%rdx, -64(%rbp)	# tmp228, data_x
# ops_bulk.c:234:     nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;
	.loc 2 234 8
	movq	(%rax), %rax	# *data_x.17_15, tmp229
	movq	%rax, -104(%rbp)	# tmp229, nx
# ops_bulk.c:234:     nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;
	.loc 2 234 36
	movq	-72(%rbp), %rax	# data_y, data_y.18_16
	leaq	8(%rax), %rdx	#, tmp230
	movq	%rdx, -72(%rbp)	# tmp230, data_y
# ops_bulk.c:234:     nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;
	.loc 2 234 26
	movq	(%rax), %rax	# *data_y.18_16, tmp231
	movq	%rax, -112(%rbp)	# tmp231, ny
# ops_bulk.c:234:     nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;
	.loc 2 234 47
	movq	$0, -176(%rbp)	#, carry
# ops_bulk.c:234:     nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;
	.loc 2 234 63
	movq	-56(%rbp), %rax	# iz, tmp232
	movb	%al, -161(%rbp)	# _17, val_offset
# ops_bulk.c:237:     if (iz && iz + rem_bits >= 64) {
	.loc 2 237 8
	cmpq	$0, -56(%rbp)	#, iz
	je	.L133	#,
# ops_bulk.c:237:     if (iz && iz + rem_bits >= 64) {
	.loc 2 237 18 discriminator 1
	movq	-56(%rbp), %rdx	# iz, tmp233
	movq	-24(%rbp), %rax	# rem_bits, tmp234
	addq	%rdx, %rax	# tmp233, _18
# ops_bulk.c:237:     if (iz && iz + rem_bits >= 64) {
	.loc 2 237 12 discriminator 1
	cmpq	$63, %rax	#, _18
	jbe	.L133	#,
# ops_bulk.c:238:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 238 15
	movq	-40(%rbp), %rax	# ix, tmp235
	movl	%eax, %edx	# tmp235, _19
# ops_bulk.c:238:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 238 10
	movq	-104(%rbp), %rax	# nx, tmp239
	movl	%edx, %ecx	# _19, tmp357
	shrq	%cl, %rax	# tmp357, tmp238
	movq	%rax, -88(%rbp)	# tmp238, vx
# ops_bulk.c:238:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 238 35
	movq	-64(%rbp), %rax	# data_x, data_x.19_20
	leaq	8(%rax), %rdx	#, tmp240
	movq	%rdx, -64(%rbp)	# tmp240, data_x
# ops_bulk.c:238:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 238 25
	movq	(%rax), %rax	# *data_x.19_20, tmp241
	movq	%rax, -104(%rbp)	# tmp241, nx
# ops_bulk.c:239:       if ((ix += 64 - iz) >= 64 && (ix -= 64))
	.loc 2 239 15
	movq	-40(%rbp), %rax	# ix, tmp242
	subq	-56(%rbp), %rax	# iz, _21
	addq	$64, %rax	#, tmp243
	movq	%rax, -40(%rbp)	# tmp243, ix
# ops_bulk.c:239:       if ((ix += 64 - iz) >= 64 && (ix -= 64))
	.loc 2 239 10
	cmpq	$63, -40(%rbp)	#, ix
	jbe	.L131	#,
# ops_bulk.c:239:       if ((ix += 64 - iz) >= 64 && (ix -= 64))
	.loc 2 239 40 discriminator 1
	subq	$64, -40(%rbp)	#, ix
# ops_bulk.c:239:       if ((ix += 64 - iz) >= 64 && (ix -= 64))
	.loc 2 239 33 discriminator 1
	cmpq	$0, -40(%rbp)	#, ix
	je	.L131	#,
# ops_bulk.c:240:         vx |= nx << (64 - ix);
	.loc 2 240 25
	movq	-40(%rbp), %rax	# ix, tmp244
	movl	%eax, %edx	# tmp244, _22
	movl	$64, %eax	#, tmp245
	subl	%edx, %eax	# _22, _23
# ops_bulk.c:240:         vx |= nx << (64 - ix);
	.loc 2 240 18
	movq	-104(%rbp), %rdx	# nx, tmp246
	movl	%eax, %ecx	# _23, tmp359
	salq	%cl, %rdx	# tmp359, tmp246
	movq	%rdx, %rax	# tmp246, _24
# ops_bulk.c:240:         vx |= nx << (64 - ix);
	.loc 2 240 12
	orq	%rax, -88(%rbp)	# _24, vx
.L131:
# ops_bulk.c:242:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 242 15
	movq	-48(%rbp), %rax	# iy, tmp247
	movl	%eax, %edx	# tmp247, _25
# ops_bulk.c:242:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 242 10
	movq	-112(%rbp), %rax	# ny, tmp251
	movl	%edx, %ecx	# _25, tmp360
	shrq	%cl, %rax	# tmp360, tmp250
	movq	%rax, -96(%rbp)	# tmp250, vy
# ops_bulk.c:242:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 242 35
	movq	-72(%rbp), %rax	# data_y, data_y.20_26
	leaq	8(%rax), %rdx	#, tmp252
	movq	%rdx, -72(%rbp)	# tmp252, data_y
# ops_bulk.c:242:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 242 25
	movq	(%rax), %rax	# *data_y.20_26, tmp253
	movq	%rax, -112(%rbp)	# tmp253, ny
# ops_bulk.c:243:       if ((iy += 64 - iz) >= 64 && (iy -= 64))
	.loc 2 243 15
	movq	-48(%rbp), %rax	# iy, tmp254
	subq	-56(%rbp), %rax	# iz, _27
	addq	$64, %rax	#, tmp255
	movq	%rax, -48(%rbp)	# tmp255, iy
# ops_bulk.c:243:       if ((iy += 64 - iz) >= 64 && (iy -= 64))
	.loc 2 243 10
	cmpq	$63, -48(%rbp)	#, iy
	jbe	.L132	#,
# ops_bulk.c:243:       if ((iy += 64 - iz) >= 64 && (iy -= 64))
	.loc 2 243 40 discriminator 1
	subq	$64, -48(%rbp)	#, iy
# ops_bulk.c:243:       if ((iy += 64 - iz) >= 64 && (iy -= 64))
	.loc 2 243 33 discriminator 1
	cmpq	$0, -48(%rbp)	#, iy
	je	.L132	#,
# ops_bulk.c:244:         vy |= ny << (64 - iy);
	.loc 2 244 25
	movq	-48(%rbp), %rax	# iy, tmp256
	movl	%eax, %edx	# tmp256, _28
	movl	$64, %eax	#, tmp257
	subl	%edx, %eax	# _28, _29
# ops_bulk.c:244:         vy |= ny << (64 - iy);
	.loc 2 244 18
	movq	-112(%rbp), %rdx	# ny, tmp258
	movl	%eax, %ecx	# _29, tmp362
	salq	%cl, %rdx	# tmp362, tmp258
	movq	%rdx, %rax	# tmp258, _30
# ops_bulk.c:244:         vy |= ny << (64 - iy);
	.loc 2 244 12
	orq	%rax, -96(%rbp)	# _30, vy
.L132:
# ops_bulk.c:246:       nmask = next_mask(bits, hi, &val_offset, imask);
	.loc 2 246 15
	movq	-184(%rbp), %rcx	# imask, imask.21_31
	movzbl	-185(%rbp), %eax	# hi, hi.22_32
	movzbl	%al, %esi	# hi.22_32, _33
	movzbl	-113(%rbp), %eax	# bits, _34
	leaq	-161(%rbp), %rdx	#, tmp259
	movl	%eax, %edi	# _34,
	call	next_mask	#
	movq	%rax, -152(%rbp)	# tmp260, nmask
# ops_bulk.c:247:       vz = action(vx << iz, vy << iz, &carry, nmask);
	.loc 2 247 12
	movq	-56(%rbp), %rax	# iz, tmp261
	movl	%eax, %edx	# tmp261, _35
	movq	-96(%rbp), %rax	# vy, tmp262
	movl	%edx, %ecx	# _35, tmp364
	salq	%cl, %rax	# tmp364, tmp262
	movq	%rax, %rsi	# tmp262, _36
	movq	-56(%rbp), %rax	# iz, tmp263
	movl	%eax, %edx	# tmp263, _37
	movq	-88(%rbp), %rax	# vx, tmp264
	movl	%edx, %ecx	# _37, tmp366
	salq	%cl, %rax	# tmp366, tmp264
	movq	%rax, %rdi	# tmp264, _38
	movq	-152(%rbp), %rdx	# nmask, tmp265
	leaq	-176(%rbp), %rax	#, tmp266
	movq	48(%rbp), %r8	# action, tmp267
	movq	%rdx, %rcx	# tmp265,
	movq	%rax, %rdx	# tmp266,
	call	*%r8	# tmp267
.LVL0:
	movq	%rax, -160(%rbp)	# tmp268, vz
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 17
	movq	-80(%rbp), %rax	# data_z, tmp269
	movq	(%rax), %rdx	# *data_z_165, _39
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 40
	movq	-56(%rbp), %rax	# iz, tmp270
	movq	$-1, %rsi	#, tmp271
	movl	%eax, %ecx	# _40, tmp368
	salq	%cl, %rsi	# tmp368, tmp271
	movq	%rsi, %rax	# tmp271, _41
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 27
	notq	%rax	# _42
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 25
	andq	%rax, %rdx	# _42, _43
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 67
	movq	-56(%rbp), %rax	# iz, tmp272
	movq	$-1, %rsi	#, tmp273
	movl	%eax, %ecx	# _44, tmp370
	salq	%cl, %rsi	# tmp370, tmp273
	movq	%rsi, %rax	# tmp273, _45
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 53
	andq	-160(%rbp), %rax	# vz, _46
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 47
	orq	%rax, %rdx	# _46, _47
# ops_bulk.c:249:       *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));
	.loc 2 249 15
	movq	-80(%rbp), %rax	# data_z, tmp274
	movq	%rdx, (%rax)	# _47, *data_z_165
# ops_bulk.c:251:       rem_bits -= 64 - iz, ++iz, iz = 0;
	.loc 2 251 16
	movq	-56(%rbp), %rdx	# iz, tmp275
	movq	-24(%rbp), %rax	# rem_bits, tmp276
	addq	%rdx, %rax	# tmp275, _48
	subq	$64, %rax	#, tmp277
	movq	%rax, -24(%rbp)	# tmp277, rem_bits
# ops_bulk.c:251:       rem_bits -= 64 - iz, ++iz, iz = 0;
	.loc 2 251 28
	addq	$1, -56(%rbp)	#, iz
# ops_bulk.c:251:       rem_bits -= 64 - iz, ++iz, iz = 0;
	.loc 2 251 37
	movq	$0, -56(%rbp)	#, iz
# ops_bulk.c:254:     for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
	.loc 2 254 5
	jmp	.L133	#
.L136:
# ops_bulk.c:255:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 255 15
	movq	-40(%rbp), %rax	# ix, tmp278
	movl	%eax, %edx	# tmp278, _49
# ops_bulk.c:255:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 255 10
	movq	-104(%rbp), %rax	# nx, tmp282
	movl	%edx, %ecx	# _49, tmp371
	shrq	%cl, %rax	# tmp371, tmp281
	movq	%rax, -88(%rbp)	# tmp281, vx
# ops_bulk.c:255:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 255 35
	movq	-64(%rbp), %rax	# data_x, data_x.23_50
	leaq	8(%rax), %rdx	#, tmp283
	movq	%rdx, -64(%rbp)	# tmp283, data_x
# ops_bulk.c:255:       vx = nx >> ix, nx = *(data_x++);
	.loc 2 255 25
	movq	(%rax), %rax	# *data_x.23_50, tmp284
	movq	%rax, -104(%rbp)	# tmp284, nx
# ops_bulk.c:256:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 256 15
	movq	-48(%rbp), %rax	# iy, tmp285
	movl	%eax, %edx	# tmp285, _51
# ops_bulk.c:256:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 256 10
	movq	-112(%rbp), %rax	# ny, tmp289
	movl	%edx, %ecx	# _51, tmp372
	shrq	%cl, %rax	# tmp372, tmp288
	movq	%rax, -96(%rbp)	# tmp288, vy
# ops_bulk.c:256:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 256 35
	movq	-72(%rbp), %rax	# data_y, data_y.24_52
	leaq	8(%rax), %rdx	#, tmp290
	movq	%rdx, -72(%rbp)	# tmp290, data_y
# ops_bulk.c:256:       vy = ny >> iy, ny = *(data_y++);
	.loc 2 256 25
	movq	(%rax), %rax	# *data_y.24_52, tmp291
	movq	%rax, -112(%rbp)	# tmp291, ny
# ops_bulk.c:258:       if (ix) vx |= nx << (64 - ix);
	.loc 2 258 10
	cmpq	$0, -40(%rbp)	#, ix
	je	.L134	#,
# ops_bulk.c:258:       if (ix) vx |= nx << (64 - ix);
	.loc 2 258 31 discriminator 1
	movq	-40(%rbp), %rax	# ix, tmp292
	movl	%eax, %edx	# tmp292, _53
	movl	$64, %eax	#, tmp293
	subl	%edx, %eax	# _53, _54
# ops_bulk.c:258:       if (ix) vx |= nx << (64 - ix);
	.loc 2 258 24 discriminator 1
	movq	-104(%rbp), %rdx	# nx, tmp294
	movl	%eax, %ecx	# _54, tmp374
	salq	%cl, %rdx	# tmp374, tmp294
	movq	%rdx, %rax	# tmp294, _55
# ops_bulk.c:258:       if (ix) vx |= nx << (64 - ix);
	.loc 2 258 18 discriminator 1
	orq	%rax, -88(%rbp)	# _55, vx
.L134:
# ops_bulk.c:259:       if (iy) vy |= ny << (64 - iy);
	.loc 2 259 10
	cmpq	$0, -48(%rbp)	#, iy
	je	.L135	#,
# ops_bulk.c:259:       if (iy) vy |= ny << (64 - iy);
	.loc 2 259 31 discriminator 1
	movq	-48(%rbp), %rax	# iy, tmp295
	movl	%eax, %edx	# tmp295, _56
	movl	$64, %eax	#, tmp296
	subl	%edx, %eax	# _56, _57
# ops_bulk.c:259:       if (iy) vy |= ny << (64 - iy);
	.loc 2 259 24 discriminator 1
	movq	-112(%rbp), %rdx	# ny, tmp297
	movl	%eax, %ecx	# _57, tmp376
	salq	%cl, %rdx	# tmp376, tmp297
	movq	%rdx, %rax	# tmp297, _58
# ops_bulk.c:259:       if (iy) vy |= ny << (64 - iy);
	.loc 2 259 18 discriminator 1
	orq	%rax, -96(%rbp)	# _58, vy
.L135:
# ops_bulk.c:261:       nmask = next_mask(bits, hi, &val_offset, imask);
	.loc 2 261 15
	movq	-184(%rbp), %rcx	# imask, imask.25_59
	movzbl	-185(%rbp), %eax	# hi, hi.26_60
	movzbl	%al, %esi	# hi.26_60, _61
	movzbl	-113(%rbp), %eax	# bits, _62
	leaq	-161(%rbp), %rdx	#, tmp298
	movl	%eax, %edi	# _62,
	call	next_mask	#
	movq	%rax, -152(%rbp)	# tmp299, nmask
# ops_bulk.c:262:       *(data_z++) = action(vx, vy, &carry, nmask);
	.loc 2 262 15
	movq	-80(%rbp), %rbx	# data_z, data_z.27_63
	leaq	8(%rbx), %rax	#, tmp300
	movq	%rax, -80(%rbp)	# tmp300, data_z
# ops_bulk.c:262:       *(data_z++) = action(vx, vy, &carry, nmask);
	.loc 2 262 21
	movq	-152(%rbp), %rcx	# nmask, tmp301
	leaq	-176(%rbp), %rdx	#, tmp302
	movq	-96(%rbp), %rsi	# vy, tmp303
	movq	-88(%rbp), %rax	# vx, tmp304
	movq	48(%rbp), %r8	# action, tmp305
	movq	%rax, %rdi	# tmp304,
	call	*%r8	# tmp305
.LVL1:
# ops_bulk.c:262:       *(data_z++) = action(vx, vy, &carry, nmask);
	.loc 2 262 19
	movq	%rax, (%rbx)	# _64, *data_z.27_63
# ops_bulk.c:254:     for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
	.loc 2 254 37
	subq	$64, -24(%rbp)	#, rem_bits
.L133:
# ops_bulk.c:254:     for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
	.loc 2 254 21 discriminator 1
	cmpq	$63, -24(%rbp)	#, rem_bits
	ja	.L136	#,
# ops_bulk.c:265:     if (rem_bits) {
	.loc 2 265 8
	cmpq	$0, -24(%rbp)	#, rem_bits
	je	.L137	#,
# ops_bulk.c:266:       vx = nx >> ix, nx = *data_x;
	.loc 2 266 15
	movq	-40(%rbp), %rax	# ix, tmp306
	movl	%eax, %edx	# tmp306, _65
# ops_bulk.c:266:       vx = nx >> ix, nx = *data_x;
	.loc 2 266 10
	movq	-104(%rbp), %rax	# nx, tmp310
	movl	%edx, %ecx	# _65, tmp377
	shrq	%cl, %rax	# tmp377, tmp309
	movq	%rax, -88(%rbp)	# tmp309, vx
# ops_bulk.c:266:       vx = nx >> ix, nx = *data_x;
	.loc 2 266 25
	movq	-64(%rbp), %rax	# data_x, tmp311
	movq	(%rax), %rax	# *data_x_115, tmp312
	movq	%rax, -104(%rbp)	# tmp312, nx
# ops_bulk.c:267:       vy = ny >> iy, ny = *data_y;
	.loc 2 267 15
	movq	-48(%rbp), %rax	# iy, tmp313
	movl	%eax, %edx	# tmp313, _66
# ops_bulk.c:267:       vy = ny >> iy, ny = *data_y;
	.loc 2 267 10
	movq	-112(%rbp), %rax	# ny, tmp317
	movl	%edx, %ecx	# _66, tmp378
	shrq	%cl, %rax	# tmp378, tmp316
	movq	%rax, -96(%rbp)	# tmp316, vy
# ops_bulk.c:267:       vy = ny >> iy, ny = *data_y;
	.loc 2 267 25
	movq	-72(%rbp), %rax	# data_y, tmp318
	movq	(%rax), %rax	# *data_y_117, tmp319
	movq	%rax, -112(%rbp)	# tmp319, ny
# ops_bulk.c:269:       if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
	.loc 2 269 14
	movq	-40(%rbp), %rdx	# ix, tmp320
	movq	-24(%rbp), %rax	# rem_bits, tmp321
	addq	%rdx, %rax	# tmp320, _67
# ops_bulk.c:269:       if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
	.loc 2 269 10
	cmpq	$63, %rax	#, _67
	jbe	.L138	#,
# ops_bulk.c:269:       if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
	.loc 2 269 48 discriminator 1
	movq	-40(%rbp), %rax	# ix, tmp322
	movl	%eax, %edx	# tmp322, _68
	movl	$64, %eax	#, tmp323
	subl	%edx, %eax	# _68, _69
# ops_bulk.c:269:       if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
	.loc 2 269 41 discriminator 1
	movq	-104(%rbp), %rdx	# nx, tmp324
	movl	%eax, %ecx	# _69, tmp380
	salq	%cl, %rdx	# tmp380, tmp324
	movq	%rdx, %rax	# tmp324, _70
# ops_bulk.c:269:       if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
	.loc 2 269 35 discriminator 1
	orq	%rax, -88(%rbp)	# _70, vx
.L138:
# ops_bulk.c:270:       if (iy + rem_bits >= 64) vy |= ny << (64 - iy);
	.loc 2 270 14
	movq	-48(%rbp), %rdx	# iy, tmp325
	movq	-24(%rbp), %rax	# rem_bits, tmp326
	addq	%rdx, %rax	# tmp325, _71
# ops_bulk.c:270:       if (iy + rem_bits >= 64) vy |= ny << (64 - iy);
	.loc 2 270 10
	cmpq	$63, %rax	#, _71
	jbe	.L139	#,
# ops_bulk.c:270:       if (iy + rem_bits >= 64) vy |= ny << (64 - iy);
	.loc 2 270 48 discriminator 1
	movq	-48(%rbp), %rax	# iy, tmp327
	movl	%eax, %edx	# tmp327, _72
	movl	$64, %eax	#, tmp328
	subl	%edx, %eax	# _72, _73
# ops_bulk.c:270:       if (iy + rem_bits >= 64) vy |= ny << (64 - iy);
	.loc 2 270 41 discriminator 1
	movq	-112(%rbp), %rdx	# ny, tmp329
	movl	%eax, %ecx	# _73, tmp382
	salq	%cl, %rdx	# tmp382, tmp329
	movq	%rdx, %rax	# tmp329, _74
# ops_bulk.c:270:       if (iy + rem_bits >= 64) vy |= ny << (64 - iy);
	.loc 2 270 35 discriminator 1
	orq	%rax, -96(%rbp)	# _74, vy
.L139:
# ops_bulk.c:272:       nmask = next_mask(bits, hi, &val_offset, imask);
	.loc 2 272 15
	movq	-184(%rbp), %rcx	# imask, imask.28_75
	movzbl	-185(%rbp), %eax	# hi, hi.29_76
	movzbl	%al, %esi	# hi.29_76, _77
	movzbl	-113(%rbp), %eax	# bits, _78
	leaq	-161(%rbp), %rdx	#, tmp330
	movl	%eax, %edi	# _78,
	call	next_mask	#
	movq	%rax, -152(%rbp)	# tmp331, nmask
# ops_bulk.c:273:       vz = action(vx, vy, &carry, nmask);
	.loc 2 273 12
	movq	-152(%rbp), %rcx	# nmask, tmp332
	leaq	-176(%rbp), %rdx	#, tmp333
	movq	-96(%rbp), %rsi	# vy, tmp334
	movq	-88(%rbp), %rax	# vx, tmp335
	movq	48(%rbp), %r8	# action, tmp336
	movq	%rax, %rdi	# tmp335,
	call	*%r8	# tmp336
.LVL2:
	movq	%rax, -160(%rbp)	# tmp337, vz
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 17
	movq	-80(%rbp), %rax	# data_z, tmp338
	movq	(%rax), %rsi	# *data_z_118, _79
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 42
	movq	-24(%rbp), %rax	# rem_bits, tmp339
	movq	$-1, %rdx	#, tmp340
	movl	%eax, %ecx	# _80, tmp384
	salq	%cl, %rdx	# tmp384, tmp340
	movq	%rdx, %rax	# tmp340, _81
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 29
	notq	%rax	# _81
	movq	%rax, %rdx	# _81, _82
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 55
	movq	-56(%rbp), %rax	# iz, tmp341
	movl	%eax, %ecx	# _83, tmp387
	salq	%cl, %rdx	# tmp387, _82
	movq	%rdx, %rax	# _82, _84
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 27
	notq	%rax	# _85
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 25
	andq	%rax, %rsi	# _85, _86
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 83
	movq	-24(%rbp), %rax	# rem_bits, tmp342
	movq	$-1, %rdx	#, tmp343
	movl	%eax, %ecx	# _87, tmp389
	salq	%cl, %rdx	# tmp389, tmp343
	movq	%rdx, %rax	# tmp343, _88
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 70
	notq	%rax	# _89
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 68
	andq	-160(%rbp), %rax	# vz, _90
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 97
	movq	-56(%rbp), %rdx	# iz, tmp344
	movl	%edx, %ecx	# _91, tmp390
	salq	%cl, %rax	# tmp390, _92
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 62
	orq	%rax, %rsi	# _92, _86
	movq	%rsi, %rdx	# _86, _93
# ops_bulk.c:275:       *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
	.loc 2 275 15
	movq	-80(%rbp), %rax	# data_z, tmp345
	movq	%rdx, (%rax)	# _93, *data_z_118
.L137:
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 18
	movq	-128(%rbp), %rax	# dim, tmp349
	subq	$2, %rax	#, tmp348
	movq	%rax, -32(%rbp)	# tmp348, cur_dim
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 5
	jmp	.L140	#
.L141:
# ops_bulk.c:279:       offset[cur_dim] = 0;
	.loc 2 279 13 discriminator 4
	movq	-32(%rbp), %rax	# cur_dim, tmp350
	leaq	0(,%rax,8), %rdx	#, _94
	movq	-144(%rbp), %rax	# offset, tmp351
	addq	%rdx, %rax	# _94, _95
# ops_bulk.c:279:       offset[cur_dim] = 0;
	.loc 2 279 23 discriminator 4
	movq	$0, (%rax)	#, *_95
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 89 discriminator 4
	subq	$1, -32(%rbp)	#, cur_dim
.L140:
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 49 discriminator 1
	cmpq	$-1, -32(%rbp)	#, cur_dim
	je	.L129	#,
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 60 discriminator 3
	movq	-32(%rbp), %rax	# cur_dim, tmp352
	leaq	0(,%rax,8), %rdx	#, _96
	movq	-144(%rbp), %rax	# offset, tmp353
	addq	%rdx, %rax	# _96, _97
	movq	(%rax), %rdx	# *_97, _98
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 52 discriminator 3
	addq	$1, %rdx	#, _99
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 49 discriminator 3
	movq	%rdx, (%rax)	# _99, *_97
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 60 discriminator 3
	movq	(%rax), %rdx	# *_97, _100
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 78 discriminator 3
	movq	-32(%rbp), %rax	# cur_dim, tmp354
	leaq	0(,%rax,8), %rcx	#, _101
	movq	40(%rbp), %rax	# count, tmp355
	addq	%rcx, %rax	# _101, _102
	movq	(%rax), %rax	# *_102, _103
# ops_bulk.c:278:     for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
	.loc 2 278 49 discriminator 3
	cmpq	%rax, %rdx	# _103, _100
	je	.L141	#,
.L129:
# ops_bulk.c:219:   while (cur_dim != SIZE_MAX) {
	.loc 2 219 18
	cmpq	$-1, -32(%rbp)	#, cur_dim
	jne	.L142	#,
# ops_bulk.c:281: }
	.loc 2 281 1
	nop	
	nop	
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE36:
	.size	bulk_op, .-bulk_op
	.globl	bulk_unary_op
	.type	bulk_unary_op, @function
bulk_unary_op:
.LFB37:
	.loc 2 288 3
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -8(%rbp)	# dx, dx
	movq	%rsi, -16(%rbp)	# x, x
	movq	%rdx, -24(%rbp)	# ox, ox
	movq	%rcx, -32(%rbp)	# dy, dy
	movq	%r8, -40(%rbp)	# y, y
	movq	%r9, -48(%rbp)	# oy, oy
# ops_bulk.c:289:   bulk_op(dx, x, ox, dx, x, ox, dy, y, oy, count, action);
	.loc 2 289 3
	movq	-24(%rbp), %r8	# ox, tmp82
	movq	-16(%rbp), %rdi	# x, tmp83
	movq	-8(%rbp), %rcx	# dx, tmp84
	movq	-24(%rbp), %rdx	# ox, tmp85
	movq	-16(%rbp), %rsi	# x, tmp86
	movq	-8(%rbp), %rax	# dx, tmp87
	subq	$8, %rsp	#,
	pushq	24(%rbp)	# action
	pushq	16(%rbp)	# count
	pushq	-48(%rbp)	# oy
	pushq	-40(%rbp)	# y
	pushq	-32(%rbp)	# dy
	movq	%r8, %r9	# tmp82,
	movq	%rdi, %r8	# tmp83,
	movq	%rax, %rdi	# tmp87,
	call	bulk_op	#
	addq	$48, %rsp	#,
# ops_bulk.c:290: }
	.loc 2 290 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE37:
	.size	bulk_unary_op, .-bulk_unary_op
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stddef.h"
	.file 4 "/usr/include/bits/types.h"
	.file 5 "/usr/include/bits/stdint-uintn.h"
	.file 6 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stdarg.h"
	.file 7 "<built-in>"
	.file 8 "/usr/include/stdio.h"
	.file 9 "../include/types.h"
	.file 10 "/usr/include/string.h"
	.file 11 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x127f
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1b
	.long	.LASF93
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x9
	.long	.LASF8
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x3f
	.uleb128 0x11
	.long	0x2e
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0xa
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0xa
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x9
	.long	.LASF9
	.byte	0x4
	.byte	0x26
	.byte	0x17
	.long	0x5b
	.uleb128 0xa
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0x28
	.byte	0x1c
	.long	0x46
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x2a
	.byte	0x16
	.long	0x62
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0x2d
	.byte	0x1b
	.long	0x3f
	.uleb128 0x1d
	.byte	0x8
	.uleb128 0x9
	.long	.LASF15
	.byte	0x5
	.byte	0x18
	.byte	0x13
	.long	0x70
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.byte	0x19
	.byte	0x14
	.long	0x83
	.uleb128 0x9
	.long	.LASF17
	.byte	0x5
	.byte	0x1a
	.byte	0x14
	.long	0x8f
	.uleb128 0x9
	.long	.LASF18
	.byte	0x5
	.byte	0x1b
	.byte	0x14
	.long	0xa2
	.uleb128 0x11
	.long	0xd4
	.uleb128 0x9
	.long	.LASF19
	.byte	0x6
	.byte	0x28
	.byte	0x1b
	.long	0xf1
	.uleb128 0x1e
	.long	.LASF94
	.long	0xfa
	.uleb128 0x1f
	.long	0x10a
	.long	0x10a
	.uleb128 0x20
	.long	0x3f
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF95
	.byte	0x18
	.byte	0x7
	.byte	0
	.long	0x13f
	.uleb128 0xf
	.long	.LASF20
	.long	0x62
	.byte	0
	.uleb128 0xf
	.long	.LASF21
	.long	0x62
	.byte	0x4
	.uleb128 0xf
	.long	.LASF22
	.long	0xae
	.byte	0x8
	.uleb128 0xf
	.long	.LASF23
	.long	0xae
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.long	.LASF24
	.byte	0x8
	.byte	0x34
	.byte	0x18
	.long	0xe5
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.long	.LASF25
	.uleb128 0xa
	.byte	0x10
	.byte	0x4
	.long	.LASF26
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.long	.LASF27
	.uleb128 0x8
	.long	0x165
	.uleb128 0x22
	.uleb128 0x9
	.long	.LASF28
	.byte	0x9
	.byte	0xa
	.byte	0x1b
	.long	0x177
	.uleb128 0x11
	.long	0x166
	.uleb128 0x23
	.long	.LASF96
	.byte	0x30
	.byte	0x1
	.byte	0x8
	.byte	0x8
	.long	0x1ce
	.uleb128 0xd
	.long	.LASF29
	.byte	0x9
	.byte	0xb
	.long	0xb0
	.byte	0
	.uleb128 0x24
	.string	"dim"
	.byte	0x1
	.byte	0xa
	.byte	0xa
	.long	0x2e
	.byte	0x8
	.uleb128 0xd
	.long	.LASF30
	.byte	0xa
	.byte	0x10
	.long	0x1ce
	.byte	0x10
	.uleb128 0xd
	.long	.LASF31
	.byte	0xa
	.byte	0x17
	.long	0x2e
	.byte	0x18
	.uleb128 0xd
	.long	.LASF32
	.byte	0xb
	.byte	0xc
	.long	0xd4
	.byte	0x20
	.uleb128 0xd
	.long	.LASF33
	.byte	0xd
	.byte	0xb
	.long	0x1ce
	.byte	0x28
	.byte	0
	.uleb128 0x8
	.long	0x2e
	.uleb128 0x16
	.long	.LASF34
	.byte	0xa
	.byte	0x3d
	.byte	0xe
	.long	0xae
	.long	0x1f3
	.uleb128 0x6
	.long	0xae
	.uleb128 0x6
	.long	0x4d
	.uleb128 0x6
	.long	0x2e
	.byte	0
	.uleb128 0x17
	.long	.LASF35
	.value	0x21e
	.long	0xae
	.long	0x20d
	.uleb128 0x6
	.long	0x2e
	.uleb128 0x6
	.long	0x2e
	.byte	0
	.uleb128 0x16
	.long	.LASF36
	.byte	0x9
	.byte	0xc
	.byte	0xa
	.long	0xd4
	.long	0x223
	.uleb128 0x6
	.long	0xb0
	.byte	0
	.uleb128 0x17
	.long	.LASF37
	.value	0x21b
	.long	0xae
	.long	0x238
	.uleb128 0x6
	.long	0x2e
	.byte	0
	.uleb128 0x25
	.long	.LASF40
	.byte	0x2
	.value	0x11b
	.byte	0x6
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c8
	.uleb128 0xc
	.string	"dx"
	.value	0x11c
	.byte	0x1a
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"x"
	.value	0x11c
	.byte	0x2a
	.long	0x160
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.string	"ox"
	.value	0x11c
	.byte	0x3b
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.string	"dy"
	.value	0x11d
	.byte	0x1a
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.string	"y"
	.value	0x11d
	.byte	0x24
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.string	"oy"
	.value	0x11d
	.byte	0x35
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.long	.LASF38
	.value	0x11e
	.byte	0x17
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.long	.LASF39
	.value	0x11f
	.byte	0x14
	.long	0x2f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x8
	.long	0x172
	.uleb128 0x8
	.long	0x3a
	.uleb128 0x12
	.long	0xd4
	.long	0x2f0
	.uleb128 0x6
	.long	0xd4
	.uleb128 0x6
	.long	0xd4
	.uleb128 0x6
	.long	0x2f0
	.uleb128 0x6
	.long	0xd4
	.byte	0
	.uleb128 0x8
	.long	0xd4
	.uleb128 0x8
	.long	0x2d2
	.uleb128 0x13
	.long	.LASF41
	.byte	0xbf
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x509
	.uleb128 0x4
	.string	"dx"
	.byte	0x2
	.byte	0xc0
	.byte	0x1a
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x4
	.string	"x"
	.byte	0x2
	.byte	0xc0
	.byte	0x2a
	.long	0x160
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x4
	.string	"ox"
	.byte	0x2
	.byte	0xc0
	.byte	0x3b
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x4
	.string	"dy"
	.byte	0x2
	.byte	0xc1
	.byte	0x1a
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x4
	.string	"y"
	.byte	0x2
	.byte	0xc1
	.byte	0x2a
	.long	0x160
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x4
	.string	"oy"
	.byte	0x2
	.byte	0xc1
	.byte	0x3b
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x4
	.string	"dz"
	.byte	0x2
	.byte	0xc2
	.byte	0x1a
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.string	"z"
	.byte	0x2
	.byte	0xc2
	.byte	0x24
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x4
	.string	"oz"
	.byte	0x2
	.byte	0xc2
	.byte	0x35
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1
	.long	.LASF38
	.byte	0x2
	.byte	0xc3
	.byte	0x17
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1
	.long	.LASF39
	.byte	0x2
	.byte	0xc4
	.byte	0x14
	.long	0x2f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x2
	.long	.LASF42
	.byte	0x2
	.byte	0xc9
	.byte	0xb
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -129
	.uleb128 0x3
	.string	"dim"
	.byte	0x2
	.byte	0xca
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2
	.long	.LASF43
	.byte	0x2
	.byte	0xca
	.byte	0x19
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x2
	.long	.LASF44
	.byte	0x2
	.byte	0xca
	.byte	0x3b
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF45
	.byte	0x2
	.byte	0xcc
	.byte	0xb
	.long	0x1ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.long	.LASF46
	.byte	0x2
	.byte	0xcf
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.string	"ix"
	.byte	0x2
	.byte	0xcf
	.byte	0x17
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.string	"iy"
	.byte	0x2
	.byte	0xcf
	.byte	0x1b
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3
	.string	"iz"
	.byte	0x2
	.byte	0xcf
	.byte	0x1f
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2
	.long	.LASF47
	.byte	0x2
	.byte	0xd0
	.byte	0xb
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -177
	.uleb128 0x2
	.long	.LASF48
	.byte	0x2
	.byte	0xd2
	.byte	0x13
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.long	.LASF49
	.byte	0x2
	.byte	0xd2
	.byte	0x1c
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x2
	.long	.LASF50
	.byte	0x2
	.byte	0xd3
	.byte	0xd
	.long	0x2f0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3
	.string	"vx"
	.byte	0x2
	.byte	0xd5
	.byte	0xc
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x3
	.string	"vy"
	.byte	0x2
	.byte	0xd5
	.byte	0x10
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3
	.string	"vz"
	.byte	0x2
	.byte	0xd5
	.byte	0x14
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2
	.long	.LASF51
	.byte	0x2
	.byte	0xd5
	.byte	0x18
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x3
	.string	"nx"
	.byte	0x2
	.byte	0xd5
	.byte	0x1f
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x3
	.string	"ny"
	.byte	0x2
	.byte	0xd5
	.byte	0x23
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x2
	.long	.LASF52
	.byte	0x2
	.byte	0xd7
	.byte	0xc
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x2
	.long	.LASF53
	.byte	0x2
	.byte	0xd7
	.byte	0x13
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x3
	.string	"hi"
	.byte	0x2
	.byte	0xd8
	.byte	0xb
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -201
	.byte	0
	.uleb128 0x8
	.long	0xe0
	.uleb128 0x10
	.long	.LASF68
	.byte	0x2
	.byte	0x8c
	.byte	0x9
	.long	0x1ce
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x629
	.uleb128 0x1
	.long	.LASF54
	.byte	0x2
	.byte	0x8d
	.byte	0x1a
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF55
	.byte	0x2
	.byte	0x8d
	.byte	0x26
	.long	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.long	.LASF45
	.byte	0x2
	.byte	0x8d
	.byte	0x3a
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.long	.LASF38
	.byte	0x2
	.byte	0x8d
	.byte	0x50
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x4
	.string	"arg"
	.byte	0x2
	.byte	0x8e
	.byte	0xf
	.long	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF39
	.byte	0x2
	.byte	0x8e
	.byte	0x1b
	.long	0x649
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2
	.long	.LASF56
	.byte	0x2
	.byte	0x90
	.byte	0xd
	.long	0x2f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF42
	.byte	0x2
	.byte	0x94
	.byte	0xb
	.long	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x3
	.string	"dim"
	.byte	0x2
	.byte	0x95
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2
	.long	.LASF43
	.byte	0x2
	.byte	0x95
	.byte	0x1b
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.long	.LASF44
	.byte	0x2
	.byte	0x95
	.byte	0x3d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.long	.LASF57
	.byte	0x2
	.byte	0x97
	.byte	0xb
	.long	0x1ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x3
	.string	"iz"
	.byte	0x2
	.byte	0x9a
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"bz"
	.byte	0x2
	.byte	0x9b
	.byte	0xb
	.long	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x2
	.long	.LASF47
	.byte	0x2
	.byte	0x9c
	.byte	0x7
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x2
	.long	.LASF46
	.byte	0x2
	.byte	0x9e
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x12
	.long	0x642
	.long	0x642
	.uleb128 0x6
	.long	0x2cd
	.uleb128 0x6
	.long	0xd4
	.uleb128 0x6
	.long	0xae
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.byte	0x2
	.long	.LASF58
	.uleb128 0x8
	.long	0x629
	.uleb128 0x14
	.long	.LASF64
	.byte	0x78
	.byte	0xd
	.long	0x642
	.long	0x6be
	.uleb128 0xb
	.string	"dim"
	.byte	0x78
	.byte	0x1f
	.long	0x2e
	.uleb128 0x7
	.long	.LASF59
	.byte	0x78
	.byte	0x2c
	.long	0xb0
	.uleb128 0xb
	.string	"bit"
	.byte	0x78
	.byte	0x3f
	.long	0x6be
	.uleb128 0x7
	.long	.LASF60
	.byte	0x78
	.byte	0x4c
	.long	0x1ce
	.uleb128 0x7
	.long	.LASF61
	.byte	0x78
	.byte	0x5b
	.long	0xb0
	.uleb128 0x7
	.long	.LASF55
	.byte	0x79
	.byte	0x2f
	.long	0x509
	.uleb128 0xb
	.string	"arg"
	.byte	0x79
	.byte	0x3b
	.long	0xae
	.uleb128 0x7
	.long	.LASF39
	.byte	0x79
	.byte	0x47
	.long	0x649
	.uleb128 0x19
	.string	"v"
	.byte	0x7a
	.long	0xd4
	.byte	0
	.uleb128 0x8
	.long	0x4d
	.uleb128 0x13
	.long	.LASF62
	.byte	0x4b
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x7ea
	.uleb128 0x1
	.long	.LASF54
	.byte	0x2
	.byte	0x4b
	.byte	0x20
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF55
	.byte	0x2
	.byte	0x4b
	.byte	0x2c
	.long	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.long	.LASF45
	.byte	0x2
	.byte	0x4b
	.byte	0x40
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.long	.LASF38
	.byte	0x2
	.byte	0x4b
	.byte	0x56
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x4
	.string	"arg"
	.byte	0x2
	.byte	0x4b
	.byte	0x63
	.long	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.long	.LASF39
	.byte	0x2
	.byte	0x4b
	.byte	0x73
	.long	0x7fe
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2
	.long	.LASF42
	.byte	0x2
	.byte	0x4f
	.byte	0xb
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -65
	.uleb128 0x2
	.long	.LASF32
	.byte	0x2
	.byte	0x50
	.byte	0xc
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x3
	.string	"dim"
	.byte	0x2
	.byte	0x51
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x2
	.long	.LASF43
	.byte	0x2
	.byte	0x51
	.byte	0x1b
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.long	.LASF44
	.byte	0x2
	.byte	0x51
	.byte	0x3d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF57
	.byte	0x2
	.byte	0x53
	.byte	0xb
	.long	0x1ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x3
	.string	"iz"
	.byte	0x2
	.byte	0x56
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.long	.LASF63
	.byte	0x2
	.byte	0x57
	.byte	0xd
	.long	0x2f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.string	"vz"
	.byte	0x2
	.byte	0x57
	.byte	0x17
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2
	.long	.LASF47
	.byte	0x2
	.byte	0x58
	.byte	0x7
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x2
	.long	.LASF46
	.byte	0x2
	.byte	0x5a
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x12
	.long	0xd4
	.long	0x7fe
	.uleb128 0x6
	.long	0x2cd
	.uleb128 0x6
	.long	0xae
	.byte	0
	.uleb128 0x8
	.long	0x7ea
	.uleb128 0x14
	.long	.LASF65
	.byte	0x3e
	.byte	0x11
	.long	0xd4
	.long	0x873
	.uleb128 0xb
	.string	"dim"
	.byte	0x3e
	.byte	0x23
	.long	0x2e
	.uleb128 0x7
	.long	.LASF59
	.byte	0x3e
	.byte	0x30
	.long	0xb0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x3e
	.byte	0x47
	.long	0xd4
	.uleb128 0xb
	.string	"bit"
	.byte	0x3e
	.byte	0x52
	.long	0x6be
	.uleb128 0x7
	.long	.LASF60
	.byte	0x3e
	.byte	0x5f
	.long	0x1ce
	.uleb128 0x7
	.long	.LASF42
	.byte	0x3e
	.byte	0x6e
	.long	0xb0
	.uleb128 0xb
	.string	"arg"
	.byte	0x3e
	.byte	0x7a
	.long	0xae
	.uleb128 0x7
	.long	.LASF39
	.byte	0x3e
	.byte	0x8a
	.long	0x7fe
	.uleb128 0x19
	.string	"v"
	.byte	0x3f
	.long	0xd4
	.byte	0
	.uleb128 0x13
	.long	.LASF66
	.byte	0x11
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x9a7
	.uleb128 0x1
	.long	.LASF54
	.byte	0x2
	.byte	0x11
	.byte	0x21
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF55
	.byte	0x2
	.byte	0x11
	.byte	0x2d
	.long	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.long	.LASF45
	.byte	0x2
	.byte	0x11
	.byte	0x41
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.long	.LASF38
	.byte	0x2
	.byte	0x11
	.byte	0x57
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x4
	.string	"val"
	.byte	0x2
	.byte	0x11
	.byte	0x67
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x2
	.long	.LASF63
	.byte	0x2
	.byte	0x12
	.byte	0xd
	.long	0x2f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF42
	.byte	0x2
	.byte	0x17
	.byte	0xb
	.long	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x3
	.string	"dim"
	.byte	0x2
	.byte	0x18
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2
	.long	.LASF43
	.byte	0x2
	.byte	0x18
	.byte	0x1b
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.long	.LASF44
	.byte	0x2
	.byte	0x18
	.byte	0x3d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.long	.LASF57
	.byte	0x2
	.byte	0x1a
	.byte	0xb
	.long	0x1ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x2
	.long	.LASF46
	.byte	0x2
	.byte	0x1d
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF52
	.byte	0x2
	.byte	0x1f
	.byte	0xc
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3
	.string	"vz"
	.byte	0x2
	.byte	0x1f
	.byte	0x13
	.long	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x3
	.string	"iz"
	.byte	0x2
	.byte	0x20
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3
	.string	"bz"
	.byte	0x2
	.byte	0x21
	.byte	0xb
	.long	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x3
	.string	"hi"
	.byte	0x2
	.byte	0x21
	.byte	0xf
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -113
	.uleb128 0x2
	.long	.LASF47
	.byte	0x2
	.byte	0x21
	.byte	0x13
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -114
	.byte	0
	.uleb128 0x14
	.long	.LASF67
	.byte	0xa
	.byte	0x11
	.long	0xd4
	.long	0x9ee
	.uleb128 0x7
	.long	.LASF42
	.byte	0xa
	.byte	0x23
	.long	0xb0
	.uleb128 0xb
	.string	"hi"
	.byte	0xa
	.byte	0x31
	.long	0xb0
	.uleb128 0x7
	.long	.LASF45
	.byte	0xa
	.byte	0x3e
	.long	0x9ee
	.uleb128 0x7
	.long	.LASF52
	.byte	0xa
	.byte	0x4f
	.long	0xd4
	.uleb128 0x26
	.long	.LASF53
	.byte	0x2
	.byte	0xb
	.byte	0xc
	.long	0xd4
	.byte	0
	.uleb128 0x8
	.long	0xb0
	.uleb128 0x27
	.long	.LASF97
	.byte	0x2
	.byte	0x5
	.byte	0xd
	.long	0xa2b
	.uleb128 0x7
	.long	.LASF42
	.byte	0x5
	.byte	0x1e
	.long	0xb0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x5
	.byte	0x2d
	.long	0xd4
	.uleb128 0x7
	.long	.LASF52
	.byte	0x5
	.byte	0x3d
	.long	0x2f0
	.uleb128 0xb
	.string	"hi"
	.byte	0x5
	.byte	0x4d
	.long	0x9ee
	.byte	0
	.uleb128 0x5
	.long	.LASF69
	.byte	0xb7
	.byte	0x1
	.long	0xd4
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xa98
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.string	"val"
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	0x2f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	.LASF71
	.byte	0xb6
	.byte	0x1
	.long	0xc8
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xb05
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.string	"val"
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0xc8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0xb05
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0xc8
	.uleb128 0x5
	.long	.LASF72
	.byte	0xb5
	.byte	0x1
	.long	0xbc
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xb77
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.string	"val"
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	0xb77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0xbc
	.uleb128 0x5
	.long	.LASF73
	.byte	0xb4
	.byte	0x1
	.long	0xb0
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe9
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.string	"val"
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0x9ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	.LASF74
	.byte	0xb2
	.byte	0x1
	.long	0xd4
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xc56
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	0x160
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	0x2f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	.LASF75
	.byte	0xb1
	.byte	0x1
	.long	0xc8
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xcc3
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.long	0x160
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.long	0xb05
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.long	0xc8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.long	.LASF76
	.byte	0xb0
	.byte	0x1
	.long	0xbc
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xd30
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	0x160
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	0xb77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x5
	.long	.LASF77
	.byte	0xaf
	.byte	0x1
	.long	0xb0
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xd9d
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.long	0x160
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.long	.LASF70
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.long	0x9ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.long	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x5
	.long	.LASF78
	.byte	0x88
	.byte	0x8
	.long	0x2e
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xe4d
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x88
	.byte	0x2a
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0x88
	.byte	0x3e
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF45
	.byte	0x1
	.byte	0x88
	.byte	0x53
	.long	0x2cd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0x89
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.long	.LASF79
	.byte	0x1
	.byte	0x89
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x28
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0xe2d
	.uleb128 0x3
	.string	"d"
	.byte	0x1
	.byte	0x8c
	.byte	0x11
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xe
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x3
	.string	"d"
	.byte	0x1
	.byte	0x8f
	.byte	0x11
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	.LASF80
	.byte	0x7f
	.byte	0x8
	.long	0x2e
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xeca
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x7f
	.byte	0x23
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF60
	.byte	0x1
	.byte	0x7f
	.byte	0x37
	.long	0x2cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0x80
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.string	"dim"
	.byte	0x1
	.byte	0x80
	.byte	0x1a
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x3
	.string	"d"
	.byte	0x1
	.byte	0x82
	.byte	0xf
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	.LASF81
	.byte	0x74
	.byte	0x8
	.long	0x2e
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xf3d
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x74
	.byte	0x23
	.long	0x2c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x15
	.uleb128 0x2
	.long	.LASF82
	.byte	0x1
	.byte	0x75
	.byte	0xb
	.long	0x13f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x3
	.string	"bit"
	.byte	0x1
	.byte	0x77
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0xe
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x3
	.string	"d"
	.byte	0x1
	.byte	0x78
	.byte	0xc
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	.LASF83
	.byte	0x70
	.byte	0x8
	.long	0x2e
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xf6e
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x70
	.byte	0x23
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	.LASF84
	.byte	0x6c
	.byte	0x8
	.long	0x2e
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0xfae
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x6c
	.byte	0x22
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"dim"
	.byte	0x1
	.byte	0x6c
	.byte	0x2f
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.long	.LASF85
	.byte	0x68
	.byte	0x8
	.long	0x2e
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0xfdf
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x68
	.byte	0x22
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF86
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.long	0x2e
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x101e
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x5a
	.byte	0x24
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"b"
	.byte	0x1
	.byte	0x5b
	.byte	0xa
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.string	"lcm"
	.byte	0x56
	.long	0x2e
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x1059
	.uleb128 0x4
	.string	"a"
	.byte	0x1
	.byte	0x56
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.string	"b"
	.byte	0x1
	.byte	0x56
	.byte	0x1d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1a
	.string	"gcd"
	.byte	0x52
	.long	0x2e
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x1094
	.uleb128 0x4
	.string	"a"
	.byte	0x1
	.byte	0x52
	.byte	0x13
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"b"
	.byte	0x1
	.byte	0x52
	.byte	0x1d
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.long	.LASF87
	.byte	0x4e
	.byte	0x8
	.long	0x2e
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x10c5
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x4e
	.byte	0x23
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	.LASF88
	.byte	0x4a
	.byte	0x8
	.long	0x2e
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x10f6
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x4a
	.byte	0x23
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.long	.LASF89
	.byte	0x46
	.byte	0xa
	.long	0xd4
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x1127
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x46
	.byte	0x25
	.long	0x2c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF90
	.byte	0x1
	.byte	0x42
	.byte	0x7
	.long	0xae
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x1159
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x42
	.byte	0x1e
	.long	0x1159
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.long	0x166
	.uleb128 0x10
	.long	.LASF91
	.byte	0x1
	.byte	0x26
	.byte	0xc
	.long	0x1159
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1202
	.uleb128 0x1
	.long	.LASF29
	.byte	0x1
	.byte	0x26
	.byte	0x1f
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x4
	.string	"dim"
	.byte	0x1
	.byte	0x26
	.byte	0x30
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x15
	.uleb128 0x2
	.long	.LASF30
	.byte	0x1
	.byte	0x27
	.byte	0xb
	.long	0x1ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x2
	.long	.LASF31
	.byte	0x1
	.byte	0x27
	.byte	0x31
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x2
	.long	.LASF82
	.byte	0x1
	.byte	0x29
	.byte	0xb
	.long	0x13f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x3
	.string	"out"
	.byte	0x1
	.byte	0x2f
	.byte	0xe
	.long	0x1159
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0xe
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x3
	.string	"d"
	.byte	0x1
	.byte	0x2b
	.byte	0xc
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF92
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
	.byte	0x1
	.byte	0x1a
	.byte	0x1b
	.long	0xb0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x4
	.string	"dim"
	.byte	0x1
	.byte	0x1a
	.byte	0x2c
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x15
	.uleb128 0x2
	.long	.LASF31
	.byte	0x1
	.byte	0x1b
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x2
	.long	.LASF82
	.byte	0x1
	.byte	0x1d
	.byte	0xb
	.long	0x13f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0xe
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x3
	.string	"d"
	.byte	0x1
	.byte	0x1f
	.byte	0xc
	.long	0x4d
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
	.uleb128 0x2
	.uleb128 0x34
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
	.uleb128 0x3
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
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
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
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 11
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
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x34
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
	.uleb128 0x27
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
.LASF38:
	.string	"count"
.LASF37:
	.string	"malloc"
.LASF75:
	.string	"array_get32"
.LASF8:
	.string	"size_t"
.LASF18:
	.string	"uint64_t"
.LASF73:
	.string	"array_set8"
.LASF48:
	.string	"data_x"
.LASF49:
	.string	"data_y"
.LASF50:
	.string	"data_z"
.LASF24:
	.string	"va_list"
.LASF63:
	.string	"row_data"
.LASF13:
	.string	"long int"
.LASF47:
	.string	"val_offset"
.LASF27:
	.string	"long long unsigned int"
.LASF64:
	.string	"get_values"
.LASF67:
	.string	"next_mask"
.LASF33:
	.string	"bulk_op_offset"
.LASF25:
	.string	"long long int"
.LASF7:
	.string	"signed char"
.LASF96:
	.string	"ARRAY_DESC"
.LASF20:
	.string	"gp_offset"
.LASF46:
	.string	"cur_dim"
.LASF84:
	.string	"dim_size"
.LASF42:
	.string	"bits"
.LASF40:
	.string	"bulk_unary_op"
.LASF90:
	.string	"alloc_array"
.LASF94:
	.string	"__builtin_va_list"
.LASF16:
	.string	"uint16_t"
.LASF93:
	.string	"GNU C17 11.2.1 20211203 (Red Hat 11.2.1-7) -mtune=generic -march=x86-64 -g"
.LASF52:
	.string	"imask"
.LASF41:
	.string	"bulk_op"
.LASF91:
	.string	"alloc_desc"
.LASF12:
	.string	"__uint32_t"
.LASF32:
	.string	"mask"
.LASF79:
	.string	"max_d"
.LASF66:
	.string	"bulk_fill"
.LASF72:
	.string	"array_set16"
.LASF6:
	.string	"unsigned int"
.LASF22:
	.string	"overflow_arg_area"
.LASF2:
	.string	"long unsigned int"
.LASF77:
	.string	"array_get8"
.LASF55:
	.string	"data"
.LASF31:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF53:
	.string	"nmask"
.LASF87:
	.string	"dim_count"
.LASF74:
	.string	"array_get64"
.LASF10:
	.string	"short int"
.LASF36:
	.string	"bit_mask"
.LASF81:
	.string	"get_index"
.LASF89:
	.string	"desc_mask"
.LASF59:
	.string	"bits_per_val"
.LASF80:
	.string	"bit_index"
.LASF78:
	.string	"bit_index_offset"
.LASF56:
	.string	"data64"
.LASF39:
	.string	"action"
.LASF19:
	.string	"__gnuc_va_list"
.LASF54:
	.string	"desc"
.LASF86:
	.string	"get_spread"
.LASF61:
	.string	"highest_bit"
.LASF68:
	.string	"bulk_find"
.LASF71:
	.string	"array_set32"
.LASF83:
	.string	"byte_size"
.LASF14:
	.string	"__uint64_t"
.LASF70:
	.string	"data_"
.LASF44:
	.string	"rem_bits"
.LASF65:
	.string	"gen_values"
.LASF51:
	.string	"carry"
.LASF58:
	.string	"_Bool"
.LASF5:
	.string	"unsigned char"
.LASF92:
	.string	"byte_count"
.LASF85:
	.string	"get_size"
.LASF29:
	.string	"num_bits"
.LASF23:
	.string	"reg_save_area"
.LASF88:
	.string	"bit_count"
.LASF97:
	.string	"gen_mask"
.LASF17:
	.string	"uint32_t"
.LASF9:
	.string	"__uint8_t"
.LASF26:
	.string	"long double"
.LASF4:
	.string	"char"
.LASF76:
	.string	"array_get16"
.LASF11:
	.string	"__uint16_t"
.LASF60:
	.string	"index"
.LASF45:
	.string	"offset"
.LASF82:
	.string	"argp"
.LASF62:
	.string	"bulk_set"
.LASF34:
	.string	"memset"
.LASF43:
	.string	"row_bits"
.LASF35:
	.string	"calloc"
.LASF15:
	.string	"uint8_t"
.LASF21:
	.string	"fp_offset"
.LASF30:
	.string	"sizes"
.LASF57:
	.string	"rel_offset"
.LASF69:
	.string	"array_set64"
.LASF28:
	.string	"ArrayDesc"
.LASF95:
	.string	"__va_list_tag"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/michiel/Documents/RU/Thesis/Parser/src"
.LASF0:
	.string	"ops_bulk.c"
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
