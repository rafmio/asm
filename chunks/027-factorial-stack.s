.globl _start
.section .data

value:
	.quad 5

.section .text
_start:
	pushq $0			# Push in the sentinel value
	movq value, %rax	# Grab the value

	# Push all the values from 1 to the current value to the stack

pushvalues:
	pushq %rax
	decq  %rax
	jnz pushvalues

	movq $1, %rax		# Prepare for multiplying

multiply:
	popq %rcx			# Get the next value from the stack
	cmpq $0, %rcx		# If it is the sentinel, we are done
	je complete

	mulq %rcx			# multiply by what we have accumulated so far

	jmp multiply		# Do it again


complete:
	movq %rax, %rdi
	movq $60,  %rax
	syscall	

	
