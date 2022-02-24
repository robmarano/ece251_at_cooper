#
# While Loop in ARMv8 Assembly Language
#
# START PROGRAM
    .arch armv8-a
    .file "mem_instructions.s"

# PROGRAM DEFINES
    .equ STDOUT, 1
    .equ NUL, 0

# PROGRAM READ-ONLY DATA
    .section .data            // data section
var1: .word 3  /* variable 1 in memory */
var2: .word 4  /* variable 2 in memory */

# PROGRAM INSTRUCTIONS
    .section .text              // program instructions go in section .text
    .global _start
    .type _start, %function    
_start:
    ldr w0, adr_var1  // load the memory address of var1 via label adr_var1 into R0 
    ldr w1, adr_var2  // load the memory address of var2 via label adr_var2 into R1 
    ldr x2, [x0]      // load the value (0x03) at memory address found in R0 to register R2  
    str x2, [x1]      // store the value found in R2 (0x03) to the memory address found in R1 
done:
/* syscall exit(int status) */
    mov w0, #0                  // status = 0
    mov w8, #93                 // setup OS syscall 93 for exit(), which looks in x0 for status
    svc #0                      // calling OS syscall
    ret
             

adr_var1: .xword var1  /* address to var1 stored here */
adr_var2: .xword var2  /* address to var2 stored here */

# END PROGRAM
