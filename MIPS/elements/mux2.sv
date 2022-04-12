///////////////////////////////////////////////////////////////////////////////
//
// 2-WAY MUX module
//
// defaults to 8 bits
//
// simple n-bit 2-way mux
//
// module: mux2
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef MUX2
`define MUX2

module mux2
  #(parameter width = 8)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
   input  logic [width-1:0] d0, d1, 
    input  logic             s,
    output logic [width-1:0] y
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
   assign y = s ? d1 : d0; 

endmodule

`endif // MUX2