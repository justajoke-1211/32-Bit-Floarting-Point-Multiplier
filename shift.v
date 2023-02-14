module shift (A,B, outA,outQ, outQless);
	input [24:0] A;
	input [24:0] B;
	output [24:0] outA, outQ;
	output outQless;
	wire [49:0]AB , shf;
	wire less ;
	assign AB = {A,B};
	assign less=AB[0];
	assign shf = AB>>1;
	assign outA={less,shf[48:25]};
	assign outQ=shf[24:0];
	assign outQless=less;
endmodule
