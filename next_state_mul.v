module next_state_mul(cur_state, next_state, mul_done,load,done_load , mul_done_1);
	input [2:0]	cur_state;
	input mul_done,load , done_load;
	
	input mul_done_1;
	
	output reg [2:0] next_state;
	
	always @ * begin 
		case(cur_state)
			3'b000: 	next_state<=3'b001;
			3'b001: 	begin 
								next_state<=3'b010;
						end
			3'b010: 	next_state<=3'b011;
			3'b011:	begin 
							if (mul_done || mul_done_1)
								next_state<=3'b000;
							else 
								next_state	<=3'b011;
						end
		endcase
		
	end 
endmodule
