`ifndef LC3_DEFS_VH
`define LC3_DEFS_VH

// Opcodes LC-3
`define OP_BR    4'b0000
`define OP_ADD   4'b0001
`define OP_LD    4'b0010
`define OP_ST    4'b0011
`define OP_JSR   4'b0100   // JSR/JSRR (bit 11 phân bi?t)
`define OP_AND   4'b0101
`define OP_LDR   4'b0110
`define OP_STR   4'b0111
`define OP_RTI   4'b1000   // (không tri?n khai)
`define OP_NOT   4'b1001
`define OP_LDI   4'b1010
`define OP_STI   4'b1011
`define OP_JMP   4'b1100
`define OP_RES   4'b1101   // (reserved)
`define OP_LEA   4'b1110
`define OP_TRAP  4'b1111   // (ch?a tri?n khai)

//////////////////////////////////////////////
// FSM STATES
//////////////////////////////////////////////
`define S_FETCH1     5'd0   // MAR <= PC
`define S_FETCH2     5'd1   // MDR <= MEM[MAR]
`define S_FETCH3     5'd2   // IR <= MDR; PC <= PC + 1
`define S_DECODE     5'd3

// Arithmetic / Logic
`define S_EXEC_ADD   5'd4
`define S_EXEC_AND   5'd5
`define S_EXEC_NOT   5'd6

// Address calc
`define S_ADDR_PC9   5'd7   // PC-relative offset9
`define S_ADDR_PC11  5'd8   // PC-relative offset11 (JSR)
`define S_ADDR_BASE6 5'd9   // Base + offset6

// Memory operations
`define S_LD_MEM1    5'd10  // MDR <= M[ALUOut]
`define S_LD_MEM2    5'd11  // DR <= MDR
`define S_ST_MEM     5'd12  // M[ALUOut] <= SR

// Indirect (LDI/STI) first level
`define S_LDI_PTR1   5'd13  // MDR <= M[ALUOut] (pointer)
`define S_LDI_PTR2   5'd14  // MAR <= MDR (pointer)
`define S_LDI_DATA1  5'd15  // MDR <= M[MAR]
`define S_LDI_DATA2  5'd16  // DR <= MDR

`define S_STI_PTR1   5'd17  // MDR <= M[ALUOut] (pointer)
`define S_STI_PTR2   5'd18  // M[MDR] <= SR

// Writeback & Branch
`define S_WRITEBACK  5'd19
`define S_BRANCH     5'd20
`define S_JSR_SAVE   5'd21  // R7 <= PC (already incremented)
`define S_JMP        5'd22

`endif
