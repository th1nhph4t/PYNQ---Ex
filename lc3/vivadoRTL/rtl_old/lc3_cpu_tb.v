`timescale 1ns/1ps
module lc3_cpu_tb;
    reg clk, reset;
    reg [15:0] IR;
    wire [15:0] ALUout;
    wire [15:0] R_out, R_out_1, R_out_2, R_out_3, R_out_4, R_out_5, R_out_6, R_out_7;
    wire [15:0] PC_out;

    // Kh?i t?o CPU
    lc3_cpu uut (
        .clk(clk),
        .reset(reset),
        .IR(IR),
        .ALUout(ALUout),
        .R_out_0(R_out_0), .R_out_1(R_out_1), .R_out_2(R_out_2), .R_out_3(R_out_3),
        .R_out_4(R_out_4), .R_out_5(R_out_5), .R_out_6(R_out_6), .R_out_7(R_out_7),
        .PC_out(PC_out)
    );

    // Xung clock (chu k? 10ns)
    always #5 clk = ~clk;

    initial begin
        // Kh?i t?o
        clk = 0;
        reset = 1;
        #10;  // G?i reset trong 10ns
        reset = 0;

        // Ki?m tra các l?nh
        IR = 16'b0001_0001_00000011;  // L?nh ADD
        #10;
        $display("ADD Test: R1 = %h", uut.R_out);

        // Ki?m tra các l?nh khác...
        // D?ng mô ph?ng
        $stop;
    end
endmodule
Beta
0 / 0
used queries
1