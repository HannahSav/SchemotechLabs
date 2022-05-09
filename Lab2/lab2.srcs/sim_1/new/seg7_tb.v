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
    reg[15:0] SW;
    reg clk = 0;
    
    reg BTND;
    reg BTNR;
    wire[15:0] LED;
    wire LED16_B;
    wire LED17_B;
    
    wire CA; //display's segments
    wire CB;
    wire CC;
    wire CD;
    wire CE;
    wire CF;
    wire CG;
    wire [7:0] AN ;//numbers of display
    seg7 mod(
    SW,
    clk,
    BTND,
    BTNR,
    LED,
    LED16_B,
    LED17_B, 
    CA,
    CB,
    CC,
    CD,
    CE,
    CF,
    CG,
    AN
    );
    //integer i;
    initial begin
        clk = 1;
        SW = 16'b1111111111111111;
        BTND = 1;
        BTNR = 0;
        #10;
        BTND = 0;
        #300;
        SW = 16'b1111100000000011;
        #10;
        BTND = 1;
        #5;
        BTND = 0;
        #250;
        SW = 16'b0011100000000101;
        BTND = 1;
        #10;
        BTND = 0;
        #350;
        SW = 16'b1111100000001101;
        #50;
        BTND = 1;
        #25;
         #5;
        BTND = 0;
        #350;
        SW = 16'b0000000000000000;
        BTND = 1;
        #10;
        BTND = 0;
        #250;
        /*for (i = 0; i < 10000; i = i+1) begin 
            clk = clk + 1; 
            #1; 
        end */
    end
    always begin
        #1;
        clk = ~clk;
    end
endmodule