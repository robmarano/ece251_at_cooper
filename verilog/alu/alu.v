
module alu(a,b,s,y);
	input[3:0]a;
	input[3:0]b;
	input[2:0]s;
	output[7:0]y;
	reg[7:0]y;
	always@(a,b,s)
	begin
		case(s)
			3'b000:y=a+b;
			3'b001:y=a-b;
			3'b010:y=a&b;
			3'b011:y=a|b;
			3'b100:y=4'b1111^a;
			3'b101:y=(4'b1111^a)+1'b1;
			3'b110:y=a*b;
			3'b111:
			begin 
				y=a;
				y=y>>1'b1;
			end
		endcase
	end
endmodule