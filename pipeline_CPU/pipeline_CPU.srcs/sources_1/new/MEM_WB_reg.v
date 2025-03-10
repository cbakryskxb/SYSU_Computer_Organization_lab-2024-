`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 17:41:33
// Design Name: 
// Module Name: MEM_WB_reg
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


module MEM_WB_reg(
    input clk,
    input RegWrite_in,
    input MemtoReg_in,
    input [4:0] rd_in,
    input [31:0] mem_data_in,
    input [31:0] alu_res_in,
    output reg RegWrite_out,
    output reg MemtoReg_out,
    output reg [4:0] rd_out,
    output reg [31:0] mem_data_out,
    output reg [31:0] alu_res_out
    );
    reg RegWrite;
    reg MemtoReg;
    reg [4:0] rd;
    reg [31:0] mem_data;
    reg [31:0] alu_res;
    initial begin
        RegWrite <= 0;
        MemtoReg <= 0;
        rd <= 5'b0;
        mem_data <= 32'b0;
        alu_res <= 32'b0;
    end
    always @(posedge clk) begin
        RegWrite_out <= RegWrite;
        MemtoReg_out <= MemtoReg;
        rd_out <= rd;
        mem_data_out <= mem_data;
        alu_res_out <= alu_res;
    end
    always @(negedge clk) begin
        RegWrite <= RegWrite_in;
        MemtoReg <= MemtoReg_in;
        rd <= rd_in;
        mem_data <= mem_data_in;
        alu_res <= alu_res_in;        
    end
endmodule
