`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2022 12:05:37
// Design Name: 
// Module Name: summer
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


module summer(
    input [7:0] SW,
    output [12:8] LED
    );
    
    wire res0, res1, res2, res3, xor1, xor2, xor3, or1, or2, or3, and1, and2, and3, and_c1, and_c2, and_c3, c_0, c_1, c_2, c_3;
    
    xor(res0, SW[0], SW[4]);
    and(c_0, SW[0], SW[4]);
    assign LED[8] = res0;
    
    or(or1, SW[1], SW[5]);
    xor(xor1, SW[1], SW[5]);
    and(and1, SW[1], SW[5]);
    and(and_c1, or1, c_0);
    or(c_1, and_c1, and1);
    xor(res1, xor1, c_0);
    assign LED[9] = res1;
    
    or(or2, SW[2], SW[6]);
    xor(xor2, SW[2], SW[6]);
    and(and2, SW[2], SW[6]);
    and(and_c2, or2, c_1);
    or(c_2, and_c2, and2);
    xor(res2, xor2, c_1);
    assign LED[10] = res2;
    
    or(or3, SW[3], SW[7]);
    xor(xor3, SW[3], SW[7]);
    and(and3, SW[3], SW[7]);
    and(and_c3, or3, c_2);
    or(c_3, and_c3, and3);
    xor(res3, xor3, c_2);
    assign LED[11] = res3;
    
    assign LED[12] = c_3;
    
endmodule