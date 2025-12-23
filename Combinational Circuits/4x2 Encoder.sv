module encoder_4x2(Y,I);
  
  input [1:0] I;
  output [3:0] Y;
  
  assign Y = {I[3]|I[2], I[3]|I[1]};
  
endmodule
