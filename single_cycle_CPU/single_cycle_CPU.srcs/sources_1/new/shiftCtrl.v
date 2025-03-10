`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/20 11:01:18
// Design Name: 
// Module Name: shiftCtrl
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


module shiftCtrl(
    input R_type,
    input [5:0] func,
    output shift
    );
    assign shift = (R_type == 1 && func == 6'b0) ? 1 : 0;
endmodule
