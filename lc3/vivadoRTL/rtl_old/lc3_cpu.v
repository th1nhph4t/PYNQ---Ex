module lc3_cpu(
    input  clk,
    input  reset,
    input  [15:0] IR,
    output [15:0] ALUout,                 // Không còn là reg; du?c drive b?i ALU (wire)
    output [15:0] R_out_0, R_out_1, R_out_2, R_out_3,
    output [15:0] R_out_4, R_out_5, R_out_6, R_out_7,
    output reg [15:0] PC_out
);

    // Control signals
    wire [3:0] ALUOp;
    wire MemWrite, MemRead, RegWrite;

    // Register file read ports
    wire [15:0] RF_ReadData1;
    wire [15:0] RF_ReadData2;

    // ALU result
    wire [15:0] ALUResult;

    // Memory read data
    wire [15:0] MemReadData;

    // Write-back data selection
    wire [15:0] WriteBackData;
    assign WriteBackData = (MemRead) ? MemReadData : ALUResult;

    // Control Unit
    ControlUnit cu (
        .Opcode(IR[15:12]),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .RegWrite(RegWrite)
    );

    // Register File
    RegisterFile rf (
        .clk(clk),
        .reset(reset),
        .read_reg1(IR[11:9]),     // SR (ho?c DR tùy l?nh)
        .read_reg2(IR[8:6]),      // SR2
        .write_reg(IR[11:9]),     // T?m th?i: ghi vào cùng tru?ng (c?n c?i ti?n cho d?nh d?ng khác)
        .write_data(WriteBackData),
        .reg_write(RegWrite),
        .read_data1(RF_ReadData1),
        .read_data2(RF_ReadData2),
        .r0(R_out_0), .r1(R_out_1), .r2(R_out_2), .r3(R_out_3),
        .r4(R_out_4), .r5(R_out_5), .r6(R_out_6), .r7(R_out_7)
    );

    // ALU
    LC3_ALU alu (
        .A(RF_ReadData1),
        .B(RF_ReadData2),
        .ALUControl(ALUOp),
        .Result(ALUResult)
    );

    assign ALUout = ALUResult;

    // Memory (d?a ch? t?m th?i dùng ALUResult)
    Memory mem (
        .clk(clk),
        .Address(ALUResult),
        .WriteData(RF_ReadData2),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ReadData(MemReadData)
    );

    // PC logic (t?m th?i: gán b?ng ALUResult — c?n thay b?ng PC + 1 ho?c PC + offset tùy lo?i l?nh)
    always @(posedge clk or posedge reset) begin
        if (reset)
            PC_out <= 16'h3000;
        else
            PC_out <= PC_out + 16'd1;  // T?I THI?U: tang tu?n t?; sau này thêm branch/LEA
    end

    // N?u b?n có thêm 'stop;' trong file, hãy xóa ho?c ch? dùng trong mô ph?ng:
    //`ifdef SIMULATION
    // initial begin
    //    #200 $stop;
    // end
    //`endif

endmodule
