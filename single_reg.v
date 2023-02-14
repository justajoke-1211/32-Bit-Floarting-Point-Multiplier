module single_reg32b(rwe, clk, reset, data_in, data_out);
	input clk, rwe,reset;
	input	 [31:0] data_in;
	output reg [31:0] data_out;
	always @ (posedge clk) begin 
		if (reset)
			data_out<=0;
		else if (rwe)
			data_out<=data_in;
	end
	
endmodule


module single_reg9b(rwe, clk, reset, data_in, data_out);
	input clk, rwe,reset;
	input	 [8:0] data_in;
	output reg [8:0] data_out;
	always @ (posedge clk) begin 
		if (reset)
			data_out<=0;
		else if (rwe)
			data_out<=data_in;
	end
endmodule
      
module single_reg8b(rwe, clk, reset, data_in, data_out);
	input clk, rwe,reset;
	input	 [7:0] data_in;
	output reg [7:0] data_out;
	always @ (posedge clk) begin 
		if (reset)
			data_out<=0;
		else if (rwe)
			data_out<=data_in;
	end
endmodule
      
        
        
