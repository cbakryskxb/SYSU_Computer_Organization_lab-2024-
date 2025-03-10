`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 08:09:26
// Design Name: 
// Module Name: RegFile
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
module RegFile(
    input Clk,
    input [2:0] state,
    input Write_Reg, //д�Ĵ����ź�
    input [4:0]R_Addr_A, //�˿�A��ַ
    input [4:0]R_Addr_B, //�˿�B��ַ
    input [4:0]W_Addr, //д�Ĵ�����ַ
    input [31:0]W_Data, //д�Ĵ�������
    output [31:0]R_Data_A, //�˿�A����
    output [31:0]R_Data_B //�˿�B����
);
    
    reg [31:0]REG_Files[0:31]; //�Ĵ����ѣ�NUMB���Ĵ�����ÿ���Ĵ���SIZEλ
    integer i; //ѭ������
    initial
        for(i = 0; i < 32; i = i + 1)
            REG_Files[i] <= 0; //�Ĵ����ѳ�ʼ��
    always@(posedge Clk) begin
        if(Write_Reg && state == 3'b100)
            REG_Files[W_Addr] <= W_Data; //д�Ĵ���
    end
    assign R_Data_A = REG_Files[R_Addr_A]; //���˿�A
    assign R_Data_B = REG_Files[R_Addr_B]; //���˿�B
endmodule
