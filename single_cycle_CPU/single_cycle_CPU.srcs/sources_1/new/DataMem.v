`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 17:14:07
// Design Name: 
// Module Name: DataMem
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

module DataMemory (
    input clk,
    input read,
    input btn,
    input [14:0] data_in,
    input [31:0] addr_in,
    input [31:0] addr,
    input [31:0] write_data,
    input MemRead,
    input MemWrite,
    output [31:0] read_data,
    output [14:0] D1,
    output [14:0] D2,
    output [14:0] D3,
    output [14:0] D4,
    output [14:0] D5,
    output [14:0] D6,
    output [14:0] D7,
    output [14:0] D8,
    output [14:0] D9,
    output [14:0] D10
);
    reg [31:0] memory [0:255];
    integer i;
    initial
        for(i = 0; i < 256; i = i + 1)
            memory[i] <= 32'b0;
    //initial begin
        //memory[0] <= 32'b01001; //9
        //memory[1] <= 32'b001; //1
        //memory[2] <= 32'b1001; //9
        //memory[3] <= 32'b101001; //29
        //memory[4] <= 32'b10; //2
        //memory[5] <= 32'b10101; //15
        //memory[6] <= 32'b11010; //1a
        //memory[7] <= 32'b1111111111011; //1ffb
        //memory[8] <= 32'b1111011; //7b
        //memory[9] <= 32'b11101; //1d
    //end
    always @(posedge clk) begin
        if(read == 1 && btn == 1) begin
            memory[addr_in-1'b1] <= data_in;
        end else begin
            if (MemWrite) begin
                memory[addr >> 2] <= write_data;
            end
        end
    end
    assign read_data = (MemRead == 1) ? memory[addr >> 2] : 32'b0;
    assign D1 = memory[0][14:0];
    assign D2 = memory[1][14:0];
    assign D3 = memory[2][14:0];
    assign D4 = memory[3][14:0];
    assign D5 = memory[4][14:0];
    assign D6 = memory[5][14:0];
    assign D7 = memory[6][14:0];
    assign D8 = memory[7][14:0];
    assign D9 = memory[8][14:0];
    assign D10 = memory[9][14:0];
endmodule
