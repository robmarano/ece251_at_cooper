///////////////////////////////////////////////////////////////////////////////
//
// FULL ADDER TEST BENCH
//
// module: fullAdder_tb
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
module fullAdder_tb(); // no I/O for a test bench
    //
    // ---------------- INPUT SIGNALS TO TEST MODULE -------------------
    //

    reg A;
    reg B;
    reg Cin;

    //
    // ---------------- OUTPUT SIGNALS FROM TEST MODULE ----------------
    //

    wire Sum;
    wire Cout;

    //
    // ---------------- TEST BENCH SIGNALS -----------------------------
    //

    // // clock periods
    // parameter CLK_PERIOD = 10; // 10 ns = 100 MHz

    // // generate clock
    // initial sim_clk = 1'b0;

    // always @(CLK_PERIOD/2.0) begin
    //     sim_clk = ~sim_clk;
    // end

    //Temporary looping variable
    reg [3:0] i = 3'd0;

    // Instantiate the Unit Under Test (UUT)
    fullAdder uut (.In1(A), .In2(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    //
    // ----------------TEST BENCH IMPLEMENTATION ----------------
    //

    initial
    begin
        $dumpfile("fullAdder_test.vcd");
        $dumpvars(0,A,B,Cin,Cout,Sum);
        $display("A\tB\tCin\tCout\tSum");
        $monitor("%b\t%b\t%b\t%b\t%b",A,B,Cin,Cout,Sum);
    end

    initial
    begin
        // Initialize Inputs
        A = 1'b0;
        B = 1'b0;
        Cin = 1'b0;
    
        // Wait #100 for global reset to finish
        #10;
    
        // Add stimulus here
        for (i = 0; i < 7; i = i + 1'b1)
        begin
            #10 {A,B,Cin} = {A,B,Cin} + 1'b1;
        end

    end      

endmodule // fullAdder_tb