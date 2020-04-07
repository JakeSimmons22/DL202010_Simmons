`timescale 1ns / 1ps

module mux2 #(parameter N=2)(
        input [N-1:0] in0, in1,
        input sel,
        output reg [15:0] out
        );

    always @*
        case(sel)
        0: out = in0 ;
        default: out = in1 ;
        endcase
endmodule
