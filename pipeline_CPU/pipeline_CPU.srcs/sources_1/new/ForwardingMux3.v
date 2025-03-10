`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/12 09:18:02
// Design Name: 
// Module Name: ForwardingMux3
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


module ForwardingMux3(
    input [31:0] R_Data_A,
    input [31:0] W_Data,
    input ForwardC,
    output [31:0] rs_Data
    );
    assign rs_Data = (ForwardC == 1) ? W_Data : R_Data_A;
endmodule
