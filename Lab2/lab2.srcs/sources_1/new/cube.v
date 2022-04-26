`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2022 20:15:09
// Design Name: 
// Module Name: cube
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


module cube(
    input clk,
    input rst,
    input [7:0] a,
    input start,
    output reg [23:0] res
    );
    
    localparam IDLE = 1'b0;
    localparam WORK = 1'b1;
    reg state = IDLE;
    
    reg [23:0] add1;
    reg [23:0] add2;
    wire [23:0] sum;
    reg squared;
    reg [7:0] ctr;
    adder adder (clk, add1, add2, sum);
    
    always @(posedge clk)
        if (rst) begin
            ctr <= 0;
            res <= 0;
            squared <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE:
                    if (start) begin
                        if (a <= 1) begin // 1or0
                            res <= a;
                        end else begin
                            state <= WORK;
                            ctr <= 0;
                            add1 <= 0;
                            add2 <= a;
                            squared <= 0;
                        end
                    end
                WORK:
                    begin
                        if (ctr >= a-1) begin
                            if (squared == 0) begin
                                squared <= 1;
                                add1 <= sum;
                                add2 <= sum;
                                ctr <= 1;
                            end else begin
                                state <= IDLE;
                                res <= sum;
                            end    
                        end else begin
                            add1 <= sum;
                            ctr <= ctr + 1;
                        end
                    end
            endcase
        end
endmodule

