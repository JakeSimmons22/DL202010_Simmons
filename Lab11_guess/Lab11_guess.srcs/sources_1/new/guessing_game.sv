`timescale 1ns / 1ps
// ELC 2137, Jake Simmons, 2020-04-22

module guessing_game(
    input btnU,
    input btnD,
    input btnR,
    input btnL,
    input btnC,
    input clk,
    input sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    
    wire [3:0] W1;
    wire [3:0] W2;
    
    debounce d1( .in(btnU), .out(W1[3]));
    debounce d2( .in(btnD), .out(W1[2]));
    debounce d3( .in(btnL), .out(W1[1]));
    debounce d4( .in(btnR), .out(W1[0]));
    
    Counter #(.N(18)) count( .clk(clk), .en(1'b1), .count(W2) );
    
    
    
endmodule
