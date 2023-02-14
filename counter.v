module counter (clk,reset, out_count);
	input clk,reset;
	output reg [4:0] out_count;
	always @(posedge clk) begin 
		if (reset) 
			out_count <=0;
		else 
			out_count <= out_count+1;
	end

endmodule
