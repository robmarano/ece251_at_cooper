// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for ALU
// by FPGA4STUDENT
// Reference https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html
 `timescale 1ms / 1ms  

module tb_alu;
//Inputs
 reg[7:0] A,B;
 reg[3:0] ALU_Sel;

initial
 begin
    $dumpfile("test.vcd");
    $dumpvars(0,A,B,ALU_Sel,ALU_Out,CarryOut);
 end

//Outputs
 wire[7:0] ALU_Out;
 wire CarryOut;
 // Verilog code for ALU
 integer i;
 alu test_unit(
            A,B,  // ALU 8-bit Inputs                 
            ALU_Sel,// ALU Selection
            ALU_Out, // ALU 8-bit Output
            CarryOut // Carry Out Flag
     );
    initial begin
    // hold reset state for 100 ns.
      A = 8'h02;
      B = 8'h01;
      ALU_Sel = 4'h0;
      
      for (i=0;i<=15;i=i+1)
      begin
       #10;
       ALU_Sel = ALU_Sel + 8'h01;
      end;
      
    end
endmodule