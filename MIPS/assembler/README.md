# MIPS 32-bit Assembler in Python
Based on Sam Zeckendorf's work at https://github.com/zeckendorf/Python-MIPS-Assembler
Updated by: Rob Marano <rob@cooper.edu>

## Prequisites
* Python 2.7

## Usage
```bash
python mips_assembler/assembler.py ./mips-simple.asm
```

or using the ```assemble.sh``` script:
```bash
./assemble.sh -f mips-simple.asm
```
# Example Output

```
user@assembler[mips_cpu-single_cycle]$ ./assemble.sh -f mips-simple.asm
MIPS Assembly Program File: mips-simple.asm
First Pass ...
.org 0
Main:
addi $v0, $zero, 10
addi $v1, $zero, 15
sub $v0, $v0, $v1
sw $v0, 84($zero)
End:  .end
DONE first pass.
Second Pass ...
<type 'str'>
addi	rs=0x0	rt=0x2	imm=not_valid
'00100000000000100000000000001010'
<type 'str'>
addi	rs=0x0	rt=0x3	imm=not_valid
'00100000000000110000000000001111'
<type 'str'>
sw	rs=0x0	rt=0x2	imm=0x54
'10101100000000100000000001010100'
The memory map is:

0: 00100000
1: 00000010
2: 00000000
3: 00001010
4: 00100000
5: 00000011
6: 00000000
7: 00001111
8: 00000000
9: 01000011
10: 00010000
11: 00100010
12: 10101100
13: 00000010
14: 00000000
15: 01010100

The label list is: {'Main': '0', 'End': '16'}



The memory map in HEX:

0x0 <Main>:
0x0:    0x2002000a    addi $v0, $zero, 10
0x4:    0x2003000f    addi $v1, $zero, 15
0x8:    0x00431022    sub  $v0, $v0, $v1
0xc:    0xac020054    sw   $v0, 84($zero)

0x10 <End>:
DONE - second pass

4
MIPS Machine Code for this program:
2002000a
2003000f
00431022
ac020054
```

Copy the lines below "MIPS Machine Code for this program:"
and store in the memfile.dat file in the MIPS verilog directory in this repo.

You can then run the Verilog emulator for the MIPS CPU on the code you just compiled
and stored in the memfile.dat file.

/rob