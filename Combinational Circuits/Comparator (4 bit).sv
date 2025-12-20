module comparator_4b(ET, GT, LT, A, B);
  
  input [3:0] A,B;
  output ET, GT, LT;
  
  assign ET = (A==B);
  assign GT = (A>B);
  assign LT = (A<B);
  
endmodule
