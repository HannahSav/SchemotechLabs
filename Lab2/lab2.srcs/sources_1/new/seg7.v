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
    input wire[15:0] SW,
    input CLK100MHZ,
    output reg CA, //display's segments
    output reg CB,
    output reg CC,
    output reg CD,
    output reg CE,
    output reg CF,
    output reg CG,
    output reg [7:0] AN, //numbers of displays
    output wire [15:0] summ,
    output wire[15:0] mult
	 );
	 
wire [2:0] s; //part of clkdiv to make delay
reg [3:0] digit; //display num
reg [7:0] clkdiv = 0; //pointer to make delay
 
// our result number <-nenorm output
//wire[23:0] x = 24'b000100010010001000011000; <- norm output

main m(CLK100MHZ, SW, summ, mult);

assign s = clkdiv[7:5];

always @(posedge CLK100MHZ)
	case(s)
	   0:digit = mult[3:0]; 
	   1:digit = mult[7:4]; 
	   2:digit = mult[11:8]; 
	   3:digit = mult[15:12]; 
	   4:digit = 4'b0000; 
       5:digit = 4'b0000; 
       6:digit = 4'b0000;
       7:digit = 4'b0000; 
	   default:digit = mult[3:0];
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
    AN=8'b11111111;
    AN[s] = 0;
end

always @(posedge CLK100MHZ) begin
    clkdiv <= clkdiv+1;
end

endmodule
