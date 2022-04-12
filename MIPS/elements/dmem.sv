///////////////////////////////////////////////////////////////////////////////
//
// DATA MEMORY module
//
// 32-bit MIPS CPU data memory
//
// module: dmem
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef DMEM
`define DMEM

module dmem(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic clk, we,
    input logic [31:0] a, wd,
    output logic [31:0] rd);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] RAM[63:0];
    
    assign rd = RAM[a[31:2]]; // word aligned
    
    always_ff @(posedge clk)
    if (we)
        RAM[a[31:2]] <= wd;

endmodule

`endif // DMEM