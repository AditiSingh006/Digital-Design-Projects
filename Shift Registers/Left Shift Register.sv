module ls_register (
  input clk,
  input rst,
  input serial_in,
  output reg [4:0] q
);

  always @(posedge clk or posedge rst)
    if (rst)
      q <= 5'b00000;
    else
      q <= {q[3:0], serial_in};

endmodule
