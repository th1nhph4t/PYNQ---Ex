#include <iostream>
#include <cstdint>
#include <cassert>
enum class Operation {
    ADD = 0,
    SUBTRACT,
    NOT,
    NAND,
    NOR,
    AND,
    OR,
    XOR,
    LEFT_SHIFT,
    RIGHT_SHIFT,
    GREATER_THAN,
    LESS_THAN,
    EQUAL
};

extern "C" {
void ALU(int32_t a, int32_t b, int op, int32_t& result) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=a
#pragma HLS INTERFACE s_axilite port=b
#pragma HLS INTERFACE s_axilite port=op
#pragma HLS INTERFACE s_axilite port=result

    switch (op) {
        case 0: result = a + b; break; // addition
        case 1: result = a - b; break; // subtraction
        case 2: result = ~a; break; // NOT gate
        case 3: result = ~(a & b); break; // NAND gate
        case 4: result = ~(a | b); break; // NOR gate
        case 5: result = a & b; break; // AND gate
        case 6: result = a | b; break; // OR gate
        case 7: result = a ^ b; break; // XOR gate
        case 8: result = a << b; break; // LEFT_SHIFT
        case 9: result = a >> b; break; // RIGHT_SHIFT
        case 10: result = (a > b) ? a : b; break; // GREATER_THAN
        case 11: result = (a < b) ? a : b; break; // LESS_THAN
        case 12: result = (a == b) ? a : 0; break; // EQUAL
        default: result = 0; break;
    }
}
}
