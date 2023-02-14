module controller (clk, start, rwe_A, rwe_M, rwe_Q, rwe_Qlessbit, out_res_A_e,out_res_Q_e,load , out_count,reset,done);
	input clk,start;
	input out_count;
	output load,done; 
	output rwe_A, rwe_M, rwe_Q, rwe_Qlessbit, out_res_A_e,out_res_Q_e,reset;
	wire	[2:0]Q_wire , next_state_wire;
	
	next_state 		inst_1	(.cur_state(Q_wire), .out_count(out_count), .next_state(next_state_wire));
	current_state	inst_2	(.clk(clk),.reset(start),.D(next_state_wire),.Q(Q_wire));
	output_signal	inst_3	(.Q(Q_wire), .rwe_A(rwe_A), 
										.rwe_M(rwe_M), .rwe_Q(rwe_Q), .rwe_Qlessbit(rwe_Qlessbit), 
										.out_res_A_e(out_res_A_e),.out_res_Q_e(out_res_Q_e),.load(load),.reset(reset),.done(done) );
	
endmodule
