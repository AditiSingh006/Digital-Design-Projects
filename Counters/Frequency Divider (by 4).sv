module freq_div_2 (clk_out, clk, rst);
  
  input clk, rst;
  output reg clk_out;
  reg clk_2;
  
  always @(posedge clk)
    
    if(rst)
      clk_2 <= 0;
  
    else
      clk_2 <= ~clk_2;
  
  always @(posedge clk_2)
    
    if(rst)
      clk_out <= 0;
  
    else
      clk_out <= ~clk_out;
  
endmodule
