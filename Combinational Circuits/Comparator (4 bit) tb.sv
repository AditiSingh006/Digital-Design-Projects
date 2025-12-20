`timescale 1ns/1ns

module tb_comparator_4b;
  
  reg [3:0] A, B;
  wire ET, GT, LT;

  comparator_4b dut (
    .ET(ET),
    .GT(GT),
    .LT(LT),
    .A(A),
    .B(B)
  );
  
  initial begin
    $display("Time\tA\tB\tET\tGT\tLT");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, ET, GT, LT);
    
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_comparator_4b);

    A = 4'b0000; B = 4'b0000; #10;   // Equal
    A = 4'b0101; B = 4'b0011; #10;   // Greater
    A = 4'b0010; B = 4'b0100; #10;   // Less
    A = 4'b1111; B = 4'b1111; #10;   // Equal
    A = 4'b1010; B = 4'b0111; #10;   // Greater
    A = 4'b1000; B = 4'b1100; #10;   // Less

    
  end

endmodule
