module dlatch_bh (q, en, d);
  
  input en, d;
  output reg q;
  
  always @(q, en)
    if(en) q = d;
  
endmodule
