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
    .align 2
hello_str:
    .asciz "Hello, World!\n"    // NULL-terminated character string
    len = . - hello_str         // length of the hello_str

# PROGRAM INSTRUCTIONS
    .section .text              // program instructions go in section .text
    .global _start
    .type main, %function
_start:
/* syscall write(int fd, const void *buf, size_t count) */
    mov x0, STDOUT              // OS syscall to write to STDOUT
    ldr x1, stringAddr          // load addr of hello_str to x1 -- can also write =hello_str
    ldr x2, =len                // load string length to x2
    mov w8, #64                 // setup OS syscall 64 for write()
    svc #0                      // calling OS syscall

/* syscall exit(int status) */
    mov x0, #0                  // status = 0
    mov w8, #93                 // setup OS syscall 93 for exit(), which looks in x0 for status
    svc #0                      // calling OS syscall

stringAddr:
    .word hello_str
# END PROGRAM
