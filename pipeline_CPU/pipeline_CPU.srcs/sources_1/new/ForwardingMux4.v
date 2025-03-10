`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/12 09:18:02
// Design Name: 
// Module Name: ForwardingMux4
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


module ForwardingMux4(
    input [31:0] R_Data_B,
    input [31:0] W_Data,
    input ForwardD,
    output [31:0] rt_Data
    );
    assign rt_Data = (ForwardD == 1) ? W_Data : R_Data_B;
endmodule
