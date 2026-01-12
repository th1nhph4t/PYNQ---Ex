module ControlUnit (
    input [3:0] Opcode,
    output reg [3:0] ALUOp,
    output reg MemWrite,
    output reg MemRead,
    output reg RegWrite
);

always @(*) begin
    case (Opcode)
        4'b0000: begin // ADD
            ALUOp = 4'b0000;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
        end
        4'b0001: begin // AND
            ALUOp = 4'b0001;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
        end
        4'b0010: begin // NOT
            ALUOp = 4'b0010;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
        end
        4'b0011: begin // LD
            ALUOp = 4'b0011;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 1;
        end
        4'b0100: begin // LDI
            ALUOp = 4'b0100;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 1;
        end
        4'b0101: begin // LEA
            ALUOp = 4'b0101;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
        end
        4'b0110: begin // ST
            ALUOp = 4'b0110;
            RegWrite = 0;
            MemWrite = 1;
            MemRead = 0;
        end
        default: begin
            ALUOp = 4'b1111;
            RegWrite = 0;
            MemWrite = 0;
            MemRead = 0;
        end
    endcase
end

endmodule
Beta
0 / 0
used queries
1