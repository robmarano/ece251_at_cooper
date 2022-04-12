///////////////////////////////////////////////////////////////////////////////
//
// 32-BIT ALU MIPS module
//
//
// MIPS 32-bit ALU with 3 bit function code
//
// module: alu32
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef ALU32
`define ALU32

// asynchronously resettable flip flop

module alu32(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [31:0] A, B, 
    input logic [2:0] F, 
    output logic [31:0] Y
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    
    logic [31:0] S, Bout;
    assign Bout = F[2] ? ~B : B;
    assign S = A + Bout + F[2];

    always @*
    case (F[1:0])
        2'b00: Y <= A & Bout;
        2'b01: Y <= A | Bout;
        2'b10: Y <= S;
        2'b11: Y <= S[31];
    endcase

endmodule

`endif // ALU32
