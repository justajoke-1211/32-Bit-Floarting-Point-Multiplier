module output_signal(Q,rwe_A, rwe_M, rwe_Q, rwe_Qlessbit, out_res_A_e,out_res_Q_e,load,reset, done);

	input [2:0]Q;
	output reg load; 
	output reg rwe_A, rwe_M, rwe_Q, rwe_Qlessbit, out_res_A_e,out_res_Q_e,reset, done;

	always @ * begin 
		reset				<=0;
		rwe_A				<=0;
		rwe_M				<=0;
		rwe_Q				<=0;
		rwe_Qlessbit	<=0; 
		out_res_A_e		<=0;
		out_res_Q_e		<=0;
		load				<=0;
		done				<=0;
		case (Q)
			3'b000: reset <=1;
			3'b001:  begin
							load	<=1;
							rwe_M	<=1;
							rwe_Q	<=1;
						end
			3'b010: 	begin 
							rwe_A				<=1;
							rwe_Q				<=1;
							rwe_Qlessbit 	<=1;
						end
			3'b011:	begin
							out_res_A_e 	<=1;
							out_res_Q_e 	<=1;
							done<=1;
						end
		endcase
	end	
	
endmodule
