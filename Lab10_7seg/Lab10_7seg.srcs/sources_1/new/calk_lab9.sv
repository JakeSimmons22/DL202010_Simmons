`timescale 1ns / 1ps
//ELC 2137 Jake Simmons 2020-4-8


module calk_lab9(
    input btnU,
    input btnD,
    input [11:0] sw,
    input clk,
    input btnC,
    output [15:0] led
     );
     wire [7:0] W1;
     wire [7:0] W2;
     
     register_2 #(.N(8)) r1( .D(sw[7:0]), .en(btnD), .clk(clk), .Q(W1), .rst(btnC) );
     ALU alu( .in1(W1), .in0(sw[7:0]), .op(sw[11:8]), .out(W2));
     register_2 #(.N(8)) r2( .D(W2), .en(btnU), .clk(clk), .rst(btnC), .Q(led[15:8]));
     
     assign led [7:0] = W1;
endmodule
