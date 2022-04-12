///////////////////////////////////////////////////////////////////////////////
//
// SIGN EXTEND 16->32 MUX module
//
// sign extend a 16-bit number to a 32-bit number
//
// module: signext
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef SIGNEXT
`define SIGNEXT

module signext(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [15:0] a,
    output logic [31:0] y
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign y = {{16{a[15]}}, a};


`endif // SIGNEXT