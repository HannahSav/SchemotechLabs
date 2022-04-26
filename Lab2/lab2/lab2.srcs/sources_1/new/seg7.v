`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2022 14:56:31
// Design Name: 
// Module Name: seg7
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


module seg7(
    input [23:0] x_i,
    input clk,
    output reg ca, //display's segments
    output reg cb,
    output reg cc,
    output reg cd,
    output reg ce,
    output reg cf,
    output reg cg,
    output reg [7:0] an //numbers of displays
	 );
 
wire [23:0] x = x_i; // our result number <-nenorm output
//wire[23:0] x = 24'b000100010010001000011000; <- norm output



wire [2:0] s; //part of clkdiv to make delay
reg [3:0] digit; //display num
//wire [7:0] aen; //pointer of display num
reg [19:0] clkdiv = 0; //pointer to make delay

assign s = clkdiv[19:17];
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
        0:{ca, cb, cc, ce, cd, cf, cg} = 7'b0000001;				
        1:{ca, cb, cc, ce, cd, cf, cg} = 7'b1001111;
        2:{ca, cb, cc, ce, cd, cf, cg} = 7'b0010010;
        3:{ca, cb, cc, ce, cd, cf, cg} = 7'b0000110;
        4:{ca, cb, cc, ce, cd, cf, cg} = 7'b1001100;
        5:{ca, cb, cc, ce, cd, cf, cg} = 7'b0100100; 
        6:{ca, cb, cc, ce, cd, cf, cg} = 7'b0100000;
        7:{ca, cb, cc, ce, cd, cf, cg} = 7'b0001111;
        8:{ca, cb, cc, ce, cd, cf, cg} = 7'b0000000;
        9:{ca, cb, cc, ce, cd, cf, cg} = 7'b0000100;
        'hA:{ca, cb, cc, ce, cd, cf, cg} = 7'b0001000; 
        'hB:{ca, cb, cc, ce, cd, cf, cg} = 7'b1100000; 
        'hC:{ca, cb, cc, ce, cd, cf, cg} = 7'b0110001;
        'hD:{ca, cb, cc, ce, cd, cf, cg} = 7'b1000010;
        'hE:{ca, cb, cc, ce, cd, cf, cg} = 7'b0110000;
        'hF:{ca, cb, cc, ce, cd, cf, cg} = 7'b0111000;
        default: {ca, cb, cc, ce, cd, cf, cg} = 7'b0000000;
    endcase

always @(*)begin
    an=8'b11111111;
    an[s] = 0;
end

always @(posedge clk) begin
    clkdiv <= clkdiv+1;
end

endmodule
