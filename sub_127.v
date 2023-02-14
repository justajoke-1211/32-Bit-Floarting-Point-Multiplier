module sub_127(num_in, sub);
  input[8:0] num_in;
  output [7:0] sub;
  assign sub = (num_in - 127);
endmodule


