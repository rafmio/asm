.globl _start
.section .data
hello:
	.string "hello-mello\n"
helloend:

.equ hellolength, helloend - hello

.section .text
_start:
	call output
	call exit
output:
	movq $1, %rax
	movq $1, %rdi
	movq $hello, %rsi
	movq $hellolength, %rdx
	syscall 
	ret

exit:
	movq $60, %rax
	movq $0,  %rdi
	syscall
	

