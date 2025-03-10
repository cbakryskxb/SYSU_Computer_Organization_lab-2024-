`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 08:12:45
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
    input [15:0] num,
    input ExtOp,
    output reg [31:0] num_out
    );
    always @(*) begin
        if(ExtOp == 1)
            num_out <= {{16{num[15]}}, num};
        else
            num_out <= {{16{1'b0}}, num};
    end
endmodule
