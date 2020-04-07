`timescale 1ns / 1ps
//ELC 2137 2020-7-4

module sseg4_TDM_test();
    reg clock;
    
    reg rst;
    
    reg [15:0] data;

    reg hex_dec;

    reg sign;

    wire [6:0] seg;

    wire dp;

    wire [3:0] an;

sseg4_TDM sseg4( .clock(clock), .rst(rst), .data(data), .hex_dec(hex_dec),
    .sign(sign), .seg(seg), .dp(dp), .an(an));

    

// clock runs continuously 

always begin 

    clock = ~clock; #10; 

end

// this block only runs once 

initial begin

    data = 0; hex_dec = 0; rst = 0; clock = 0; sign = 0; #20;
    data = 1; hex_dec = 0; rst = 0; clock = 1; sign = 0; #20;
    data = 2; hex_dec = 0; rst = 0; clock = 2; sign = 0; #20;
    data = 3; hex_dec = 0; rst = 0; clock = 3; sign = 0; #20;


      $finish;

    end
endmodule
