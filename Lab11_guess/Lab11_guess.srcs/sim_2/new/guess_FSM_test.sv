`timescale 1ns / 1 ps
//ELC 2137, Jake Simmons, 2020-04-21
module guess_FSM_test();
    
    reg clk, reset;
    reg [3:0] b;
    wire [4:0] y;
    wire win, lose;
    
guess_FSM gs( .clk(clk), .b(b), .reset(reset), .y(y), .win(win),
    .lose(lose) );

always begin
    clk = ~clk; #10;
end

initial begin
    clk = 0; reset = 0; b = 0; #10;
    reset = 1; #10;
    reset = 0; #10;
    
    b = 0; #10; //S1
    b = 0; #10; //S2
    b = 0; #10; //S3
    
    b = 0; #10; //S0
    b = 1; #10; //SWIN
    b = 2; #10; //SWIN
    
    b = 0; #10; //S0
    b = 2; #10; //SLOSE
    b = 1; #10; //SLOSE
    
    b = 0; #10; //S0
    b = 0; #10; //S1
    b = 2; #10; //SWIN
    b = 2; #10; //SWIN
    
    b = 0; #10; //S0
    b = 0; #10; //S1
    b = 1; #10; //SLOSE
    b = 1; #10; //SLOSE
    
    b = 0; #10; //S0
    b = 0; #10; //S1
    b = 0; #10; //S2
    b = 4; #10; //SWIN
    b = 2; #10; //SWIN
    b = 0; #10; //S0
    b = 0; #10; //S1
    b = 0; #10; //S2
    b = 1; #10; //SLOSE
    b = 1; #10; //SLOSE
    b = 0; #10; //S0
    
    b = 0; #10; //S1
    b = 0; #10; //S2
    b = 0; #10; //S3
    b = 8; #10; //SWIN
    b = 2; #10; //SWIN
    b = 0; #10; //S0
    b = 0; #10; //S1
    b = 0; #10; //S2
    b = 0; #10; //S3
    b = 1; #10; //SLOSE
    b = 1; #10; //SLOSE
    b = 0; #10; //S0
    
    
    end
endmodule