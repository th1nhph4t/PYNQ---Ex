
module ControlUnit(
    input  [15:0] IR,
    output [3:0]  Opcode
);
    assign Opcode = IR[15:12];
endmodule
