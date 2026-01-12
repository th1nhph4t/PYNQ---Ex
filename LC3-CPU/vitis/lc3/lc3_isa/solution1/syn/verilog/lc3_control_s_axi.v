// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module lc3_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 9,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [15:0]                   IR,
    output wire [15:0]                   PC,
    input  wire [15:0]                   PC_out,
    input  wire                          PC_out_ap_vld,
    input  wire [15:0]                   R0,
    input  wire                          R0_ap_vld,
    input  wire [15:0]                   R1,
    input  wire                          R1_ap_vld,
    input  wire [15:0]                   R2,
    input  wire                          R2_ap_vld,
    input  wire [15:0]                   R3,
    input  wire                          R3_ap_vld,
    input  wire [15:0]                   R4,
    input  wire                          R4_ap_vld,
    input  wire [15:0]                   R5,
    input  wire                          R5_ap_vld,
    input  wire [15:0]                   R6,
    input  wire                          R6_ap_vld,
    input  wire [15:0]                   R7,
    input  wire                          R7_ap_vld,
    input  wire [15:0]                   N,
    input  wire                          N_ap_vld,
    input  wire [15:0]                   Z,
    input  wire                          Z_ap_vld,
    input  wire [15:0]                   P,
    input  wire                          P_ap_vld,
    input  wire [15:0]                   n1,
    input  wire                          n1_ap_vld,
    input  wire [15:0]                   p1,
    input  wire                          p1_ap_vld,
    input  wire [15:0]                   z1,
    input  wire                          z1_ap_vld
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_none
//
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

//------------------------Parameter----------------------
localparam
    ADDR_IR_DATA_0     = 9'h010,
    ADDR_IR_CTRL       = 9'h014,
    ADDR_PC_DATA_0     = 9'h018,
    ADDR_PC_CTRL       = 9'h01c,
    ADDR_PC_OUT_DATA_0 = 9'h020,
    ADDR_PC_OUT_CTRL   = 9'h024,
    ADDR_R0_DATA_0     = 9'h030,
    ADDR_R0_CTRL       = 9'h034,
    ADDR_R1_DATA_0     = 9'h040,
    ADDR_R1_CTRL       = 9'h044,
    ADDR_R2_DATA_0     = 9'h050,
    ADDR_R2_CTRL       = 9'h054,
    ADDR_R3_DATA_0     = 9'h060,
    ADDR_R3_CTRL       = 9'h064,
    ADDR_R4_DATA_0     = 9'h070,
    ADDR_R4_CTRL       = 9'h074,
    ADDR_R5_DATA_0     = 9'h080,
    ADDR_R5_CTRL       = 9'h084,
    ADDR_R6_DATA_0     = 9'h090,
    ADDR_R6_CTRL       = 9'h094,
    ADDR_R7_DATA_0     = 9'h0a0,
    ADDR_R7_CTRL       = 9'h0a4,
    ADDR_N_DATA_0      = 9'h0b0,
    ADDR_N_CTRL        = 9'h0b4,
    ADDR_Z_DATA_0      = 9'h0c0,
    ADDR_Z_CTRL        = 9'h0c4,
    ADDR_P_DATA_0      = 9'h0d0,
    ADDR_P_CTRL        = 9'h0d4,
    ADDR_N1_DATA_0     = 9'h0e0,
    ADDR_N1_CTRL       = 9'h0e4,
    ADDR_P1_DATA_0     = 9'h0f0,
    ADDR_P1_CTRL       = 9'h0f4,
    ADDR_Z1_DATA_0     = 9'h100,
    ADDR_Z1_CTRL       = 9'h104,
    WRIDLE             = 2'd0,
    WRDATA             = 2'd1,
    WRRESP             = 2'd2,
    WRRESET            = 2'd3,
    RDIDLE             = 2'd0,
    RDDATA             = 2'd1,
    RDRESET            = 2'd2,
    ADDR_BITS                = 9;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [15:0]                   int_IR = 'b0;
    reg  [15:0]                   int_PC = 'b0;
    reg                           int_PC_out_ap_vld;
    reg  [15:0]                   int_PC_out = 'b0;
    reg                           int_R0_ap_vld;
    reg  [15:0]                   int_R0 = 'b0;
    reg                           int_R1_ap_vld;
    reg  [15:0]                   int_R1 = 'b0;
    reg                           int_R2_ap_vld;
    reg  [15:0]                   int_R2 = 'b0;
    reg                           int_R3_ap_vld;
    reg  [15:0]                   int_R3 = 'b0;
    reg                           int_R4_ap_vld;
    reg  [15:0]                   int_R4 = 'b0;
    reg                           int_R5_ap_vld;
    reg  [15:0]                   int_R5 = 'b0;
    reg                           int_R6_ap_vld;
    reg  [15:0]                   int_R6 = 'b0;
    reg                           int_R7_ap_vld;
    reg  [15:0]                   int_R7 = 'b0;
    reg                           int_N_ap_vld;
    reg  [15:0]                   int_N = 'b0;
    reg                           int_Z_ap_vld;
    reg  [15:0]                   int_Z = 'b0;
    reg                           int_P_ap_vld;
    reg  [15:0]                   int_P = 'b0;
    reg                           int_n1_ap_vld;
    reg  [15:0]                   int_n1 = 'b0;
    reg                           int_p1_ap_vld;
    reg  [15:0]                   int_p1 = 'b0;
    reg                           int_z1_ap_vld;
    reg  [15:0]                   int_z1 = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_IR_DATA_0: begin
                    rdata <= int_IR[15:0];
                end
                ADDR_PC_DATA_0: begin
                    rdata <= int_PC[15:0];
                end
                ADDR_PC_OUT_DATA_0: begin
                    rdata <= int_PC_out[15:0];
                end
                ADDR_PC_OUT_CTRL: begin
                    rdata[0] <= int_PC_out_ap_vld;
                end
                ADDR_R0_DATA_0: begin
                    rdata <= int_R0[15:0];
                end
                ADDR_R0_CTRL: begin
                    rdata[0] <= int_R0_ap_vld;
                end
                ADDR_R1_DATA_0: begin
                    rdata <= int_R1[15:0];
                end
                ADDR_R1_CTRL: begin
                    rdata[0] <= int_R1_ap_vld;
                end
                ADDR_R2_DATA_0: begin
                    rdata <= int_R2[15:0];
                end
                ADDR_R2_CTRL: begin
                    rdata[0] <= int_R2_ap_vld;
                end
                ADDR_R3_DATA_0: begin
                    rdata <= int_R3[15:0];
                end
                ADDR_R3_CTRL: begin
                    rdata[0] <= int_R3_ap_vld;
                end
                ADDR_R4_DATA_0: begin
                    rdata <= int_R4[15:0];
                end
                ADDR_R4_CTRL: begin
                    rdata[0] <= int_R4_ap_vld;
                end
                ADDR_R5_DATA_0: begin
                    rdata <= int_R5[15:0];
                end
                ADDR_R5_CTRL: begin
                    rdata[0] <= int_R5_ap_vld;
                end
                ADDR_R6_DATA_0: begin
                    rdata <= int_R6[15:0];
                end
                ADDR_R6_CTRL: begin
                    rdata[0] <= int_R6_ap_vld;
                end
                ADDR_R7_DATA_0: begin
                    rdata <= int_R7[15:0];
                end
                ADDR_R7_CTRL: begin
                    rdata[0] <= int_R7_ap_vld;
                end
                ADDR_N_DATA_0: begin
                    rdata <= int_N[15:0];
                end
                ADDR_N_CTRL: begin
                    rdata[0] <= int_N_ap_vld;
                end
                ADDR_Z_DATA_0: begin
                    rdata <= int_Z[15:0];
                end
                ADDR_Z_CTRL: begin
                    rdata[0] <= int_Z_ap_vld;
                end
                ADDR_P_DATA_0: begin
                    rdata <= int_P[15:0];
                end
                ADDR_P_CTRL: begin
                    rdata[0] <= int_P_ap_vld;
                end
                ADDR_N1_DATA_0: begin
                    rdata <= int_n1[15:0];
                end
                ADDR_N1_CTRL: begin
                    rdata[0] <= int_n1_ap_vld;
                end
                ADDR_P1_DATA_0: begin
                    rdata <= int_p1[15:0];
                end
                ADDR_P1_CTRL: begin
                    rdata[0] <= int_p1_ap_vld;
                end
                ADDR_Z1_DATA_0: begin
                    rdata <= int_z1[15:0];
                end
                ADDR_Z1_CTRL: begin
                    rdata[0] <= int_z1_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign IR = int_IR;
assign PC = int_PC;
// int_IR[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_IR[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IR_DATA_0)
            int_IR[15:0] <= (WDATA[31:0] & wmask) | (int_IR[15:0] & ~wmask);
    end
end

// int_PC[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_PC[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PC_DATA_0)
            int_PC[15:0] <= (WDATA[31:0] & wmask) | (int_PC[15:0] & ~wmask);
    end
end

// int_PC_out
always @(posedge ACLK) begin
    if (ARESET)
        int_PC_out <= 0;
    else if (ACLK_EN) begin
        if (PC_out_ap_vld)
            int_PC_out <= PC_out;
    end
end

// int_PC_out_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_PC_out_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (PC_out_ap_vld)
            int_PC_out_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_PC_OUT_CTRL)
            int_PC_out_ap_vld <= 1'b0; // clear on read
    end
end

// int_R0
always @(posedge ACLK) begin
    if (ARESET)
        int_R0 <= 0;
    else if (ACLK_EN) begin
        if (R0_ap_vld)
            int_R0 <= R0;
    end
end

// int_R0_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R0_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R0_ap_vld)
            int_R0_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R0_CTRL)
            int_R0_ap_vld <= 1'b0; // clear on read
    end
end

// int_R1
always @(posedge ACLK) begin
    if (ARESET)
        int_R1 <= 0;
    else if (ACLK_EN) begin
        if (R1_ap_vld)
            int_R1 <= R1;
    end
end

// int_R1_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R1_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R1_ap_vld)
            int_R1_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R1_CTRL)
            int_R1_ap_vld <= 1'b0; // clear on read
    end
end

// int_R2
always @(posedge ACLK) begin
    if (ARESET)
        int_R2 <= 0;
    else if (ACLK_EN) begin
        if (R2_ap_vld)
            int_R2 <= R2;
    end
end

// int_R2_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R2_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R2_ap_vld)
            int_R2_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R2_CTRL)
            int_R2_ap_vld <= 1'b0; // clear on read
    end
end

// int_R3
always @(posedge ACLK) begin
    if (ARESET)
        int_R3 <= 0;
    else if (ACLK_EN) begin
        if (R3_ap_vld)
            int_R3 <= R3;
    end
end

// int_R3_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R3_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R3_ap_vld)
            int_R3_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R3_CTRL)
            int_R3_ap_vld <= 1'b0; // clear on read
    end
end

// int_R4
always @(posedge ACLK) begin
    if (ARESET)
        int_R4 <= 0;
    else if (ACLK_EN) begin
        if (R4_ap_vld)
            int_R4 <= R4;
    end
end

// int_R4_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R4_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R4_ap_vld)
            int_R4_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R4_CTRL)
            int_R4_ap_vld <= 1'b0; // clear on read
    end
end

// int_R5
always @(posedge ACLK) begin
    if (ARESET)
        int_R5 <= 0;
    else if (ACLK_EN) begin
        if (R5_ap_vld)
            int_R5 <= R5;
    end
end

// int_R5_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R5_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R5_ap_vld)
            int_R5_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R5_CTRL)
            int_R5_ap_vld <= 1'b0; // clear on read
    end
end

// int_R6
always @(posedge ACLK) begin
    if (ARESET)
        int_R6 <= 0;
    else if (ACLK_EN) begin
        if (R6_ap_vld)
            int_R6 <= R6;
    end
end

// int_R6_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R6_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R6_ap_vld)
            int_R6_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R6_CTRL)
            int_R6_ap_vld <= 1'b0; // clear on read
    end
end

// int_R7
always @(posedge ACLK) begin
    if (ARESET)
        int_R7 <= 0;
    else if (ACLK_EN) begin
        if (R7_ap_vld)
            int_R7 <= R7;
    end
end

// int_R7_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_R7_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (R7_ap_vld)
            int_R7_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R7_CTRL)
            int_R7_ap_vld <= 1'b0; // clear on read
    end
end

// int_N
always @(posedge ACLK) begin
    if (ARESET)
        int_N <= 0;
    else if (ACLK_EN) begin
        if (N_ap_vld)
            int_N <= N;
    end
end

// int_N_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_N_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (N_ap_vld)
            int_N_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_N_CTRL)
            int_N_ap_vld <= 1'b0; // clear on read
    end
end

// int_Z
always @(posedge ACLK) begin
    if (ARESET)
        int_Z <= 0;
    else if (ACLK_EN) begin
        if (Z_ap_vld)
            int_Z <= Z;
    end
end

// int_Z_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_Z_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (Z_ap_vld)
            int_Z_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_Z_CTRL)
            int_Z_ap_vld <= 1'b0; // clear on read
    end
end

// int_P
always @(posedge ACLK) begin
    if (ARESET)
        int_P <= 0;
    else if (ACLK_EN) begin
        if (P_ap_vld)
            int_P <= P;
    end
end

// int_P_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_P_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (P_ap_vld)
            int_P_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_P_CTRL)
            int_P_ap_vld <= 1'b0; // clear on read
    end
end

// int_n1
always @(posedge ACLK) begin
    if (ARESET)
        int_n1 <= 0;
    else if (ACLK_EN) begin
        if (n1_ap_vld)
            int_n1 <= n1;
    end
end

// int_n1_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_n1_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (n1_ap_vld)
            int_n1_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_N1_CTRL)
            int_n1_ap_vld <= 1'b0; // clear on read
    end
end

// int_p1
always @(posedge ACLK) begin
    if (ARESET)
        int_p1 <= 0;
    else if (ACLK_EN) begin
        if (p1_ap_vld)
            int_p1 <= p1;
    end
end

// int_p1_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_p1_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (p1_ap_vld)
            int_p1_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_P1_CTRL)
            int_p1_ap_vld <= 1'b0; // clear on read
    end
end

// int_z1
always @(posedge ACLK) begin
    if (ARESET)
        int_z1 <= 0;
    else if (ACLK_EN) begin
        if (z1_ap_vld)
            int_z1 <= z1;
    end
end

// int_z1_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_z1_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (z1_ap_vld)
            int_z1_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_Z1_CTRL)
            int_z1_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------

endmodule
