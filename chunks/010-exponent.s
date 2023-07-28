.globl _start

# This will calculate 2 ^ 3
# You can nodify %rbx and %rcx to calculate another exponentional

.section .text
_start:
    movq $2, %rbx       # %rbx will hold the base
    movq $3, %rcx       # %rcx will hold the current exponent count
    movq $1, %rax       # Store the accumulated value int %rax

mainloop:
    addq $0, %rcx       # Adding zero will allow us to use the flags to 
                        # determine is %rcx has zero to begin 
                        # with addq $o %rcx
    
    jz complete         # If the exponent is zero, we are done

    mulq %rbx           # Otherwise, multiply the accumulated value by our base
    decq %rcx           # Decrease the counter

    jmp mainloop        # Go back to the beginning of the loop and try again

complete:
    movq %rax, %rdi     # Move the accumulated value to %rdi so we can return int
    movq $60,  %rax     # Call the "exit" syscall
    syscall

