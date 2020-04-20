`timescale 1ns / 1ps
//ELC 2137, Jake Simmons, 2020-04-20


module guess_FSM (
    input [3:0]b,
    input reset,
    input clk,
    output [3:0]y,
    output win,
    output lose
);
    reg[1:0] state;
    reg swin, slose;

always @*
    begin
        //state zero
        if(~b & state == 2'b11) 
            assign y[0] = 1'b1;
        else if(~b & swin == 1'b1)
            assign y[0] = 1'b1;
        else(~b & slose == 1'b1)
            assign y[0] = 1'b1;
       //state one
       //state two
       //state three
   end
        
         
    
    
endmodule
