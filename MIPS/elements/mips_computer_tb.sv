///////////////////////////////////////////////////////////////////////////////
//
// 32-BIT MIPS CPU TEST BENCH
//
// module: mips_cpu_tb
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps // time-unit = 1 ns, precision = 10 ps

//
// TEST BENCH
//
module mips_computer_tb(); // no I/O for a test bench
    //
    // ---------------- INPUT SIGNALS TO TEST MODULE -------------------
    //
    logic        clk;
    logic        reset;

    logic [31:0] writedata, dataadr;
    logic        memwrite;

    //
    // ---------------- OUTPUT SIGNALS FROM TEST MODULE ----------------
    //

    //
    // ---------------- TEST BENCH SIGNALS -----------------------------
    //
    // Instantiate the Unit Under Test (UUT)
    // instantiate mips device to be tested (see below for definition)
    mips_computer dut(clk, reset, writedata, dataadr, memwrite);

    // initialize test
    initial
    begin
        reset <= 1; # 22; reset <= 0;
    end

// generate clock to sequence tests
    always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end
    // initial
    // begin
    //     clk = 1'b0;
    //     forever begin
    //         #10 clk = !clk;
    //     end
    // end

    //
    // ----------------TEST BENCH IMPLEMENTATION ----------------
    //

    initial
    begin
        $dumpfile("mips_cpu_tb_test.vcd");
//        $dumpvars(0,clk,a,b,ctrl,result,zero,negative,carryOut,overflow);
//        $display("Ctl Z  N  O  C  A                    B                    ALUresult");
//        $monitor("%3b %b  %b  %b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)",ctrl,zero,negative,overflow,carryOut,a,a,a,b,b,b,result,result,result);
    end

endmodule // mips_cpu_tb