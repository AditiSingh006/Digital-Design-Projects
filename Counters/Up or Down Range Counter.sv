module ud_range_counter (count, clk, rst, u_d, load, data);
  
  input clk, rst, u_d, load;
  input [7:0] data;
  output [7:0] count;
  
  reg [7:0] temp_count;
  
  always @(posedge clk)
    
    if(rst | temp_count<8'd100 | temp_count>8'd10)
      temp_count <= 8'd0;
      
    else if(load)
      temp_count <= data;
  
    else if(u_d)
      temp_count <= (temp_count>=8'd100) ? 8'd0 : temp_count+1;
  
    else
      temp_count <= (temp_count<=8'd10) ? 8'd0 : temp_count-1;
  
  assign count = temp_count;
  
endmodule
