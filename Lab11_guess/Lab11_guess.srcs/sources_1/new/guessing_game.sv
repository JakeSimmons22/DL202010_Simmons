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
    wire [17:0] W2;
    wire  [15:0] W3;
    wire [3:0] W4;
    wire W5, W6;
    
    debounce d1( .in(btnU), .out(W1[3]));
    debounce d2( .in(btnD), .out(W1[2]));
    debounce d3( .in(btnL), .out(W1[1]));
    debounce d4( .in(btnR), .out(W1[0]));
    
    Counter #(.N(18)) count( .clk(clk), .en(1'b1), .count(W2) );
    
    mux2 #(.N(18)) m( .in1(W2), .in0(clk), .sel(sw), .out(W3));
    
    guess_FSM gFSM( .b(W1), .clk(W3), .y(W4), .win(W5), .lose(W6), .reset(btnC));
    
    
    assign led[2:0] = W5;
    assign led[3] = W6;
    
    assign seg[7] = W4[0];
    assign seg[6] = W4[1];
    assign seg[5] = W4[2];
    assign seg[4] = W4[3];
    
    assign led[5] = W4[0];
    assign led[6] = W4[1];
    assign led[7] = W4[2];
    assign led[8] = W4[3];
    
    assign an = 4'b1110;
    
endmodule
