`timescale 1ns / 1ps

module FullAdder_tb;

// Declare the test bench input variables
reg In1;
reg In2;
reg Cin;

// Outputs
wire Sum;
wire Cout;

//Temporary looping variable
reg [3:0] i = 3'd0;

// Instantiate the Unit Under Test (UUT)
FullAdder uut (.In1(In1), .In2(In2), .Cin(Cin), .Sum(Sum), .Cout(Cout));

initial
begin
    $display("A\tB\tCin\tCout\tSum");
    $monitor("%b\t%b\t%b\t%b\t%b",In1,In2,Cin,Cout,Sum);
end

initial
begin
    // Initialize Inputs
    In1 = 1'b0;
    In2 = 1'b0;
    Cin = 1'b0;
    

    // Wait 100 ns for global reset to finish
    #100;
    
    // Add stimulus here
    for (i = 0; i < 7; i = i + 1'b1)
    begin
        {In1,In2,Cin} = {In1,In2,Cin} + 1'b1;
        #20;
    end

 end      

endmodule