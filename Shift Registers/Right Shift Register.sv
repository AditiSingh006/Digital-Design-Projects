module rs_register(q, clk, rst, serial_in);
  
  input clk, rst;
  input serial_in;
  output reg [4:0] q;
  
  always @( posedge clk, posedge rst)
    
    if(rst)
      q <= 5'b00000;
  
    else
      q <= {serial_in, q[4:1]};

endmodule
