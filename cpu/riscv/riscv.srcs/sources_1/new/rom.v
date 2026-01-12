
module rom(data, addr, read, ena); 
input read, ena; 
input [7:0] addr; 
output [7:0] data; 
reg [7:0] memory[255:0]; 
// Ghi chu: Cac so ben trong dau ngoac la cac so thap phan 
initial begin 
    memory[0] = 8'b000_00000; // NOP 
//[ins] [target_reg_addr] [from_rom_addr] 
memory[1] = 8'b001_00001;  // LDO s1   LDO la lenh dai 
memory[2] = 8'b00101101;   // ROM(45) REG(1) <- ROM(45) 
memory[3] = 8'b001_00010;  // LDO s2   LDO la lenh dai 
memory[4] = 8'b00110111;   // ROM(55) REG(2) <- ROM(55) 
memory[5] = 8'b100_00001;  // PRE s1 ACCUM <- REG(1) 
memory[6] = 8'b101_00010;  // XOR s2  ACCUM <- REG(2)^ACCUM 
memory[7] = 8'b110_00001;  // LDM s1  REG(1) <- ACCUM 
memory[8] = 8'b011_00001;  // STO s1   STO la lenh dai 
memory[9] = 8'b00000001;   // RAM(1)   RAM(1) <- REG(1)    
memory[10] = 8'b111_00000; // HLT 

memory[45] = 8'b11001010;  // 1100 1010 
memory[55] = 8'b01100001;  // 0110 0001 
//  memory[45] = 8'b10010110;   // 1001 0110 
//  memory[55] = 8'b11100011; // 1110 0011

end 
assign data = (read&&ena)? memory[addr]:8'hzz; 
endmodule 