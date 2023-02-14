module mux32b (inA, inB,out, sel);
	input [31:0] inA,inB;
	input sel;
	output [31:0] out;
	assign out= (sel) ? inB: inA;
	
endmodule
