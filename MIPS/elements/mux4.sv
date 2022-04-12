///////////////////////////////////////////////////////////////////////////////
//
// 4-WAY MUX module
//
// defaults to 8 bits
//
// simple n-bit 4-way mux
//
// module: mux4
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef MUX4
`define MUX4

`include "./mux2.sv"

module mux4(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [11:0] d0, d1, d2, d3,
    input  logic [1:0]  s,
    output logic [11:0] y
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [11:0] low, hi;

    mux2 #(12) lowmux(d0, d1, s[0], low);
    mux2 #(12) himux(d2, d3, s[1], hi);
    mux2 #(12) outmux(low, hi, s[1], y);

endmodule

`endif // MUX4