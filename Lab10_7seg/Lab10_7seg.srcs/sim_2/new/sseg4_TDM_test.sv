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

    clock = ~clock; #5; 

end

// this block only runs once 

initial begin

    clock = 0; rst = 0; #7;

    rst = 1; #3; // reset 

    rst = 0; #10; 


      $finish;

    end
endmodule
