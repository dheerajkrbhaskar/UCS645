	.file	"ex1.c"
	.text
	.section	.rodata
.LC8:
	.string	"Total Energy = %f\n"
.LC9:
	.string	"Execution Time = %f seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	$48000, %edi
	call	malloc@PLT
	movq	%rax, -112(%rbp)
	movl	$8, %esi
	movl	$2000, %edi
	call	calloc@PLT
	movq	%rax, -104(%rbp)
	movl	$8, %esi
	movl	$2000, %edi
	call	calloc@PLT
	movq	%rax, -96(%rbp)
	movl	$8, %esi
	movl	$2000, %edi
	call	calloc@PLT
	movq	%rax, -88(%rbp)
	movl	$0, -156(%rbp)
	jmp	.L2
.L3:
	call	drand48@PLT
	movl	-156(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	call	drand48@PLT
	movl	-156(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rax)
	call	drand48@PLT
	movl	-156(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rax)
	addl	$1, -156(%rbp)
.L2:
	cmpl	$1999, -156(%rbp)
	jle	.L3
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -144(%rbp)
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -80(%rbp)
	movl	$0, -152(%rbp)
	jmp	.L4
.L10:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -136(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -128(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -120(%rbp)
	movl	-152(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
	jmp	.L5
.L9:
	movl	-152(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-148(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movl	-152(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	8(%rax), %xmm0
	movl	-148(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	8(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-152(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	16(%rax), %xmm0
	movl	-148(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movsd	16(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-64(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	-56(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	movsd	-48(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	.LC2(%rip), %xmm0
	comisd	-32(%rbp), %xmm0
	jbe	.L6
	movsd	-32(%rbp), %xmm0
	comisd	.LC3(%rip), %xmm0
	jbe	.L6
	movsd	.LC4(%rip), %xmm0
	divsd	-32(%rbp), %xmm0
	movq	%xmm0, %rax
	movsd	.LC5(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	subsd	-24(%rbp), %xmm1
	movsd	.LC6(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	divsd	-40(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	mulsd	-64(%rbp), %xmm0
	movsd	-136(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -136(%rbp)
	movsd	-8(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	-128(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
	movsd	-8(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	movsd	-120(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)
	movl	-148(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	mulsd	-64(%rbp), %xmm1
	movl	-148(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-148(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	mulsd	-56(%rbp), %xmm1
	movl	-148(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-148(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	mulsd	-48(%rbp), %xmm1
	movl	-148(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movsd	-16(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-24(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-144(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
.L6:
	addl	$1, -148(%rbp)
.L5:
	cmpl	$1999, -148(%rbp)
	jle	.L9
	movl	-152(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-152(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	addsd	-136(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	movl	-152(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-152(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	movl	-152(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-152(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	addsd	-120(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -152(%rbp)
.L4:
	cmpl	$1999, -152(%rbp)
	jle	.L10
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -72(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	-72(%rbp), %xmm0
	subsd	-80(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1076101120
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	-2127697391
	.long	1030854553
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	0
	.long	1075314688
	.align 8
.LC6:
	.long	0
	.long	1077411840
	.align 8
.LC7:
	.long	0
	.long	1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
