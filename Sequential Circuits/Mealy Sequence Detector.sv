module seq_d001( det, inp, clk, rst);
  
  input inp, clk, rst;
  output reg det;
  
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
  
  reg [1:0] pr_state, nxt_state;
  
  always @(posedge clk) begin
    if(rst)
      pr_state <= 0;
    else
      pr_state <= nxt_state;
  end
  
  
  always @(inp, pr_state) begin
    
    case (pr_state)
      
      S0 : begin
        if(inp) nxt_state <= S0;
        else nxt_state <= S1;
      end
      
      S1: begin
        if(inp) nxt_state <= S0;
        else nxt_state <= S2;
      end
      
      S2: begin
        if(inp) nxt_state <= S0;
        else nxt_state <= S2;
      end
      
      default: nxt_state <= S0;
    endcase
    
  end
  
  
  always @(inp, pr_state) begin
      case (pr_state)
        S0 : det = 0;
        S1 : det = 0;
        S2 : begin
          if (inp) det = 1;
          else det = 0;
        end
        default : det = 0;
      endcase
  end
  
endmodule
