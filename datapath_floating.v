module datapath_floating(clk, reset, rwe_a, mul_enable, rwe_b, reg_1, reg_2, reg_1_e, reg_2_e, mul_done,result , mul_done_1);
	input clk, reset, rwe_a, mul_enable, rwe_b, reg_1_e, reg_2_e;
	input [31:0] reg_1, reg_2;
	output [31:0] result;
	output mul_done;
	
	output mul_done_1;// isZero Wire 
	
	wire  b31;
	wire [7:0] b30_23;
	wire [22:0] b22_0,b22_00;
	wire [31:0] connect;
	
	wire[31:0] reg_1_out, reg_2_out;
	wire[8:0] sum_add_1, out_reg_a;
	wire[7:0] sub_out, out_reg_b;
	wire[48:0] mul_out;
	wire mux1_out;
	
	//wire [31:0] result_1;

	assign b31 = (reg_1_out[31] ^ reg_2_out[31]); 
	assign connect ={b31,b30_23,b22_0};
	
	bufif1  buf_out [31:0](result[31:0],connect[31:0],mul_done);
	
	single_reg32b reg1(.rwe(reg_1_e), .clk(clk), .reset(reset), .data_in(reg_1), .data_out(reg_1_out)); //wire r1o
	single_reg32b reg2(.rwe(reg_2_e), .clk(clk), .reset(reset), .data_in(reg_2), .data_out(reg_2_out)); // r2o
	
	compare_is_zero isZero (.inA(reg_1_out), .inB(reg_2_out) , .out(result), .isZero(mul_done_1));
	
	adder add1(.num_1(reg_1_out[30:23]), .num_2(reg_2_out[30:23]), .sum(sum_add_1)); // sa1  
	single_reg9b rega(.rwe(rwe_a), .clk(clk), .reset(reset), .data_in(sum_add_1), .data_out(out_reg_a)); //ora
	sub_127 sub(.num_in(out_reg_a), .sub(sub_out)); //so
	single_reg8b regb(.rwe(rwe_b), .clk(clk), .reset(reset), .data_in(sub_out), .data_out(out_reg_b)); // orb
	mux1b mux1(.in(mul_out[47]), .out(mux1_out)); //mul_out, mux1_out
	mux23b mux23(.select(mul_out[47]), .f47t25(mul_out[46:24]), .f46t24(mul_out[45:23]), .out(b22_00)); // mux23_out
	
	assign b22_0 = (mul_out[47]) ? (b22_00+ mul_out[23]): (b22_00+ mul_out[22]);
	
	//mul mulne(.in1(reg_1_out[22:0]), .in2(reg_2_out[22:0]), .mul_e(mul_enable), .out(mul_out)); // 
	multiplier mulne(.clk(clk), .start(mul_enable), .inM({2'b01,reg_1_out[22:0]}), .inQ({2'b01,reg_2_out[22:0]}) , .outA_res(mul_out[48:25]), .outQ_res(mul_out[24:0]), .done(mul_done));
	adder add2(.num_1(out_reg_b), .num_2({7'b0000000,mux1_out}), .sum(b30_23));  //a2o
	
endmodule