.globl _start
.section .text
_start:
    movq $50,  %rbx     # Делитель
    movq $100, %rax     # Делимое
    divq %rbx           # %rax / %rbx  - результат сохраняется в %rax
    jmp adding

adding:
    movq $150, %r8      # Слогаемое
    movq $150, %r9      # Слогаемое
    addq %r8,  %r9      # К регистру %r9 прибавляем содержимое %r8
                        # Результат сохраняется в %r9
    jmp subtraction

subtraction:
    movq $555,  %r10    
    movq $333,  %r11
    subq %r11,  %r10    # Из %r10 вычитаем %r11
                        # Результат сохранится в %r10
    jmp complete

    # Результат вычитания - больше нуля
    # Поялвяются флаги (был только IF) AF и PF

complete:
    movq $60, %rax
    movq %r10, %rdi     # Программа вернет то, что лежит в %rdi
    syscall
