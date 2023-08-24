### Find the largest value in the array

.globl _start

.section .data

numberofnumbers:			# how many elements we have
	.quad 7

mynumbers:					# the data elements themselves
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	movq numberofnumbers, %rcx
	movq $0, %rbx					# put the index of the first element in %rbx	
	movq $0, %rdi					# use %rdi to hold the current-hight value
	
	### Check Preconditions ###
	cmp $0, %rcx
	je endloop


	### MAIL LOOP ###
	
myloop:
	movq mynumbers(,%rbx,8), %rax	# get the next value of mynumbers indexted by %rbx
	cmp %rdi, %rax					# 
	jbe loopcontrol
	movq %rax, %rdi

loopcontrol:
	incq %rbx
	loopq myloop

endloop:
	movq $60, %rax
	syscall


