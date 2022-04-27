`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 16:04:54
// Design Name: 
// Module Name: main
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


module main(
        input clk,
        input wire [15:0] x,
        //input wire start,
        //input wire r,
        
        output wire [15:0] res,
        output wire [15:0] res2
       /* output reg CA,
        output wire CB,
        output wire CC,
        output wire CD,
        output wire CE,
        output wire CF,
        output wire CG,
        output [7:0] AN*/
        //output wire [23:0] res,
        //output wire [23:0] res2
    );
    //wire [23:0] res2;
    wire rst = 0;
    wire start_i = 1;
    //assign start_i = start;
    //assign rst = r;
    wire busy;
    wire[7:0] a = x[15:8];
    wire[7:0] b = x[7:0];
    adder add(clk, a, b, res);
    multipl ml(clk, rst, a, b, start_i, busy, res2); 
    //seg7 seg7(x, CLK100MHZ, CA, CB, CC, CD, CE, CF, CG, AN);
endmodule
