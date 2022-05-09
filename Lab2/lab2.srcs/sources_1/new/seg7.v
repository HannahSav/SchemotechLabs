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
    input BTND,
    input BTNR,
    
    output wire[15:0] LED,
    output LED16_B,
    output LED17_B,
    output reg CA, //display's segments
    output reg CB,
    output reg CC,
    output reg CD,
    output reg CE,
    output reg CF,
    output reg CG,
    output reg [7:0] AN//numbers of displays
    );
wire [23:0] res;

wire [2:0] s; //part of clkdiv to make delay
reg [3:0] digit; //display num
reg [19:0] clkdiv = 0; //pointer to make delay

wire start; 
wire rst;
reg rst_send;
reg start_send;

wire state;

main m(CLK100MHZ, SW, start_send, rst_send, res, state);



assign s = clkdiv[19:17];
assign LED[15:0] = SW[15:0];
assign LED17_B = BTND;
assign rst = BTNR;
assign start = BTND;
assign LED16_B = BTNR;

always @(posedge CLK100MHZ)
	case(s)
	   0:digit = res[3:0]; 
	   1:digit = res[7:4]; 
	   2:digit = res[11:8]; 
	   3:digit = res[15:12]; 
	   4:digit = res[19:16]; 
       5:digit = res[23:20]; 
       6:digit = 4'b0000;
       7:digit = 4'b0000; 
	   default:digit = res[3:0];
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
    #1;
    AN[s] = 0;
end

always @(posedge CLK100MHZ) begin
    clkdiv <= clkdiv+1;
    if(state == 2'b00)begin
        start_send <= start;
        rst_send <= rst;
    end
end

endmodule