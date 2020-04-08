`timescale 1ns / 1ps
//ELC 2137 Jake Simmons 2020-4-8

module calc_lab10(
    output [15:0] Led
    );
    wire [7:0] W1;
    sseg4_TDM disp_unit( .data(), .hex_dec(), .reset(), .clock(),
    .sign(), .seg(), .dp(), .an());
    
    top_lab9 calc_unit( .btnU(), .btnD(), .sw(),
    .clk(), .btnC(), .Led(W1) );
    
    assign Led[7:0] = W1;
endmodule
