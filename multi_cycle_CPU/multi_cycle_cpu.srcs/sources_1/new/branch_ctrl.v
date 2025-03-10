`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 17:38:57
// Design Name: 
// Module Name: branch_ctrl
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


module branch_ctrl(
    input [1:0] branch,
    input zero,
    output reg branchCtrl
    );
    always @(branch or zero) begin
        if(branch == 2'b01)
            if(zero == 1)
                branchCtrl <= 1;
            else
                branchCtrl <= 0;
        else if(branch == 2'b10)
            if(zero == 0)
                branchCtrl <= 1;
            else
                branchCtrl <= 0;
         else
            branchCtrl <= 0;
    end
endmodule
