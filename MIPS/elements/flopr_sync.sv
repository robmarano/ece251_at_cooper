///////////////////////////////////////////////////////////////////////////////
//
// FLIP FLOP SYNC RESETTABLE module
//
// defaults to 8 bits
//
// synchronously resettable flip flop
//
// module: flopr_sync
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef FLOPR_SYNC
`define FLOPR_SYNC

// synchronously resettable flip flop

module flopr_sync(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic       clk,
    input  logic       reset, 
    input  logic [3:0] d, 
    output logic [3:0] q
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    
  // synchronous reset
    always_ff @(posedge clk)
        if (reset) q <= 4'b0;
        else       q <= d;

endmodule

`endif // FLOPR_SYNC