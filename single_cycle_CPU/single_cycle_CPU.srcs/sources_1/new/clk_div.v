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
    input clk,//����ʱ���źţ�100MHz
    output reg clk_sys = 0//���ʱ���źţ�1Hz����ʼ��Ϊ0
);
reg [25:0] div_counter = 0;//26λ�����������ڷ�Ƶ

always @(posedge clk) begin
    if (div_counter >= 50000000) begin
        clk_sys <= ~clk_sys;//��ת���ʱ���ź�
        div_counter <= 0;//���ü�����
    end else begin
        div_counter <= div_counter + 1;//����������
    end
end
endmodule
