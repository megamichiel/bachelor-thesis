	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Values are %i, %i, %i\n"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movw	$1284, -3(%rbp)
	movb	$6, -1(%rbp)
	movb	$7, -1(%rbp)
	leaq	-3(%rbp), %rax
	movw	$-21555, (%rax)
	leaq	-3(%rbp), %rax
	addq	$1, %rax
	movw	$-21521, (%rax)
	movzbl	-1(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-2(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-3(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.globl	main
	.type	main, @function
main:
.LFB1:
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
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.1 20210728 (Red Hat 11.2.1-1)"
	.section	.note.GNU-stack,"",@progbits
