/* listing 7: standard i/o */
.data # data segment
buf:
.space 200, 0 # 200 - размер, 0 - байт для заполнения резервируемой области

.text   #text segment
.globl _start
_start:

# read the line
# read() syscall:
# ssize_t read(int fd, void *buf, size_t count);
mov $0,   %rdi    #  fd    - stdin
mov $buf, %rsi    # *buf   - buffer's address 
mov $200, %rdx    #  count - buffer's length
mov $0,   %rax    #  read  - num of syscall
syscall           #  interrupt 0x80

# number of output characters in rax
# print line
# write() syscall:
# ssize_t write(int fd, const void *buf, size_t count);
mov $1,   %rdi    # fd - stdout
mov $buf, %rsi    # *buf - buffer's address
mov %rax, %rdx    # number of output characters 
mov $1,   %rax    # syscall number
syscall

ex:
# finish the program
mov $60, %rax # syscall number
xor %rdi, %rdi # return code (0 - without errors)
syscall

