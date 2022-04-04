///////////////////////////////////////////////////////////////////////////////
//
// N-BIT FULL COMPARATOR module
//
// defaults to 8 bits
//
// module: comparator
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////
`ifndef COMPARATOR
`define COMPARATOR

module comparator #(parameter N = 8) (In1, In2, eq, neq, lt, lte, gt, gte);
  //
  // ---------------- PORT DEFINITIONS ----------------
  //
  input logic [N-1:0] In1, In2;
  output logic eq, neq, lt, lte, gt, gte;
  
  //
  // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
  //
  assign eq = (In1 == In2);
  assign neq = (In1 != In2);
  assign lt = (In1 < In2);
  assign lte = (In1 <= In2);
  assign gt = (In1 > In2);
  assign gte = (In1 >= In2);
  
endmodule

`endif // COMPARATOR