`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 08:10:50
// Design Name: 
// Module Name: display
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
module display(
    input clk,
    input [15:0] data,
    output [3:0] seg,
    output [6:0] a_to_g
    );
    //时钟分频
    integer clk_cnt;
    reg clk_div = 0;
    always @(posedge clk) begin
        if(clk_cnt == 32'd99999) begin
            clk_cnt <= 0;
            clk_div = ~clk_div;
        end
        else begin
            clk_cnt <= clk_cnt + 1;
        end 
    end
    //位控制
    reg [3:0] seg_ctrl = 4'b1110;
    always @(posedge clk_div) begin //循环控制每一位
        seg_ctrl <= {seg_ctrl[2:0], seg_ctrl[3]}; //循环左移
    end
    //段控制
    reg [3:0] a_to_g_ctrl;
    always @(seg_ctrl) begin
        //根据位选信号选择数据的其中4位
        case(seg_ctrl)
            4'b1110: a_to_g_ctrl = data[3:0]; // 选择低4位
            4'b1101: a_to_g_ctrl = data[7:4]; // 选择次低4位
            4'b1011: a_to_g_ctrl = data[11:8]; // 选择次高4位
            4'b0111: a_to_g_ctrl = data[15:12]; // 选择最高4位
            default: a_to_g_ctrl = 4'hf; //默认f
        endcase
    end
    //段选
    reg [6:0] a_to_g_temp;
    always @(a_to_g_ctrl) begin
        case(a_to_g_ctrl)
            4'b0000: a_to_g_temp = 7'b0000001;
            4'b0001: a_to_g_temp = 7'b1001111;
            4'b0010: a_to_g_temp = 7'b0010010;
            4'b0011: a_to_g_temp = 7'b0000110;
            4'b0100: a_to_g_temp = 7'b1001100;
            4'b0101: a_to_g_temp = 7'b0100100;
            4'b0110: a_to_g_temp = 7'b0100000;
            4'b0111: a_to_g_temp = 7'b0001111;
            4'b1000: a_to_g_temp = 7'b0000000;
            4'b1001: a_to_g_temp = 7'b0000100;
            4'b1010: a_to_g_temp = 7'b0001000;
            4'b1011: a_to_g_temp = 7'b1100000;
            4'b1100: a_to_g_temp = 7'b0110001;
            4'b1101: a_to_g_temp = 7'b1000010;
            4'b1110: a_to_g_temp = 7'b0110000;
            4'b1111: a_to_g_temp = 7'b0111000;
            default: a_to_g_temp = 7'b0000001;
        endcase
    end
    //给输出信号赋值
    assign seg = seg_ctrl;
    assign a_to_g = a_to_g_temp;
endmodule
