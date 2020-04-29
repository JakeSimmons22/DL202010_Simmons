`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  4-21-2020

module guess_fSM #(parameter N=21)
   (input clk, reset,
    output reg [3:0] y,
    input [3:0] b,
    output reg win,
    output reg lose);
    
   // define states as local parameters (constants)
   localparam [2:0]
      s0  = 3'b000,
      s1  = 3'b001,
      s2  = 3'b010,
      s3  = 3'b011,
      swin = 3'b100,
      slose = 3'b101;
      
   // internal signals
   reg [1:0] state, state_next;
   
   
   // state memory (register)
   always_ff @(posedge clk or posedge reset)
      if (reset) begin
         state   <= s0;
      end
      else begin
         state   <= state_next;
      end
      
   // combined next-state and output logic
   always_comb begin
      // default behavior
     // state_next   = state;
      
      case(state)
         s0: begin
            win=0;
            lose=0;
            y = 4'b0001;
            if (b==0)
               state_next = s1;
            else if (b==1)
                    state_next = swin;
            else 
                    state_next = slose;
         end
         
         s1: begin
            y = 4'b0010;
            if (b==0)
                state_next = s2;
            else if (b==2)
                    state_next = swin;
            else 
                    state_next = slose;
         end
         
         s2: begin
            y = 4'b0100;
            if (b==0)
                state_next = s3;
            else if (b==4)
                    state_next = swin;
            else 
                    state_next = slose;
         end
         
         s3: begin
            y = 4'b1000;
            if (b==0)
                state_next = s0;
            else if (b==8)
                    state_next = swin;
             else 
                     state_next = slose;
         end   
            
         swin: begin
              win=1;
              lose=0;
              if(b==0)
                 state_next = s0;
              else 
              state_next = swin;
            end   
            
          slose: begin
              lose=1;
              win=0;
              if(b==0)
                state_next = s0;
              else
                state_next = slose;
            end
      endcase
   end
   
endmodule
