`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/16 19:25:21
// Design Name: 
// Module Name: debounce
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


module debounce (
    input wire Clk,
    input wire btn_in,
    output reg btn_out 
);
    reg [19:0] count;
    reg btn_in_d;
    always @(posedge Clk) begin
        btn_in_d <= btn_in;
        if (btn_in == btn_in_d) begin
            if (count == 20'hfffff) begin 
                btn_out <= btn_in;
            end else begin
                count <= count + 1'b1;
            end
        end else begin
            count <= 0;
        end
    end
endmodule