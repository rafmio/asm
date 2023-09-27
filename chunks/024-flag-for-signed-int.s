.globl _start
.section .text

_start:
	movb $0b01111111, %al
	addb $0b01111111, %al

	movq %rax, %rdi

	movq $60, %rax
	syscall
