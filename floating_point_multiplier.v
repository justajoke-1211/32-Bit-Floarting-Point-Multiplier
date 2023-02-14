module floating_point_multiplier(clk, start,reg_1,reg_2, result);
	input clk, start;
	input [31:0] reg_1, reg_2;
	output [31:0] result;
	
	wire rwe_a, mul_enable, rwe_b, reg_1_e, reg_2_e,reset,mul_done;
	
	wire mul_done_1;
	
	controller_mul controller_mul (.clk(clk), .reset(reset), .start(start),.mul_done(mul_done), 
										.rwe_a(rwe_a), .mul_enable(mul_enable), .rwe_b(rwe_b), 
										.reg_1_e(reg_1_e), .reg_2_e(reg_2_e), .mul_done_1(mul_done_1));
	datapath_floating datapath_mul(.clk(clk), .reset(reset), .rwe_a(rwe_a), .mul_enable(mul_enable), 
												.rwe_b(rwe_b), .reg_1(reg_1), .reg_2(reg_2), .reg_1_e(reg_1_e), 
												.reg_2_e(reg_2_e), .mul_done(mul_done),.result(result),.mul_done_1(mul_done_1));
	
	
endmodule
