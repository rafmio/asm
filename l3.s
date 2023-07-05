/*Listing 3 - first program*/
.text 
.globl _start
_start: # _start - для компановщика означает, что с этого места начинает вып.прог-ма
# some actions here

# finish

mov $60, %rax # syscall number of 'exit'
xor %rdi, %rdi # return code (0 - without errors)
syscall # syscall
