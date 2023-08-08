### This program will find the largest value in the array

.globl _start

.section .data

numberofnumbers:        #how many elements we have
    .quad 7

mynumbers:              # the data elements themselves
    .quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
    # Initialize Registers #
    movq numberofnumbers, %rcx # put the number of elements of the array in %rcx
    movq $mynumbers,      %rbx # put the *address* of the first element in %rbx
    movq $0,              %rdi # use %rdi to hold the current-high value

    # Check Preconditions #
    cmp  $0,              %rcx # if there are no numbers, stop
    je endloop

    # Main Loop #

myloop:
    movq (%rbx),          %rax # get the next value (currently pointed to by %rbx)
    cmp   %rdi,           %rax # if it is not bigger, go to the end of the loop
    jbe loopcontrol
    
    movq %rax,            %rdi # otherwise, store this as the biggest element so far

loopcontrol:
    addq $8,              %rbx # change the address in %rbx to point to the next value
    loopq myloop               # decrement %rcx and keep going until %rcx is zero

    # Cleanup and Exit #

endloop:
    movq $60,             %rax
    syscall
