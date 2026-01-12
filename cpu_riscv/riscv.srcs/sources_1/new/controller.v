module controller(ins, clk, rst, write_r, read_r, PC_en, fetch, ac_ena, ram_ena, rom_ena,ram_write, ram_read, rom_read, ad_sel); 
input clk, rst;     // Tin hieu xung clock, Tin hieu reset muc cao 
input [2:0] ins;    // Lenh, 3 bit, co tat ca 8 lenh 
// Cac tin hieu dieu khien 
output reg write_r, read_r, PC_en, ac_ena, ram_ena, rom_ena; 
 
// ROM: Noi cac lenh duoc luu tru. Chi co chuc nang doc. 
// RAM: Noi du lieu duoc luu tru. Co c? chuc nang doc va ghi. 
output reg ram_write, ram_read, rom_read, ad_sel; 
output reg [1:0] fetch;  // 01: lay lenh hoac du lieu tu RAM/ROM;  
                               // 10: lay lenh hoac du lieu tu REG 
reg [3:0] current_state;  // Trang thai hien tai 
reg [3:0] next_state;   // Trang thai ke tiep 
// Lenh 
parameter  NOP=3'b000, // No operation 
   LDO=3'b001, // Load ROM to register 
   LDA=3'b010, // Load RAM to register 
   STO=3'b011, // Store intermediate results to accumulator 
   PRE=3'b100, // Prefetch Data from Address 
   XOR=3'b101, // Xors the contents of the memory address or integer to the accumulator 
   LDM=3'b110, // Load Multiple 
   HLT=3'b111; // Halt 
// Cac trang thai     
parameter  Sidle=4'hf, 
 S0=4'd0, 
    S1=4'd1, 
    S2=4'd2, 
    S3=4'd3, 
    S4=4'd4, 
    S5=4'd5, 
    S6=4'd6, 
    S7=4'd7, 
    S8=4'd8, 
    S9=4'd9, 
    S10=4'd10, 
    S11=4'd11, 
    S12=4'd12;   
//PART 1: D flip latch; Thanh ghi trang thai 
always @(posedge clk or negedge rst)  
begin 
 if(!rst) current_state <= Sidle; 
 else current_state <= next_state;  
end 
//PART 2: Tong hop logic cac trang thai ke tiep 
always @(*) 
begin 
case(current_state) 
S1:  begin 
   if (ins==NOP) next_state=S0; 
   else if (ins==HLT)  next_state=S2; 
   else if (ins==PRE | ins==XOR) next_state=S9; 
   else if (ins==LDM) next_state=S11; 
   else next_state=S3; 
 end 
 
S4:  begin 
   if (ins==LDA | ins==LDO) next_state=S5; 
   else next_state=S7; 
  end 
Sidle: next_state=S0; 
S0:  next_state=S1; 
S2:      next_state=S2; 
S3:  next_state=S4; 
S5:  next_state=S6; 
S6:  next_state=S0; 
S7:  next_state=S8; 
S8:  next_state=S0; 
S9:  next_state=S10; 
S10:  next_state=S0; 
S11:  next_state=S12; 
S12:  next_state=S0; 
default: next_state=Sidle; 
endcase 
end 
//PART 3: Logic tong hop ngo ra 
always@(*) 
begin  
case(current_state) 
  Sidle: begin 
   write_r=1'b0; 
   read_r=1'b0; 
   PC_en=1'b0;  
 ac_ena=1'b0; 
   ram_ena=1'b0; 
   rom_ena=1'b0; 
   ram_write=1'b0; 
   ram_read=1'b0; 
   rom_read=1'b0; 
   ad_sel=1'b0; 
   fetch=2'b00; 
   end   
     S0: begin // Tim va nap lenh 1 
   write_r=0; 
   read_r=0; 
   PC_en=0; 
         ac_ena=0; 
   ram_ena=0; 
   rom_ena=1; 
   ram_write=0; 
   ram_read=0; 
   rom_read=1; 
   ad_sel=0; 
   fetch=2'b01; 
   end 
     S1: begin  // Tang PC them 1 
   write_r=0; 
   read_r=0; 
   PC_en=1;  
   ac_ena=0; 
   ram_ena=0; 
   ram_write=0;
    ram_read=0; 
   rom_ena=1; 
   rom_read=1;  
   ad_sel=0; 
   fetch=2'b00; 
   end 
     S2: begin   
   write_r=0; 
   read_r=0; 
   PC_en=0; 
   ac_ena=0; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00; 
   end  
     S3: begin // Tim va nap lenh 2 
   write_r=0; 
   read_r=0; 
   PC_en=0; 
   ac_ena=1;  
   ram_ena=0; 
   rom_ena=1; 
   ram_write=0; 
   ram_read=0; 
   rom_read=1;
    ad_sel=0; 
       fetch=2'b10;  
   end   
S4: begin       // Tang PC them 1 
   write_r=0; 
   read_r=0; 
   PC_en=1; 
   ac_ena=1; 
   ram_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_ena=1;  
   rom_read=1; 
   ad_sel=0; 
   fetch=2'b10;  
   end   
     S5: begin  // LDA/LDO 
   if (ins==LDO)    // LDO, REG -> ROM 
   begin 
   write_r=1; 
   read_r=0; 
   PC_en=0; 
   ac_ena=1; 
   ram_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_ena=1; 
   rom_read=1; 
   ad_sel=1;
    fetch=2'b01;     
   end 
   else             // LDA, REG -> RAM 
   begin 
   write_r=1; 
   read_r=0; 
   PC_en=0; 
   ac_ena=1; 
   ram_ena=1; 
      ram_write=0; 
   ram_read=1; 
   rom_ena=0; 
   rom_read=0; 
   ad_sel=1; 
   fetch=2'b01; 
   end   
   end   
     S6: begin   
       write_r=1'b0; 
   read_r=1'b0; 
   PC_en=1'b0; 
   ac_ena=1'b0; 
   ram_ena=1'b0; 
   rom_ena=1'b0; 
   ram_write=1'b0; 
   ram_read=1'b0; 
   rom_read=1'b0; 
   ad_sel=1'b0; 
   fetch=2'b00; 
end 
     S7: begin  // STO giai doan 1, REG -> RAM. Read REG 
   write_r=0; 
   read_r=1; 
   PC_en=0; 
   ac_ena=0; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00; 
   end  
     S8: begin  // STO giai doan 2. Write RAM 
   write_r=0; 
   read_r=1; 
   PC_en=0; 
   ac_ena=0; 
   rom_read=0; 
   rom_ena=0; 
   ram_ena=1; 
   ram_write=1; 
   ram_read=0; 
   ad_sel=1; 
   fetch=2'b10; 
   end 
     S9: begin  // PRE/XOR giai doan 1 
   if (ins==PRE) // PRE, REG -> ACCUM
    begin 
   write_r=0; 
   read_r=1; 
   PC_en=0; 
   ac_ena=1; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00; 
   end 
   else         // XOR 
   begin  
   write_r=0; 
   read_r=1; 
   PC_en=0; 
   ac_ena=1; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00;    
   end  
   end  
    S10: begin
     write_r=0; 
   read_r=1; 
   PC_en=0; 
   ac_ena=0; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00; 
   end  
    S11: begin // LDM, write REG 
   write_r=1; 
   read_r=0; 
   PC_en=0; 
   ac_ena=1; 
   ram_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_ena=1; 
   rom_read=1; 
   ad_sel=0; 
   fetch=2'b00;   
   end  
    S12: begin  
   write_r=0; 
   read_r=0; 
   PC_en=0; 
 ac_ena=0; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00;   
   end 
default: begin 
   write_r=0; 
   read_r=0; 
   PC_en=0; 
   ac_ena=0; 
   ram_ena=0; 
   rom_ena=0; 
   ram_write=0; 
   ram_read=0; 
   rom_read=0; 
   ad_sel=0; 
   fetch=2'b00;    
   end 
endcase 
end 
endmodule 