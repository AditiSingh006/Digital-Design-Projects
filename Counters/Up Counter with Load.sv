module up_counter_load (count, load, rst, clk, data);
  
  input load, clk, rst;
  input [7:0] data;
  output [7:0] count;
  reg [7:0] temp_count;
  
  always @(posedge clk)
    
    if(rst)
      temp_count <= 8'b0;
    
    else if(load)
      temp_count <= data;
  
    else
      temp_count <= temp_count + 1;
  
assign count = temp_count;
  
endmodule
