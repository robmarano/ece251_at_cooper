///////////////////////////////////////////////////////////////////////////////
//
// FULL ADDER module
//
// module: fullAdder
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////
`ifndef FULL_ADDER
`define FULL_ADDER

module fullAdder(In1, In2, Cin, Sum, Cout);
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input In1, In2, Cin;
    output  Sum, Cout;
    
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign Sum  = (In1 ^ In2) ^ Cin;
    assign Cout = (In1 & In2) | (In2 & Cin) | (Cin & In1);

endmodule

`endif // FULL_ADDER