`timescale 1ns / 1ps
//ELC 2137, Jake Simmons, 2020-04-20


module guess_FSM #(parameter N=19)(
    input [3:0]b,
    input reset,
    input clk,
    output reg [3:0]y,
    output reg win,
    output reg lose
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
    reg[2:0] nState, State;
    reg[N-1:0] counter, ncounter;
    
    always_ff @(posedge clk or posedge reset)
        if(reset) begin
            State <= S0;
            counter <= {N{1'b1}};
        end
        else begin
            State <= nState;
            counter <= ncounter;
        end
        

 always_comb begin
    case(State)
        S0: begin
            y[0] = 1;
            y[3:1] = 0;
            lose = 0;
            win = 0;
            if(b==1)
                nState = SWIN;
            else if(b==0)
                nState = S1;
            else 
                nState = SLOSE;
        end
        
        S1: begin
            y[1] = 1;
            y[0] = 0;
            y[3:2] = 0;
            if(b== 2)
                nState = SWIN;
            else if(b==0)
                nState = S2;
            else
                nState = lose;
        end
        
        S2: begin
            y[2] = 1;
            y[3] = 0;
            y[1:0] = 0;
            if(b==4)
                nState = SWIN;
            else if(b==0)
                nState = S3;
            else
                nState = SLOSE;
        end
        
        S3: begin
            y[3] = 1;
            y[2:0] = 0;
            if(b==8)
                nState = SWIN;
            else if(b==0)
                nState = S0;
            else
                nState = SLOSE;
        end
        
        SWIN: begin
            win = 1;
            if(b==0)
                nState = S0;
            else
                nState = SWIN;
        end
        
        SLOSE: begin
            lose = 1;
            if(b==0)
                nState = S0;
            else
                nState = SLOSE;
        end
   endcase
 end   
endmodule
