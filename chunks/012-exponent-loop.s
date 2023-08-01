.globl _start

# This will calculate 2 ^ 3

.section .text
_start:
    movq $2, %rbx       # %rbx will hold base
    movq $3, %rcx       # %rcx will hold the current exponent count
    movq $1, %rax       # store the accumulated value int %rax
    cmpq $0, %rcx       # If the exponent is equal to zero, wa are done
    je complete

mainloop:
    mulq %rbx           # Multiply the accumulated value by our base
    loopq mainloop      # Decrement %rcx, go back to loop label if 
                        # %rcx is not yet zero 
    
complete:
    movq %rax, %rdi     # Move the accumulated value to %rdi so we can return it
    movq $60,  %rax     # Call _exit()
    syscall

