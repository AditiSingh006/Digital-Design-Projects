`timescale 1ns/1ns

module tb_seq_d001;

  reg clk, rst, inp;
  wire det;

  //dut
  seq_d001 dut(
    .clk(clk),
    .rst(rst),
    .inp(inp),
    .det(det)
  );

  //clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("\tTime\t clk rst inp det");
    $monitor("\t%0t\t %b   %b   %b   %b",
              $time, clk, rst, inp, det);

    //initial state
    rst = 1; inp = 0;
    #12;
    rst = 0;

    //test sequence : 0 0 1 pattern detection (001)

    //sequence 1: 0 0 1 = should detect
    inp = 0; #10;
    inp = 0; #10;
    inp = 1; #10;

    //sequence 2: Random bits
    inp = 1; #10;
    inp = 0; #10;
    inp = 1; #10;
    inp = 0; #10;

    //sequence 3: Another valid 0 0 1
    inp = 0; #10;
    inp = 0; #10;
    inp = 1; #10;

    //sequence 4: Noise inputs
    inp = 1; #10;
    inp = 1; #10;
    inp = 0; #10;
    inp = 0; #10;

    $finish;
  end

endmodule
