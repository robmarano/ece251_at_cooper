`timescale 1ns / 1ps

module Adder4bit_tb;
// Inputs
reg [3:0] A;
reg [3:0] B;
reg Cin;

// Outputs
wire [3:0] Sum;
wire Cout;

// Instantiate the Unit Under Test (UUT)
Adder4bit uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

initial begin
   // Initialize Inputs
   A = 4'b0;
   B = 4'b0;
   Cin = 4'b0;
   
   // Wait 100 ns for global reset to finish
   #100;
   
   // Add stimulus here
   A    = 4'b1011;
   B    = 4'b0100;
   Cin  = 4'b0;

   #20;
   
   A    = 4'd1111;
   B    = 4'd1101;
   Cin  = 4'b1;
   
end

endmodule
