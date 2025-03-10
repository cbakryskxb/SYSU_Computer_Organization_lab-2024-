`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/12 08:47:59
// Design Name: 
// Module Name: led_sim
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


module led_sim();

reg clock;
reg reset;

wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
 
led_8lights uut (
    .clock(clock),
    .reset(reset),
    .Y0(Y0), 
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .Y5(Y5),
    .Y6(Y6),
    .Y7(Y7)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 0;
    #100 reset = 1;
end
    
endmodule
