.globl _start
.section .data 

a: 
	.space 10

.section .text
_start:
	movq $0, %rax
	movq $0, %rdi
	movq $a, %rsi
	movq $10, %rdx
	syscall

	movq $1, %rax
	movq $1, %rdi
	movq $a, %rsi
	movq $10, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall



