# https://dzen.ru/media/id/5f04c4d28b9cee73d889add0/assembler-dlia-linux-dlia-nachala-hello-world-kniga-60baf0e6b680955261873207
.data
msg:
.ascii "Hello-mello Huggy-Wuggy\n"
len = . -msg
.text

.globl _start
_start:
    mov $1, %rdi    # stdout, 1st param
    mov $msg, %rsi  # addr of msg, 2nd param
    mov $len, %rdx  # len of msg, 3d param
    mov $1, %rax    # syscall number
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall

