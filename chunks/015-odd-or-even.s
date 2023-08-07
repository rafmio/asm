.globl _start

.section .text
_start:
    movq $100, %rax
    movq $8,  %rbx
    divq %rbx 
    cmpq $0, %rdx
    jne odd
    je even

odd:
    movq $1, %rdi
    jmp complete

even:
    movq $0, %rdi
    jmp complete

complete:
    movq $60,  %rax
    syscall


/*
Write a program that starts with a value in a register and yields a
1 if that number is even and 0 if that number is odd (hint—think
about the divq instruction and remainders).
*/

# Я немного изменил себе задачу - вместо решения четное-нечетное
# реализовал определение делится ли с остатком или без