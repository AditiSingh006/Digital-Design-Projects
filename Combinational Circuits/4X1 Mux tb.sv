`timescale 1ns/1ns

module tb_mux_4x1_df;
  
  reg [3:0] I;
  reg [1:0] S;
  wire Y;
  
  mux_4x1_df dut(
    .Y(Y),
    .I(I),
    .S(S)
  );
  
  initial begin
    
    $display("\t Time \t  I \t S \t Y");
    $monitor("\t %0t \t %b \t %b \t %b", $time, I, S, Y);
    
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux_4x1_df);
    
    I = 4'b 1010;
    S = 2'b 00; #10;
    S = 2'b 01; #10;
    S = 2'b 10; #10;
    S = 2'b 11; #10;
    
    I = 4'b 1101;
    S = 2'b 00; #10;
    S = 2'b 01; #10;
    S = 2'b 10; #10;
    S = 2'b 11; #10;
    
    $finish;
    
  end
  
endmodule
