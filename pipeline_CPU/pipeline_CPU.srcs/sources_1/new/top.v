`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 19:34:44
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input clr,
    output reg [31:0] pc,
    output [31:0] inst,
    output [31:0] IF_ID_inst,
    output [31:0] ID_EX_R_Data_A,
    output [31:0] ID_EX_R_Data_B,
    output [15:0] ID_EX_imme,
    output [4:0] ID_EX_rs,
    output [4:0] ID_EX_rt,
    output [4:0] ID_EX_rd,
    output [4:0] ID_EX_shamt,
    output [5:0] ID_EX_func,
    output ID_EX_RegDst,
    output ID_EX_aluSrc,
    output ID_EX_MemWrite,
    output ID_EX_MemRead,
    output ID_EX_RegWrite,
    output ID_EX_MemtoReg,
    output ID_EX_shift,
    output ID_EX_ExtOp,
    output [1:0] ID_EX_branch,
    output [3:0] ID_EX_aluOp,
    output [31:0] rs_Data,
    output [31:0] rt_Data,
    output [31:0] ForwardingMux1_res,
    output [31:0] ForwardingMux2_res,
    output [31:0] alu1,
    output [31:0] alu2,
    output [4:0] EX_MEM_rd,
    output [31:0] EX_MEM_write_data,
    output [31:0] EX_MEM_alu_res,
    output EX_MEM_MemWrite,
    output EX_MEM_MemRead,
    output EX_MEM_RegWrite,
    output EX_MEM_MemtoReg,
    output [4:0] MEM_WB_rd,
    output [31:0] MEM_WB_mem_data,
    output [31:0] MEM_WB_alu_res,
    output MEM_WB_RegWrite,
    output MEM_WB_MemtoReg,
    output [31:0] W_Data,
    output [1:0] ForwardA,
    output [1:0] ForwardB,
    output ForwardC,
    output ForwardD,
    output zero,
    output branchCtrl,
    output jmp,
    output [14:0] D1,
    output [14:0] D2,
    output [14:0] D3,
    output [14:0] D4,
    output [14:0] D5,
    output [14:0] D6,
    output [14:0] D7,
    output [14:0] D8,
    output [14:0] D9,
    output [14:0] D10
    );
    
    wire [5:0] OpCode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] func;
    wire [15:0] imme;
    wire [25:0] jmpAddr;
    assign OpCode = IF_ID_inst[31:26];
    assign rs = IF_ID_inst[25:21];
    assign rt = IF_ID_inst[20:16];
    assign rd = IF_ID_inst[15:11];
    assign shamt = IF_ID_inst[11:6];
    assign func = IF_ID_inst[5:0];
    assign imme = IF_ID_inst[15:0];
    assign jmpAddr = IF_ID_inst[25:0];
    
    wire RegDst;
    wire aluSrc;
    wire MemWrite;
    wire MemRead;
    wire RegWrite;
    wire MemtoReg;
    wire shift;
    wire [1:0] branch;
    wire ExtOp;
    wire [3:0] aluOp;
    wire [3:0] aluCtrl;
    wire [31:0] R_Data_A;
    wire [31:0] R_Data_B;
    wire [4:0] RegDst_res;
    wire [31:0] ext_imme;
    wire [31:0] alu_res;
    wire [31:0] mem_data;
    
    initial pc <= 32'b0;
    wire [31:0] pc_plus;
    assign pc_plus = pc + 32'd4;
    always @(posedge clk) begin
        if(clr) pc <= 32'b0;
        else if(pc >= 32'd169) pc <= pc;
        else if(branchCtrl) pc <= pc_plus + (ext_imme << 2) - 32'd8;
        else if(jmp) pc <= {pc_plus[31:28], jmpAddr, 2'b00};
        else pc <= pc_plus;
    end
    ctrl U0(
        .OpCode(OpCode),
        .func(func),
        .RegDst(RegDst),
        .aluSrc(aluSrc),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg),
        .shift(shift),
        .branch(branch),
        .jmp(jmp),
        .ExtOp(ExtOp),
        .aluOp(aluOp)
    );
    DataMemory U1(
        .clk(clk),
        .addr(EX_MEM_alu_res),
        .write_data(EX_MEM_write_data),
        .MemRead(EX_MEM_MemRead),
        .MemWrite(EX_MEM_MemWrite),
        .read_data(mem_data),
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
    EX_MEM_reg U2(
        .clk(clk),
        .MemWrite_in(ID_EX_MemWrite),
        .MemRead_in(ID_EX_MemRead),
        .RegWrite_in(ID_EX_RegWrite),
        .MemtoReg_in(ID_EX_MemtoReg),
        .rd_in(RegDst_res),
        .write_data_in(ID_EX_R_Data_B),
        .alu_res_in(alu_res),
        .MemWrite_out(EX_MEM_MemWrite),
        .MemRead_out(EX_MEM_MemRead),
        .RegWrite_out(EX_MEM_RegWrite),
        .MemtoReg_out(EX_MEM_MemtoReg),
        .rd_out(EX_MEM_rd),
        .write_data_out(EX_MEM_write_data),
        .alu_res_out(EX_MEM_alu_res)
    );
    ForwardingMux1 U3(
        .ForwardA(ForwardA),
        .R_Data_A(ID_EX_R_Data_A),
        .EX_MEM_alu_res(EX_MEM_alu_res),
        .W_Data(W_Data),
        .data_out(ForwardingMux1_res)
    );
    ForwardingMux2 U4(
        .ForwardB(ForwardB),
        .R_Data_B(ID_EX_R_Data_B),
        .EX_MEM_alu_res(EX_MEM_alu_res),
        .W_Data(W_Data),
        .data_out(ForwardingMux2_res)
    );
    ID_EX_reg U5(
        .clk(clk),
        .RegDst_in(RegDst),
        .aluSrc_in(aluSrc),
        .MemWrite_in(MemWrite),
        .MemRead_in(MemRead),
        .RegWrite_in(RegWrite),
        .MemtoReg_in(MemtoReg),
        .shift_in(shift),
        .ExtOp_in(ExtOp),
        .branch_in(branch),
        .aluOp_in(aluOp),
        .rs_in(rs),
        .rt_in(rt),
        .rd_in(rd),
        .shamt_in(shamt),
        .func_in(func),
        .R_Data_A_in(rs_Data),
        .R_Data_B_in(rt_Data),
        .imme_in(imme),
        .RegDst_out(ID_EX_RegDst),
        .aluSrc_out(ID_EX_aluSrc),
        .MemWrite_out(ID_EX_MemWrite),
        .MemRead_out(ID_EX_MemRead),
        .RegWrite_out(ID_EX_RegWrite),
        .MemtoReg_out(ID_EX_MemtoReg),
        .shift_out(ID_EX_shift),
        .ExtOp_out(ID_EX_ExtOp),
        .branch_out(ID_EX_branch),
        .aluOp_out(ID_EX_aluOp),
        .rs_out(ID_EX_rs),
        .rt_out(ID_EX_rt),
        .rd_out(ID_EX_rd),
        .shamt_out(ID_EX_shamt),
        .func_out(ID_EX_func),
        .R_Data_A_out(ID_EX_R_Data_A),
        .R_Data_B_out(ID_EX_R_Data_B),
        .imme_out(ID_EX_imme)
    );
    IF_ID_reg U6(
        .clk(clk),
        .inst_in(inst),
        .inst_out(IF_ID_inst)
    );
    MEM_WB_reg U7(
        .clk(clk),
        .RegWrite_in(EX_MEM_RegWrite),
        .MemtoReg_in(EX_MEM_MemtoReg),
        .rd_in(EX_MEM_rd),
        .mem_data_in(mem_data),
        .alu_res_in(EX_MEM_alu_res),
        .RegWrite_out(MEM_WB_RegWrite),
        .MemtoReg_out(MEM_WB_MemtoReg),
        .rd_out(MEM_WB_rd),
        .mem_data_out(MEM_WB_mem_data),
        .alu_res_out(MEM_WB_alu_res)
    );
    RegDstMux U8(
        .rt(ID_EX_rt),
        .rd(ID_EX_rd),
        .RegDst(ID_EX_RegDst),
        .res(RegDst_res)
    );
    RegFile U9(
        .Clk(clk),
        .Write_Reg(MEM_WB_RegWrite),
        .R_Addr_A(rs),
        .R_Addr_B(rt),
        .W_Addr(MEM_WB_rd),
        .W_Data(W_Data),
        .R_Data_A(R_Data_A),
        .R_Data_B(R_Data_B)
    );
    WBMux U10(
        .alu_res(MEM_WB_alu_res),
        .mem_res(MEM_WB_mem_data),
        .MemtoReg(MEM_WB_MemtoReg),
        .res(W_Data)
    );
    alu U11(
        .input1(alu1),
        .input2(alu2),
        .alu_ctrl(aluCtrl),
        .alu_res(alu_res),
        .zero(zero)
    );
    Forwarding_Unit U12(
        .rs(rs),
        .rt(rt),
        .ID_EX_rs(ID_EX_rs),
        .ID_EX_rt(ID_EX_rt),
        .EX_MEM_rd(EX_MEM_rd),
        .MEM_WB_rd(MEM_WB_rd),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .MEM_WB_RegWrite(MEM_WB_RegWrite),
        .ForwardA(ForwardA),
        .ForwardB(ForwardB),
        .ForwardC(ForwardC),
        .ForwardD(ForwardD)
    );
    aluMux1 U13(
        .rs(ForwardingMux1_res),
        .shamt(ID_EX_shamt),
        .shift(ID_EX_shift),
        .res(alu1)
    );
    aluMux2 U14(
        .rt(ForwardingMux2_res),
        .imme(ext_imme),
        .aluSrc(ID_EX_aluSrc),
        .res(alu2)
    );
    aluctrl U15(
        .aluOp(ID_EX_aluOp),
        .func(ID_EX_func),
        .aluCtrl(aluCtrl)
    );
    branch_ctrl U16(
        .branch(ID_EX_branch),
        .zero(zero),
        .branchCtrl(branchCtrl)
    );
    sign_extend U17(
        .num(ID_EX_imme),
        .ExtOp(ID_EX_ExtOp),
        .num_out(ext_imme)
    );
    Inst U18(
        .a(pc),
        .spo(inst)
    );
    ForwardingMux3 U19(
        .R_Data_A(R_Data_A),
        .W_Data(W_Data),
        .ForwardC(ForwardC),
        .rs_Data(rs_Data)
    );
    ForwardingMux4 U20(
        .R_Data_B(R_Data_B),
        .W_Data(W_Data),
        .ForwardD(ForwardD),
        .rt_Data(rt_Data)
    );
endmodule
