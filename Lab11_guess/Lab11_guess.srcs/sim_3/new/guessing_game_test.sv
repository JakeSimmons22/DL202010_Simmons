`timescale 1ns / 1ps
//ELC 2137, Jake Simmons, 2020-04-22

module guessing_game_test();
    reg btnU;
    reg btnD;
    reg btnR;
    reg btnL;
    reg btnC;
    reg clk;
    reg sw;
    wire [6:0] seg;
    wire [3:0] an;
    wire [15:0] led; 
    
    guessing_game test( .btnU(btnU), .btnD(btnD), .btnR(btnR),
        .btnL(btnL), .btnC(btnC), .clk(clk), .seg(seg), .an(an), 
        .led(led));
        
always begin
    clk = ~clk; #10;
end

initial begin
    clk = 0; btnC = 0; btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnC = 1; #20;
    btnC = 0; #20;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 1; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 0; btnD = 1; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 0; btnD = 0; btnR = 1; btnL = 0; sw = 0; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 1; sw = 0; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 0; #10;
    btnU = 1; btnD = 0; btnR = 0; btnL = 0; sw = 1; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 1; #10;
    btnU = 0; btnD = 1; btnR = 0; btnL = 0; sw = 1; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 1; #10;
    btnU = 0; btnD = 0; btnR = 1; btnL = 0; sw = 1; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 1; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 1; sw = 1; #10;
    btnU = 0; btnD = 0; btnR = 0; btnL = 0; sw = 1; #10;
  
end
endmodule