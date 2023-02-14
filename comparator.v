module comparator (in, out);
	input [4:0] in;
	output out;
	assign out = (in <= 5'b11000) ? 1 : 0;

endmodule
