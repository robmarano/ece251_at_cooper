///////////////////////////////////////////////////////////////////////////////
//
// N-BIT ALU TEST BENCH
//
// module: alu_tb
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
module alu_tb(); // no I/O for a test bench
    //
    // ---------------- INPUT SIGNALS TO TEST MODULE -------------------
    //
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] ctrl;

    //
    // ---------------- OUTPUT SIGNALS FROM TEST MODULE ----------------
    //

    reg [7:0] result;
    wire zero;
    wire overflow;
    wire negative;
    wire carryOut;

    //
    // ---------------- TEST BENCH SIGNALS -----------------------------
    //
    // Instantiate the Unit Under Test (UUT)
    alu aluUUT (.A(a), .B(b), .ALUctrl(ctrl), .ALUresult(result), .Zero(zero), .Overflow(overflow), .Negative(negative), .CarryOut(carryOut));

    // clock
    logic clk;

    //Temporary looping variable
    integer i;

    //
    // ----------------TEST BENCH IMPLEMENTATION ----------------
    //

    initial
    begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0,clk,a,b,ctrl,result,zero,negative,carryOut,overflow);
        $display("Ctl Z  N  O  C  A                    B                    ALUresult");
        $monitor("%3b %b  %b  %b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)",ctrl,zero,negative,overflow,carryOut,a,a,a,b,b,b,result,result,result);
    end

    initial
    begin
        clk = 1'b0;
        forever begin
            #10 clk = !clk;
        end
    end

    initial
    begin
        // Initialize Inputs
        b = 8'b00001111;
        a = 8'b00001111;
        ctrl = 3'b000;
    
        // Wait #100 for global reset to finish
        #100;

        // Add stimulus here
        for (i = 0; i < 7; i = i + 1)
        begin
            {ctrl} = {ctrl} + 1'b1; #100;
        end

        $display("next input values");
        $display("Ctl Z  N  O  C  A                    B                    ALUresult");

        // Initialize Inputs
        b = 8'b11110000;
        a = 8'b10001111;
    
        // Add stimulus here
        for (i = 0; i < 8; i = i + 1)
        begin
            {ctrl} = {ctrl} + 1'b1; #100;
        end

        $display("next input values");
        $display("Ctl Z  N  O  C  A                    B                    ALUresult");

        // Initialize Inputs
        b = 8'b11111111;
        a = 8'b10000001;
    
        // Add stimulus here
        for (i = 0; i < 8; i = i + 1)
        begin
            {ctrl} = {ctrl} + 1'b1; #100;
        end

        $finish;
    end      

endmodule // alu_tb