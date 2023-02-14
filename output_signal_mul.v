module output_signal_mul(Q, reset, rwe_a, mul_enable, rwe_b, reg_1_e, reg_2_e );
	input  [2:0]Q;
	output reg  reset, rwe_a, rwe_b, mul_enable, reg_1_e, reg_2_e;
	
	always @* begin 
		reset			<=0;
		rwe_a			<=0;
		rwe_b			<=0;
		mul_enable	<=0;
		reg_1_e		<=0;
		reg_2_e		<=0;
		case (Q)
			3'b000:	begin 
							reset		<=1;
						end
			3'b001:	begin 
							reg_1_e	<=1;
							reg_2_e	<=1;
						end
			3'b010:	begin
							mul_enable<=1;
							rwe_a<=1;
						end
			3'b011: 	begin 
							rwe_b<=1;
						end
		endcase
	
	end

endmodule
