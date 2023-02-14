`timescale 1ns/1ps

module testbench_floating_point();
	reg clk,start,done_load;
	reg [31:0] reg_1, reg_2;
	wire [31:0] res;
	parameter time_de=6;
	floating_point_multiplier float (.clk(clk), .start(start), .reg_1(reg_1), .reg_2(reg_2), .result(res),.done_load(done_load));  
	initial begin 
		forever begin 
			#(1*time_de) clk=~clk;
		end
	end
	initial begin 
		clk=0;
		start=1;
		#(2*time_de) start=0;
		done_load=1;
		reg_1 = 32'b01000010111101101010111101000111;
		//reg_1 = 32'b0;
		reg_2 = 32'b01000101100001000101001101100101;
		#(60*time_de) 
		#(2*time_de) start=1;
			done_load=0;
		#(2*time_de) start=0;
			done_load=1;
			reg_1 = 32'b0;
			reg_2 = 32'b01000101100001000101001101100101;
		#(62*time_de) $stop	;

	end
	
endmodule
