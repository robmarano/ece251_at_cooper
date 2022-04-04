///////////////////////////////////////////////////////////////////////////////
//
// CLOCK TEST BENCH
//
// module: clock_tb
// hdl: Verilog
//
// reference: https://www.chipverify.com/verilog/verilog-clock-generator
// org: Chip Verify
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps // time-unit = 1 ns, precision = 10 ps

//
// TEST BENCH
//

module clock_tb; // no I/O for a test bench
    //
    // ---------------- INPUT SIGNALS TO TEST MODULE -------------------
    //
    wire clk1;
    wire clk2;
    wire clk3;
    wire clk4;
    reg enable;
    reg [7:0] dly;
    integer i;

    //
    // ---------------- OUTPUT SIGNALS FROM TEST MODULE ----------------
    //

    //
    // ---------------- TEST BENCH SIGNALS -----------------------------
    //
    clock uut0(enable, clk0);
    clock #(.FREQ(200000)) uut1(.enable(enable), .clk(clk1));
    clock #(.FREQ(400000)) uut2(.enable(enable), .clk(clk2));
    clock #(.FREQ(800000)) uut3(.enable(enable), .clk(clk3));

    //
    // ----------------TEST BENCH IMPLEMENTATION ----------------
    //
    initial begin
        $dumpfile("clock_test.vcd");
        $dumpvars(0,enable,dly,clk0,clk1,clk2,clk3);
        $monitor("%b\t%d\t%b\t%b\t%b\t%b",enable,dly,clk0,clk1,clk2,clk3);
    end
    
    initial begin
        // Wait 100 ns for global reset to finish
        #100;
        enable <= 0;

        for (i = 0; i < 10; i = i + 1)
        begin
            dly = $random;
            #(dly) enable <= ~enable;
            $display("i = %d\tenable = %b\tdly = %0d\tclk0 = %b\tclk1 = %b\tclk2 = %b\tclk3 = %b"
                ,i,enable,dly,clk0,clk1,clk2,clk3);
            #50;
        end
        #50 $finish;
    end

endmodule
