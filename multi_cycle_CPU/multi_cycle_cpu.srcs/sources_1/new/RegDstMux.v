`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 19:47:52
// Design Name: 
// Module Name: RegDstMux
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


module RegDstMux(
    input [4:0] rt,
    input [4:0] rd,
    input RegDst,
    output [4:0] res
    );
    assign res = (RegDst == 0) ? rt : rd;
endmodule
