///////////////////////////////////////////////////////////////////////////////
//
// FLIP FLOP ASYNC RESETTABLE module
//
// defaults to 8 bits
//
// asynchronously resettable flip flop
//
// module: flopr_async
// hdl: Verilog
//
// author: Sarah Harris
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef FLOPR_ASYNC
`define FLOPR_ASYNC

// asynchronously resettable flip flop

module flopr_async(
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
    
    // asynchronous reset
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= 4'b0;
        else       q <= d;

endmodule

`endif // FLOPR_ASYNC