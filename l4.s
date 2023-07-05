/* Output string*/
.data # beginning of the data section
msg:
.ascii "Hello, world!\n"
len = . -msg # length of the message

.text	# start of the code section
.globl _start
_start:
# output the string to the stdout
mov $1,   %rdi	# stdout, the first parameter
mov $msg, %rsi	# address of the message, 2nd param
mov $len, %rdx	# the length of the message, 3d param
mov $1,	  %rax	# syscall number (1)
syscall

#finish the programm
mov $60, %rax	# syscall number(60)
xor %rdi, %rdi	# return code 0 - without errors
syscall 
