`timescale 1ns / 1ps
//ELC 2137, Jake Simmons, 2020-04-20


module guess_FSM (
    input [3:0]b,
    input reset,
    input clk,
    output reg [3:0]y,
    output win,
    output lose
    );
    
    
    //states
    localparam [2:0]
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        SWIN = 3'b100,
        SLOSE = 3'b101;
        
    //internal signals
    reg[2:0] nState;

    
    case(State)
        S0: begin
           y[0] = 1'b1;
           if(b==1)
            nState = SWIN;
            
    

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
