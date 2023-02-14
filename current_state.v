module current_state (clk, D, Q, reset);
	input clk,reset;
	input [2:0]D;
	output reg [2:0]Q;
	always @ (posedge clk) begin 
		if (reset)
			Q<=3'b000;
		else 
			Q<=D;
	end
	
endmodule
