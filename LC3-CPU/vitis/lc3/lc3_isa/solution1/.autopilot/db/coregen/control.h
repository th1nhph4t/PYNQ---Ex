// 0x000 : reserved
// 0x004 : reserved
// 0x008 : reserved
// 0x00c : reserved
// 0x010 : Data signal of IR
//         bit 15~0 - IR[15:0] (Read/Write)
//         others   - reserved
// 0x014 : reserved
// 0x018 : Data signal of PC
//         bit 15~0 - PC[15:0] (Read/Write)
//         others   - reserved
// 0x01c : reserved
// 0x020 : Data signal of PC_out
//         bit 15~0 - PC_out[15:0] (Read)
//         others   - reserved
// 0x024 : Control signal of PC_out
//         bit 0  - PC_out_ap_vld (Read/COR)
//         others - reserved
// 0x030 : Data signal of R0
//         bit 15~0 - R0[15:0] (Read)
//         others   - reserved
// 0x034 : Control signal of R0
//         bit 0  - R0_ap_vld (Read/COR)
//         others - reserved
// 0x040 : Data signal of R1
//         bit 15~0 - R1[15:0] (Read)
//         others   - reserved
// 0x044 : Control signal of R1
//         bit 0  - R1_ap_vld (Read/COR)
//         others - reserved
// 0x050 : Data signal of R2
//         bit 15~0 - R2[15:0] (Read)
//         others   - reserved
// 0x054 : Control signal of R2
//         bit 0  - R2_ap_vld (Read/COR)
//         others - reserved
// 0x060 : Data signal of R3
//         bit 15~0 - R3[15:0] (Read)
//         others   - reserved
// 0x064 : Control signal of R3
//         bit 0  - R3_ap_vld (Read/COR)
//         others - reserved
// 0x070 : Data signal of R4
//         bit 15~0 - R4[15:0] (Read)
//         others   - reserved
// 0x074 : Control signal of R4
//         bit 0  - R4_ap_vld (Read/COR)
//         others - reserved
// 0x080 : Data signal of R5
//         bit 15~0 - R5[15:0] (Read)
//         others   - reserved
// 0x084 : Control signal of R5
//         bit 0  - R5_ap_vld (Read/COR)
//         others - reserved
// 0x090 : Data signal of R6
//         bit 15~0 - R6[15:0] (Read)
//         others   - reserved
// 0x094 : Control signal of R6
//         bit 0  - R6_ap_vld (Read/COR)
//         others - reserved
// 0x0a0 : Data signal of R7
//         bit 15~0 - R7[15:0] (Read)
//         others   - reserved
// 0x0a4 : Control signal of R7
//         bit 0  - R7_ap_vld (Read/COR)
//         others - reserved
// 0x0b0 : Data signal of N
//         bit 15~0 - N[15:0] (Read)
//         others   - reserved
// 0x0b4 : Control signal of N
//         bit 0  - N_ap_vld (Read/COR)
//         others - reserved
// 0x0c0 : Data signal of Z
//         bit 15~0 - Z[15:0] (Read)
//         others   - reserved
// 0x0c4 : Control signal of Z
//         bit 0  - Z_ap_vld (Read/COR)
//         others - reserved
// 0x0d0 : Data signal of P
//         bit 15~0 - P[15:0] (Read)
//         others   - reserved
// 0x0d4 : Control signal of P
//         bit 0  - P_ap_vld (Read/COR)
//         others - reserved
// 0x0e0 : Data signal of n1
//         bit 15~0 - n1[15:0] (Read)
//         others   - reserved
// 0x0e4 : Control signal of n1
//         bit 0  - n1_ap_vld (Read/COR)
//         others - reserved
// 0x0f0 : Data signal of p1
//         bit 15~0 - p1[15:0] (Read)
//         others   - reserved
// 0x0f4 : Control signal of p1
//         bit 0  - p1_ap_vld (Read/COR)
//         others - reserved
// 0x100 : Data signal of z1
//         bit 15~0 - z1[15:0] (Read)
//         others   - reserved
// 0x104 : Control signal of z1
//         bit 0  - z1_ap_vld (Read/COR)
//         others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_IR_DATA     0x010
#define CONTROL_BITS_IR_DATA     16
#define CONTROL_ADDR_PC_DATA     0x018
#define CONTROL_BITS_PC_DATA     16
#define CONTROL_ADDR_PC_OUT_DATA 0x020
#define CONTROL_BITS_PC_OUT_DATA 16
#define CONTROL_ADDR_PC_OUT_CTRL 0x024
#define CONTROL_ADDR_R0_DATA     0x030
#define CONTROL_BITS_R0_DATA     16
#define CONTROL_ADDR_R0_CTRL     0x034
#define CONTROL_ADDR_R1_DATA     0x040
#define CONTROL_BITS_R1_DATA     16
#define CONTROL_ADDR_R1_CTRL     0x044
#define CONTROL_ADDR_R2_DATA     0x050
#define CONTROL_BITS_R2_DATA     16
#define CONTROL_ADDR_R2_CTRL     0x054
#define CONTROL_ADDR_R3_DATA     0x060
#define CONTROL_BITS_R3_DATA     16
#define CONTROL_ADDR_R3_CTRL     0x064
#define CONTROL_ADDR_R4_DATA     0x070
#define CONTROL_BITS_R4_DATA     16
#define CONTROL_ADDR_R4_CTRL     0x074
#define CONTROL_ADDR_R5_DATA     0x080
#define CONTROL_BITS_R5_DATA     16
#define CONTROL_ADDR_R5_CTRL     0x084
#define CONTROL_ADDR_R6_DATA     0x090
#define CONTROL_BITS_R6_DATA     16
#define CONTROL_ADDR_R6_CTRL     0x094
#define CONTROL_ADDR_R7_DATA     0x0a0
#define CONTROL_BITS_R7_DATA     16
#define CONTROL_ADDR_R7_CTRL     0x0a4
#define CONTROL_ADDR_N_DATA      0x0b0
#define CONTROL_BITS_N_DATA      16
#define CONTROL_ADDR_N_CTRL      0x0b4
#define CONTROL_ADDR_Z_DATA      0x0c0
#define CONTROL_BITS_Z_DATA      16
#define CONTROL_ADDR_Z_CTRL      0x0c4
#define CONTROL_ADDR_P_DATA      0x0d0
#define CONTROL_BITS_P_DATA      16
#define CONTROL_ADDR_P_CTRL      0x0d4
#define CONTROL_ADDR_N1_DATA     0x0e0
#define CONTROL_BITS_N1_DATA     16
#define CONTROL_ADDR_N1_CTRL     0x0e4
#define CONTROL_ADDR_P1_DATA     0x0f0
#define CONTROL_BITS_P1_DATA     16
#define CONTROL_ADDR_P1_CTRL     0x0f4
#define CONTROL_ADDR_Z1_DATA     0x100
#define CONTROL_BITS_Z1_DATA     16
#define CONTROL_ADDR_Z1_CTRL     0x104
