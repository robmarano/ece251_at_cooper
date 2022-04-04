///////////////////////////////////////////////////////////////////////////////
//
// ADDER-8-BIT TEST BENCH
//
// module: adder-8-bit_tb
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps // time-unit = 1 ns, precision = 10 ps

//
// TEST BENCH
//

module adder8bit_tb; // no I/O for a test bench
    //
    // ---------------- INPUT SIGNALS TO TEST MODULE -------------------
    //
    reg [7:0] Operand1;
    reg [7:0] Operand2;
    reg CarryIn;

    //
    // ---------------- OUTPUT SIGNALS FROM TEST MODULE ----------------
    //
    wire [7:0] Sum;
    wire CarryOut;

    //
    // ---------------- TEST BENCH SIGNALS -----------------------------
    //

    //Temporary looping variable
    reg [7:0] i = 8'b0;

    //
    // ----------------TEST BENCH IMPLEMENTATION ----------------
    //

    // Instantiate the Unit Under Test (UUT)
    adder8bit uut (.In1(Operand1), .In2(Operand2), .Cin(CarryIn), .Sum(Sum), .Cout(CarryOut));

    initial
    begin
        $dumpfile("adder8bit_test.vcd");
        $dumpvars(0,Operand1,Operand2,CarryIn,Sum,CarryOut);
        // $monitor("%b\t%b\t%b\t%b\t%b",Operand1,Operand2,CarryIn,Sum,CarryOut);
    end

    // initial
    // begin
    //     $display("Operand1         Operand2         Cin              Cout             Sum");
    //     $monitor("%b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h); %b (%d) (0x%0h)",
    //         Operand1,Operand1,Operand1,Operand2,Operand2,Operand2,
    //         CarryIn,CarryIn,CarryIn,CarryOut,CarryOut,CarryOut,Sum,Sum,Sum);
    // end

    // initial
    // begin
    //     // Initialize Inputs
    //     Operand1 = 8'b0;
    //     Operand2 = 8'b0;
    //     CarryIn = 8'b0;
        
    //     // Wait 100 ns for global reset to finish
    //     #100;
    //     Operand1    = 8'b00001111;
    //     Operand2    = 8'b00001111;
    //     CarryIn     = 8'b0;
    // end

    initial
    begin
        // $display("  i\tOperand1               Operand2               Cin Cout  Sum");
        // $monitor("%3d\t%b (%3d) (0x%2h); %b (%3d) (0x%2h); %3b; %3b; %b (%3d) (0x%2h)",
        //     i,Operand1,Operand1,Operand1,Operand2,Operand2,Operand2,
        //     CarryIn,CarryOut,Sum,Sum,Sum);

        // Initialize Inputs
        Operand1 = 8'b0;
        Operand2 = 8'b0;
        CarryIn = 8'b0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        for (i = 0; i < 2**17; i = i + 1)
        begin
            {Operand1,Operand2,CarryIn} = {Operand1,Operand2,CarryIn} + 8'b1;
            #20;
        end
    end

endmodule