module core (
    input wire clk,
    input wire rst,
    output wire [7:0] data_out
);
    // Các tín hi?u n?i b? ?? k?t n?i các kh?i
    wire [7:0] data_rom, data_ram, alu_out, accum_out;
    wire [7:0] addr_rom, addr_ram, addr_mux;
    wire [2:0] ins;
    wire read_rom, read_ram, ena_rom, ena_ram;
    wire PC_en, ac_ena, ram_ena, rom_ena, ram_write, ram_read, rom_read;
    wire [7:0] pc_addr;
    
    // Instantiate ROM
    rom ROM (
        .addr(addr_rom),
        .read(read_rom),
        .ena(ena_rom),
        .data(data_rom)
    );

    // Instantiate RAM
    ram RAM (
        .addr(addr_ram),
        .read(read_ram),
        .ena(ena_ram),
        .data(data_ram)
    );

    // Instantiate ALU
    alu ALU (
        .accum(accum_out),
        .alu_in(data_rom),  // K?t n?i v?i d? li?u t? ROM
        .op(ins),  // Mã l?nh t? Instruction Register
        .alu_out(alu_out)
    );

    // Instantiate General Register
    gen_reg GEN_REG (
        .clk(clk),
        .read(ena_rom),
        .write(ena_ram),
        .in(data_rom),
        .data(accum_out)
    );

    // Instantiate MUX
    mux MUX (
        .ir_ad(data_rom),
        .pc_ad(data_ram),
        .sel(1'b1),  // Gi? s? tín hi?u ch?n
        .addr(addr_mux)
    );

    // Instantiate Instruction Register
    ins_reg INS_REG (
        .clk(clk),
        .data(data_rom),
        .fetch(2'b01),
        .ins(ins)
    );

    // Instantiate Accumulator
    accum ACCUM (
        .clk(clk),
        .ena(ac_ena),  // Kích ho?t t? Controller
        .in(alu_out),
        .out(accum_out)
    );

    // Instantiate Controller
    controller CONTROLLER (
        .clk(clk),
        .rst(rst),
        .ins(ins),
        .PC_en(PC_en),
        .ac_ena(ac_ena),
        .ram_ena(ram_ena),
        .rom_ena(rom_ena),
        .ram_write(ram_write),
        .ram_read(ram_read),
        .rom_read(rom_read),
        .fetch(fetch)
    );

    // Instantiate Program Counter (PC)
    pc PC (
        .clk(clk),
        .rst(rst),
        .en(PC_en),
        .pc_addr(pc_addr)
    );

    // Output data t? ALU ho?c kh?i khác
    assign data_out = alu_out;  // K?t n?i ra ngoài t? ALU ho?c các kh?i tính toán khác
endmodule
