module dlatch_df (q, en, d);
  
  input en, d;
  output q;
  
  assign q = en?d:q;
  
endmodule
