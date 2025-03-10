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
    input Write_Reg, //写寄存器信号
    input [4:0]R_Addr_A, //端口A地址
    input [4:0]R_Addr_B, //端口B地址
    input [4:0]W_Addr, //写寄存器地址
    input [31:0]W_Data, //写寄存器数据
    output [31:0]R_Data_A, //端口A数据
    output [31:0]R_Data_B //端口B数据
);
    
    reg [31:0]REG_Files[0:31]; //寄存器堆，NUMB个寄存器，每个寄存器SIZE位
    integer i; //循环变量
    initial
        for(i = 0; i < 32; i = i + 1)
            REG_Files[i] <= 0; //寄存器堆初始化
    always@(posedge Clk) begin
        if(Write_Reg && state == 3'b100)
            REG_Files[W_Addr] <= W_Data; //写寄存器
    end
    assign R_Data_A = REG_Files[R_Addr_A]; //读端口A
    assign R_Data_B = REG_Files[R_Addr_B]; //读端口B
endmodule
