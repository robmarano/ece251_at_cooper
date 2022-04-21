##############################
#    SZ, TZ, ZM              #
#    10/3/2013               #
# pseudoinstruction_table.py #
##############################

# Create the Pseudoinstruction Table as a dictionary. This table stores the format of each pseudoinstructiontable

# All values in HEX
pseudoinstruction_table = {
    'move'  : ['add'],                 # add other reg and zero, store in reg
    'clear' : ['add'],                 # addi zero and zero, store in reg
    'li'    : ['addi', 'addi'],        # load total immediate
    'beq'   : ['lui', 'addi', 'beq'],  # add immediate twice for big immediates
    'ble'   : ['slt','bne'],           # branch if equal
    'bgt'   : ['slt','bne'],           # skip past bne if equal
    'bge'   : ['slt','beq'],           # straightforward
    'addi'  : ['addi','addi'],         # add immediate twice for big immediates
    'lw'    : ['addi','addi','lw']     # add immediate to $ti
    }


