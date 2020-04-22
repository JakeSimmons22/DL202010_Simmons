`timescale 1ns / 1ps
// ELC 2137, Jake Simmons, 2020-04-22

module guessing_game(
    input btnU,
    input btnD,
    input btnR,
    input btnL,
    input btnC,
    input clk,
    input [15:0]sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output dp
    );
    
    wire [3:0] W1;
    wire [17:0] W2;
    wire  [15:0] W3;
    wire [3:0] W4;
    wire W5, W6;
    
    debounce d1( .in(btnU), .out(W1[3]));
    debounce d2( .in(btnD), .out(W1[2]));
    debounce d3( .in(btnL), .out(W1[1]));
    debounce d4( .in(btnR), .out(W1[0]));
    
    Counter #(.N(18)) count( .clk(clk), .en(1'b1), .count(W2) );
    
    mux2 #(.N(18)) m( .in1(W2), .in0(clk), .sel(sw[0]), .out(W3));
    
    guess_FSM gFSM( .b(W1), .clk(W3), .y(W4), .win(W5), .lose(W6), .reset(btnC));
    
    
    assign seg[0] = W4[0];
    assign seg[1] = W4[1];
    assign seg[4:2] = 3'b000;
    assign seg[5] = W4[3];
    assign seg[6] = W4[2];
    
    //win
    assign led[0] = W5;
    //lose
    assign led[1] = W6;
    assign led[15:2] = 14'b00000000000000;
    assign an = 4'b1110;
    
    assign dp = 1'b1;
    
endmodule
