///////////////////////////////////////////////////////////////////////////////
//
// 32-BIT REGISTER FILE module
//
// 32-bit register file for the MIPS CPU
// three ported register file
// read two ports combinationally
// write third port on rising edge of clk
// register 0 hardwired to 0
// note: for pipelined processor, write third port on falling edge of clk
//
// module: regfile
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef REGFILE
`define REGFILE

module regfile(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic clk,
    input logic we3,
    input logic [4:0] ra1, ra2, wa3,
    input logic [31:0] wd3,
    output logic [31:0] rd1, rd2
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] rf[31:0];

    always_ff @(posedge clk)
    begin
        if (we3) rf[wa3] <= wd3;
    end
    
    assign rd1 = (ra1 ! = 0) ? rf[ra1] : 0;
    assign rd2 = (ra2 ! = 0) ? rf[ra2] : 0;
endmodule

`endif // REGFILE