# Comment
.globl _start		
.section .text		

_start:			# label, it defines the value of the _start sybmol
	movq $60, %rax	# 
	movq $10, %rdi	# exit status (10? 3? etc)
			# можно поставить тот, какой мы захотим, от 0 до 255 (?) 
	syscall		# This intruction performs the syscall


# dot (.) is an instruction to the assembler (directive), doesn't unusally generate code on its own.
# .globl - tell the assembler that the symbol _start (and its corresponding value) should not be 
# discarded after the assembly process is over

# The dollar sing ($) means that we are treating 60 as a value, not an address, or anything else
# If we had left off the dollar sign, it would try to load a value from memory address 60
# 60 - syscall number of exit()

# In the exit() the %rdi holds the exit status of the program

