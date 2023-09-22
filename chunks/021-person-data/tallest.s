.globl _start
.section .text
_start:
	### Initialize Registers ###
	leaq people, %rbx			# pointer to first record. 'leak' - see below
	movq numpeople, %rcx			# record count
	movq $0, %rdi				# tallest value found
	
	### Check preconditions ###

	cmpq $0, %rcx
	je finish

mainloop:
	# %rbx is the pointer to the whole struct
	# this instruction grabs the height field
	# and stores it in %rax
	
	movq HEIGHT_OFFSET(%rbx), %rax	# if it is less than of equal to our current
	# tallest, go to the next one
	
	cmpq %rdi, %rax
	jbe endloop

	mov %rax, %rdi				# copy this value as the tallest value

endloop:
	# move %rbx to point to the next record	
	
	addq $PERSON_RECORD_SIZE, %rbx

	loopq mainloop				# decrement %rcx and do it again

finish:
	movq $60, %rax
	syscall


# LEAQ INSTRUCTION:
# leaq means 'load effective address' - rather than load the contents of the memory at this location, will
# calculate the final address and store the address itself into the distination register
