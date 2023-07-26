.globl _start

.section .text
_start:
    movq $25, %rax
    jmp anotherlabel

somewhere:
    movq %rax, %rdi
    jmp anotherlabel

label1:
    addq %rbx, %rax
    movq $5, %rbx
    jmp here

labellabel:
    syscall

anotherlabel:
    movq $60, %rax
    jmp labellabel

thelabel:
    movq %rax, %rbx
    jmp there

here:
    divq %rax
    jmp somewhere

there:
    addq $5, %rbx
    jmp label1

anywhere:
    jmp thelabel
