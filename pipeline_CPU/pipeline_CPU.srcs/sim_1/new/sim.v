`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/06 19:37:15
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
    wire [31:0] pc;
    wire [31:0] inst;
    wire [31:0] IF_ID_inst;
    wire [31:0] ID_EX_R_Data_A;
    wire [31:0] ID_EX_R_Data_B;
    wire [15:0] ID_EX_imme;
    wire [4:0] ID_EX_rs;
    wire [4:0] ID_EX_rt;
    wire [4:0] ID_EX_rd;
    wire [4:0] ID_EX_shamt;
    wire [5:0] ID_EX_func;
    wire ID_EX_RegDst;
    wire ID_EX_aluSrc;
    wire ID_EX_MemWrite;
    wire ID_EX_MemRead;
    wire ID_EX_RegWrite;
    wire ID_EX_MemtoReg;
    wire ID_EX_shift;
    wire ID_EX_ExtOp;
    wire [1:0] ID_EX_branch;
    wire [3:0] ID_EX_aluOp;
    wire [31:0] rs_Data;
    wire [31:0] rt_Data;
    wire [31:0] ForwardingMux1_res;
    wire [31:0] ForwardingMux2_res;
    wire [31:0] alu1;
    wire [31:0] alu2;
    wire [4:0] EX_MEM_rd;
    wire [31:0] EX_MEM_write_data;
    wire [31:0] EX_MEM_alu_res;
    wire EX_MEM_MemWrite;
    wire EX_MEM_MemRead;
    wire EX_MEM_RegWrite;
    wire EX_MEM_MemtoReg;
    wire [4:0] MEM_WB_rd;
    wire [31:0] MEM_WB_mem_data;
    wire [31:0] MEM_WB_alu_res;
    wire MEM_WB_RegWrite;
    wire MEM_WB_MemtoReg;
    wire [31:0] W_Data;
    wire [1:0] ForwardA;
    wire [1:0] ForwardB;
    wire ForwardC;
    wire ForwardD;
    wire zero;
    wire branchCtrl;
    wire jmp;
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
    top top(
        .clk(clk),
        .clr(clr),
        .pc(pc),
        .inst(inst),
        .IF_ID_inst(IF_ID_inst),
        .ID_EX_R_Data_A(ID_EX_R_Data_A),
        .ID_EX_R_Data_B(ID_EX_R_Data_B),
        .ID_EX_imme(ID_EX_imme),
        .ID_EX_rs(ID_EX_rs),
        .ID_EX_rt(ID_EX_rt),
        .ID_EX_rd(ID_EX_rd),
        .ID_EX_shamt(ID_EX_shamt),
        .ID_EX_func(ID_EX_func),
        .ID_EX_RegDst(ID_EX_RegDst),
        .ID_EX_aluSrc(ID_EX_aluSrc),
        .ID_EX_MemWrite(ID_EX_MemWrite),
        .ID_EX_MemRead(ID_EX_MemRead),
        .ID_EX_RegWrite(ID_EX_RegWrite),
        .ID_EX_MemtoReg(ID_EX_MemtoReg),
        .ID_EX_shift(ID_EX_shift),
        .ID_EX_ExtOp(ID_EX_ExtOp),
        .ID_EX_branch(ID_EX_branch),
        .ID_EX_aluOp(ID_EX_aluOp),
        .rs_Data(rs_Data),
        .rt_Data(rt_Data),
        .ForwardingMux1_res(ForwardingMux1_res),
        .ForwardingMux2_res(ForwardingMux2_res),
        .alu1(alu1),
        .alu2(alu2),
        .EX_MEM_rd(EX_MEM_rd),
        .EX_MEM_write_data(EX_MEM_write_data),
        .EX_MEM_alu_res(EX_MEM_alu_res),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .EX_MEM_MemtoReg(EX_MEM_MemtoReg),
        .MEM_WB_rd(MEM_WB_rd),
        .MEM_WB_mem_data(MEM_WB_mem_data),
        .MEM_WB_alu_res(MEM_WB_alu_res),
        .MEM_WB_RegWrite(MEM_WB_RegWrite),
        .MEM_WB_MemtoReg(MEM_WB_MemtoReg),
        .W_Data(W_Data),
        .ForwardA(ForwardA),
        .ForwardB(ForwardB),
        .ForwardC(ForwardC),
        .ForwardD(ForwardD),
        .zero(zero),
        .branchCtrl(branchCtrl),
        .jmp(jmp),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .D5(D5),
        .D6(D6),
        .D7(D7),
        .D8(D8),
        .D9(D9),
        .D10(D10)
    );
    initial clk = 1'b0;
    always #(`clk_period / 2) clk = ~clk;
    //初始块：复位和仿真
    initial begin;
        clr = 1'b0;
        #(`clk_period * 10000);
        $stop;
    end   
endmodule
