///////////////////////////////////////////////////////////////////////////////
//
// N-BIT FULL ADDER module
//
// defaults to 8 bits
//
// module: adder
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

module adder #(parameter N = 8) (In1, In2, Cin, Sum, Cout);
  //
  // ---------------- PORT DEFINITIONS ----------------
  //
  input logic [N-1:0] In1, In2;
  input logic Cin;
  output logic [N-1:0] Sum;
  output logic Cout;
  
  //
  // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
  //
  assign {Cout, Sum} = In1 + In2 + Cin;
  
endmodule

`endif // ADDER