module controller_mul (clk, start,reset, mul_done,rwe_a, mul_enable, rwe_b, reg_1_e, reg_2_e, mul_done_1);
	input clk,mul_done;
	output rwe_a, mul_enable, rwe_b, reg_1_e, reg_2_e,start,reset;
	
	input mul_done_1;
	
	wire [2:0] Q_wire_mul, next_state_wire_mul;
	
	next_state_mul next_state (.cur_state(Q_wire_mul), .next_state(next_state_wire_mul), .mul_done(mul_done),.mul_done_1(mul_done_1));
	current_state current_state(.clk(clk),.D(next_state_wire_mul),.Q(Q_wire_mul),.reset(start));
	output_signal_mul out_sig	(.Q(Q_wire_mul), .reset(reset), .rwe_a(rwe_a), .mul_enable(mul_enable), .rwe_b(rwe_b), .reg_1_e(reg_1_e), .reg_2_e(reg_2_e));
endmodule
