///////////////////////////////////////////////////////////////////////////////
//
// MAINCONTROLLER module
//
// Controller for MIPS CPU
//
// module: controller
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef CONTROLLER
`define CONTROLLER

`include "./maindec.sv"
`include "./aludec.sv"

module controller(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [5:0] op, funct,
    input logic zero,
    output logic memtoreg, memwrite,
    output logic pcsrc, alusrc,
    output logic regdst, regwrite,
    output logic jump,
    output logic [2:0] alucontrol
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [1:0] aluop;
    logic branch;

    maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    aludec ad(funct, aluop, alucontrol);
    assign pcsrc = branch & zero;

endmodule

`endif // CONTROLLER






