.globl _start
.section .text
_start:
	### Initialize registers ###
	
	# Pointer to first record 
	leaq people, %rbx

	# Total record count
	movq numpeople, %rcx

	# Brown-hair count
	movq $0, %rdi

	### Check preconditions ###

	# if there are no record, finish
	cmpq $0, %rcx
	je finish


	### MAIN LOOP ###
mainloop:
	# is the hair color brown (2)?
	cmpq $2, HAIR_OFFSET(%rbx)

	# No? Go to the next record
	jne endloop

	# Yes? Increment the count
	incq %rdi

endloop:	
	addq $PERSON_RECORD_SIZE, %rbx
	loop mainloop

finish:
	movq $60, %rax
	syscall


# $ as brown-count.s -o brown-count.o
# $ ld person-data.o brown-count.o -o brown-cownt
