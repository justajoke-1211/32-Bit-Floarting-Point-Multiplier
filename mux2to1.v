module mux2to1(sel, A, B  ,out);
	input  sel ;
	input [24:0] A,B;
	output [24:0] out;
	assign out = (sel) ? B: A ;
endmodule

