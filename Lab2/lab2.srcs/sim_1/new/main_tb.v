`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 17:38:46
// Design Name: 
// Module Name: main_tb
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


module main_tb;
    reg CLK_test;
    reg [15:0] SW_test;
    reg start = 1;
    reg rst = 0;
    
    wire [6:0] SEG;
    wire [7:0] AN;
    
    wire [23:0] res_test;
    wire [1:0] state;
    main mod(
        .clk(CLK_test),
        .x(SW_test),
        .start_in(start),
        .rst_in(rst),
        .SEG(SEG),
        .AN(AN),
        .res(res_test),
        .state_o(state)
    );
    reg[7:0] i, j;
    reg[23:0] s;
    reg[23:0] mult2;
    reg[15:0] a22;
    reg[23:0] cube2;
    initial begin
        i = 255; //253, 80,   53 80, 53 42
        j = 153;// ok but only if answer is lower then 001000
        CLK_test = 1;
        SW_test[7:0] = i;
        SW_test[15:8] = j;
        #150;
        s = i*j + i*i*i;
        mult2 = i*j;
        a22 = i*i;
        cube2 = i*i*i;
    end
    always begin
        #1;
        CLK_test = ~CLK_test;
    end
endmodule