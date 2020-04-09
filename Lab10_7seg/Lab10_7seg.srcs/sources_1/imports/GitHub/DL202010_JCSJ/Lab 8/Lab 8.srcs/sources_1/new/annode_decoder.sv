`timescale 1ns / 1ps
module annode_decoder(
    input [1:0] in,
    output reg [3:0] out
    );
    
    always @*
        case(in)
        0: out = 4'b1110;
        1: out = 4'b1101;
        2: out = 4'b1011;
        default: out = 4'b0111;
    endcase
endmodule
