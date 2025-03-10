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
    input [31:0] input1, //��������32λ��
    input [31:0] input2,
    input [3:0] alu_ctrl, //����alu����
    output reg [31:0] alu_res, //���������
    output reg zero //���־λ
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
            4'b0110: alu_res = $signed(input2) >>> input1; //sra��Ҫ������Ϊ�з������ſ���ʹ����������>>>
            default: alu_res = 0; //�������Ĭ��Ϊ0
        endcase
        if(alu_res == 0) //���־λ
            zero = 1;
        else
            zero = 0;
    end
endmodule
