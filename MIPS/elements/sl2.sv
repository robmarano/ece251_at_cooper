///////////////////////////////////////////////////////////////////////////////
//
// 32-BIT LEFT SHIFT BY 2 module
//
// left shift a 32-bit number by 2
//
// module: sl2
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef SHIFT_LEFT_2
`define SHIFT_LEFT_2

// asynchronously resettable flip flop

module sl2(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [31:0] a,
    output logic [31:0] y
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    
    // shift left by 2
    assign y = {a[29:0], 2'b00};

endmodule

`endif // SHIFT_LEFT_2
