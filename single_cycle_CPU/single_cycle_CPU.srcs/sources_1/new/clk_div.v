`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 19:52:53
// Design Name: 
// Module Name: clk_div
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

module clock_div(
    input clk,//输入时钟信号，100MHz
    output reg clk_sys = 0//输出时钟信号，1Hz，初始化为0
);
reg [25:0] div_counter = 0;//26位计数器，用于分频

always @(posedge clk) begin
    if (div_counter >= 50000000) begin
        clk_sys <= ~clk_sys;//反转输出时钟信号
        div_counter <= 0;//重置计数器
    end else begin
        div_counter <= div_counter + 1;//计数器递增
    end
end
endmodule
