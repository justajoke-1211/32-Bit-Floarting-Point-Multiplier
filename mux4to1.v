module mux4to1(sel, A, B , C, D ,out);
	input [1:0] sel;
	input A,B,C,D;
	output [24:0] out;
	assign out = (sel!=2'b00 && sel!= 2'b11) ? ((sel==2'b10)? A : B) : C ;
endmodule

