module RegisterFile (
    input clk,
    input reset,
    input [2:0] read_reg1,
    input [2:0] read_reg2,
    input [2:0] write_reg,
    input [15:0] write_data,
    input reg_write,
    output [15:0] read_data1,
    output [15:0] read_data2,
    output [15:0] r0, r1, r2, r3, r4, r5, r6, r7
);
    reg [15:0] registers [0:7];

    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

    assign r0 = registers[0];
    assign r1 = registers[1];
    assign r2 = registers[2];
    assign r3 = registers[3];
    assign r4 = registers[4];
    assign r5 = registers[5];
    assign r6 = registers[6];
    assign r7 = registers[7];

    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i=0;i<8;i=i+1) registers[i] <= 16'b0;
        end else if (reg_write) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule
