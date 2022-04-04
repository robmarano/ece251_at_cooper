///////////////////////////////////////////////////////////////////////////////
//
// FULL ADDER 8-bit module
//
// module: adder-8-bit
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////
`ifndef ADDER8BIT
`define ADDER8BIT

`include "../fullAdder/fullAdder.v"

module adder8bit(In1, In2, Cin, Sum, Cout);
  //
  // ---------------- PORT DEFINITIONS ----------------
  //
  input[7:0] In1, In2;
  input Cin;
  output[7:0] Sum;
  output Cout;
  wire [7:0] transferC;
  
  //
  // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
  //
  fullAdder FA1(.In1(In1[0]), .In2(In2[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(transferC[0]));
  fullAdder FA2(.In1(In1[1]), .In2(In2[1]), .Cin(transferC[0]), .Sum(Sum[1]), .Cout(transferC[1]));
  fullAdder FA3(.In1(In1[2]), .In2(In2[2]), .Cin(transferC[1]), .Sum(Sum[2]), .Cout(transferC[2]));
  fullAdder FA4(.In1(In1[3]), .In2(In2[3]), .Cin(transferC[2]), .Sum(Sum[3]), .Cout(transferC[3]));
  fullAdder FA5(.In1(In1[4]), .In2(In2[4]), .Cin(transferC[3]), .Sum(Sum[4]), .Cout(transferC[4]));
  fullAdder FA6(.In1(In1[5]), .In2(In2[5]), .Cin(transferC[4]), .Sum(Sum[5]), .Cout(transferC[5]));
  fullAdder FA7(.In1(In1[6]), .In2(In2[6]), .Cin(transferC[5]), .Sum(Sum[6]), .Cout(transferC[6]));
  fullAdder FA8(.In1(In1[7]), .In2(In2[7]), .Cin(transferC[6]), .Sum(Sum[7]), .Cout(Cout));
endmodule

`endif // ADDER8BIT