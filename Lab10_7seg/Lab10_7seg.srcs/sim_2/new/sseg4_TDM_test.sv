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

    data = 0; hex_dec = 0; reset = 1; clock = 18'b000000000000000000; sign = 0; #2621440;
    data = 1; hex_dec = 1; reset = 0; clock = 18'b000000000000000001; sign = 0; #2621440;
    data = 2; hex_dec = 1; reset = 0; clock = 18'b000000000000000010; sign = 0;  #2621440;
    data = 3; hex_dec = 1; reset = 0; clock = 18'b000000000000000011; sign = 0;  #2621440;
    data = 4; hex_dec = 1; reset = 0; clock = 18'b000000000000000100; sign = 0;  #2621440;
    data = 5; hex_dec = 1; reset = 0; clock = 18'b000000000000000101; sign = 0;  #2621440;
    data = 6; hex_dec = 1; reset = 0; clock = 18'b000000000000000110; sign = 0;  #2621440;
    data = 7; hex_dec = 1; reset = 0; clock = 18'b000000000000000111; sign = 0;  #2621440;
    data = 8; hex_dec = 1; reset = 0; clock = 18'b000000000000001000; sign = 0;  #2621440;
    data = 9; hex_dec = 1; reset = 0; clock = 18'b000000000000001001; sign = 0;  #2621440;
    data = 10; hex_dec = 1; reset = 0; clock = 18'b000000000000001010; sign = 0;  #2621440;
    data = 11; hex_dec = 1; reset = 0; clock = 18'b000000000000001011; sign = 0;  #2621440;
    data = 12; hex_dec = 1; reset = 0; clock = 18'b000000000000001100; sign = 0;  #2621440;
    data = 13; hex_dec = 1; reset = 0; clock = 18'b000000000000001101; sign = 0;  #2621440;


      $finish;

    end
endmodule
