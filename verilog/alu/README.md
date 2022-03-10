/* ALU Arithmetic and Logic Operations
Reference: https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 00 | 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 01 | 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 02 | 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 03 | 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 04 | 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 05 | 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 06 | 0110  |   ALU_Out = A rotated left by 1;
----------------------------------------------------------------------
| 07 | 0111  |   ALU_Out = A rotated right by 1;
----------------------------------------------------------------------
| 08 | 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 09 | 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 10 | 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 11 | 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 12 | 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 13 | 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 14 | 1110  |   ALU_Out = 1 if A>B else 0;
----------------------------------------------------------------------
| 15 | 1111  |   ALU_Out = 1 if A=B else 0;
----------------------------------------------------------------------*/
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for ALU
// by FPGA4STUDENT
module alu(
           input [7:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: // Multiplication
           ALU_Result = A * B;
        4'b0011: // Division
           ALU_Result = A/B;
        4'b0100: // Logical shift left
           ALU_Result = A<<1;
         4'b0101: // Logical shift right
           ALU_Result = A>>1;
         4'b0110: // Rotate left
           ALU_Result = {A[6:0],A[7]};
         4'b0111: // Rotate right
           ALU_Result = {A[0],A[7:1]};
          4'b1000: //  Logical and 
           ALU_Result = A & B;
          4'b1001: //  Logical or
           ALU_Result = A | B;
          4'b1010: //  Logical xor 
           ALU_Result = A ^ B;
          4'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          4'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          4'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          4'b1110: // Greater comparison
           ALU_Result = (A>B)?8'd1:8'd0 ;
          4'b1111: // Equal comparison   
            ALU_Result = (A==B)?8'd1:8'd0 ;
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule