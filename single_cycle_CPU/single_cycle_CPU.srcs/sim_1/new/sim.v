`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 13:12:17
// Design Name: 
// Module Name: sim
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

`define clk_period 10
module sim();
    reg clk;
    reg clr;
    wire [14:0] D1;
    wire [14:0] D2;
    wire [14:0] D3;
    wire [14:0] D4;
    wire [14:0] D5;
    wire [14:0] D6;
    wire [14:0] D7;
    wire [14:0] D8;
    wire [14:0] D9;
    wire [14:0] D10;
    wire [31:0] pc;
    wire [31:0] inst;
    wire [4:0] W_Addr;
    wire [31:0] W_Data;
    wire [31:0] R_Data_A;
    wire [31:0] R_Data_B;
    wire [31:0] alu_res;
    wire [31:0] R_Mem_Data;
    wire RegDst;
    wire aluSrc;
    wire MemWrite;
    wire MemRead;
    wire RegWrite;
    wire MemtoReg;
    wire shift;
    wire [1:0] branch;
    wire branchCtrl;
    wire jmp;
    wire ExtOp;
    wire [3:0] aluOp;
    wire [3:0] aluCtrl;
    wire [31:0] alu1;
    wire [31:0] alu2;
    wire zero;
    Top top(
        .clk(clk),
        .clr(clr),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .D5(D5),
        .D6(D6),
        .D7(D7),
        .D8(D8),
        .D9(D9),
        .D10(D10),
        .pc(pc),
        .inst(inst),
        .W_Addr(W_Addr),
        .W_Data(W_Data),
        .R_Data_A(R_Data_A),
        .R_Data_B(R_Data_B),
        .alu_res(alu_res),
        .R_Mem_Data(R_Mem_Data),
        .RegDst(RegDst),
        .aluSrc(aluSrc),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg),
        .shift(shift),
        .branch(branch),
        .branchCtrl(branchCtrl),
        .jmp(jmp),
        .ExtOp(ExtOp),
        .aluOp(aluOp),
        .aluCtrl(aluCtrl),
        .alu1(alu1),
        .alu2(alu2),
        .zero(zero)
    );
    initial clk = 1'b0;
    always #(`clk_period / 2) clk = ~clk;
    //初始块：复位和仿真
    initial begin;
        clr = 1'b1;
        #(`clk_period * 3);
        clr = 1'b0;
        #(`clk_period * 1000);
        $stop;
    end    
endmodule
