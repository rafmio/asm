/* listing 8. Stdin, посимвольный вывод */
.data
buf:
.space 200, 0

.text
.globl _start
_start:

# read the line
mov $buf, %rsi      # buffer's address
mov $0,   %rdi      # stdin
mov $200, %rdx      # buffer's length
mov $0,   %rax      # syscall number
syscall

# print the line
mov $200, %r8       # в регистре будет длина буфера
mov $buf, %rsi      # начало буфера в регистр rsi

loo:
mov (%rsi), %al     # символ по адресу в rsi в регистр al
cmp $10, %al        # не конец ли строки (код перевода строки)
jz ex               # если что - заканчиваем

mov $1, %rdi        # stdout
mov $1, %rdx        # выводим один символ
mov $1, %rax        # номер системной функции вывода
syscall

inc %rsi            # переходим к следующему символу
dec %r8             # получить длину оставшейся части буфера
jnz loo             # можно продолжать

ex:
mov $60, %rax       # номер системного вызова exit
xor %rdi, %rdi      # код возврата (0 - без ошибок)
syscall