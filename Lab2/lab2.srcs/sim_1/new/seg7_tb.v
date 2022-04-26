`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2022 01:04:17
// Design Name: 
// Module Name: seg7_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seg7_tb;
    wire[15:0] SW = 16'b1111111000000001;
    reg clk = 0;
    wire CA; //display's segments
    wire CB;
    wire CC;
    wire CD;
    wire CE;
    wire CF;
    wire CG;
    wire [7:0] AN ;//numbers of displays
    wire [15:0] summ;
    wire [15:0] mult;
    seg7 mod(
    SW,
    clk, 
    CA,
    CB,
    CC,
    CD,
    CE,
    CF,
    CG,
    AN,
    summ,
    mult
    );
    integer i;
    initial begin
        for (i = 0; i < 10000; i = i+1) begin 
            clk = clk + 1; 
            #1; 
        end 
    end
endmodule
