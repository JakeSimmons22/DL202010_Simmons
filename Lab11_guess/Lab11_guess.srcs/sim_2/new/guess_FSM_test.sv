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

end
endmodule