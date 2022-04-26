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
        input CLK100MHZ,
        input [15:0] SW,
        output CA,
        output CB,
        output CC,
        output CD,
        output CE,
        output CF,
        output CG,
        output [7:0] AN
        //output wire [23:0] res,
        //output wire [23:0] res2
    );
    wire [23:0] res;
    wire [23:0] res2;
    reg rst = 0;
    wire start_i = 1;
    wire busy;
    wire[23:0] a = SW[15:8];
    wire[23:0] b = SW[7:0];
    //multipl ml(CLK100MHZ, rst, a, b, start_i, res2); 
    adder add(CLK100MHZ, a, b, res);
    seg7 seg7(x, CLK100MHZ, CA, CB, CC, CD, CE, CF, CG, AN);
endmodule
