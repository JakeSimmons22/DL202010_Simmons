`timescale 1ns / 1ps
//ELC 2137 2020-4-7

module sseg4_TDM(
    input clock,
    input reset,
    input [15:0] data,
    input hex_dec,
    input sign,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    wire [1:0] digit_sel;    
    wire [15:0] W1 ;
    wire [15:0] W2 ;
    wire [3:0] W3;
    wire [6:0] W4;
    wire [3:0] W5;
    wire W6;    
    wire [1:0] W7;
    
    Counter #(.N(18)) timer( .clk(clock),.en(1'b1), .tick(W7), .rst(reset));  
    Counter #(.N(2)) counter2( .clk(W7),.en(1'b1),.count(digit_sel), .rst(reset) );    
    BCD11_2 B1( .in11(data[10:0]), .out11(W1));
    mux2 #(.N(16)) B2( .in0(data), .in1(W1), .sel(hex_dec), .out(W2));
    mux4 B3( .in0(W2[3:0]), .in1(W2[7:4]), .in2(W2[11:8]), .in3(W2[15:12]), .sel(digit_sel), .out(W3));
    sseg_decoder B5( .num(W3), .sseg(W4));
    mux2 #(.N(7)) B6( .in0(W4), .in1(7'b0111111), .out(seg) , .sel(W6));
    and G2( W6, sign, ~W5[3]);
    annode_decoder B7( .in(digit_sel), .out(W5));

    assign dp = 1;
    assign an = W5;
endmodule
