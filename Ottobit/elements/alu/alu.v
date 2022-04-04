///////////////////////////////////////////////////////////////////////////////
//
// N-BIT ALU module
//
// defaults to 8 bits
//
// simple n-bit ALU with 3 control bits:
// NO support (yet) for Zero, proper SLT to handle -7 < 6 (do math)
//
// module: alu
// hdl: Verilog
//
// author: Prof. Rob Marano <rob@cooper.edu>
// org: The Cooper Union
// date: 2022-02-28
//
///////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU

module alu #(parameter N = 8) (A, B, ALUctrl, ALUresult, Zero, Negative, Overflow, CarryOut);
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [N-1:0] A, B;
    input logic [2:0] ALUctrl;
    output logic [N-1:0] ALUresult;
    output logic Zero;
    output logic Negative;
    output logic Overflow;
    output logic Underflow;
    output logic CarryOut;

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [N-1:0] S, Bout;
    logic [N-1:0] out;
    logic preCarryOut;

    // initial
    // begin
    //     $display("Ctl Z N O C A                    B                    Bout                 S                    ALUresult");
    // end

    always @(ALUctrl,A,B)
    begin
        Bout = ALUctrl[2] ? ~B : B; // according to ALU operations table (see README.md) msb=0, use B; msb=1, use ~B (bitwise negation)
        {preCarryOut, S} = A + Bout + ALUctrl[2]; // when ALUctrlF[2] = 1, Bout + ALUctrl[2] is 2s complement addition: negate and add one.

        // $display("%3b %b %b %b %b %8b (0x%2h;%3d;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) (%3d)!",
        //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult,S[N-2:0]);
        // $display("%b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %3b  %8b (0x%2h;%3d)!",Zero,Overflow,A,A,A,Bout,Bout,Bout,ALUctrl,S,S,S);
        case (ALUctrl[1:0])
            2'b00: begin
                ALUresult = A & Bout; // bitwise AND
            end
            2'b01: begin
                ALUresult = A | Bout; // bitwise OR
            end
            2'b10: begin
                ALUresult = S; // arithmetic addition/subtraction with 2s complement
                CarryOut = preCarryOut;
            end
            2'b11: begin
                ALUresult = S[N-1]; // set less than (SLT): the operation produces 1 if Rs < Rt, and 0 otherwise.
                CarryOut = 1'b0;
            end
            default: begin
                ALUresult = 0;
            end
        endcase
        Zero = S  ? 1'b0 : 1'b1;
        Negative = ALUresult[N-1];

        // $display("%3b %b %b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) @",
        //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult);
        // $display("%2b-%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)@",ALUctrl[1:0],Zero,Overflow,A,A,B,B,ALUctrl,ALUresult,ALUresult);

        case (ALUctrl[2])  // Overflow based upon ALUop
            1'b0: begin
                // overflow in signed arithmetic:
                Overflow = A[N-1] & B[N-1] & ~S[N-1] | ~A[N-1] & ~B[N-1] & S[N-1];
                // $display("A=%b\t~A=%b\tB=%b\t~B=%b\tS=%b\t~S=%b",A[N-1],~A[N-1],B[N-1],~B[N-1],S[N-1],~S[N-1]);
                // $display("%3b %b %b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) $",
                //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult);
                // $display("%b-%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)#",ALUctrl[2],Zero,Overflow,A,A,Bout,Bout,ALUctrl,ALUresult,ALUresult);
            end
            1'b1: begin
                Overflow = ~A[N-1] & B[N-1] & S[N-1] | A[N-1] & ~B[N-1] & ~S[N-1];
                // $display("A=%b\t~A=%b\tB=%b\t~B=%b\tS=%b\t~S=%b",A[N-1],~A[N-1],B[N-1],~B[N-1],S[N-1],~S[N-1]);
                // $display("%3b %b %b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) %",
                //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult);
                // $display("%b-%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)$",ALUctrl[2],Zero,Overflow,A,A,Bout,Bout,ALUctrl,ALUresult,ALUresult);
            end
            default: Overflow = 1'b0;
        endcase
        // $display("%3b %b %b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) ^",
        //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult);

        // $display("%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)%",Zero,Overflow,A,A,B,B,ALUctrl,ALUresult,ALUresult);
    end

    // always @(S,ALUresult)
    // begin
        // Zero = S  ? 1'b0 : 1'b1;
        // Negative = S[N-1];
        // $display("%3b %b %b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) #",
        //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult);
        // $display("%b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %3b  %8b (0x%2h;%3d)^",Zero,Overflow,A,A,A,Bout,Bout,Bout,ALUctrl,S,S,S);

        // Extend the result for capturing carry bit
        // Simply use this bit if you want result > bus width
        // overflow in signed arithmetic:
        // Overflow = ({CarryOut, S[N-1]} == 2'b01);
        // Underflow = ({preCarryOut, S[N-1]} == 2'b10);


        // $display("carry = %b\tout = %8b\tOverflow = %b",CarryOut,out,Overflow);
        // $display("%3b %b %b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d) &",
        //     ALUctrl,Zero,Negative,Overflow,CarryOut,A,A,A,B,B,B,Bout,Bout,Bout,S,S,S,ALUresult,ALUresult,ALUresult);
        // $display("%b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %3b  %8b (0x%2h;%3d) %b %b &",Zero,Overflow,A,A,A,Bout,Bout,Bout,ALUctrl,S,S,S,carry,out[N-1]);
    // end

endmodule

`endif // ALU