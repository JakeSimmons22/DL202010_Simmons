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
    wire [3:0] W7;
    
    reg [1:0] Sel = 0;
    always_ff @(posedge clk)begin
        if(clk) begin
            if(Sel > 2) begin
              Sel = 0;
            end
            else begin
                Sel = Sel + 1;       
            end 
        end 
    end
    
    debounce d1( .in(btnU), .out(W1[3]));
    debounce d2( .in(btnD), .out(W1[2]));
    debounce d3( .in(btnL), .out(W1[1]));
    debounce d4( .in(btnR), .out(W1[0]));
    
    Counter #(.N(18)) count( .clk(clk), .en(1'b1), .count(W2) );
    
    mux2 #(.N(18)) m( .in1(W2), .in0(clk), .sel(sw), .out(W3));
    
    guess_FSM gFSM( .b(W1), .clk(W3), .y(W4), .win(W5), .lose(W6), .reset(btnC));
    
    mux4 m2( .in0(W4[0]), .in1(W4[1]), .in2(W4[2]), .in3(W4[3]) 
    , .sel(Sel), .out(W7));
    
    assign seg[0] = W7[0];
    assign seg[1] = W7[1];
    assign seg[4:2] = 3'b000;
    assign seg[5] = W7[3];
    assign seg[6] = W7[2];
    
    assign led[2:0] = W5;
    assign led[3] = W6;
    assign led[4:0] = 5'b00000;
    assign led[5] = W4[0];
    assign led[6] = W4[1];
    assign led[7] = W4[2];
    assign led[8] = W4[3];
    
    assign led[15:9] = 8'b00000000;
    assign an = 4'b1110;
    
endmodule
