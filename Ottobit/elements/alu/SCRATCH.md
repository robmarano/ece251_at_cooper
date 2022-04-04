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

module alu #(parameter N = 8) (A, B, ALUctrl, ALUresult, Zero, Overflow);
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [N-1:0] A, B;
    input logic [2:0] ALUctrl;
    output logic [N-1:0] ALUresult;
    output logic Zero;
    output logic Overflow;

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [N-1:0] S, Bout;
    logic [N-1:0] out;
    logic carry;

    initial
    begin
        $display("Ctl Z  O  A                    B                  Bout                 C  S                    ALUresult");
    end

    always @(A,B,ALUctrl)
    begin
        Bout = ALUctrl[2] ? ~B : B; // according to ALU operations table (see README.md) msb=0, use B; msb=1, use ~B (bitwise negation)
        S = A + Bout + ALUctrl[2]; // when ALUctrlF[2] = 1, Bout + ALUctrl[2] is 2s complement addition: negate and add one.
        $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)!",
            ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);
        // $display("%b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %3b  %8b (0x%2h;%3d)!",Zero,Overflow,A,A,A,Bout,Bout,Bout,ALUctrl,S,S,S);
        case (ALUctrl[1:0])
            2'b00: ALUresult = A & Bout; // bitwise AND
            2'b01: ALUresult = A | Bout; // bitwise OR
            2'b10: ALUresult = S; // arithmetic addition/subtraction with 2s complement
            2'b11: ALUresult = S[N-1]; // set less than (SLT): the operation produces 1 if Rs < Rt, and 0 otherwise.
            default: ALUresult = 0;
        endcase
        $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)@",
            ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);
        // $display("%2b-%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)@",ALUctrl[1:0],Zero,Overflow,A,A,B,B,ALUctrl,ALUresult,ALUresult);

    end

    always @(S,ALUresult)
    begin
        Zero = S  ? 1'b0 : 1'b1;
        $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)#",
            ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);

        // $display("%b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %3b  %8b (0x%2h;%3d)^",Zero,Overflow,A,A,A,Bout,Bout,Bout,ALUctrl,S,S,S);

        case (ALUctrl[2])
            1'b0: 
            begin
                // Overflow = A[N-1] & Bout[N-1] & ~S[N-1] || ~A[N-1] & ~Bout[N-1] & S[N-1];
                $display("A=%b\t~A=%b\tB=%b\t~B=%b\tS=%b\t~S=%b",A[N-1],~A[N-1],Bout[N-1],~Bout[N-1],S[N-1],~S[N-1]);
                $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)$",
                    ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);
                // $display("%b-%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)#",ALUctrl[2],Zero,Overflow,A,A,Bout,Bout,ALUctrl,ALUresult,ALUresult);
                // Extend the result for capturing carry bit
                // Simply use this bit if you want result > bus width
                {carry,out} = A + Bout;
                // overflow in signed arithmetic:
                Overflow = ({carry,out[N-1]} == 2'b10);
            end
            1'b1:
            begin
                Overflow = ~A[N-1] & Bout[N-1] & S[N-1] || A[N-1] & ~Bout[N-1] & ~S[N-1];
                $display("A=%b\t~A=%b\tB=%b\t~B=%b\tS=%b\t~S=%b",A[N-1],~A[N-1],Bout[N-1],~Bout[N-1],S[N-1],~S[N-1]);
                $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)%",
                    ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);
                // $display("%b-%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)$",ALUctrl[2],Zero,Overflow,A,A,Bout,Bout,ALUctrl,ALUresult,ALUresult);
            end
            default: Overflow = 1'b0;
        endcase
        $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)^",
            ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);

        // $display("%b  %b  %8b (0x%2h)  %8b (0x%2h)  %3b  %8b (0x%2h)%",Zero,Overflow,A,A,B,B,ALUctrl,ALUresult,ALUresult);

        $display("carry = %b\tout = %8b\tOverflow = %b",carry,out,Overflow);
        $display("%3b %b %b %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)&",
            ALUctrl,Zero,Overflow,A,A,A,B,B,B,Bout,Bout,Bout,carry,S,S,S,ALUresult,ALUresult,ALUresult);
        // $display("%b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %3b  %8b (0x%2h;%3d) %b %b &",Zero,Overflow,A,A,A,Bout,Bout,Bout,ALUctrl,S,S,S,carry,out[N-1]);
    end

endmodule

`endif // ALU


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

//module alu #(parameter N = 8) (A, B, ALUctrl, ALUout, Zero, Overflow);
module alu #(parameter N = 8)(
    input logic [N-1:0] A, B,
    input logic [2:0] ALUctrl,
    output logic [N-1:0] ALUout,
    output logic Zero,
    output logic Overflow);

  //
  // ---------------- PORT DEFINITIONS ----------------
  //
//   input logic [N-1:0] A, B;
//   input logic [2:0] ALUctrl; // ALU ops represented using 3 bits
//   output logic [N-1:0] ALUout;
//   output logic Zero;
//   output logic Overflow;

  logic [N-1:0] S, Bout;

  //
  // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
  //

    always_comb begin
        assign Bout = ALUctrl[2] ? ~B : B; // according to ALU operations table (see README.md) msb=0, use B; msb=1, use ~B (bitwise negation)
        assign S = A + Bout + ALUctrl[2]; // when ALUctrlF[2] = 1, Bout + ALUctrl[2] is 2s complement addition: negate and add one.
        assign Zero = (ALUout == 0); // Zero is true if ALUout == 0
    end

    always_comb
    begin
        case (ALUctrl[1:0])
            2'b00: ALUout <= A & Bout; // bitwise AND
            2'b01: ALUout <= A | Bout; // bitwise OR
            2'b10: ALUout <= S; // arithmetic addition/subtraction with 2s complement
            2'b11: ALUout <= S[N-1]; // set less than (SLT): the operation produces 1 if Rs < Rt, and 0 otherwise.
            default: ALUout <= 0;
        endcase
    end

    always_comb
    begin
        case (ALUctrl[2])
            1'b0: Overflow = A[N-1] & B[N-1] & ~S[N-1] | ~A[N-1] & ~B[N-1] & S[N-1];
            1'b1: Overflow = ~A[N-1] & B[N-1] & S[N-1] | A[N-1] & ~B[N-1] & ~S[N-1];
            default: Overflow = 1'b0;
        endcase
    end
  
endmodule

`endif // ALU