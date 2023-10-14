.globl _start

.section .data

mystring:
	.ascii "Hello-mello there!\n"
mystring_end:

# calculate value of 'mystring_length' variable
.equ mystring_length, mystring_end - mystring

.section .text
_start:
	# Display the string
	movq $1, %rax				# system call number
	movq $1, %rdi				# file descripor 1 (output) 
	movq $mystring, 	   %rsi	# pointer to the data
	movq $mystring_length, %rdx	# length
	syscall	

	# Exit
	movq $0x3c, %rax
	movq $0, 	%rdi
	syscall

# Queque of parameters:
# %rdi
# %rsi
# %rdx
# %r10
# %r8
# %r9
