module gen_reg(in, data, write, read, addr, clk); 
// Thanh ghi da dung addr 
input write, read, clk; 
input [7:0] in; 
input [7:0] addr;  
output [7:0] data; 
reg [7:0] R[31:0];  
wire [4:0] r_addr; 
assign r_addr = addr[4:0];
assign data = (read)? R[r_addr]:8'hzz;   
always @(posedge clk) begin     
    if(write) R[r_addr] <= in;  
end 
endmodule