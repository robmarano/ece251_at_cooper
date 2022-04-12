///////////////////////////////////////////////////////////////////////////////
//
// ALU DECODER MIPS module
//
// ALU decoder for MIPS CPU
//
// module: aludec
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

module aludec(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [5:0] funct,
    input logic [1:0] aluop,
    output logic [2:0] alucontrol
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @*
    case(aluop)
        2'b00: alucontrol <= 3'b010; // add (for lw/sw/addi)
        2'b01: alucontrol <= 3'b110; // sub (for beq)
        default:
            case(funct) // R-type instructions
                6'b100000: alucontrol <= 3'b010; // add
                6'b100010: alucontrol <= 3'b110; // sub
                6'b100100: alucontrol <= 3'b000; // and
                6'b100101: alucontrol <= 3'b001; // or
                6'b101010: alucontrol <= 3'b111; // slt
                default: alucontrol <= 3'bxxx; // ???
            endcase
    endcase

endmodule

`endif // ALUDEC