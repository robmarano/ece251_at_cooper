///////////////////////////////////////////////////////////////////////////////
//
// DATAPATH MIPS module
//
// Datapath for MIPS CPU
//
// module: datapath
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef DATAPATH
`define DATAPATH

`include "./adder.sv"
`include "./alu32.sv"
`include "./flopr_async.sv"
`include "./mux2.sv"
`include "./signext.sv"
`include "./sl2.sv"

module datapath(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
        input logic clk, reset,
        input logic memtoreg, pcsrc,
        input logic alusrc, regdst,
        input logic regwrite, jump,
        input logic [2:0] alucontrol,
        output logic zero,
        output logic [31:0] pc,
        input logic [31:0] instr,
        output logic [31:0] aluout, writedata,
        input logic [31:0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [4:0] writereg;
    logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    logic [31:0] signimm, signimmsh;
    logic [31:0] srca, srcb;
    logic [31:0] result;

    // next PC logic
    flopr_async #(32) pcreg(clk, reset, pcnext, pc);
    adder pcadd1(pc, 32'b100, pcplus4);
    sl2 immsh(signimm, signimmsh);
    adder pcadd2(pcplus4, signimmsh, pcbranch);
    mux2 #(32) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    mux2 #(32) pcmux(pcnextbr, {pcplus4[31:28],
    instr[25:0], 2'b00}, jump, pcnext);

    // register file logic
    regfile rf(clk, regwrite, instr[25:21], instr[20:16],
    writereg, result, srca, writedata);
    mux2 #(5) wrmux(instr[20:16], instr[15:11],
    regdst, writereg);
    mux2 #(32) resmux(aluout, readdata, memtoreg, result);
    signext se(instr[15:0], signimm);

    // ALU logic
    mux2 #(32) srcbmux(writedata, signimm, alusrc, srcb);
    alu alu32(srca, srcb, alucontrol, aluout, zero);

endmodule

`endif // DATAPATH