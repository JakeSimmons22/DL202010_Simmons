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
    wire [1:0] W2;
    wire [15:0] W3;
    wire [3:0] W4;
    wire W5, W6;
    wire [1:0] W7;
    
    debounce #(.N(21)) d1( .in(btnU), .clk(clk), .reset(btnC), .out(W1[3]));
    debounce #(.N(21)) d2( .in(btnR), .clk(clk), .reset(btnC), .out(W1[2]));
    debounce #(.N(21)) d3( .in(btnD), .clk(clk), .reset(btnC), .out(W1[1]));
    debounce #(.N(21)) d4( .in(btnL), .clk(clk), .reset(btnC), .out(W1[0]));
    
    Counter #(.N(25)) count( .clk(clk), .en(1'b1), .tick(W2));
    Counter #(.N(24)) count1( .clk(clk), .en(1'b1), .tick(W7));
    
    mux2 #(.N(25)) m( .in1(W2), .in0(W7), .sel(sw[0]), .out(W3));
    
    guess_FSM gFSM( .b(W1), .clk(W3), .y(W4), .win(W5), .lose(W6), .reset(btnC));
    
    //top
    assign seg[0] = ~W4[3];
    
    //right
    assign seg[1] = ~W4[2];
    
    assign seg[4:2] = 3'b111;
    
    //left
    assign seg[5] = ~W4[0];
    
    //bottom
    assign seg[6] = ~W4[1];
    
    //win
    assign led[0] = W5;
    
    //lose
    assign led[1] = W6;
    
    
    assign led[15:2] = 14'b00000000000000;
    assign an = 4'b1110;
    
    assign dp = 1'b1;
    
endmodule
