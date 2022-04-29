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
    output reg [6:0] seg,
    output reg [7:0] an
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
    0:seg = 7'b1000000;			
    1:seg = 7'b1111001;
    2:seg = 7'b0100100;
    3:seg = 7'b0110000;
    4:seg = 7'b0011001;
    5:seg = 7'b0010010; 
    6:seg = 7'b0000010;
    7:seg = 7'b1111000;
    8:seg = 7'b0000000;
    9:seg = 7'b0010000;
    'hA:seg = 7'b0001000; 
    'hB:seg = 7'b0000011; 
    'hC:seg = 7'b1000110;
    'hD:seg = 7'b0100001;
    'hE:seg = 7'b0000110;
    'hF:seg = 7'b0001110;
    default: seg = 7'b0000000;
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

