`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/17 21:29:21
// Design Name: 
// Module Name: clk_div2
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


module clk_div2(
    input clk,
    output reg clk_div2
    );
    integer clk_cnt;
    always @(posedge clk) begin
        if(clk_cnt == 32'd99999) begin
            clk_cnt <= 0;
            clk_div2 = ~clk_div2;
        end
        else begin
            clk_cnt <= clk_cnt + 1;
        end 
    end
endmodule
