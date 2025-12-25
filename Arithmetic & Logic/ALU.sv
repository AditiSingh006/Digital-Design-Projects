module ALU(A, B, X, Y, OPCODE)
  
  input [3:0] X, Y, OPCODE;
  output reg [3:0] A, B;
  
  always @(X, Y, OPCODE)
    begin
      
      case(OPCODE)
        
        4'b0000 : X [0] = | A;
        
        4'b0001 : X [0] = & A;
        
        4'b0010 : X [0] = ^ A;
        
        4'b0011 : X = A | B;
        
        4'b0100 : X = A & B;
        
        4'b0101 : X = A ^ B;
        
        4'b0110 : X [0] = A > B;
        
        4'b0111 : X [0] = A < B;
        
        4'b1000 : X [0] = A != B;
        
        4'b1001 : X [0] = A == B;
        
        4'b1010 : {Y[0], X} = A+B;
        
        4'b1011 : X = A-B;
        
        4'b1100 : {Y, X} = A*B;
        
        4'b1101 : {Y, X} = A>>B;
        
        4'b1110 : {Y, X} = A<<B;
        
        4'b1111 : X = ~A;
        
        default : $display("error");
        
      endcase
      
    end
  
endmodule
