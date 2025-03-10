`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/12 08:32:17
// Design Name: 
// Module Name: decoder38
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


module decoder38(
    input A,
    input B,
    input C,
    input Enable,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3,
    output reg Y4,
    output reg Y5,
    output reg Y6,
    output reg Y7
);
    always @(A or B or C or Enable) begin
        if (!Enable) begin
            {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0000_0000;
        end else begin
            case ({C,B,A})
                3'b000 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0000_0001;
                3'b001 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0000_0010;
                3'b010 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0000_0100;
                3'b011 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0000_1000;
                3'b100 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0001_0000;
                3'b101 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0010_0000;
                3'b110 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0100_0000;
                3'b111 : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b1000_0000;
                default : {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = 8'b0000_0000;
            endcase
        end
    end    
endmodule
