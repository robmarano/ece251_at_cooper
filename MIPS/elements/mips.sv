///////////////////////////////////////////////////////////////////////////////
//
// MIPS CPU module
//
// 32-bit MIPS CPU
//
// module: mips
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef MIPS
`define MIPS

`include "./datapath.sv"
`include "./controller.sv"

module mips(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic clk, reset,
    output logic [31:0] pc,
    input logic [31:0] instr,
    output logic memwrite,
    output logic [31:0] aluout, writedata,
    input logic [31:0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic memtoreg, alusrc, regdst,
    regwrite, jump, pcsrc, zero;
    logic [2:0] alucontrol;

    // MIPS controller
    controller c(
        instr[31:26], instr[5:0], zero,
        memtoreg, memwrite, pcsrc,
        alusrc, regdst, regwrite,
        jump, alucontrol);

    // MIPS datapath
    datapath dp(
        clk, reset, memtoreg,
        pcsrc, alusrc, regdst,
        regwrite, jump, alucontrol,
        zero, pc, instr,
        aluout, writedata, readdata);

endmodule

`endif // MIPS