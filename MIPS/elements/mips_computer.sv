///////////////////////////////////////////////////////////////////////////////
//
// MIPS COMPUTER module
//
// 32-bit MIPS COMPUTER
//
// module: mips_computer
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef MIPSCOMPUTER
`define MIPSCOMPUTER

`include "./mips.sv"
`include "./imem.sv"
`include "./dmem.sv"

module mips_computer(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic clk, reset,
    output logic [31:0] writedata, dataadr, 
    output logic memwrite
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] pc, instr, readdata;
    
    // instantiate processor
    mips mips(.clk(clk), .reset(reset), .pc(pc), .instr(instr), .memwrite(memwrite), .dataadr(dataadr), .writedata(writedata), .readdata(readdata));
    
    // instantiate instruction memory
    imem imem(pc[7:2], instr);

    // instantiate data memory
    dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule

`endif // MIPSCOMPUTER