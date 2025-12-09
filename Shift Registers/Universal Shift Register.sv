module us_register (q, rst, clk, parallel_in, right_in, left_in, mode);
  
  input rst, clk;
  input [1:0] mode;
  input right_in, left_in;
  input [4:0] parallel_in;
  output reg [4:0] q;
  
  always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 5'b00000;  // Reset
    else begin
        case (mode)
            2'b00: q <= q;                        // Hold
            2'b01: q <= {right_in, q[4:1]};       // Right shift
            2'b10: q <= {q[3:0], left_in};        // Left shift
            2'b11: q <= parallel_in;              // Parallel load
            default: q <= q;                      // Default: hold
        endcase
    end
end

endmodule
