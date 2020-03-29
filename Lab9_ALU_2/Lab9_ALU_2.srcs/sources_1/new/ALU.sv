`timescale 1ns / 1ps
/ELC 2137 Jake Simmons 2020-3-29

module ALU#(parameter N=8) 
    ( 
    output reg[N-1:0] out, 
    input [N-1:0] in0, 
    input [N-1:0] in1, 
    input [3:0] op 
    );
// Local parameters 
parameter ADD=0; 
parameter SUB=1; 
parameter AND=2; 
parameter OR=3; 
parameter XOR=4;
always @* 
begin 
    case(op) 
        ADD: destination = in0 + in1; 
        // add the remaining commands 
        default: out = in0; 
     endcase 
  end

endmodule
