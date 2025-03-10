`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 19:43:07
// Design Name: 
// Module Name: aluMux1
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


module aluMux1(
    input [31:0] rs,
    input [4:0] shamt,
    input shift,
    output [31:0] res
    );
    assign res = (shift == 0) ? rs : shamt;
endmodule
