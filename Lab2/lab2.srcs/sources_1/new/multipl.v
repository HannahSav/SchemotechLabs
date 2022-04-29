`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2022 20:14:41
// Design Name: 
// Module Name: multipl
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


module multipl( 
    input clk_i,
    input rst_i,
    
    input [7:0] a_bi,
    input [15:0] b_bi,
    input start_i,
    
    output busy_o,
    output reg [23:0] y_bo
);

    localparam IDLE = 1'b0;
    localparam WORK = 1'b1;

    reg [4:0] ctr; //perenos
    wire [3:0] end_step; //number length
    wire [7:0] part_sum;
    wire [23:0] shifted_part_sum;
    reg [7:0] a;
    reg [15:0] b;
    reg [23:0] part_res;
    reg state = IDLE;
    
    assign part_sum = a & {16{b[ctr]}};
    assign shifted_part_sum = part_sum << ctr;
    assign end_step = (ctr == 5'b10000); 
    assign busy_o = state; ///BUSY ?? ???????? ????????????....
    
    always @(posedge clk_i)
        if (rst_i) begin
            ctr <= 0;
            part_res <= 0;
            y_bo <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE:
                    if (start_i) begin
                        state <= WORK;
                        a <= a_bi;
                        b <= b_bi;
                        ctr <= 0;
                        part_res <= 0;
                    end
                WORK:
                    begin
                        if (end_step) begin
                            state <= IDLE;
                            y_bo <= part_res;
                        end
                        part_res <= part_res + shifted_part_sum;
                        ctr <= ctr + 1 ;
                    end
            endcase
        end
endmodule
