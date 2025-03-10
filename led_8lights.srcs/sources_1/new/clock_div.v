`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/12 08:18:23
// Design Name: 
// Module Name: clock_div
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


module clock_div(
    input clk,
    output reg clk_sys = 0
);
reg [25:0] div_counter = 0;

always @(posedge clk) begin
//仿真条件：if (div_counter >= 50) begin
//硬件条件50000000
    if (div_counter >= 50000000) begin
        clk_sys <= ~clk_sys;
        div_counter <= 0;
    end else begin
        div_counter <= div_counter + 1;
    end
end

endmodule