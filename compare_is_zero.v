module compare_is_zero (inA, inB , out, isZero);
	input[31:0] inA, inB;
	output [31:0] out;
	output isZero;
	assign isZero = (inA === 32'b0 || inA === 32'b0 ) ? 1 : 0 ;
	assign out = (inA === 32'b0 || inB === 32'b0 ) ? 32'b0 : 32'bz ;

endmodule
