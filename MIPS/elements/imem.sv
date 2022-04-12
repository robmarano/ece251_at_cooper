///////////////////////////////////////////////////////////////////////////////
//
// INSTRUCTION MEMORY module
//
// 32-bit MIPS CPU instruction memory
//
// module: imem
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef IMEM
`define IMEM

module imem(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [5:0] a,
    output logic [31:0] rd
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] RAM[63:0];

    initial
    begin
        $readmemh("memfile.dat",RAM);
    end
    
    assign rd = RAM[a]; // word aligned

endmodule

`endif // IMEM