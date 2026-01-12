module pc(pc_addr, clk, rst, en); 
// Bo dem chuong trinh 

input clk, rst, en; 
output reg [7:0] pc_addr; 
always @(posedge clk or negedge rst) begin 
    if(!rst) begin 
        pc_addr <= 8'd0; 
    end 
    else begin 
        if(en) pc_addr <= pc_addr+1; 
        else pc_addr <= pc_addr; 
    end 
end 
endmodule 