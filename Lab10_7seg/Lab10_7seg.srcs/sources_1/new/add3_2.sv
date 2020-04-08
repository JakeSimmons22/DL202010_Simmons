`timescale 1ns / 1ps

module add3_2(
    input  [3:0] Cin,
    output reg [3:0] Cout);
    
always @*
    begin
     if (Cin > 4'd4)
        Cout = Cin + 4'd3;
    else
        Cout = Cin;
    end
    
endmodule //Add3
