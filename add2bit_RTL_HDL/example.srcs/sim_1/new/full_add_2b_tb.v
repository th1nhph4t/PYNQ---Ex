`timescale 1ns / 1ps
module testbench;

    reg [1:0] a;
    reg [1:0] b;
    wire [2:0] sum;

    // G?i module c?n test
    full_adder_2b uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Th? t?t c? các tr??ng h?p ??u vào
        a = 2'b00; b = 2'b00; #10;
        a = 2'b01; b = 2'b01; #10;
        a = 2'b10; b = 2'b01; #10;
        a = 2'b11; b = 2'b11; #10;
        a = 2'b01; b = 2'b10; #10;
        a = 2'b10; b = 2'b10; #10;

        $finish; // k?t thúc mô ph?ng
    end

endmodule
