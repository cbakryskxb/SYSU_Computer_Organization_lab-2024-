`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/12 08:41:01
// Design Name: 
// Module Name: led_8lights
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


module led_8lights(
    input clock,
    input reset,
    output Y0,
    output Y1,
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output Y6,
    output Y7
);
    
wire clk_sys;
wire [2:0] count;

counter8 U0 (
    .clk(clk_sys),
    .reset(reset),
    .count(count)
);

clock_div U1 (
    .clk(clock),
    .clk_sys(clk_sys)
);

decoder38 U2 (
    .A(count[0]),
    .B(count[1]),
    .C(count[2]),
    .Enable(reset),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .Y5(Y5),
    .Y6(Y6),
    .Y7(Y7)
);

endmodule
