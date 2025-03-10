`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/27 14:46:06
// Design Name: 
// Module Name: state_ctrl
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


module state_ctrl(
    input clk,
    input [5:0] OpCode,
    input [2:0] curr_state,
    output reg [2:0] next_state
    );
    initial next_state <= curr_state;
    always @(posedge clk) begin
        if(OpCode == 6'b0) begin
            if(curr_state == 3'b000) next_state <= 3'b001;
            else if(curr_state == 3'b001) next_state <= 3'b010;
            else if(curr_state == 3'b010) next_state <= 3'b100;
            else if(curr_state == 3'b100) next_state <= 3'b000;
        end else if(OpCode == 6'b100011) begin
            if(curr_state == 3'b000) next_state <= 3'b001;
            else if(curr_state == 3'b001) next_state <= 3'b010;
            else if(curr_state == 3'b010) next_state <= 3'b100;
            else if(curr_state == 3'
        end
    end
    
endmodule
