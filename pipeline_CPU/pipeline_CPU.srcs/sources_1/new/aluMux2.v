`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 19:46:19
// Design Name: 
// Module Name: aluMux2
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


module aluMux2(
    input [31:0] rt,
    input [31:0] imme,
    input aluSrc,
    output [31:0] res
    );
    assign res = (aluSrc == 0) ? rt : imme;
endmodule
