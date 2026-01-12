module mux(addr, sel, ir_ad, pc_ad);  
// Dung de dinh dia chi cua IR hoac dia chi cua PC 
input [7:0] ir_ad, pc_ad; 
input sel; 
output [7:0] addr; 
assign addr = (sel)? ir_ad:pc_ad; 
endmodule