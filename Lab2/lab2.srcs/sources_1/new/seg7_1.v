`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2022 02:02:43
// Design Name: 
// Module Name: seg7_1
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


module seg7_1(
    input [23:0] x_i,
    input clk,
    input [19:0] clkdiv,
    output CA, //display's segments
    output CB,
    output CC,
    output CD,
    output CE,
    output CF,
    output CG,
    output [7:0] an
    //output wire dp 
	 );
 
wire [23:0] x = x_i;	 
wire [2:0] s;	 
reg [3:0] digit;
//wire [7:0] aen;
//reg [19:0] clkdiv = 0;

//assign dp = 1;
assign s = clkdiv[3:1];
//assign aen = 8'b11111111; 

always @(posedge clk)
	case(s)
	0:digit = x[3:0]; 
	1:digit = x[7:4]; 
	2:digit = x[11:8]; 
	3:digit = x[15:12]; 
	4:digit = x[19:16]; 
    5:digit = x[23:20]; 
    6:digit = 4'b0000;
    7:digit = 4'b0000; 
	default:digit = x[3:0];
	endcase
always @(*)
   case(digit)
        0:{CA, CB, CC, CD, CE, CF, CG} = 7'b0000001;				
        1:{CA, CB, CC, CD, CE, CF, CG} = 7'b1001111;
        2:{CA, CB, CC, CD, CE, CF, CG} = 7'b0010010;
        3:{CA, CB, CC, CD, CE, CF, CG} = 7'b0000110;
        4:{CA, CB, CC, CD, CE, CF, CG} = 7'b1001100;
        5:{CA, CB, CC, CD, CE, CF, CG} = 7'b0100100; 
        6:{CA, CB, CC, CD, CE, CF, CG} = 7'b0100000;
        7:{CA, CB, CC, CD, CE, CF, CG} = 7'b0001111;
        8:{CA, CB, CC, CD, CE, CF, CG} = 7'b0000000;
        9:{CA, CB, CC, CD, CE, CF, CG} = 7'b0000100;
        'hA:{CA, CB, CC, CD, CE, CF, CG} = 7'b0001000; 
        'hB:{CA, CB, CC, CD, CE, CF, CG} = 7'b1100000; 
        'hC:{CA, CB, CC, CD, CE, CF, CG} = 7'b0110001;
        'hD:{CA, CB, CC, CD, CE, CF, CG} = 7'b1000010;
        'hE:{CA, CB, CC, CD, CE, CF, CG} = 7'b0110000;
        'hF:{CA, CB, CC, CD, CE, CF, CG} = 7'b0111000;
        default: {CA, CB, CC, CD, CE, CF, CG} = 7'b0000000;
    endcase

always @(*)begin
    an=8'b11111111;
    an[s] = 0;
end
/*
always @(posedge clk) begin
    clkdiv <= clkdiv+1;
end*/
endmodule 

