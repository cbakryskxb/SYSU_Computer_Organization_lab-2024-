`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 19:49:38
// Design Name: 
// Module Name: WBMux
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


module WBMux(
    input [31:0] alu_res,
    input [31:0] mem_res,
    input MemtoReg,
    output [31:0] res
    );
    assign res = (MemtoReg == 1) ? alu_res : mem_res;
endmodule
