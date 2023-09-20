.globl _start

.section .data

mytext:
	.ascii "This is a string of characters.\0"

.section .text

_start:
	### Initialization
	movq $mytext, %rbx # Move a pointer to the string into %rbx
	
	movq $0, %rdi      # Count starts at zero

mainloop:
	movb (%rbx), %al   # Get the next byte
	cmpb $0, %al	   # Quit if we hit the null terminator
	je finish

	cmpb $'a', %al	   # Go to the next byte if the value isn't between a and z
	jb loopcontrol

	cmpb $'z', %al
	ja loopcontrol

	incq %rdi	   # It's lower-case! Add to %rdi

loopcontrol:
	incq %rbx	   # Next byte
	
	jmp mainloop	   # Repeat

finish:
	movq $60, %rax
	syscall


