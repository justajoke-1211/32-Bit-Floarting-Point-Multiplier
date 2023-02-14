module mux23b(select, f47t25, f46t24, out);
  input select;
  input[22:0] f47t25, f46t24;
  output [22:0] out;
  
  assign out= (select) ? f47t25 : f46t24;
endmodule

  

