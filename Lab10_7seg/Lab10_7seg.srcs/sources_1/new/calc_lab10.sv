`timescale 1ns / 1ps
//ELC 2137 Jake Simmons 2020-4-8

module calc_lab10(
    input hex_dec,
    input reset,
    input [17:0] clock,
    input sign,
    input btnU,
    input btnD,
    input [11:0] sw,
    input clk,
    input btnC,
    output [15:0] led,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    wire [7:0] W1;
    wire [7:0] W2;
    
    sseg4_TDM disp_unit( .data({8'b00000000, W2}), .hex_dec(hex_dec),
     .reset(reset), .clock(clock), .sign(sign), 
     .seg(seg), .dp(dp), .an(an));
    
    top_lab9 calc_unit( .btnU(btnU), .btnD(btnD), .sw(sw),
    .clk(clk), .btnC(btnc), .led({W1[7:0], W2[15:8]}) );
    
    assign led[7:0] = W1;
endmodule
