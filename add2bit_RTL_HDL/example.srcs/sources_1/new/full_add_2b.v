`timescale 1ns / 1ps
module full_adder_2b(
    input wire [1:0] a,     // ??u vào a (2 bit)
    input wire [1:0] b,     // ??u vào b (2 bit)
    output wire [2:0] sum   // ??u ra sum (3 bit)
);

    wire carry; // tín hi?u nh? trung gian

    // B? c?ng 1 bit th? nh?t
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),     // ban ??u không có bit nh?
        .sum(sum[0]),
        .cout(carry)
    );

    // B? c?ng 1 bit th? hai
    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(carry),    // c?ng thêm bit nh? t? FA0
        .sum(sum[1]),
        .cout(sum[2])
    );

endmodule

// Module full adder 1 bit
module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire xor_ab, and_ab, and_cin_xor_ab;

    xor (xor_ab, a, b); 
    xor (sum, xor_ab, cin);
    and (and_ab, a, b);
    and (and_cin_xor_ab, cin, xor_ab);
    or  (cout, and_ab, and_cin_xor_ab);

endmodule
