`timescale 1ns / 1ps

module FullAdder(In1, In2, Cin, Sum, Cout);
    input In1, In2, Cin;
    output  Sum, Cout;
    
    assign Sum  = (In1 ^ In2) ^ Cin;
    assign Cout = (In1 & In2) | (In2 & Cin) | (Cin & In1);

endmodule