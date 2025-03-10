`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 16:38:31
// Design Name: 
// Module Name: ID_EX_reg
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


module ID_EX_reg(
    input clk,
    input RegDst_in,
    input aluSrc_in,
    input MemWrite_in,
    input MemRead_in,
    input RegWrite_in,
    input MemtoReg_in,
    input shift_in,
    input ExtOp_in,
    input [1:0] branch_in,
    input [3:0] aluOp_in,
    input [4:0] rs_in,
    input [4:0] rt_in,
    input [4:0] rd_in,
    input [4:0] shamt_in,
    input [5:0] func_in,
    input [31:0] R_Data_A_in,
    input [31:0] R_Data_B_in,
    input [15:0] imme_in,
    output reg RegDst_out,
    output reg aluSrc_out,
    output reg MemWrite_out,
    output reg MemRead_out,
    output reg RegWrite_out,
    output reg MemtoReg_out,
    output reg shift_out,
    output reg ExtOp_out,
    output reg [1:0] branch_out,
    output reg [3:0] aluOp_out,
    output reg [4:0] rs_out,
    output reg [4:0] rt_out,
    output reg [4:0] rd_out,
    output reg [4:0] shamt_out,
    output reg [5:0] func_out,
    output reg [31:0] R_Data_A_out,
    output reg [31:0] R_Data_B_out,
    output reg [15:0] imme_out
    );
    reg RegDst;
    reg aluSrc;
    reg MemWrite;
    reg MemRead;
    reg RegWrite;
    reg MemtoReg;
    reg shift;
    reg ExtOp;
    reg [1:0] branch;
    reg [3:0] aluOp;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [4:0] shamt;
    reg [5:0] func;
    reg [31:0] R_Data_A;
    reg [31:0] R_Data_B;
    reg [15:0] imme;
    initial begin
        RegDst <= 0;
        aluSrc <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        RegWrite <= 0;
        MemtoReg <= 0;
        shift <= 0;
        ExtOp <= 0;
        branch <= 2'b0;
        aluOp <= 4'b0;
        rs <= 5'b0;
        rt <= 5'b0;
        rd <= 5'b0;
        shamt <= 5'b0;
        func <= 5'b0;
        R_Data_A <= 32'b0;
        R_Data_B <= 32'b0;
        imme <= 32'b0;
    end

    always @(posedge clk) begin
        RegDst_out <= RegDst;
        aluSrc_out <= aluSrc;
        MemWrite_out <= MemWrite;
        MemRead_out <= MemRead;
        RegWrite_out <= RegWrite;
        MemtoReg_out <= MemtoReg;
        shift_out <= shift;
        ExtOp_out <= ExtOp;
        branch_out <= branch;
        aluOp_out <= aluOp;
        rs_out <= rs;
        rt_out <= rt;
        rd_out <= rd;
        shamt_out <= shamt;
        func_out <= func;
        R_Data_A_out <= R_Data_A;
        R_Data_B_out <= R_Data_B;
        imme_out <= imme;
    end
    always @(negedge clk) begin //如果这样不行的话就模仿寄存器堆使用assign
        RegDst <= RegDst_in;
        aluSrc <= aluSrc_in;
        MemWrite <= MemWrite_in;
        MemRead <= MemRead_in;
        RegWrite <= RegWrite_in;
        MemtoReg <= MemtoReg_in;
        shift <= shift_in;
        ExtOp <= ExtOp_in;
        branch <= branch_in;
        aluOp <= aluOp_in;
        rs <= rs_in;
        rt <= rt_in;
        rd <= rd_in;
        shamt <= shamt_in;
        func <= func_in;
        R_Data_A <= R_Data_A_in;
        R_Data_B <= R_Data_B_in;
        imme <= imme_in;
    end
endmodule
