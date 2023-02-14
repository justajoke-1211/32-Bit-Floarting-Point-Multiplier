module datapath_mul (clk, reset,inQ,inM , outA_res,outQ_res,rwe_A,rwe_M,rwe_Q,rwe_Qlessbit, load, out_res_A_e,out_res_Q_e,out_count);
	input clk, reset, load; 
	input [24:0] inQ, inM;
	input rwe_A, rwe_M, rwe_Q, rwe_Qlessbit, out_res_A_e,out_res_Q_e;
	output [24:0] outA_res,outQ_res;
	output out_count;
	wire [4:0]out;
	wire [24:0] outA,outQ;
	wire [24:0] out_shf_a,out_shf_q,out_au,outM,out_mux_a_au,out_mux;
	wire out_Qless,out_Qless_shf;
	
	register 		Multiplicand_M 	(.clk(clk), .rwe(rwe_M), .in(inM), .out(outM), .reset(reset));
	register 		Multiplier_Q 		(.clk(clk), .rwe(rwe_Q), .in(out_mux), .out(outQ), .reset(reset));
	register 		A 						(.clk(clk), .rwe(rwe_A), .in(out_shf_a), .out(outA), .reset(reset));
	mux2to1			mux_load				(.sel(load), .A(out_shf_q),.B(inQ),.out(out_mux));
	
	reg_q_lessbit 	reg_q_less			(.clk(clk),	.rwe(rwe_Qlessbit), .in(out_Qless_shf),.out(out_Qless),.reset(reset));
	au					add_sub				(.sel({outQ[0],out_Qless}), .A(outA),.B(outM), .out(out_au));
	mux2to1 			mux_a_au				(.sel(~(outQ[0] ^ out_Qless)), .A(out_au),.B(outA),.out(out_mux_a_au));
	
	
	shift 			shf 					(.A(out_mux_a_au),.B(outQ), .outA(out_shf_a),.outQ(out_shf_q), .outQless(out_Qless_shf));
	
	bufif1 			buf_a[24:0] 		(outA_res[24:0], outA[24:0], out_res_A_e);
	bufif1 			buf_q[24:0]			(outQ_res[24:0], outQ[24:0], out_res_Q_e );
	
	counter 			count 				(.clk(clk),.reset(reset),.out_count(out));
	comparator  cmp(.in(out), .out(out_count));
		
endmodule


