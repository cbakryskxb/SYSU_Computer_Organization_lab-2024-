`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 17:21:43
// Design Name: 
// Module Name: IF_ID_reg
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


module IF_ID_reg(
    input clk,
    input [31:0] inst_in,
    output reg [31:0] inst_out
    );
    reg [31:0] inst;
    initial begin
        inst <= 32'b0;
    end
    always @(posedge clk) begin
        inst_out <= inst;
    end
    always @(negedge clk) begin
        inst <= inst_in;
    end
endmodule
