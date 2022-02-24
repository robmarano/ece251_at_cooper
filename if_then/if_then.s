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
