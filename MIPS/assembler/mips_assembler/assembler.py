#############################
#    SZ, TZ, ZM             #
#    10/3/2013              #
#    assembler.py           #
#############################

from assembly_parser import assembly_parser
from instruction_table import instruction_table
from register_table import register_table
from pseudoinstruction_table import pseudoinstruction_table

import sys
import getopt

def usage():
    print 'Usage: '+sys.argv[0]+' -i <file1>'
    sys.exit(1)

def n_split(iterable, n, fillvalue=None):
    num_extra = len(iterable) % n
    zipped = zip(*[iter(iterable)] * n)
    return zipped if not num_extra else zipped + [iterable[-num_extra:], ]

def main(argv):
    program_code = []
    files = argv
    if len(files) is not 1:
        usage()
    for filename in files:
        asm           = open(filename)
        lines         = asm.readlines()
        parser        = assembly_parser(64, instruction_table, register_table, pseudoinstruction_table,4)
        parser.first_pass(lines)
        parser.second_pass(lines)
        program_code = parser.get_program_code()

    print('')
    print(len(program_code))
    print('MIPS Machine Code for this program:')
    # for instr_line in n_split(program_code,9):
    #     print(''.join(instr_line))
    for instr_line in program_code:
        print(instr_line)


if __name__ == '__main__':
    main(sys.argv[1:])

