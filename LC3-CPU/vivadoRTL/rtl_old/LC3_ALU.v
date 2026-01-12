module LC3_ALU (
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALUControl,
    output reg [15:0] Result
);

always @(*) begin
    case (ALUControl)
        4'b0000: Result = A + B;      // ADD
        4'b0001: Result = A & B;      // AND
        4'b0010: Result = ~A;         // NOT
        default: Result = 16'b0;
    endcase
end

endmodule
Beta
0 / 0
used queries