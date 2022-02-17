#
# While Loop in ARMv8 Assembly Language
#

# DEFINES
    .equ STDOUT, 1
    .equ NUL, 0

# READ-ONLY DATA
    .section .rodata
    .align 2
hello_str:
    .asciz "Hello, World!\n"

# PROGRAM INSTRUCTIONS
    .section .text
    .global main
    .type main, %function
main:
    sub sp, sp, 16      // space for saving registers
                        // keep 8-byte sp alignment
    str x4, [sp, #4]    // save x4
    str fp, [sp, #8]    // save fp
    str lr, [sp, #12]   // save lr
    add fp, sp, #12     // set fp

    ldr x4, hello_str   // x4 -> hello_str (pointer variable)
while:
    ldrb w3, [x4]       // load a char from string
    cmp w3, NUL         // reached end of string \0
    beq done            // if yes, while loop done

    mov x0, STDOUT      // write to screen via OS
    mov x1, x4          // address of current char
    mov x2, #1          // write 1 byte
    bl write            // write() system call label; library linked in exe
    
    add x4, x4, #1      // increment pointer to next char in string
    b while             // continue while loop
done:
    mov x0, #0          // return 0
    ldr x4, [sp, #4]    // restore x4
    ldr fp, [sp, #8]    // restore fp
    ldr lr, [sp, #12]   // restore lr
    add sp, sp, #16     // restore sp
    br lr               // return

stringAddr:
    .word hello_str
