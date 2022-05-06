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
        input wire [15:0] SW,
        input wire start_in,
        input wire rst_in,
       
        output wire [23:0] res,
        output [1:0] state_o
    );
    localparam IDLE = 2'b00;
    localparam WORK1 = 2'b01;
    localparam WORK2 = 2'b10;
    localparam WORK3 = 2'b11;
   
    //wire start;
    reg start_r;
    //assign start = start_r;//rst_in
    
    //wire rst;
    reg rst_r;
    //assign rst = rst_r;//rst_r
    
    wire rst_m;
    reg rst_m_r;
    assign rst_m = rst_m_r;
    
    wire start_m; 
    reg start_m_r; 
    assign start_m = start_m_r;
    
    reg [1:0] state = IDLE;
    assign state_o = state;
    
    wire busy;
    wire[7:0] a;
    reg [7:0] a_r;
    assign a = a_r;
    
    wire[15:0] b;
    reg[15:0] b_r;
    assign b = b_r;

    wire [23:0] result_func;
    reg [23:0] result_mult;
    reg [23:0] result_cube;
    reg [23:0] send_a_adder;
    reg [23:0] send_b_adder;
    
    reg [19:0] clkdiv = 0;
    always @(posedge clk)
        if (rst_r && rst_in) begin
           send_a_adder <= 0;
           send_b_adder <= 0;
           result_mult <= 0;
           result_cube <= 0;
           state <= IDLE;//
           rst_m_r <= 1;
        end else begin
            case (state)
                IDLE:
                  if (start_in && start_r)  
                  begin
                        state <= WORK1;
                        b_r <= SW[15:8];
                        a_r <= SW[7:0];
                        rst_m_r <= 0;
                        start_m_r <= start_in;
                   end else begin
                        send_a_adder <= result_mult;
                        send_b_adder <= result_cube;
                   end
                WORK1:
                    begin
                       if(!busy && !start_m) begin
                            result_mult <= result_func;
                            state <= WORK2;
                            b_r <= SW[7:0];
                            rst_m_r <= 0;
                            start_m_r <= 1;
                            start_r <= 0;
                       end else if(busy) begin
                            start_m_r <= 0;
                       end
                    end
                WORK2:
                    begin
                       if(!busy && !start_m) begin
                            state <= WORK3;
                            b_r <= result_func;
                            rst_m_r <= 0;
                            start_m_r <= 1;
                            start_r <= 0;
                       end else if(busy) begin
                            start_m_r <= 0;
                       end
                    end
                WORK3:
                    begin
                       if(!busy && !start_m) begin
                            result_cube <= result_func;
                            start_m_r <= 0; 
                            state <= IDLE;
                            start_r <= 0;
                       end else if(busy) begin
                            start_m_r <= 0;
                       end
                    end
            endcase
        end
        
    always @(posedge clk) begin
        clkdiv <= clkdiv+1;
    end
        
    always @(start_in)begin
        start_r <= 1;
    end   
    always @(rst_in)begin
        rst_r <= 1;
    end   
     
    adder add(clk, send_a_adder, send_b_adder, res);
    multipl ml(clk, rst_m, a, b, start_m, busy, result_func); 
endmodule