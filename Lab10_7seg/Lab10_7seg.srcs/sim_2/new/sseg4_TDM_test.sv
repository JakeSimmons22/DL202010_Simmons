`timescale 1ns / 1ps
//ELC 2137 2020-7-4

module sseg4_TDM_test();
    reg clock;
    
    reg reset;
    
    reg [15:0] data;

    reg hex_dec;

    reg sign;

    wire [6:0] seg;

    wire dp;

    wire [3:0] an;

sseg4_TDM sseg4( .clock(clock), .reset(reset), .data(data), .hex_dec(hex_dec),
    .sign(sign), .seg(seg), .dp(dp), .an(an));

    

// clock runs continuously 

always begin 

    clock = ~clock; #2621440; 

end

// this block only runs once 

initial begin

    data = 0; hex_dec = 0; reset = 1; clock = 0; sign = 0; #10;
    data = 1; hex_dec = 1; reset = 0; clock = 1; sign = 1; #10;
    data = 2; hex_dec = 1; reset = 0; clock = 5; sign = 1; #10;
    data = 3; hex_dec = 1; reset = 0; clock = 10; sign = 1; #10;
    data = 4; hex_dec = 1; reset = 0; clock = 15; sign = 1; #10;
    data = 5; hex_dec = 1; reset = 0; clock = 20; sign = 1; #10;
    data = 6; hex_dec = 1; reset = 0; clock = 25; sign = 1; #10;
    data = 7; hex_dec = 1; reset = 0; clock = 30; sign = 1; #10;
    data = 8; hex_dec = 1; reset = 0; clock = 35; sign = 1; #10;
    data = 9; hex_dec = 1; reset = 0; clock = 40; sign = 1; #10;
    data = 10; hex_dec = 1; reset = 0; clock = 45; sign = 1; #10;
    data = 11; hex_dec = 1; reset = 0; clock = 50; sign = 1; #10;
    data = 12; hex_dec = 1; reset = 0; clock = 55; sign = 1; #10;
    data = 13; hex_dec = 1; reset = 0; clock = 60; sign = 1; #10;


      $finish;

    end
endmodule
