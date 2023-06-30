/*Listing 3 - first program*/
.text 
.globl _start
_start:
# some actions here

# finish

mov $60, %rax # syscall number of 'exit'
xor %rdi, %rdi # return code (0 - without errors)
syscall # syscall
