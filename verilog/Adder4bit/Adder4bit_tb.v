`timescale 1ns / 1ps

module Adder4bit_tb;
// Inputs
reg [3:0] A;
reg [3:0] B;
reg Cin;

// Outputs
wire [3:0] Sum;
wire Cout;

//Temporary looping variable
reg [3:0] i = 3'd0;

// Instantiate the Unit Under Test (UUT)
Adder4bit uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

initial
begin
   $display("A                B                Cin          Cout         Sum");
   $monitor("%b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h)",
        A,A,A,B,B,B,Cin,Cin,Cin,Cout,Cout,Cout,Sum,Sum,Sum);
end

initial
begin
   // Initialize Inputs
   A = 4'b0;
   B = 4'b0;
   Cin = 4'b0;
   
   // Wait 100 ns for global reset to finish
   #100;
/*   
   // Add stimulus here
   A    = 4'b1011;
   B    = 4'b0100;
   Cin  = 4'b0;

   #20;
   
   A    = 4'd1111;
   B    = 4'd1101;
   Cin  = 4'b1;
   
   #20;
*/
   A    = 4'd1111;
   B    = 4'd1111;
   Cin  = 4'b1;
end

/*
initial
begin
   $monitor("%b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h)",
        A,A,A,B,B,B,Cin,Cin,Cin,Cout,Cout,Cout,Sum,Sum,Sum);
   // Initialize Inputs
   A = 4'b0;
   B = 4'b0;
   Cin = 4'b0;

   // Wait 100 ns for global reset to finish
   #100;
    
   // Add stimulus here
   for (i = 0; i < 23; i = i + 8'b1)
   begin
       {A,B,Cin} = {A,B,Cin} + 8'b1;
       #20;
   end
end
*/
endmodule
