module multiplier (clk, start, inM,inQ ,outA_res,outQ_res,done);
	input clk;
	input start;
	input [24:0] inM, inQ;
	output [24:0] outA_res, outQ_res;
	output done;
	wire reset, rwe_A, rwe_M, rwe_Q, rwe_Qlessbit, out_res_A_e, out_res_Q_e, load;
	wire  out_count;
	controller controller(
	.clk							(clk), 
	.start						(start), 
	.rwe_A						(rwe_A), 
	.rwe_M						(rwe_M), 
	.rwe_Q						(rwe_Q), 
	.rwe_Qlessbit				(rwe_Qlessbit), 
	.out_res_A_e				(out_res_A_e),
	.out_res_Q_e				(out_res_Q_e),
	.load 						(load), 
	.out_count					(out_count),
	.reset						(reset),
	.done							(done)
	);
	
	
	datapath_mul  datapath(
	.clk						(clk), 
	.reset					(reset),
	.inQ						(inQ),
	.inM 						(inM), 
	.outA_res				(outA_res),
	.outQ_res				(outQ_res),
	.rwe_A					(rwe_A),
	.rwe_M					(rwe_M),
	.rwe_Q					(rwe_Q),
	.rwe_Qlessbit			(rwe_Qlessbit), 
	.load						(load), 
	.out_res_A_e			(out_res_A_e),
	.out_res_Q_e			(out_res_Q_e),
	.out_count				(out_count)
	);
			
		
endmodule


