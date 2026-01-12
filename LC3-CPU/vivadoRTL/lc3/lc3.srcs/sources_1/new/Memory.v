module Memory (
    input  clk,
    input  MemRead,
    input  MemWrite,
    input  [15:0] Address,
    input  [15:0] WriteData,
    output [15:0] ReadData
);
    reg [15:0] mem [0:65535];

    // ??c async
    assign ReadData = (MemRead) ? mem[Address] : 16'h0000;

    // Ghi sync
    always @(posedge clk) begin
        if (MemWrite)
            mem[Address] <= WriteData;
    end

    // Kh?i t?o ví d? (có th? b? khi t?ng h?p)
    // initial begin
    //     mem[16'h3000] = 16'h1234;
    // end
endmodule
