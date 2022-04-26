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
    wire [15:0] res_test;
    wire [15:0] res2_test;
    main mod(
        .CLK100MHZ(CLK_test),
        .SW(SW_test),
        .res(res_test),
        .res2(res2_test)
    );
    reg[7:0] i, j;
    reg[15:0] s;
    initial begin
        i = 255; //255 254, 255 255
        j = 237;// 246+ not 247
        CLK_test = 1;
        for(i = 2 ;j <= 255; i = i+1) begin
            for(j = 251;j<=255; j = j+1 )begin 
                SW_test[7:0] = i;
                //#100
                SW_test[15:8] = j;
                s = i * j;
                #120;
                if(res2_test[15:0] != s[15:0])begin
                    $display("Uncorrect res=%d, s=%d, i=%d, j=%d", res2_test[23:0], s[23:0], i, j);
                end
            end
        end
    end
    always begin
        #1;
        CLK_test = ~CLK_test;
    end
endmodule
