`timescale 1ns / 1ps
//ELC 2137 Jake Simmons 2020-3-29

module ALU_Test();
    reg [7:0] in0;
    reg [7:0] in1;
    reg [7:0] op;
    wire [7:0] out;
    
    ALU alu(
        .in0(in0), .in1(in1), .op(op), .out(out)
    );
    initial 
        begin
        in0 = 8'd5; in1 = 8'd5; op = 0; #10;
        in0 = 8'd10; in1 = 8'd5; op = 1; #10;
        in0 = 8'd1; in1 = 8'd2; op = 2; #10;
        in0 = 8'd3; in1 = 8'd4; op = 3; #10;
        in0 = 8'd5; in1 = 8'd6; op = 4; #10;
        in0 = 8'd15; in1 = 8'd12; op = 5; #10;
        end
endmodule