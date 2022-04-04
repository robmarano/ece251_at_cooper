///////////////////////////////////////////////////////////////////////////////
//
// N-BIT FULL SUBTRACTOR module
//
// defaults to 8 bits
//
// module: subtractor
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////
`ifndef SUBTRACTOR
`define SUBTRACTOR

module subtractor #(parameter N = 8) (In1, In2, Difference);
  //
  // ---------------- PORT DEFINITIONS ----------------
  //
  input logic [N-1:0] In1, In2;
  output logic [N-1:0] Difference;
  
  //
  // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
  //
  assign Difference = In1 - In2;
  
endmodule

`endif // SUBTRACTOR