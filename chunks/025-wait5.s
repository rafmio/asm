.globl _start

.section .data

curtime:
	.quad 0						# The time will stored here
#--------------------------------------------------------------------------------------------

.section .text
_start:
	### Initialize
	movq $0xc9,    %rax			# 0xc9 (decimal 201) is the time()  syscall number 
	movq $curtime, %rdi
	syscall

	movq curtime,  %rdx			# store it in %rdx

	addq $5,       %rdx			# add 5 seconds

timeloop:
	# Check the time
	movq $0xc9,    %rax
	movq $curtime, %rdi
	syscall

	# If I haven't reached the time specified in %rdx, do it again
	cmpq %rdx,      curtime
	jb timeloop

timefinish:
	# Exit:
	movq $0x3c,    %rax
	movq $0,       %rdi
	syscall


