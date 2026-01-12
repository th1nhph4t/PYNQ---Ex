`timescale 1ns/1ps
`include "lc3_defs.vh"

module lc3_cpu_tb;
    reg clk, reset;

    wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
    wire [15:0] PC;
    wire [2:0]  NZP;
    wire [15:0] IR;

    // DUT
    lc3_cpu dut (
        .clk(clk),
        .reset(reset),
        .R_out_0(R0), .R_out_1(R1), .R_out_2(R2), .R_out_3(R3),
        .R_out_4(R4), .R_out_5(R5), .R_out_6(R6), .R_out_7(R7),
        .PC_dbg(PC),
        .NZP_dbg(NZP),
        .IR_dbg(IR)
    );

    // Clock 10ns
    always #5 clk = ~clk;

    // Truy c?p tr?c ti?p memory c?a DUT (hierarchical) ?? n?p ch??ng trình
    // Gi? s? PC reset = 0x3000
    localparam BASE = 16'h3000;

    initial begin
        clk = 0;
        reset = 1;
        #20;
        reset = 0;

        // N?p ch??ng trình vào dut.mem.mem[...] (n?u Memory mem inst tên mem)
        // C?n th?n ???ng d?n: trong lc3_cpu -> Memory mem
        // L?NH (gi?i thích ? comment):

        // 3000: LEA R1, +4   (R1 = 3005)  opcode 1110 DR=001 offset9=000000100 (0x004)
        dut.mem.mem[16'h3000] = 16'b1110_001_000000100;

        // 3001: LD R2, +5   (R2 = mem[3001+5=3006] = giá tr? value) offset9=000000101
        dut.mem.mem[16'h3001] = 16'b0010_010_000000101;

        // 3002: ADD R3, R2, #5  (0001 DR=011 SR1=010 1 imm5=00101)
        dut.mem.mem[16'h3002] = 16'b0001_011_010_1_00101;

        // 3003: NOT R4, R3 (1001 DR=100 SR=011 111111)
        dut.mem.mem[16'h3003] = 16'b1001_100_011_111111;

        // 3004: BRp +2  (0000 n=0 z=0 p=1 offset9=000000010) -> skip next ADD n?u R3 > 0
        dut.mem.mem[16'h3004] = 16'b0000_001_000000010;

        // 3005: ADD R5, R3, #1
        dut.mem.mem[16'h3005] = 16'b0001_101_011_1_00001;

        // 3006: AND R6, R4, R3 (0101 DR=110 SR1=100 0 00 SR2=011)
        dut.mem.mem[16'h3006] = 16'b0101_110_100_0_00_011;

        // 3007: BRnzp -1 (vòng l?p d?ng mô ph?ng)
        // offset9 = 0x1FF (signed -1) => 111111111
        dut.mem.mem[16'h3007] = 16'b0000_111_111111111;

        // 3006 (??a ch? ch?a value) ta ?ã dùng cho AND, nên ?? value t?i 3008:
        // OOPS ? trên LD R2 offset +5 -> 3001+5=3006 -> Chúng ta trùng! S?a: ??t value khác.
        // Ta s? ?i?u ch?nh: Thay LD R2 offset +7 (000000111) => n?p t? 3001+7=3008.
        // S?a l?i 3001 và 3002 vì 3002 c?? Ch? c?n s?a 3001:
        dut.mem.mem[16'h3001] = 16'b0010_010_000000111; // LD R2, +7 => mem[3008]

        // 3008: value = 0x0012
        dut.mem.mem[16'h3008] = 16'h0012;

        // Ch?y mô ph?ng trong m?t th?i gian
        repeat (60) @(posedge clk);

        $display("---- K?T QU? ----");
        $display("PC  = %h", PC);
        $display("IR  = %h", IR);
        $display("R1 (LEA) = %h (expect 3005)", R1);
        $display("R2 (LD ) = %h (expect 0012)", R2);
        $display("R3 (ADD) = %h (expect 0012 + 5 = 0017)", R3);
        $display("R4 (NOT) = %h (~0017 = FFE8)", R4);
        $display("R5 (ADD maybe skipped if R3>0) = %h", R5);
        $display("R6 (AND) = %h (R4 & R3)", R6);
        $display("NZP = %b", NZP);

        $stop;
    end
endmodule
