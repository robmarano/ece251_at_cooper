module test;
  reg in_1 = 1;
  reg in_2 = 0;
  reg in_3 = 1;
  wire out_1;
  wire out_2;
  simple s1 (in_1,in_2,in_3,out_1,out_2);
  initial
    $monitor("in_1=%h,in_2=%h,in_3=%h out_1=%h,out_2=%h",
            in_1,in_2,in_3,out_1,out_2);
endmodule