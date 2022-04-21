#
# int n = 8
# int sum = 0
# for (int i=0; i<n; i++) {
#   // do stuff here
#   sum =+ i;
# }
.org 0                      # Memory begins at location 0x00000000
Main:
    add $v0, $zero, $zero   # $v0 is sum
    add $t0, $zero, $zero   # $t0 = i, initialized to 0, $t0 = 0
    add $t8, $zero, $zero   # $t8 = 1 to use for beq below
Loop:
    # do stuff here
    add $v0, $v0, $t0       # sum = sum + $t0
    addi $t0, $t0, 1        # i=i+1, where 1 means one byte
    slt $t1, $t0, 8      # $t1 = 1 if i > 8
    beq $t1, $t8, Loop      # go to loop if i < 8
End:
    sw $v0, 84($zero)       # store sum in mem[16] = 28, for this array
    .end                    # final sum in LSB of 4th word from top.