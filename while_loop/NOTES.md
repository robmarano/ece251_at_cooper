# Notes

While Loop
```asm
#
# While Loop in ARMv8 Assembly Language
#
# START PROGRAM
    .arch armv8-a
    .file "while.s"

# PROGRAM DEFINES
    .equ STDOUT, 1
    .equ NUL, 0

# PROGRAM READ-ONLY DATA
    .section .rodata            // read-only section
    .align 3
hello_str:
    .asciz "Hello, World!\n"    // NULL-terminated character string
    len = . - hello_str         // length of the hello_str

# PROGRAM INSTRUCTIONS
    .section .text              // program instructions go in section .text
    .global _start
    .type _start, %function    
_start:
/* Load the character string */
    ldr x4, stringAddr   // x4 -> hello_str (pointer variable)
/* while loop */
while:
    ldrb w3, [x4]       // load a char from string
    cmp w3, NUL         // reached end of string \0
    beq done            // if yes, while loop done

    mov w0, STDOUT      // write to screen via OS
    mov w1, w4          // address of current char
    mov w2, #1          // write 1 byte
    mov w8, #64         // setup OS syscall 64 for write()
    svc #0              // write() system call label; library linked in exe
    
    add x4, x4, #1      // increment pointer to next char in string
    b while             // continue while loop

done:
/* syscall exit(int status) */
    mov w0, #0                  // status = 0
    mov w8, #93                 // setup OS syscall 93 for exit(), which looks in x0 for status
    svc #0                      // calling OS syscall
    ret

stringAddr:
    .xword hello_str

# END PROGRAM
```

Example Assembly Code
```asm
#
# While Loop in ARMv8 Assembly Language
#

    .arch armv8-a
    .file "while.s"

# DEFINES
    .equ STDOUT, 1
    .equ NUL, 0

# READ-ONLY DATA
    .section .rodata
    .align 2
hello_str:
    .asciz "Hello, World!\n"
    len = . - hello_str

# PROGRAM INSTRUCTIONS
    .section .text
    .global _start
    .type main, %function
_start:
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

```