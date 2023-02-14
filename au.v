module au(sel, A,B, out);
	input [1:0] sel;
	input [24:0]A,B;
	output [24:0]out;
	assign out = (sel==2'b10) ? (A+((~B)+1)) : (A+B);
endmodule
