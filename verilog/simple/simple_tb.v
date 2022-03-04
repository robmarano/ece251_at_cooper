module test;

  reg in_1 = 1;
  reg in_2 = 0;
  reg in_3 = 1;

  wire out_1;
  wire out_2;

  //Temporary looping variable
  reg [3:0] i = 3'd0;

  simple uut (in_1,in_2,in_3,out_1,out_2);

  initial
  begin
      $display("in_1\tin_2\tin_3\tout_1\tout_2");
      $monitor("%b\t%b\t%b\t%b\t%b",in_1,in_2,in_3,out_1,out_2);
  end

  initial
    begin
      // Initialize Inputs
      in_1 = 1'b0;
      in_2 = 1'b0;
      in_3 = 1'b0;
      

      // Wait 100 ns for global reset to finish
      #100;
      
      // Add stimulus here
      for (i = 0; i < 7; i = i + 1'b1)
      begin
          {in_1,in_2,in_3} = {in_1,in_2,in_3} + 1'b1;
          #20;
      end

  end
endmodule