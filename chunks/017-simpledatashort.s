.globl _start

.section .data

first_val:
    .quad 4
second_val:
    .quad 6

.section .text
_start:
    movq first_val, %rdi
    addq second_val, %rdi

    movq $60, %rax
    syscall
