module next_state(cur_state,out_count, next_state);
	input 		[2:0]	cur_state;
	input 		 out_count;
	output reg	[2:0]	next_state;
	always @* begin 
		case (cur_state)
			3'b000: next_state<=3'b001;
			3'b001: next_state<=3'b010;
			3'b010: begin
							if (out_count == 1'b1) begin 
								next_state<=3'b010;
							end
							else begin 
								next_state<=3'b011;
							end
						end
			3'b011:  next_state <= 3'b000;
			default: next_state <=3'b000;
		endcase
	end 
	
endmodule
