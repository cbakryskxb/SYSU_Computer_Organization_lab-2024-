`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/20 11:33:44
// Design Name: 
// Module Name: tt
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


module Top(
    input clk,
    input clr,
    //input btn_in,
    //input [14:0] data,
    //output reg [9:0] lights = 10'b1,
    //output [6:0] a_to_g,
    //output [3:0] seg
    output [14:0] D1,
    output [14:0] D2,
    output [14:0] D3,
    output [14:0] D4,
    output [14:0] D5,
    output [14:0] D6,
    output [14:0] D7,
    output [14:0] D8,
    output [14:0] D9,
    output [14:0] D10,
    output reg [31:0] pc,
    output [31:0] inst,
    output reg [2:0] state,
    output [4:0] W_Addr,
    output [31:0] W_Data,
    output [31:0] R_Data_A,
    output [31:0] R_Data_B,
    output [31:0] alu_res,
    output [31:0] R_Mem_Data,
    output RegDst,
    output aluSrc,
    output MemWrite,
    output MemRead,
    output RegWrite,
    output MemtoReg,
    output shift,
    output [1:0] branch,
    output branchCtrl,
    output jmp,
    output ExtOp,
    output [3:0] aluOp,
    output [3:0] aluCtrl,
    output [31:0] alu1,
    output [31:0] alu2,
    output zero
    );
    initial state <= 3'b000;
    
    wire [5:0] OpCode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] func;
    wire [15:0] imme;
    wire [25:0] jmpAddr;
    wire [32:0] ExtImme;
    assign OpCode = inst[31:26];
    assign rs = inst[25:21];
    assign rt = inst[20:16];
    assign rd = inst[15:11];
    assign shamt = inst[10:6];
    assign func = inst[5:0];
    assign imme = inst[15:0];
    assign jmpAddr = inst[25:0];
    
    wire [31:0] pc_plus;
    //wire clk_div;
    //wire clk_div2;
    assign pc_plus = pc + 32'd4;
    initial begin
        pc <= 32'b0;
    end
    always @(posedge clk or posedge clr) begin
        if(clr)
            pc <= 32'b0;
        else if(state == 3'b000) begin
            if(jmp == 1 && branchCtrl == 0)
                pc <= {pc_plus[31:28], jmpAddr, 2'b00};
            else if(jmp == 0 && branchCtrl == 1)
                pc <= pc_plus + (ExtImme << 2);
            else if(pc >= 32'd109) 
                pc <= pc;
            else
                pc <= pc_plus;
        end
    end
    
    always @(posedge clk) begin
        if(OpCode == 6'b00000 || OpCode == 6'b001000 || OpCode == 6'b001100 || OpCode == 6'b001101 || OpCode == 6'b001110 || OpCode == 6'b001010) begin
            if(state == 3'b000) state <= 3'b001;
            else if(state == 3'b001) state <= 3'b010;
            else if(state == 3'b010) state <= 3'b100;
            else if(state == 3'b100) state <= 3'b000;
        end else if(OpCode == 6'b100011) begin
            if(state == 3'b000) state <= 3'b001;
            else if(state == 3'b001) state <= 3'b010;
            else if(state == 3'b010) state <= 3'b011;
            else if(state == 3'b011) state <= 3'b100;
            else state <= 3'b000;
        end else if(OpCode == 6'b101011) begin
            if(state == 3'b000) state <= 3'b001;
            else if(state == 3'b001) state <= 3'b010;
            else if(state == 3'b010) state <= 3'b011;
            else if(state == 3'b011) state <= 3'b000;
        end else if(OpCode == 6'b000100 || OpCode == 6'b000101) begin
            if(state == 3'b000) state <= 3'b001;
            else if(state == 3'b001) state <= 3'b010;
            else if(state == 3'b010) state <= 3'b000;
        end else if(OpCode == 6'b000010) begin
            if(state == 3'b000) state <= 3'b001;
            else if(state == 3'b001) state <= 3'b000;
        end
    end
 
    sign_extend U0(
        .num(imme),
        .ExtOp(ExtOp),
        .num_out(ExtImme)
    );
    ctrl U1(
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
    aluctrl U2(
        .aluOp(aluOp),
        .func(func),
        .aluCtrl(aluCtrl)
    );
    RegFile U3(
        .Clk(clk),
        .state(state),
        .Write_Reg(RegWrite),
        .R_Addr_A(rs),
        .R_Addr_B(rt),
        .W_Addr(W_Addr),
        .W_Data(W_Data),
        .R_Data_A(R_Data_A),
        .R_Data_B(R_Data_B)
    );
    RegDstMux U4(
        .rt(rt),
        .rd(rd),
        .RegDst(RegDst),
        .res(W_Addr)
    );
    WBMux U5(
        .alu_res(alu_res),
        .mem_res(R_Mem_Data),
        .MemtoReg(MemtoReg),
        .res(W_Data)
    );
    aluMux1 U6(
        .rs(R_Data_A),
        .shamt(shamt),
        .shift(shift),
        .res(alu1)
    );
    aluMux2 U7(
        .rt(R_Data_B),
        .imme(ExtImme),
        .aluSrc(aluSrc),
        .res(alu2)
    );
    alu U8(
        .input1(alu1),
        .input2(alu2),
        .alu_ctrl(aluCtrl),
        .alu_res(alu_res),
        .zero(zero)
    );
    branch_ctrl U9(
        .branch(branch),
        .zero(zero),
        .branchCtrl(branchCtrl)
    );
    DataMemory U10(
        .clk(clk),
        //.read(clr),
        //.btn(btn),
        //.data_in(data),
        //.addr_in(addr_in),
        .state(state),
        .addr(alu_res),
        .write_data(R_Data_B),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .read_data(R_Mem_Data),
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
    Inst U11(
        .a(pc[7:0]),
        .spo(inst)
    );
endmodule
