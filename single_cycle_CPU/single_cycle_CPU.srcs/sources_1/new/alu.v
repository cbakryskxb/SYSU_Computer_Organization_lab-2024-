`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 08:52:14
// Design Name: 
// Module Name: alu
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
module alu(
    input [31:0] input1, //输入两个32位数
    input [31:0] input2,
    input [3:0] alu_ctrl, //输入alu控制
    output reg [31:0] alu_res, //输出运算结果
    output reg zero //零标志位
    );
    
    always @(*) begin
        case(alu_ctrl)
            4'b1111: alu_res = input1 & input2; //and
            4'b1110: alu_res = input1 | input2; //or
            4'b1101: alu_res = input1 ^ input2; //xor
            4'b1100: alu_res = ~(input1 | input2); //nor
            4'b0010: alu_res = input1 + input2; //add
            4'b0001: alu_res = input1 - input2; //sub
            4'b0011: begin //slt
                if(input1 < input2) begin
                    alu_res = 1;
                end else begin
                    alu_res = 0;
                end
            end
            4'b0100: alu_res = input2 << input1; //sll
            4'b0101: alu_res = input2 >> input1; //srl
            4'b0110: alu_res = $signed(input2) >>> input1; //sra，要先声明为有符号数才可以使用算术右移>>>
            default: alu_res = 0; //其他情况默认为0
        endcase
        if(alu_res == 0) //零标志位
            zero = 1;
        else
            zero = 0;
    end
endmodule
