`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 19:14:20
// Design Name: 
// Module Name: ForwardingMux2
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


module ForwardingMux2(
    input [1:0] ForwardB,
    input [31:0] R_Data_B,
    input [31:0] EX_MEM_alu_res,
    input [31:0] W_Data,
    output reg [31:0] data_out
    );
    always @(*) begin
        case(ForwardB)
            2'b10 : data_out <= EX_MEM_alu_res;
            2'b01 : data_out <= W_Data;
            2'b00 : data_out <= R_Data_B;
            default : data_out <= 32'b0;
        endcase
    end
endmodule
