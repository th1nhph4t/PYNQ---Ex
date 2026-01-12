`include "lc3_defs.vh"

module lc3_cpu(
    input  clk,
    input  reset,
    output [15:0] R_out_0, R_out_1, R_out_2, R_out_3,
    output [15:0] R_out_4, R_out_5, R_out_6, R_out_7,
    output [15:0] PC_dbg,
    output [2:0]  NZP_dbg,
    output [15:0] IR_dbg
);

    // Thanh ghi tr?ng thái
    reg [15:0] PC;
    reg [15:0] IR;
    reg [15:0] MAR;
    reg [15:0] MDR;
    reg [15:0] ALUOut;

    // C? ?i?u ki?n
    reg N_flag, Z_flag, P_flag;

    // FSM
    reg [4:0] state, next_state;

    // Gi?i mã tr??ng
    wire [3:0] opcode = IR[15:12];
    wire [2:0] DR     = IR[11:9];
    wire [2:0] SR1    = IR[8:6];
    wire [2:0] SR2    = IR[2:0];
    wire       bit5   = IR[5];
    wire       bit11  = IR[11];

    // D?ch & sign extend
    wire [4:0] imm5       = IR[4:0];
    wire [5:0] off6       = IR[5:0];
    wire [8:0] pc_off9    = IR[8:0];
    wire [10:0] pc_off11  = IR[10:0];

    wire [15:0] sext_imm5   = {{11{imm5[4]}}, imm5};
    wire [15:0] sext_off6   = {{10{off6[5]}}, off6};
    wire [15:0] sext_pcoff9 = {{7{pc_off9[8]}}, pc_off9};
    wire [15:0] sext_pcoff11= {{5{pc_off11[10]}}, pc_off11};

    // Branch condition bits
    wire br_n = IR[11];
    wire br_z = IR[10];
    wire br_p = IR[9];

    // K?t n?i RegisterFile
    wire [15:0] rf_read_data1;
    wire [15:0] rf_read_data2;
    reg  [2:0]  write_reg;
    reg  [15:0] write_data;
    reg         reg_write_en;

    RegisterFile rf (
        .clk(clk),
        .reset(reset),
        .read_reg1(SR1),
        .read_reg2(SR2),
        .write_reg(write_reg),
        .write_data(write_data),
        .reg_write(reg_write_en),
        .read_data1(rf_read_data1),
        .read_data2(rf_read_data2),
        .r0(R_out_0), .r1(R_out_1), .r2(R_out_2), .r3(R_out_3),
        .r4(R_out_4), .r5(R_out_5), .r6(R_out_6), .r7(R_out_7)
    );

    // ALU
    reg [3:0]  alu_ctrl;
    reg [15:0] alu_A, alu_B;
    wire [15:0] alu_result;

    LC3_ALU alu (
        .A(alu_A),
        .B(alu_B),
        .ALUControl(alu_ctrl),
        .Result(alu_result)
    );

    // Memory
    reg MemRead, MemWrite;
    wire [15:0] mem_out;

    Memory mem (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Address(MAR),
        .WriteData(MDR),
        .ReadData(mem_out)
    );

    // C?p nh?t c? NZP khi ghi register (tr? R7 do JSR?)
    // Quy ??c: nh?ng instruction ghi DR (ADD/AND/NOT/LD/LDI/LDR/LEA) c?p nh?t, JSR ghi R7 không c?p nh?t.
    task update_nzp;
        input [15:0] val;
        begin
            N_flag = (val[15] == 1);
            Z_flag = (val == 16'h0000);
            P_flag = (~val[15] && val != 16'h0000);
        end
    endtask

    // FSM chuy?n tr?ng thái
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= `S_FETCH1;
            PC <= 16'h3000;
            IR <= 16'h0000;
            MAR <= 16'h0000;
            MDR <= 16'h0000;
            ALUOut <= 16'h0000;
            N_flag <= 0; Z_flag <= 1; P_flag <= 0;
        end else begin
            state <= next_state;

            // M?t s? hành vi theo t?ng state
            case (state)
                `S_FETCH1: begin
                    MAR <= PC;
                end
                `S_FETCH2: begin
                    // ??c memory ? MAR async => mem_out
                    MDR <= mem_out;
                end
                `S_FETCH3: begin
                    IR <= MDR;
                    PC <= PC + 16'd1;
                end
                `S_EXEC_ADD,
                `S_EXEC_AND,
                `S_EXEC_NOT: begin
                    ALUOut <= alu_result;
                end
                `S_ADDR_PC9,
                `S_ADDR_PC11,
                `S_ADDR_BASE6: begin
                    ALUOut <= alu_result;
                end
                `S_LD_MEM1: begin
                    MDR <= mem_out;
                end
                `S_LD_MEM2: begin
                    // DR <= MDR handled in writeback signals
                end
                `S_ST_MEM: begin
                    // memory write occurs on posedge
                end
                `S_LDI_PTR1: begin
                    MDR <= mem_out;
                end
                `S_LDI_PTR2: begin
                    MAR <= MDR; // pointer
                end
                `S_LDI_DATA1: begin
                    MDR <= mem_out;
                end
                `S_LDI_DATA2: begin
                    // DR <= MDR handled by reg_write
                end
                `S_STI_PTR1: begin
                    MDR <= mem_out; // pointer
                end
                `S_STI_PTR2: begin
                    // memory write
                end
                `S_JSR_SAVE: begin
                    // Write R7 done by reg_write path
                end
                `S_JMP: begin
                    // PC <= BaseR done below (we can store in ALUOut earlier)
                end
                `S_BRANCH: begin
                    // PC <= ALUOut if condition
                end
            endcase
        end
    end

    // Logic combinational ?i?u khi?n
    always @(*) begin
        // M?c ??nh
        next_state     = state;
        MemRead        = 0;
        MemWrite       = 0;
        reg_write_en   = 0;
        write_reg      = 3'b000;
        write_data     = 16'h0000;
        alu_A          = 16'h0000;
        alu_B          = 16'h0000;
        alu_ctrl       = 4'b0000;

        case (state)
            //////////////////////////////////////////////////
            // FETCH
            //////////////////////////////////////////////////
            `S_FETCH1: begin
                MemRead    = 1;
                next_state = `S_FETCH2;
            end
            `S_FETCH2: begin
                MemRead    = 1;
                next_state = `S_FETCH3;
            end
            `S_FETCH3: begin
                next_state = `S_DECODE;
            end

            //////////////////////////////////////////////////
            // DECODE
            //////////////////////////////////////////////////
            `S_DECODE: begin
                case (opcode)
                    `OP_ADD: next_state = `S_EXEC_ADD;
                    `OP_AND: next_state = `S_EXEC_AND;
                    `OP_NOT: next_state = `S_EXEC_NOT;
                    `OP_LD:  next_state = `S_ADDR_PC9;
                    `OP_LEA: next_state = `S_ADDR_PC9;
                    `OP_LDI: next_state = `S_ADDR_PC9;
                    `OP_ST:  next_state = `S_ADDR_PC9;
                    `OP_STI: next_state = `S_ADDR_PC9;
                    `OP_LDR: next_state = `S_ADDR_BASE6;
                    `OP_STR: next_state = `S_ADDR_BASE6;
                    `OP_BR:  next_state = `S_ADDR_PC9;
                    `OP_JSR: begin
                        if (bit11)
                            next_state = `S_ADDR_PC11; // JSR offset11
                        else
                            next_state = `S_JMP;        // JSRR (JMP-like)
                    end
                    `OP_JMP: next_state = `S_JMP;
                    default: next_state = `S_FETCH1; // Unsupported -> fetch ti?p
                endcase
            end

            //////////////////////////////////////////////////
            // Arithmetic / Logic
            //////////////////////////////////////////////////
            `S_EXEC_ADD: begin
                // ADD: A=SR1, B= (imm5 or SR2)
                alu_A = rf_read_data1;
                alu_B = (bit5) ? sext_imm5 : rf_read_data2;
                alu_ctrl = 4'b0000;
                // ALUOut <= result (registered ? clock)
                next_state = `S_WRITEBACK;
            end
            `S_EXEC_AND: begin
                alu_A = rf_read_data1;
                alu_B = (bit5) ? sext_imm5 : rf_read_data2;
                alu_ctrl = 4'b0001;
                next_state = `S_WRITEBACK;
            end
            `S_EXEC_NOT: begin
                alu_A = rf_read_data1;
                alu_ctrl = 4'b0010;
                next_state = `S_WRITEBACK;
            end

            //////////////////////////////////////////////////
            // Address Calculations
            //////////////////////////////////////////////////
            `S_ADDR_PC9: begin
                // ALUOut = PC + sext_pcoff9
                alu_A = PC;
                alu_B = sext_pcoff9;
                alu_ctrl = 4'b0000;
                case (opcode)
                    `OP_LD:  next_state = `S_LD_MEM1;
                    `OP_LEA: next_state = `S_WRITEBACK;
                    `OP_LDI: next_state = `S_LDI_PTR1;
                    `OP_ST:  next_state = `S_ST_MEM;
                    `OP_STI: next_state = `S_STI_PTR1;
                    `OP_BR:  next_state = `S_BRANCH;
                    default: next_state = `S_FETCH1;
                endcase
            end
            `S_ADDR_PC11: begin
                // For JSR: ALUOut = PC + sext_pcoff11 (PC already incremented)
                alu_A = PC;
                alu_B = sext_pcoff11;
                alu_ctrl = 4'b0000;
                next_state = `S_JSR_SAVE;
            end
            `S_ADDR_BASE6: begin
                // Base + offset6 (LDR / STR)
                alu_A = rf_read_data1; // SR1 is BaseR
                alu_B = sext_off6;
                alu_ctrl = 4'b0000;
                if (opcode == `OP_LDR) next_state = `S_LD_MEM1;
                else if (opcode == `OP_STR) next_state = `S_ST_MEM;
                else next_state = `S_FETCH1;
            end

            //////////////////////////////////////////////////
            // Load / Store direct
            //////////////////////////////////////////////////
            `S_LD_MEM1: begin
                // MAR = ALUOut (?ã ch?a addr); MemRead
                MemRead = 1;
                MAR = ALUOut;
                next_state = `S_LD_MEM2;
            end
            `S_LD_MEM2: begin
                MemRead = 1;
                write_reg = DR;
                write_data = mem_out;
                reg_write_en = 1;
                // update NZP
                // (C?p nh?t sau posedge -> ta làm t?m th?i logic c? trong sequential khác,
                // ? ?ây ta ?? combinational set reg_write_en, flags s? update trong always @(posedge) "nâng cao" n?u c?n;
                // ho?c ta ch?p nh?n update ? vòng sau.)
                next_state = `S_FETCH1;
            end
            `S_ST_MEM: begin
                // MAR = ALUOut, MDR = SR (rf_read_data1 ho?c rf_read_data2?)
                // Ki?n trúc: ??i v?i ST/STR ngu?n là SR l?u trong SR1 ho?c SR2? Theo LC-3:
                // ST: DR field = base for something? Th?c t? ST: opcode(15:12) SR(11:9) PCoffset9 => IR[11:9] là SR
                // ? giai ?o?n decode ta ch?a ??i read ports. ??n gi?n ta dùng rf_read_data1 (SR1) là ngu?n.
                MemWrite = 1;
                MAR = ALUOut;
                MDR = rf_read_data1;
                next_state = `S_FETCH1;
            end

            //////////////////////////////////////////////////
            // Indirect LDI
            //////////////////////////////////////////////////
            `S_LDI_PTR1: begin
                // First level pointer read
                MemRead = 1;
                MAR = ALUOut;
                next_state = `S_LDI_PTR2;
            end
            `S_LDI_PTR2: begin
                MemRead = 1;
                // MAR <= MDR (pointer) ? sequential
                next_state = `S_LDI_DATA1;
            end
            `S_LDI_DATA1: begin
                MemRead = 1;
                next_state = `S_LDI_DATA2;
            end
            `S_LDI_DATA2: begin
                MemRead = 1;
                write_reg = DR;
                write_data = mem_out;
                reg_write_en = 1;
                next_state = `S_FETCH1;
            end

            //////////////////////////////////////////////////
            // Indirect STI
            //////////////////////////////////////////////////
            `S_STI_PTR1: begin
                MemRead = 1;
                MAR = ALUOut;
                next_state = `S_STI_PTR2;
            end
            `S_STI_PTR2: begin
                // Write memory at pointer with SR1
                MemWrite = 1;
                MAR = MDR;         // pointer
                MDR = rf_read_data1;
                next_state = `S_FETCH1;
            end

            //////////////////////////////////////////////////
            // Branch
            //////////////////////////////////////////////////
            `S_BRANCH: begin
                // Condition check
                if ((br_n && N_flag) ||
                    (br_z && Z_flag) ||
                    (br_p && P_flag)) begin
                    // PC <= ALUOut
                    PC = ALUOut;
                end
                next_state = `S_FETCH1;
            end

            //////////////////////////////////////////////////
            // JSR / JSRR
            //////////////////////////////////////////////////
            `S_JSR_SAVE: begin
                // Save PC (already incremented in fetch)
                write_reg = 3'b111; // R7
                write_data = PC;
                reg_write_en = 1;
                // PC <= ALUOut
                PC = ALUOut;
                next_state = `S_FETCH1;
            end
            `S_JMP: begin
                // JSRR or JMP: BaseR = SR1
                // ALUOut = BaseR (dùng PASS A)
                alu_A = rf_read_data1;
                alu_ctrl = 4'b1111;
                // Th?c hi?n tr?c ti?p:
                PC = rf_read_data1;
                next_state = `S_FETCH1;
            end

            //////////////////////////////////////////////////
            // Writeback chung (ADD/AND/NOT/LEA/LDR)
            //////////////////////////////////////////////////
            `S_WRITEBACK: begin
                case (opcode)
                    `OP_ADD,
                    `OP_AND,
                    `OP_NOT: begin
                        write_reg = DR;
                        write_data = ALUOut;
                        reg_write_en = 1;
                    end
                    `OP_LEA: begin
                        write_reg = DR;
                        write_data = ALUOut;
                        reg_write_en = 1;
                    end
                    // LDR dùng chu?i LD_MEM1/LD_MEM2 nên không vào ?ây
                endcase
                next_state = `S_FETCH1;
            end

            default: begin
                next_state = `S_FETCH1;
            end
        endcase
    end

    // C?p nh?t c? ? clock n?u có ghi register (ngo?i tr? JSR ghi R7 không ??i c?)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            N_flag <= 0; Z_flag <= 1; P_flag <= 0;
        end else begin
            if (reg_write_en) begin
                // Không c?p nh?t n?u là R7 do JSR_SAVE (opcode JSR)
                if (!(opcode == `OP_JSR && write_reg == 3'b111)) begin
                    if (write_data[15] == 1) begin
                        N_flag <= 1; Z_flag <= 0; P_flag <= 0;
                    end else if (write_data == 16'h0000) begin
                        N_flag <= 0; Z_flag <= 1; P_flag <= 0;
                    end else begin
                        N_flag <= 0; Z_flag <= 0; P_flag <= 1;
                    end
                end
            end
        end
    end

    assign PC_dbg  = PC;
    assign IR_dbg  = IR;
    assign NZP_dbg = {N_flag, Z_flag, P_flag};

endmodule
