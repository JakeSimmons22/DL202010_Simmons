`timescale 1ns / 1ps
//ELC 2137 Jake Simmons 2020-4-8

module calc_lab10(
    input [17:0] clk,
    input btnU,
    input btnD,
    input [15:0] sw,
    input btnC,
    output [15:0] led,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    wire [7:0] W1;
    wire [7:0] W2;
    
    sseg4_TDM disp_unit( .data({W2, 8'b00000000}), .hex_dec(sw[15]),
     .reset(btnC), .clock(clk), .sign(sw[14]), 
     .seg(seg), .dp(dp), .an(an));
    
    top_lab9 calc_unit( .btnU(btnU), .btnD(btnD), .sw(sw[11:0]),
    .clk(clk), .btnC(btnC), .led({W1, W2}) );
    
    assign led[7:0] = W1;
endmodule
