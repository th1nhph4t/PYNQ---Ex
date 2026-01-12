module LC3_ALU (
    input  [15:0] A,
    input  [15:0] B,
    input  [3:0]  ALUControl,
    output reg [15:0] Result
);
    // ALUControl encoding (t? ??t):
    // 0000 ADD
    // 0001 AND
    // 0010 NOT (B b? b? qua)
    // 1111 PASS A (dùng cho chuy?n giá tr?)
    always @(*) begin
        case (ALUControl)
            4'b0000: Result = A + B;
            4'b0001: Result = A & B;
            4'b0010: Result = ~A;
            4'b1111: Result = A;
            default: Result = 16'h0000;
        endcase
    end
endmodule
