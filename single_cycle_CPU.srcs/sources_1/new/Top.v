`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 19:53:40
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,
    input clr,
    input btn_in,
    input [14:0] data,
    output reg [9:0] lights = 10'b1,
    output [6:0] a_to_g,
    output [3:0] seg
    );
    
    wire [5:0] OpCode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] func;
    wire [15:0] imme;
    wire [25:0] jmpAddr;
    wire [31:0] ExtImme;
    assign OpCode = inst[31:26];
    assign rs = inst[25:21];
    assign rt = inst[20:16];
    assign rd = inst[15:11];
    assign shamt = inst[10:6];
    assign func = inst[5:0];
    assign imme = inst[15:0];
    assign jmpAddr = inst[25:0];
    
    wire [14:0] D1;
    wire [14:0] D2;
    wire [14:0] D3;
    wire [14:0] D4;
    wire [14:0] D5;
    wire [14:0] D6;
    wire [14:0] D7;
    wire [14:0] D8;
    wire [14:0] D9;
    wire [14:0] D10;
    reg [31:0] pc;
    wire [31:0] inst;
    wire [4:0] W_Addr;
    wire [31:0] W_Data;
    wire [31:0] R_Data_A;
    wire [31:0] R_Data_B;
    wire [31:0] alu_res;
    wire [31:0] R_Mem_Data;
    wire RegDst;
    wire aluSrc;
    wire MemWrite;
    wire MemRead;
    wire RegWrite;
    wire MemtoReg;
    wire shift;
    wire [1:0] branch;
    wire branchCtrl;
    wire jmp;
    wire ExtOp;
    wire [3:0] aluOp;
    wire [3:0] aluCtrl;
    wire [31:0] alu1;
    wire [31:0] alu2;
    wire zero;
    wire clk_div;
    wire clk_div2; 
    wire [31:0] pc_plus;
    assign pc_plus = pc + 32'd4;
    initial begin
        pc <= 32'b0;
    end
    always @(posedge clk_div2 or posedge clr) begin
        if(clr)
            pc <= 32'b0;
        else if(jmp == 1 && branchCtrl == 0)
            pc <= {pc_plus[31:28], jmpAddr, 2'b00};
        else if(jmp == 0 && branchCtrl == 1)
            pc <= pc_plus + (ExtImme << 2);
        else if(pc >= 32'd113) 
            pc <= pc;
        else
            pc <= pc_plus;
    end
    
    reg [15:0] display_data;
    wire btn;
    reg [3:0] count = 1'b0;
    reg [3:0] count1 = 1'b0;
    wire [31:0] addr_in;
    assign addr_in = count;
    always @(posedge btn) begin
        count <= count + 1'b1;
    end
    always @(posedge clk_div) begin
        if(clr) begin
            display_data <= {1'b0, data};
            if(btn) begin
                case(count)
                    4'b0000: lights <= 10'b00000_00001;
                    4'b0001: lights <= 10'b00000_00010;
                    4'b0010: lights <= 10'b00000_00100;
                    4'b0011: lights <= 10'b00000_01000;
                    4'b0100: lights <= 10'b00000_10000;
                    4'b0101: lights <= 10'b00001_00000;
                    4'b0110: lights <= 10'b00010_00000;
                    4'b0111: lights <= 10'b00100_00000;
                    4'b1000: lights <= 10'b01000_00000;
                    4'b1001: lights <= 10'b10000_00000;
                    default: lights <= 10'b0;
                endcase      
            end
        end else begin
            count1 <= count1 + 1'b1;
            if(count1 == 4'b1011) count1 <= 4'b0001;
            case(count1)
                4'b0001: begin display_data <= D1; lights <= 10'b00000_00001; end
                4'b0010: begin display_data <= D2; lights <= 10'b00000_00010; end
                4'b0011: begin display_data <= D3; lights <= 10'b00000_00100; end
                4'b0100: begin display_data <= D4; lights <= 10'b00000_01000; end
                4'b0101: begin display_data <= D5; lights <= 10'b00000_10000; end
                4'b0110: begin display_data <= D6; lights <= 10'b00001_00000; end
                4'b0111: begin display_data <= D7; lights <= 10'b00010_00000; end
                4'b1000: begin display_data <= D8; lights <= 10'b00100_00000; end
                4'b1001: begin display_data <= D9; lights <= 10'b01000_00000; end
                4'b1010: begin display_data <= D10; lights <= 10'b10000_00000; end
                default: begin display_data <= 0; lights <= 0;end
            endcase
        end
    end
    sign_extend U0(
        .num(imme),
        .ExtOp(ExtOp),
        .num_out(ExtImme)
    );
    ctrl U1(
        .OpCode(OpCode),
        .func(func),
        .RegDst(RegDst),
        .aluSrc(aluSrc),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg),
        .shift(shift),
        .branch(branch),
        .jmp(jmp),
        .ExtOp(ExtOp),
        .aluOp(aluOp)
    );
    aluctrl U2(
        .aluOp(aluOp),
        .func(func),
        .aluCtrl(aluCtrl)
    );
    RegFile U3(
        .Clk(clk_div2),
        .Write_Reg(RegWrite),
        .R_Addr_A(rs),
        .R_Addr_B(rt),
        .W_Addr(W_Addr),
        .W_Data(W_Data),
        .R_Data_A(R_Data_A),
        .R_Data_B(R_Data_B)
    );
    RegDstMux U4(
        .rt(rt),
        .rd(rd),
        .RegDst(RegDst),
        .res(W_Addr)
    );
    WBMux U5(
        .alu_res(alu_res),
        .mem_res(R_Mem_Data),
        .MemtoReg(MemtoReg),
        .res(W_Data)
    );
    aluMux1 U6(
        .rs(R_Data_A),
        .shamt(shamt),
        .shift(shift),
        .res(alu1)
    );
    aluMux2 U7(
        .rt(R_Data_B),
        .imme(ExtImme),
        .aluSrc(aluSrc),
        .res(alu2)
    );
    alu U8(
        .input1(alu1),
        .input2(alu2),
        .alu_ctrl(aluCtrl),
        .alu_res(alu_res),
        .zero(zero)
    );
    branch_ctrl U9(
        .branch(branch),
        .zero(zero),
        .branchCtrl(branchCtrl)
    );
    DataMemory U10(
        .clk(clk_div2),
        .read(clr),
        .btn(btn),
        .data_in(data),
        .addr_in(addr_in),
        .addr(alu_res),
        .write_data(R_Data_B),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .read_data(R_Mem_Data),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .D5(D5),
        .D6(D6),
        .D7(D7),
        .D8(D8),
        .D9(D9),
        .D10(D10)
    );    
    Inst U11(
        .a(pc[7:0]),
        .spo(inst)
    );
    clock_div U12(
        .clk(clk),
        .clk_sys(clk_div)
    );
    debounce U13(
        .Clk(clk),
        .btn_in(btn_in),
        .btn_out(btn)
    );
    display U14(
        .clk(clk),
        .data(display_data),
        .seg(seg),
        .a_to_g(a_to_g)
    );
    clk_div2 U15(
        .clk(clk),
        .clk_div2(clk_div2)
    );
endmodule
