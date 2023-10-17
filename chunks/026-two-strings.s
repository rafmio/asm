.globl _start
#--------------------------------------------

.section .data
mystring:
	.ascii "Hello-mello, Tosy-Bosy!\n"
mystring_end:

second_string:
	.ascii "This is the second string\n"
end_second_string:

.equ mystring_length, mystring_end - mystring
.equ second_string_length, end_second_string - second_string
#--------------------------------------------

.section .text
_start:
	movq $1,	 	       %rax
	movq $1, 		       %rdi
	movq $mystring,        %rsi
	movq $mystring_length, %rdx
	syscall

	movq $mystring,        %r11
	movq  mystring,        %r12 

	movq $1, 			   %rax
	movq $1,			   %rdi
	movq $second_string,	   %rsi
	movq $second_string_length, %rdx
	syscall

	movq $0x3c, 	       %rax
	movq $0, 		       %rdi
	syscall




