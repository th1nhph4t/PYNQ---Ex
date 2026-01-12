-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
-- Tool Version Limit: 2023.10
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity lc3_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 9;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    IR                    :out  STD_LOGIC_VECTOR(15 downto 0);
    PC                    :out  STD_LOGIC_VECTOR(15 downto 0);
    PC_out                :in   STD_LOGIC_VECTOR(15 downto 0);
    PC_out_ap_vld         :in   STD_LOGIC;
    R0                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R0_ap_vld             :in   STD_LOGIC;
    R1                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R1_ap_vld             :in   STD_LOGIC;
    R2                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R2_ap_vld             :in   STD_LOGIC;
    R3                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R3_ap_vld             :in   STD_LOGIC;
    R4                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R4_ap_vld             :in   STD_LOGIC;
    R5                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R5_ap_vld             :in   STD_LOGIC;
    R6                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R6_ap_vld             :in   STD_LOGIC;
    R7                    :in   STD_LOGIC_VECTOR(15 downto 0);
    R7_ap_vld             :in   STD_LOGIC;
    N                     :in   STD_LOGIC_VECTOR(15 downto 0);
    N_ap_vld              :in   STD_LOGIC;
    Z                     :in   STD_LOGIC_VECTOR(15 downto 0);
    Z_ap_vld              :in   STD_LOGIC;
    P                     :in   STD_LOGIC_VECTOR(15 downto 0);
    P_ap_vld              :in   STD_LOGIC;
    n1                    :in   STD_LOGIC_VECTOR(15 downto 0);
    n1_ap_vld             :in   STD_LOGIC;
    p1                    :in   STD_LOGIC_VECTOR(15 downto 0);
    p1_ap_vld             :in   STD_LOGIC;
    z1                    :in   STD_LOGIC_VECTOR(15 downto 0);
    z1_ap_vld             :in   STD_LOGIC
);
end entity lc3_control_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_none
--
-- 0x000 : reserved
-- 0x004 : reserved
-- 0x008 : reserved
-- 0x00c : reserved
-- 0x010 : Data signal of IR
--         bit 15~0 - IR[15:0] (Read/Write)
--         others   - reserved
-- 0x014 : reserved
-- 0x018 : Data signal of PC
--         bit 15~0 - PC[15:0] (Read/Write)
--         others   - reserved
-- 0x01c : reserved
-- 0x020 : Data signal of PC_out
--         bit 15~0 - PC_out[15:0] (Read)
--         others   - reserved
-- 0x024 : Control signal of PC_out
--         bit 0  - PC_out_ap_vld (Read/COR)
--         others - reserved
-- 0x030 : Data signal of R0
--         bit 15~0 - R0[15:0] (Read)
--         others   - reserved
-- 0x034 : Control signal of R0
--         bit 0  - R0_ap_vld (Read/COR)
--         others - reserved
-- 0x040 : Data signal of R1
--         bit 15~0 - R1[15:0] (Read)
--         others   - reserved
-- 0x044 : Control signal of R1
--         bit 0  - R1_ap_vld (Read/COR)
--         others - reserved
-- 0x050 : Data signal of R2
--         bit 15~0 - R2[15:0] (Read)
--         others   - reserved
-- 0x054 : Control signal of R2
--         bit 0  - R2_ap_vld (Read/COR)
--         others - reserved
-- 0x060 : Data signal of R3
--         bit 15~0 - R3[15:0] (Read)
--         others   - reserved
-- 0x064 : Control signal of R3
--         bit 0  - R3_ap_vld (Read/COR)
--         others - reserved
-- 0x070 : Data signal of R4
--         bit 15~0 - R4[15:0] (Read)
--         others   - reserved
-- 0x074 : Control signal of R4
--         bit 0  - R4_ap_vld (Read/COR)
--         others - reserved
-- 0x080 : Data signal of R5
--         bit 15~0 - R5[15:0] (Read)
--         others   - reserved
-- 0x084 : Control signal of R5
--         bit 0  - R5_ap_vld (Read/COR)
--         others - reserved
-- 0x090 : Data signal of R6
--         bit 15~0 - R6[15:0] (Read)
--         others   - reserved
-- 0x094 : Control signal of R6
--         bit 0  - R6_ap_vld (Read/COR)
--         others - reserved
-- 0x0a0 : Data signal of R7
--         bit 15~0 - R7[15:0] (Read)
--         others   - reserved
-- 0x0a4 : Control signal of R7
--         bit 0  - R7_ap_vld (Read/COR)
--         others - reserved
-- 0x0b0 : Data signal of N
--         bit 15~0 - N[15:0] (Read)
--         others   - reserved
-- 0x0b4 : Control signal of N
--         bit 0  - N_ap_vld (Read/COR)
--         others - reserved
-- 0x0c0 : Data signal of Z
--         bit 15~0 - Z[15:0] (Read)
--         others   - reserved
-- 0x0c4 : Control signal of Z
--         bit 0  - Z_ap_vld (Read/COR)
--         others - reserved
-- 0x0d0 : Data signal of P
--         bit 15~0 - P[15:0] (Read)
--         others   - reserved
-- 0x0d4 : Control signal of P
--         bit 0  - P_ap_vld (Read/COR)
--         others - reserved
-- 0x0e0 : Data signal of n1
--         bit 15~0 - n1[15:0] (Read)
--         others   - reserved
-- 0x0e4 : Control signal of n1
--         bit 0  - n1_ap_vld (Read/COR)
--         others - reserved
-- 0x0f0 : Data signal of p1
--         bit 15~0 - p1[15:0] (Read)
--         others   - reserved
-- 0x0f4 : Control signal of p1
--         bit 0  - p1_ap_vld (Read/COR)
--         others - reserved
-- 0x100 : Data signal of z1
--         bit 15~0 - z1[15:0] (Read)
--         others   - reserved
-- 0x104 : Control signal of z1
--         bit 0  - z1_ap_vld (Read/COR)
--         others - reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of lc3_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_IR_DATA_0     : INTEGER := 16#010#;
    constant ADDR_IR_CTRL       : INTEGER := 16#014#;
    constant ADDR_PC_DATA_0     : INTEGER := 16#018#;
    constant ADDR_PC_CTRL       : INTEGER := 16#01c#;
    constant ADDR_PC_OUT_DATA_0 : INTEGER := 16#020#;
    constant ADDR_PC_OUT_CTRL   : INTEGER := 16#024#;
    constant ADDR_R0_DATA_0     : INTEGER := 16#030#;
    constant ADDR_R0_CTRL       : INTEGER := 16#034#;
    constant ADDR_R1_DATA_0     : INTEGER := 16#040#;
    constant ADDR_R1_CTRL       : INTEGER := 16#044#;
    constant ADDR_R2_DATA_0     : INTEGER := 16#050#;
    constant ADDR_R2_CTRL       : INTEGER := 16#054#;
    constant ADDR_R3_DATA_0     : INTEGER := 16#060#;
    constant ADDR_R3_CTRL       : INTEGER := 16#064#;
    constant ADDR_R4_DATA_0     : INTEGER := 16#070#;
    constant ADDR_R4_CTRL       : INTEGER := 16#074#;
    constant ADDR_R5_DATA_0     : INTEGER := 16#080#;
    constant ADDR_R5_CTRL       : INTEGER := 16#084#;
    constant ADDR_R6_DATA_0     : INTEGER := 16#090#;
    constant ADDR_R6_CTRL       : INTEGER := 16#094#;
    constant ADDR_R7_DATA_0     : INTEGER := 16#0a0#;
    constant ADDR_R7_CTRL       : INTEGER := 16#0a4#;
    constant ADDR_N_DATA_0      : INTEGER := 16#0b0#;
    constant ADDR_N_CTRL        : INTEGER := 16#0b4#;
    constant ADDR_Z_DATA_0      : INTEGER := 16#0c0#;
    constant ADDR_Z_CTRL        : INTEGER := 16#0c4#;
    constant ADDR_P_DATA_0      : INTEGER := 16#0d0#;
    constant ADDR_P_CTRL        : INTEGER := 16#0d4#;
    constant ADDR_N1_DATA_0     : INTEGER := 16#0e0#;
    constant ADDR_N1_CTRL       : INTEGER := 16#0e4#;
    constant ADDR_P1_DATA_0     : INTEGER := 16#0f0#;
    constant ADDR_P1_CTRL       : INTEGER := 16#0f4#;
    constant ADDR_Z1_DATA_0     : INTEGER := 16#100#;
    constant ADDR_Z1_CTRL       : INTEGER := 16#104#;
    constant ADDR_BITS         : INTEGER := 9;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_IR              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_PC              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_PC_out_ap_vld   : STD_LOGIC;
    signal int_PC_out          : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R0_ap_vld       : STD_LOGIC;
    signal int_R0              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R1_ap_vld       : STD_LOGIC;
    signal int_R1              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R2_ap_vld       : STD_LOGIC;
    signal int_R2              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R3_ap_vld       : STD_LOGIC;
    signal int_R3              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R4_ap_vld       : STD_LOGIC;
    signal int_R4              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R5_ap_vld       : STD_LOGIC;
    signal int_R5              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R6_ap_vld       : STD_LOGIC;
    signal int_R6              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_R7_ap_vld       : STD_LOGIC;
    signal int_R7              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_N_ap_vld        : STD_LOGIC;
    signal int_N               : UNSIGNED(15 downto 0) := (others => '0');
    signal int_Z_ap_vld        : STD_LOGIC;
    signal int_Z               : UNSIGNED(15 downto 0) := (others => '0');
    signal int_P_ap_vld        : STD_LOGIC;
    signal int_P               : UNSIGNED(15 downto 0) := (others => '0');
    signal int_n1_ap_vld       : STD_LOGIC;
    signal int_n1              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_p1_ap_vld       : STD_LOGIC;
    signal int_p1              : UNSIGNED(15 downto 0) := (others => '0');
    signal int_z1_ap_vld       : STD_LOGIC;
    signal int_z1              : UNSIGNED(15 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_IR_DATA_0 =>
                        rdata_data <= RESIZE(int_IR(15 downto 0), 32);
                    when ADDR_PC_DATA_0 =>
                        rdata_data <= RESIZE(int_PC(15 downto 0), 32);
                    when ADDR_PC_OUT_DATA_0 =>
                        rdata_data <= RESIZE(int_PC_out(15 downto 0), 32);
                    when ADDR_PC_OUT_CTRL =>
                        rdata_data(0) <= int_PC_out_ap_vld;
                    when ADDR_R0_DATA_0 =>
                        rdata_data <= RESIZE(int_R0(15 downto 0), 32);
                    when ADDR_R0_CTRL =>
                        rdata_data(0) <= int_R0_ap_vld;
                    when ADDR_R1_DATA_0 =>
                        rdata_data <= RESIZE(int_R1(15 downto 0), 32);
                    when ADDR_R1_CTRL =>
                        rdata_data(0) <= int_R1_ap_vld;
                    when ADDR_R2_DATA_0 =>
                        rdata_data <= RESIZE(int_R2(15 downto 0), 32);
                    when ADDR_R2_CTRL =>
                        rdata_data(0) <= int_R2_ap_vld;
                    when ADDR_R3_DATA_0 =>
                        rdata_data <= RESIZE(int_R3(15 downto 0), 32);
                    when ADDR_R3_CTRL =>
                        rdata_data(0) <= int_R3_ap_vld;
                    when ADDR_R4_DATA_0 =>
                        rdata_data <= RESIZE(int_R4(15 downto 0), 32);
                    when ADDR_R4_CTRL =>
                        rdata_data(0) <= int_R4_ap_vld;
                    when ADDR_R5_DATA_0 =>
                        rdata_data <= RESIZE(int_R5(15 downto 0), 32);
                    when ADDR_R5_CTRL =>
                        rdata_data(0) <= int_R5_ap_vld;
                    when ADDR_R6_DATA_0 =>
                        rdata_data <= RESIZE(int_R6(15 downto 0), 32);
                    when ADDR_R6_CTRL =>
                        rdata_data(0) <= int_R6_ap_vld;
                    when ADDR_R7_DATA_0 =>
                        rdata_data <= RESIZE(int_R7(15 downto 0), 32);
                    when ADDR_R7_CTRL =>
                        rdata_data(0) <= int_R7_ap_vld;
                    when ADDR_N_DATA_0 =>
                        rdata_data <= RESIZE(int_N(15 downto 0), 32);
                    when ADDR_N_CTRL =>
                        rdata_data(0) <= int_N_ap_vld;
                    when ADDR_Z_DATA_0 =>
                        rdata_data <= RESIZE(int_Z(15 downto 0), 32);
                    when ADDR_Z_CTRL =>
                        rdata_data(0) <= int_Z_ap_vld;
                    when ADDR_P_DATA_0 =>
                        rdata_data <= RESIZE(int_P(15 downto 0), 32);
                    when ADDR_P_CTRL =>
                        rdata_data(0) <= int_P_ap_vld;
                    when ADDR_N1_DATA_0 =>
                        rdata_data <= RESIZE(int_n1(15 downto 0), 32);
                    when ADDR_N1_CTRL =>
                        rdata_data(0) <= int_n1_ap_vld;
                    when ADDR_P1_DATA_0 =>
                        rdata_data <= RESIZE(int_p1(15 downto 0), 32);
                    when ADDR_P1_CTRL =>
                        rdata_data(0) <= int_p1_ap_vld;
                    when ADDR_Z1_DATA_0 =>
                        rdata_data <= RESIZE(int_z1(15 downto 0), 32);
                    when ADDR_Z1_CTRL =>
                        rdata_data(0) <= int_z1_ap_vld;
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    IR                   <= STD_LOGIC_VECTOR(int_IR);
    PC                   <= STD_LOGIC_VECTOR(int_PC);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IR_DATA_0) then
                    int_IR(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_IR(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PC_DATA_0) then
                    int_PC(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_PC(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_PC_out <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (PC_out_ap_vld = '1') then
                    int_PC_out <= UNSIGNED(PC_out);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_PC_out_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (PC_out_ap_vld = '1') then
                    int_PC_out_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_PC_OUT_CTRL) then
                    int_PC_out_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R0 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R0_ap_vld = '1') then
                    int_R0 <= UNSIGNED(R0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R0_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R0_ap_vld = '1') then
                    int_R0_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R0_CTRL) then
                    int_R0_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R1 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R1_ap_vld = '1') then
                    int_R1 <= UNSIGNED(R1);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R1_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R1_ap_vld = '1') then
                    int_R1_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R1_CTRL) then
                    int_R1_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R2 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R2_ap_vld = '1') then
                    int_R2 <= UNSIGNED(R2);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R2_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R2_ap_vld = '1') then
                    int_R2_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R2_CTRL) then
                    int_R2_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R3 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R3_ap_vld = '1') then
                    int_R3 <= UNSIGNED(R3);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R3_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R3_ap_vld = '1') then
                    int_R3_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R3_CTRL) then
                    int_R3_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R4 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R4_ap_vld = '1') then
                    int_R4 <= UNSIGNED(R4);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R4_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R4_ap_vld = '1') then
                    int_R4_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R4_CTRL) then
                    int_R4_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R5 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R5_ap_vld = '1') then
                    int_R5 <= UNSIGNED(R5);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R5_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R5_ap_vld = '1') then
                    int_R5_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R5_CTRL) then
                    int_R5_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R6 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R6_ap_vld = '1') then
                    int_R6 <= UNSIGNED(R6);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R6_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R6_ap_vld = '1') then
                    int_R6_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R6_CTRL) then
                    int_R6_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R7 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (R7_ap_vld = '1') then
                    int_R7 <= UNSIGNED(R7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_R7_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (R7_ap_vld = '1') then
                    int_R7_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_R7_CTRL) then
                    int_R7_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_N <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (N_ap_vld = '1') then
                    int_N <= UNSIGNED(N);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_N_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (N_ap_vld = '1') then
                    int_N_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_N_CTRL) then
                    int_N_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_Z <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (Z_ap_vld = '1') then
                    int_Z <= UNSIGNED(Z);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_Z_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (Z_ap_vld = '1') then
                    int_Z_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_Z_CTRL) then
                    int_Z_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_P <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (P_ap_vld = '1') then
                    int_P <= UNSIGNED(P);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_P_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (P_ap_vld = '1') then
                    int_P_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_P_CTRL) then
                    int_P_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_n1 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (n1_ap_vld = '1') then
                    int_n1 <= UNSIGNED(n1);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_n1_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (n1_ap_vld = '1') then
                    int_n1_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_N1_CTRL) then
                    int_n1_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_p1 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (p1_ap_vld = '1') then
                    int_p1 <= UNSIGNED(p1);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_p1_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (p1_ap_vld = '1') then
                    int_p1_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_P1_CTRL) then
                    int_p1_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_z1 <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (z1_ap_vld = '1') then
                    int_z1 <= UNSIGNED(z1);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_z1_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (z1_ap_vld = '1') then
                    int_z1_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_Z1_CTRL) then
                    int_z1_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
