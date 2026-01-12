module Memory (
    input clk,
    input [15:0] Address,
    input [15:0] WriteData,
    input MemWrite,
    input MemRead,
    output reg [15:0] ReadData
);

    reg [15:0] memory [0:65535];

    always @(*) begin
        if (MemRead)
            ReadData = memory[Address];
        else
            ReadData = 16'h0000;
    end

    always @(posedge clk) begin
        if (MemWrite)
            memory[Address] <= WriteData;
    end
endmodule
