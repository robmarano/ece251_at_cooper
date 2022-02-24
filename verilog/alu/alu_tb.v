module alu_tb;
	reg[3:0]a;
	reg[3:0]b;
	reg[2:0]s;
	wire[7:0]y;
	alu a1(a,b,s,y);
	

  initial begin

     if (! $value$plusargs("a=%d", a)) begin
        $display("ERROR: please specify +a=<value> to start.");
        $finish;
     end   
     if (! $value$plusargs("b=%d", b)) begin
        $display("ERROR: please specify +b=<value> to start.");
        $finish;
     end   
     if (! $value$plusargs("s=%d", s)) begin
        $display("ERROR: please specify +s=<value> to start.");
        $finish;
     end     

    

     wait (y) $display("y=%d", y);
     $finish;
  end // initial begin
endmodule