module modulus_counter(count, rst, clk);
  
  input rst, clk;
  output [7:0] count;
  
  reg [7:0] temp_count;
  
  always @(posedge clk)
    
    if (rst | temp_count>=8'd47)
      temp_count <= 8'd0;
  
    else
      temp_count <= temp_count + 1;
  
  assign count = temp_count;
  
endmodule
