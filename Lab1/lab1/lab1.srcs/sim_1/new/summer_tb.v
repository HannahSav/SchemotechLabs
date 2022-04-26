`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2022 02:11:12
// Design Name: 
// Module Name: summer_tb
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


module summer_tb;

    reg [7:0] SW_test;
    wire [12:8] LED_test;
    summer mod(
        .SW(SW_test),
        .LED(LED_test)
    );
    
    integer i, j;
    initial begin
        SW_test = 'b0;
        for(i = 0; i < 16; i = i + 1)begin
            SW_test[3:0] = i;
            #5;   
            for(j = 0; j < 16; j = j + 1)begin
                SW_test[7:4] = j;
                #5;
                    if(LED_test[12:8] != i+j) begin
                        $display("UNCORRECT! %d + %d answer should be %d, but it is, %d",i, j, i+j, LED_test[12:8]);
                        $display("%d, %d, %d, %d, %d",LED_test[12], LED_test[11], LED_test[10], LED_test[9], LED_test[8]);
                    end
                $display("CORRECT on test %d +%d = %d", i, j, i+j);
            end
        end 
        $stop;
    end
endmodule
