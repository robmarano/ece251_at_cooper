#
# ARMv8 Assembly Language - factorial(n)
#
# START PROGRAM
    .arch armv8-a
    .file "factorial.s"

# PROGRAM DEFINES
    .equ STDOUT, 1
    .equ NUL, 0
    .equ ENN, 20

# PROGRAM READ-ONLY DATA
    .section .rodata            // read-only section
    .align 4
printf_str:
    .asciz "fact(%lld) = %lld\n"    // NULL-terminated character string
    len = . - printf_str         // length of the printf_str

# PROGRAM INSTRUCTIONS
    .section .text              // program instructions go in section .text
    .align 2
    .global _start
    .type _start, %function    
_start:
    // preserve registers
    sub sp, sp, #24 // adjust stack for 3 items
    stur lr, [sp,#16] // save the return address
    stur x1, [sp,#8] // x1
    stur x0, [sp,#0] // x0
    // Note that the stack pointer must always be a multiple of 16
    // so if you only need an odd number of 8-byte slots you should round it up and reserve a multiple of 16 bytes.

    mov x0, #ENN         // n for fact(n)
    bl fact             // result in x1
    ldr x0, stringAddr  // x0 -> printf_str (pointer variable); printf(x0=string;x1=n,x2=fact(n))
    add x2, x1, xzr     // need to copy x1 -> x2 because fact(n)->x1
    mov x1, #ENN         // n for fact(n)
    bl printf

    // Now the old return address and old argument are restored, along with the stack pointer:
    ldur x0, [sp,#0] // return from BL: restore argument n
    ldur x1, [sp,#8] // return from BL: restore argument n
    ldur lr, [sp,#16] // restore the return address
    add sp, sp, #24 // adjust stack pointer to pop 2 items
    // free the stack space that we reserved
    // note: this should exactly match the subtraction at the top


done:
/* syscall exit(int status) */
    mov w0, #0                  // status = 0
    mov w8, #93                 // setup OS syscall 93 for exit(), which looks in x0 for status
    svc #0                      // calling OS syscall
    ret

/* factorial */
    .global fact
    .type fact, %function    
fact:
    // The first time fact is called, STUR saves an address in the program that called fact.
    // The next two instructions test whether n is less than 1, going to L1 if n ≥ 1.

    sub sp, sp, #16 // adjust stack for 2 items
    stur lr, [sp,#8] // save the return address
    stur x0, [sp,#0] // save the argument n

    subs xzr, x0, #1 // test for n < 1
    b.ge L1 // if n >= 1, go to L1

    // If n is less than 1, fact returns 1 by putting 1 into a value register:
    // it adds 1 to 0 and places that sum in X1. It then pops the two saved values off
    // the stack and branches to the return address:
 
    mov x1, #1 // return 1
    add sp, sp, #16 // pop 2 items off stack
    br lr // return to caller

    // Before popping two items off the stack, we could have loaded X0 and LR.
    // Since X0 and LR don’t change when n is less than 1, we skip those instructions.
    // If n is not less than 1, the argument n is decremented and then fact is
    // called again with the decremented value:

L1: sub x0,x0,#1 // n >= 1: argument gets (n −1)
    bl fact // call fact with (n −1)

    // The next instruction is where fact returns. Now the old return address and
    // old argument are restored, along with the stack pointer:
    ldur x0, [sp,#0] // return from BL: restore argument n
    ldur lr, [sp,#8] // restore the return address
    add sp, sp, #16 // adjust stack pointer to pop 2 items

    // Next, the value register X1 gets the product of old argument X0 and the current value of the value register.
    mul x1,x0,x1 // return n * fact (n −1)

    // Finally, fact branches again to the return address:
    br lr // return to the caller


stringAddr:
    .xword printf_str

# END PROGRAM
