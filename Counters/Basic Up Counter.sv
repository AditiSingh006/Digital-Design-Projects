module up_counter (count, clk, rst);
  
  input clk, rst;
  output [7:0] count;
  
  reg [7:0] temp_count;
  
  always @(posedge clk)
    
    if(rst)
      temp_count <= 8'b0;
  
    else
      temp_count <= temp_count + 1;
  
  assign count = temp_count;
  
endmodule
