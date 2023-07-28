.globl _start
.section .text
_start:
	movq $300, %rax
	movq $300, %rbx
	movq $300, %rcx
	movq $300, %rdx
	movq $300, %rsi
	movq $300, %rdi
	movq $300, %r8
	movq $300, %r9
	movq $300, %r10
	movq $300, %r11
	movq $300, %r12
	movq $300, %r13
	movq $300, %r14
	movq $300, %r15 
	movq $8,   %r8
	divq %r8
	syscall
