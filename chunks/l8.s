/* listing 8: stdin, посимвольный вывод */
.data
buf:
.space 200, 0

.text
.globl _start
_start:

mov $buf, %rsi
mov $0, %rdi
mov $200, %rdx
mov $0, %rax
syscall

mov $200, %r8
mov $buf, %rsi

loo:
mov (%rsi), %al
cmp $10, %al
jz ex

mov $1, %rdi
mov $1, %rdx
mov $1, %rax
syscall

inc %rsi
dec %r8
jnz loo

ex:
mov $60, %rax
xor %rdi, %rdi
syscall
