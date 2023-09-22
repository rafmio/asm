.globl _start
.section .text

_start:
	# Initialize registers
	leaq people,    %rbx
	movq numpeople, %rcx
	movq $0,        %rdi	

	cmpq $0, %rcx
	je finish

mainloop:
	movq AGE_OFFSET(%rbx), %rax
	cmpq %rdi, %rax
	jbe loopcontrol

	movq %rax, %rdi

loopcontrol:
	addq $PERSON_RECORD_SIZE, %rbx

#	movq $61680, %r8	# for fun
#	xchg 				# for fun	

	loop mainloop

finish:
	movq $60, %rax
	syscall
