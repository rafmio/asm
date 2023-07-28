.globl _start
.section .text
_start:
	movq $10, %rax
	movq $10, %rbx
	movq $10, %rcx
	addq %rax, %rbx
	addq %rcx, %rbx
	addq %rbx, %rax

	mulq %rax
	mulq %rbx
	mulq %rcx

	divq %rcx
	divq %rbx
	divq %rax

	movq $60, %rax
	syscall	

