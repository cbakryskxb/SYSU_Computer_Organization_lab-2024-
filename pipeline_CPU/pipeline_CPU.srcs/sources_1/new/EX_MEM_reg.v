`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 17:24:12
// Design Name: 
// Module Name: EX_MEM_reg
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


module EX_MEM_reg(
    input clk,
    input MemWrite_in,
    input MemRead_in,
    input RegWrite_in,
    input MemtoReg_in,
    input [4:0] rd_in,
    input [31:0] write_data_in,
    input [31:0] alu_res_in,
    output reg MemWrite_out,
    output reg MemRead_out,
    output reg RegWrite_out,
    output reg MemtoReg_out,
    output reg [4:0] rd_out,
    output reg [31:0] write_data_out,
    output reg [31:0] alu_res_out
    );
    reg MemWrite;
    reg MemRead;
    reg RegWrite;
    reg MemtoReg;
    reg [4:0] rd;
    reg [31:0] write_data;
    reg [31:0] alu_res;
    initial begin
        MemWrite <= 0;
        MemRead <= 0;
        RegWrite <= 0;
        MemtoReg <= 0;
        rd <= 5'b0;
        write_data <= 32'b0;
        alu_res <= 32'b0;
    end
    always @(posedge clk) begin
        MemWrite_out <= MemWrite;
        MemRead_out <= MemRead;
        RegWrite_out <= RegWrite;
        MemtoReg_out <= MemtoReg;
        rd_out <= rd;
        write_data_out <= write_data;
        alu_res_out <= alu_res;
    end
    always @(negedge clk) begin
        MemWrite <= MemWrite_in;
        MemRead <= MemRead_in;
        RegWrite <= RegWrite_in;
        MemtoReg <= MemtoReg_in;
        rd <= rd_in;
        write_data <= write_data_in;
        alu_res <= alu_res_in;
    end
endmodule
