`timescale 1ns / 1ps
`include "../FullAdder/FullAdder.v"

module Adder8bit(A, B, Cin, Sum, Cout);
  input[7:0] A, B;
  input Cin;
  output[7:0] Sum;
  output Cout;
  wire [7:0] transferC;
  
  FullAdder FA1(.In1(A[0]), .In2(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(transferC[0]));
  FullAdder FA2(.In1(A[1]), .In2(B[1]), .Cin(transferC[0]), .Sum(Sum[1]), .Cout(transferC[1]));
  FullAdder FA3(.In1(A[2]), .In2(B[2]), .Cin(transferC[1]), .Sum(Sum[2]), .Cout(transferC[2]));
  FullAdder FA4(.In1(A[3]), .In2(B[3]), .Cin(transferC[2]), .Sum(Sum[3]), .Cout(transferC[3]));
  FullAdder FA5(.In1(A[4]), .In2(B[4]), .Cin(transferC[3]), .Sum(Sum[4]), .Cout(transferC[4]));
  FullAdder FA6(.In1(A[5]), .In2(B[5]), .Cin(transferC[4]), .Sum(Sum[5]), .Cout(transferC[5]));
  FullAdder FA7(.In1(A[6]), .In2(B[6]), .Cin(transferC[5]), .Sum(Sum[6]), .Cout(transferC[6]));
  FullAdder FA8(.In1(A[7]), .In2(B[7]), .Cin(transferC[6]), .Sum(Sum[7]), .Cout(Cout));

endmodule