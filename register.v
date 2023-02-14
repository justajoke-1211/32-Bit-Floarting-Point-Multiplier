module register( clk, rwe, in, out, reset);
	input clk, rwe,reset;
	input	 [24:0] in;
	output reg [24:0] out;
	reg [24:0] mem;
	always @ (posedge clk) begin 
		if (reset)
			out<=0;
		else if (rwe)
			out<=in;
	end
	
endmodule
