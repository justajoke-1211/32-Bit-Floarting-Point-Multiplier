module adder(num_1, num_2, sum);
  input [7:0] num_1, num_2;
  output [8:0]sum;
  assign sum = (num_1 + num_2);
endmodule
  
