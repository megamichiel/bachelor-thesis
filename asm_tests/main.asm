	.file	"main.c"
	.text
	.globl	test
	.type	test, @function
test:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

	subq	$16, %rsp
	movl	$3, %edi
	call	malloc
	movq	%rax, -8(%rbp)

	movq	-8(%rbp), %rax
	movb	$4, (%rax)

	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$5, (%rax)
	
	movq	-8(%rbp), %rax
	addq	$2, %rax
	movb	$6, (%rax)

	movq	-8(%rbp), %rax
	movw	$-21555, (%rax)

	movq	-8(%rbp), %rax
	addq	$1, %rax
	movw	$-21521, (%rax)

	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movw	%dx, (%rax)

	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	test, .-test
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	test
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.1 20210728 (Red Hat 11.2.1-1)"
	.section	.note.GNU-stack,"",@progbits
