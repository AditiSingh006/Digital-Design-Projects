module ud_counter (count, clk, rst, load, data, u_d);
  
  input clk, rst, load, u_d;
  input [7:0] data;
  output [7:0] count;
  
  reg temp_count;
  
  always @(posedge clk)
    
    if(rst)
      temp_count <= 8'd0;
  
    else if(load)
      temp_count <= data;
  
    else if(u_d)
      temp_count <= temp_count + 1;
  
    else
      temp_count <= temp_count - 1;
  
  assign count = temp_count;
  
endmodule
