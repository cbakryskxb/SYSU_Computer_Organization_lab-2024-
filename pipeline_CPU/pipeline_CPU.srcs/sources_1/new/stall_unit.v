`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/12 18:38:33
// Design Name: 
// Module Name: stall_unit
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


module stall_unit(
    input [31:0] inst,
    output reg stall
    );
    initial stall <= 0;
    always @(*) begin
        if(inst[31:26] == 6'b100011 || inst[31:26] == 6'b000010) stall <= 1;
        else stall <= 0;
    end
endmodule
