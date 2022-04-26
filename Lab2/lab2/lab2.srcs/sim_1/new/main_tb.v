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
    wire [23:0] res_test;
    wire [23:0] res2_test;
    main mod(
        .CLK100MHZ(CLK_test),
        .SW(SW_test),
        .res(res_test),
        .res2(res2_test)
    );
    reg[7:0] i, j;
    reg[23:0] s;
    initial begin
        i = 57; //57, 133
        j = 57;
        CLK_test = 1;
        SW_test[7:0] = i;
        SW_test[15:8] = j;
        #120;
        s = i * j;
        //#15;
        if(res2_test[23:0] == s[23:0])
            begin
            $display("Correct\n");  
            end
        else
            begin
            $display("Uncorrect res=%d, s=%d ", res2_test[23:0], s[23:0]);
            end
    end
    always begin
        #1;
        CLK_test = ~CLK_test;
    end
endmodule
