module reg_q_lessbit( clk, rwe, in, out, reset);
	input clk, rwe,reset;
	input	  in;
	output reg  out;
	reg  mem;
	always @ (posedge clk) begin 
		if (reset)
			out<=0;
		else if (rwe)
			out<=in;
	end
	
endmodule
