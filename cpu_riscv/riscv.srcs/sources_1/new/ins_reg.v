module ins_reg(data, fetch, clk, rst, ins, ad1, ad2);  
// Thanh ghi lenh  
input clk, rst; 
input [1:0] fetch; 
input [7:0] data; 
output [2:0] ins; 
output [4:0] ad1; 
output [7:0] ad2; 
reg [7:0] ins_p1, ins_p2; 
reg [2:0] state; 
assign ins = ins_p1[7:5]; // 3 bit cao, bieu dien lenh 
assign ad1 = ins_p1[4:0]; // 5 bit thap, bieu dien dia chi thanh ghi 
assign ad2 = ins_p2; 
always @(posedge clk or negedge rst) begin 
    if(!rst) begin 
        ins_p1 <= 8'd0; 
        ins_p2 <= 8'd0; 
    end 
    else begin 
        if(fetch==2'b01) begin     //fetch==2'b01, Lay dia chi lenh tu REG
            ins_p1 <= data;
            ins_p2 <= ins_p2; 
        end 
        else if(fetch==2'b10) begin     //fetch==2'b10, Lay du lieu tu ROM hoac RAM 
            ins_p1 <= ins_p1; 
            ins_p2 <= data; 
        end 
        else begin 
            ins_p1 <= ins_p1; 
            ins_p2 <= ins_p2; 
    end 
 end 
end 
endmodule