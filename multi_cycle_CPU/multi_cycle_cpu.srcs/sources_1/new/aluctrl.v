`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 08:24:23
// Design Name: 
// Module Name: aluctrl
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
module aluctrl(
    input [3:0] aluOp,
    input [5:0] func,
    output reg [3:0] aluCtrl
    );
    always @(aluOp or func) begin
        casex({aluOp, func})
            10'b0000xxxxxx: aluCtrl = 4'b0010; // lw, sw, addi
            10'b0001xxxxxx: aluCtrl = 4'b0001; // beq
            10'b0010xxxxxx: aluCtrl = 4'b0001; // bne
            10'b1000xxxxxx: aluCtrl = 4'b1111; // andi
            10'b1001xxxxxx: aluCtrl = 4'b1110; // ori
            10'b1010xxxxxx: aluCtrl = 4'b1101; // xori
            10'b0110xxxxxx: aluCtrl = 4'b0011; // slti
            10'b1111100000: aluCtrl = 4'b0010; // add
            10'b1111100010: aluCtrl = 4'b0001; // sub
            10'b1111100100: aluCtrl = 4'b1111; // and
            10'b1111100101: aluCtrl = 4'b1110; // or
            10'b1111100110: aluCtrl = 4'b1101; // xor
            10'b1111100111: aluCtrl = 4'b1100; // nor
            10'b1111101010: aluCtrl = 4'b0011; // slt
            10'b1111000000: aluCtrl = 4'b0100; // sll
            10'b1111000010: aluCtrl = 4'b0101; // srl
            10'b1111000011: aluCtrl = 4'b0110; // sra
        endcase
    end
endmodule
