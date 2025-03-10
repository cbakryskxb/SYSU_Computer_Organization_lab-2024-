`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 18:46:59
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] ID_EX_rs,
    input [4:0] ID_EX_rt,
    input [4:0] EX_MEM_rd,
    input [4:0] MEM_WB_rd,
    input EX_MEM_RegWrite,
    input MEM_WB_RegWrite,
    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB,
    output reg ForwardC,
    output reg ForwardD
    );
    initial begin
        ForwardA <= 2'b00;
        ForwardB <= 2'b00;
        ForwardC <= 0;
        ForwardD <= 0; end
    always @(*) begin
        ForwardA <= 2'b00; ForwardB <= 2'b00; ForwardC <= 0; ForwardD <= 0;
         if(MEM_WB_RegWrite && MEM_WB_rd != 0 && (MEM_WB_rd == ID_EX_rs || MEM_WB_rd == ID_EX_rt))begin
            if(MEM_WB_rd == ID_EX_rs) ForwardA <= 2'b01;
            if(MEM_WB_rd == ID_EX_rt) ForwardB <= 2'b01;
        end       
        
        if(EX_MEM_RegWrite && EX_MEM_rd != 0 && (EX_MEM_rd == ID_EX_rs || EX_MEM_rd == ID_EX_rt))begin 
            if(EX_MEM_rd == ID_EX_rs) ForwardA <= 2'b10;
            if(EX_MEM_rd == ID_EX_rt) ForwardB <= 2'b10;
        end
        
        if(MEM_WB_RegWrite && MEM_WB_rd != 0 && (MEM_WB_rd == rs || MEM_WB_rd == rt))begin 
            if(MEM_WB_rd == rs) ForwardC <= 1;
            if(MEM_WB_rd == rt) ForwardD <= 1;
        end
    end
endmodule
