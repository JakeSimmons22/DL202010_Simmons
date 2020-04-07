`timescale 1ns / 1ps
//ELC 2137 2020-7-4

module counter_test();
    reg clk, en, rst; 
    wire [3:0] W1;
    wire W2;

Counter #(.N(4)) count1( .tick(W2), .clk(clk), 

    .en(en), .rst(rst), .count(W1) );

    

// clock runs continuously 

always begin 

    clk = ~clk; #5; 

end

// this block only runs once 

initial begin

    clk = 0; en = 0; rst = 0; #7;

    rst = 1; #3; // reset 

    en = 1; rst = 0; #10; 


    en = 0; #5; 

    en = 1; #3;

    en = 0; #10; 

    en = 1; #2; 
      en = 0; #5; 

    en = 1; #3;

    en = 0; #10; 

    en = 1; #2; 
      en = 0; #5; 

    en = 1; #3;

    en = 0; #10; 

    en = 1; #2; 


      $finish;

    end
endmodule
