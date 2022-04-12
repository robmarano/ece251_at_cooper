///////////////////////////////////////////////////////////////////////////////
//
// 32-BIT ADDER module
//
// 32-bit adder for the MIPS CPU
//
// module: adder
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

module adder(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [31:0] a, b,
    output logic [31:0] y
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign y = a + b;

endmodule

`endif // ADDER
