`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 08:23:35
// Design Name: 
// Module Name: ctrl
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
module ctrl(
    input [5:0] OpCode,
    input [5:0] func,
    output reg RegDst, //EX
    output reg aluSrc, //EX
    output reg MemWrite, //MEM
    output reg MemRead, //MEM
    output reg RegWrite, //WB
    output reg MemtoReg, //WB
    output shift, //EX
    output reg [1:0] branch, //EX
    output reg jmp, //ID
    output reg ExtOp, //EX
    output reg [3:0] aluOp //EX
    );
    reg R_type;
    always @(OpCode) begin
        case(OpCode)
            6'b000010: begin // JÐÍ
                RegDst = 0;
                aluSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 0;
                MemtoReg = 0;
                R_type = 0;
                branch = 2'b00;
                jmp = 1;
                ExtOp = 1;
                aluOp = 4'b0000;
            end
            6'b000000: begin // RÐÍ
                RegDst = 1;
                aluSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 1;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 0;
                aluOp = 4'b1111;
            end
            6'b100011: begin // lw
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 1;
                RegWrite = 1;
                MemtoReg = 0;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0000;                
            end
            6'b101011: begin // sw
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 1;
                MemRead = 0;
                RegWrite = 0;
                MemtoReg = 0;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0000;                
            end
            6'b000100: begin // beq
                RegDst = 0;
                aluSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 0;
                MemtoReg = 0;
                R_type = 0;
                branch = 2'b01;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0001;                
            end
            6'b000101: begin // bne
                RegDst = 0;
                aluSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 0;
                MemtoReg = 0;
                R_type = 0;
                branch = 2'b10;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0001;                
            end
            6'b001000: begin // addi
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0000;                
            end
            6'b001100: begin // andi
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 0;
                aluOp = 4'b1000;          
            end
            6'b001101: begin // ori
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 0;
                aluOp = 4'b1001;                
            end    
            6'b001110: begin // xori
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 0;
                aluOp = 4'b1010;                
            end      
            6'b001010: begin // slti
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0110;                
            end
            6'b001111: begin // lui
                RegDst = 0;
                aluSrc = 1;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 1;
                MemtoReg = 1;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 1;
                aluOp = 4'b0111;                
            end           
            default: begin
                RegDst = 0;
                aluSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                RegWrite = 0;
                MemtoReg = 0;
                R_type = 0;
                branch = 2'b00;
                jmp = 0;
                ExtOp = 0;
                aluOp = 4'b0000;
            end                                                                        
        endcase
    end
    shiftCtrl shiftctrl(
        .R_type(R_type),
        .func(func),
        .shift(shift)
);
endmodule
