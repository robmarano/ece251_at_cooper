.org 0                      # Memory begins at location 0x00000000
Main:                                                         # MIPS machine code
    addi $v0, $zero, 11     # $v0 = 11                        ; 2002000b
    addi $v1, $zero, 12     # $v1 = 12                        ; 2003000c
    add  $a0, $v0, $v1      # $a0 = $v0, $v1                  ; 00432020
    mult $v0, $v1           # {HI,LO} = $v0 * $v1             ; 00430018
    mflo $t0                # $t0 = {LO}                      ; 00004012
    mfhi $t1                # $t1 = {HI}                      ; 00004810
    sw $t0, 84($zero)       # store prod(LO)=132 in mem[84]   ; ac080054
    sw $t1, 88($zero)       # store prod(HI)=0 in mem[88]     ; ac090058
End:  .end                  # final sum in LSB of 4th word from top.