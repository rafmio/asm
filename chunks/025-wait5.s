.globl _start

.section .data
curtime:
	.quad 0			# the time will be stored here

.section .text
_start:
	movq $0xC9,    %rax	# get initialized time (0xC9 - 201 time() syscall number)
	movq $curtime, %rdi
	syscall

	movq curtime,  %rdx	# store it in %rdx

	addq $5,       %rdx	# add 5 seconds

timeloop:
	# check the time
	movq $0xC9,    %rax		
	movq $curtime, %rdi
	syscall

	# if i haven't reached the time specified in %rax, do it again
	cmpq %rdx,      curtime
	jb timeloop

timefinish:
	movq $0x3C,    %rax
	movq $0,       %rdi
	syscall
