.globl _start
.section .text
_start:
	# Perform various arithmetic functions
	movq $3,   %rdi
	movq %rdi, %rax	
	addq %rdi, %rax
	mulq %rdi
	movq $2,   %rdi
	addq %rdi, %rax
	movq $4,   %rdi
	mulq %rdi
	movq %rax, %rdi

	movq $60, %rax		# set the exit system call number
	syscall			# perform the syscall
