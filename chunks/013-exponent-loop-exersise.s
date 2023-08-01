.globl _start

.section .text
_start:
	movq $10, %rbx
	movq $5,  %rax
	movq $3,  %rcx

	cmpq $0,  %rcx
	je complete	

mainloop:
	addq %rbx, %rax
	loopq mainloop

complete:
	movq %rax, %rdi
	movq $60,  %rax
	syscall

