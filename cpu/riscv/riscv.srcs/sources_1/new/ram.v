
module ram(data, addr, ena, read, write); 
input ena, read, write; 
input [7:0] addr; 
inout [7:0] data; 
reg [7:0] ram[255:0]; 
assign data = (read&&ena)? ram[addr]:8'hzz;  
always @(posedge write) begin        
    ram[addr] <= data; 
end 
endmodule