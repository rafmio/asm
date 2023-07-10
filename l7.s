/* listing 7: standard i/o */
.data # data segment
buf:
.space 200, 0

.text   #text segment
.globl _start
_start:

# read the line
mov $0,   %rdi    # stdin
mov $buf, %rsi    # buffer's address 
mov $200, %rdx    # buffer's length
mov $0,   %rax    # num of syscall
syscall

# number of output characters in rax
# print line
mov $1,   %rdi    # stdout
mov $buf, %rsi    # buffer's address
mov %rax, %rdx    # number of output characters 
mov $1,   %rax    # syscall number
syscall

ex:
# finish the program
mov $60, %rax # syscall number
xor %rdi, %rdi # return code (0 - without errors)
syscall

