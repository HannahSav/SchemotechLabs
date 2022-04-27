`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 16:04:54
// Design Name: 
// Module Name: main
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


module main(
        input clk,
        input wire [15:0] x,
        //input wire start,
        //input wire r,
        
        output wire [23:0] res,
        //output reg [15:0] result_mult,
        //output reg [15:0] a2,
        //output reg [23:0] result_cube,
        
        output wire[1:0] state_o
    );
    localparam IDLE = 2'b00;
    localparam WORK1 = 2'b01;
    localparam WORK2 = 2'b10;
    localparam WORK3 = 2'b11;
    
    wire rst;
    reg rst_reg = 0;
    assign rst = rst_reg;
    
    wire rst_m;
    reg rst_m_reg = 1;
    assign rst_m = rst_m_reg;
    
    wire start_i; 
    reg start_r = 0;
    assign start_i = start_r;
    
    reg [1:0] state = IDLE;
    assign state_o = state;
    
    wire busy;
    wire[7:0] a;
    reg [7:0] a_reg;
    assign a = a_reg;
    
    wire[15:0] b;
    reg[15:0] b_r;
    assign b = b_r;
    
    reg [15:0] a2;
    wire [23:0] result_func;
    reg [15:0] result_mult; //not right
    reg [23:0] result_cube; // not right
    
    
    always @(posedge clk)
        if (rst) begin
           a2 <= 0;
           result_cube <= 0;
           result_mult <= 0;
           state <= IDLE;
           start_r <= 1;
        end else begin
            case (state)
                IDLE:
                  //  if (!busy) 
                  begin
                        state <= WORK1;
                        b_r <= x[7:0];
                        a_reg <= x[7:0];
                        start_r <= 1;
                        rst_m_reg = 0;
                    end
                WORK1:
                    begin
                       if(!busy) begin
                            result_mult <= result_func;
                            state <= WORK2;
                            b_r <= x[15:8];
                            rst_m_reg = 0;
                       end //else
                       //    start_r <= 0;
                    end
                WORK2:
                    begin
                       if(!busy && start_i) begin
                            a2 <= result_func;
                            state <= WORK3;
                            b_r <= a2;
                            rst_m_reg = 0;
                       end
                    end
                WORK3:
                    begin
                       if(!busy && start_i) begin
                            result_cube <= result_func;
                            start_r = 0; 
                            state <= IDLE;
                       end
                    end
            endcase
        end
        
    adder add(clk, result_mult, result_cube, res);
    multipl ml(clk, rst_m, a, b, start_i, busy, result_func); 
endmodule
