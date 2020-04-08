`timescale 1ns / 1ps
module BCD11_2(
    input [10:0] in11,
    output [15:0] out11
    );
   
    wire[3:0] W1;
    wire[3:0] W2;
    wire[3:0] W3;
    wire[3:0] W4;
    wire[3:0] W5;
    wire[3:0] W6;
    wire[3:0] W7;
    wire[3:0] W8;
    wire[3:0] W9;
    wire[2:0] W10;
    wire[3:0] W11;
    wire[3:0] W12;
    
 add3_2 A(.Cin({0, in11[10:8]}), .Cout(W1));
 add3_2 B(.Cin({W1[2:0], in11[7]}), .Cout(W2));
 add3_2 C(.Cin({W2[2:0], in11[6]}), .Cout(W3));
 add3_2 D(.Cin({0, W1[3], W2[3], W3[3]}), .Cout(W4));
 add3_2 E(.Cin({W3[2:0], in11[5]}), .Cout(W5));
 add3_2 F(.Cin({W4[2:0], W5[3]}), .Cout(W6));
 add3_2 G(.Cin({W5[2:0],in11[4]}), .Cout(W7));
 add3_2 H(.Cin({W6[2:0], W7[3]}), .Cout(W8));
 add3_2 I(.Cin({W7[2:0], in11[3]}), .Cout(W9));
 add3_2 J(.Cin({0, W4[3], W6[3], W8[3]}), .Cout({out11[13], W10}));
 add3_2 K(.Cin({W8[2:0], W9[3]}), .Cout(W11));
 add3_2 L(.Cin({W9[2:0], in11[2]}), .Cout(W12));
 add3_2 M(.Cin({W10[2:0], W11[3]}), .Cout(out11[12:9]));
 add3_2 N(.Cin({W11[2:0], W12[3]}), .Cout(out11[8:5]));
 add3_2 O(.Cin({W12[2:0], in11[1]}), .Cout(out11[4:1]));
    assign out11[0] = in11[0];
    assign out11[15] = 0;
    assign out11[14] = 0;
endmodule
