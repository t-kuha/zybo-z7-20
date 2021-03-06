-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pwm_rgb is
generic (
    C_S_AXI_AXIL_CTL_ADDR_WIDTH : INTEGER := 6;
    C_S_AXI_AXIL_CTL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    rgb_V : OUT STD_LOGIC_VECTOR (2 downto 0);
    s_axi_AXIL_CTL_AWVALID : IN STD_LOGIC;
    s_axi_AXIL_CTL_AWREADY : OUT STD_LOGIC;
    s_axi_AXIL_CTL_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_AXIL_CTL_ADDR_WIDTH-1 downto 0);
    s_axi_AXIL_CTL_WVALID : IN STD_LOGIC;
    s_axi_AXIL_CTL_WREADY : OUT STD_LOGIC;
    s_axi_AXIL_CTL_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_AXIL_CTL_DATA_WIDTH-1 downto 0);
    s_axi_AXIL_CTL_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_AXIL_CTL_DATA_WIDTH/8-1 downto 0);
    s_axi_AXIL_CTL_ARVALID : IN STD_LOGIC;
    s_axi_AXIL_CTL_ARREADY : OUT STD_LOGIC;
    s_axi_AXIL_CTL_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_AXIL_CTL_ADDR_WIDTH-1 downto 0);
    s_axi_AXIL_CTL_RVALID : OUT STD_LOGIC;
    s_axi_AXIL_CTL_RREADY : IN STD_LOGIC;
    s_axi_AXIL_CTL_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_AXIL_CTL_DATA_WIDTH-1 downto 0);
    s_axi_AXIL_CTL_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_AXIL_CTL_BVALID : OUT STD_LOGIC;
    s_axi_AXIL_CTL_BREADY : IN STD_LOGIC;
    s_axi_AXIL_CTL_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of pwm_rgb is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "pwm_rgb,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.380000,HLS_SYN_LAT=10002,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=9,HLS_SYN_FF=476,HLS_SYN_LUT=452,HLS_VERSION=2018_3}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv14_0 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    constant ap_const_lv14_1 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000001";
    constant ap_const_lv14_270F : STD_LOGIC_VECTOR (13 downto 0) := "10011100001111";
    constant ap_const_lv46_404041 : STD_LOGIC_VECTOR (45 downto 0) := "0000000000000000000000010000000100000001000001";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";
    constant ap_const_lv22_2710 : STD_LOGIC_VECTOR (21 downto 0) := "0000000010011100010000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal tmp_6_fu_208_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal duty_r : STD_LOGIC_VECTOR (7 downto 0);
    signal duty_g : STD_LOGIC_VECTOR (7 downto 0);
    signal duty_b : STD_LOGIC_VECTOR (7 downto 0);
    signal do_init_reg_93 : STD_LOGIC_VECTOR (0 downto 0);
    signal do_init_reg_93_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal i7_reg_109 : STD_LOGIC_VECTOR (13 downto 0);
    signal i7_reg_109_pp0_iter1_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal i7_reg_109_pp0_iter2_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal pwm_rgb_unsigned_cha_6_reg_124 : STD_LOGIC_VECTOR (13 downto 0);
    signal pwm_rgb_unsigned_cha_7_reg_138 : STD_LOGIC_VECTOR (13 downto 0);
    signal pwm_rgb_unsigned_cha_8_reg_152 : STD_LOGIC_VECTOR (13 downto 0);
    signal i_fu_202_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal i_reg_332 : STD_LOGIC_VECTOR (13 downto 0);
    signal tmp_6_reg_337 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_reg_337_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_reg_337_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_314_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp_1_reg_341 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_phi_mux_do_init_phi_fu_97_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_320_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp_3_reg_346 : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp_5_fu_326_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp_5_reg_351 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_phi_mux_i7_phi_fu_113_p6 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_mux_pwm_rgb_unsigned_cha_3_phi_fu_170_p4 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_mux_pwm_rgb_unsigned_cha_4_phi_fu_182_p4 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_mux_pwm_rgb_unsigned_cha_5_phi_fu_194_p4 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_3_reg_166 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_3_reg_166 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_3_reg_166 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_3_reg_166 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_4_reg_178 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_4_reg_178 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_4_reg_178 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_4_reg_178 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_5_reg_190 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_5_reg_190 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_5_reg_190 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_5_reg_190 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal mul5_fu_229_p0 : STD_LOGIC_VECTOR (21 downto 0);
    signal mul5_fu_229_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul2_fu_248_p0 : STD_LOGIC_VECTOR (21 downto 0);
    signal mul2_fu_248_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul_fu_267_p0 : STD_LOGIC_VECTOR (21 downto 0);
    signal mul_fu_267_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal b_V_fu_295_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal g_V_fu_289_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_fu_283_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_314_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_fu_314_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_3_fu_320_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_3_fu_320_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_5_fu_326_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_5_fu_326_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_idle_pp0_0to2 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal mul2_fu_248_p00 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul5_fu_229_p00 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul_fu_267_p00 : STD_LOGIC_VECTOR (45 downto 0);
    signal tmp_1_fu_314_p00 : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp_3_fu_320_p00 : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp_5_fu_326_p00 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_condition_158 : BOOLEAN;

    component pwm_rgb_mul_mul_8bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component pwm_rgb_AXIL_CTL_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        duty_r : OUT STD_LOGIC_VECTOR (7 downto 0);
        duty_g : OUT STD_LOGIC_VECTOR (7 downto 0);
        duty_b : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;



begin
    pwm_rgb_AXIL_CTL_s_axi_U : component pwm_rgb_AXIL_CTL_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_AXIL_CTL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_AXIL_CTL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_AXIL_CTL_AWVALID,
        AWREADY => s_axi_AXIL_CTL_AWREADY,
        AWADDR => s_axi_AXIL_CTL_AWADDR,
        WVALID => s_axi_AXIL_CTL_WVALID,
        WREADY => s_axi_AXIL_CTL_WREADY,
        WDATA => s_axi_AXIL_CTL_WDATA,
        WSTRB => s_axi_AXIL_CTL_WSTRB,
        ARVALID => s_axi_AXIL_CTL_ARVALID,
        ARREADY => s_axi_AXIL_CTL_ARREADY,
        ARADDR => s_axi_AXIL_CTL_ARADDR,
        RVALID => s_axi_AXIL_CTL_RVALID,
        RREADY => s_axi_AXIL_CTL_RREADY,
        RDATA => s_axi_AXIL_CTL_RDATA,
        RRESP => s_axi_AXIL_CTL_RRESP,
        BVALID => s_axi_AXIL_CTL_BVALID,
        BREADY => s_axi_AXIL_CTL_BREADY,
        BRESP => s_axi_AXIL_CTL_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        duty_r => duty_r,
        duty_g => duty_g,
        duty_b => duty_b);

    pwm_rgb_mul_mul_8bkb_U1 : component pwm_rgb_mul_mul_8bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 15,
        dout_WIDTH => 22)
    port map (
        din0 => tmp_1_fu_314_p0,
        din1 => tmp_1_fu_314_p1,
        dout => tmp_1_fu_314_p2);

    pwm_rgb_mul_mul_8bkb_U2 : component pwm_rgb_mul_mul_8bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 15,
        dout_WIDTH => 22)
    port map (
        din0 => tmp_3_fu_320_p0,
        din1 => tmp_3_fu_320_p1,
        dout => tmp_3_fu_320_p2);

    pwm_rgb_mul_mul_8bkb_U3 : component pwm_rgb_mul_mul_8bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 15,
        dout_WIDTH => 22)
    port map (
        din0 => tmp_5_fu_326_p0,
        din1 => tmp_5_fu_326_p1,
        dout => tmp_5_fu_326_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_3_reg_166_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                if ((do_init_reg_93 = ap_const_lv1_1)) then 
                    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_3_reg_166 <= mul_fu_267_p2(43 downto 30);
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_3_reg_166 <= ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_3_reg_166;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_4_reg_178_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                if ((do_init_reg_93 = ap_const_lv1_1)) then 
                    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_4_reg_178 <= mul2_fu_248_p2(43 downto 30);
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_4_reg_178 <= ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_4_reg_178;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_5_reg_190_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                if ((do_init_reg_93 = ap_const_lv1_1)) then 
                    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_5_reg_190 <= mul5_fu_229_p2(43 downto 30);
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_5_reg_190 <= ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_5_reg_190;
                end if;
            end if; 
        end if;
    end process;

    do_init_reg_93_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (tmp_6_reg_337_pp0_iter1_reg = ap_const_lv1_0))) then 
                do_init_reg_93 <= ap_const_lv1_0;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_6_reg_337_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                do_init_reg_93 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    i7_reg_109_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (tmp_6_reg_337 = ap_const_lv1_0))) then 
                i7_reg_109 <= i_reg_332;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_6_reg_337 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                i7_reg_109 <= ap_const_lv14_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_3_reg_166 <= ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_3_reg_166;
                ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_4_reg_178 <= ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_4_reg_178;
                ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_5_reg_190 <= ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_5_reg_190;
                i_reg_332 <= i_fu_202_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then
                ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_3_reg_166 <= ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_3_reg_166;
                ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_4_reg_178 <= ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_4_reg_178;
                ap_phi_reg_pp0_iter2_pwm_rgb_unsigned_cha_5_reg_190 <= ap_phi_reg_pp0_iter1_pwm_rgb_unsigned_cha_5_reg_190;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                do_init_reg_93_pp0_iter2_reg <= do_init_reg_93;
                i7_reg_109_pp0_iter2_reg <= i7_reg_109_pp0_iter1_reg;
                tmp_6_reg_337_pp0_iter2_reg <= tmp_6_reg_337_pp0_iter1_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                i7_reg_109_pp0_iter1_reg <= i7_reg_109;
                tmp_6_reg_337 <= tmp_6_fu_208_p2;
                tmp_6_reg_337_pp0_iter1_reg <= tmp_6_reg_337;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (tmp_6_reg_337_pp0_iter2_reg = ap_const_lv1_0))) then
                pwm_rgb_unsigned_cha_6_reg_124 <= ap_phi_mux_pwm_rgb_unsigned_cha_3_phi_fu_170_p4;
                pwm_rgb_unsigned_cha_7_reg_138 <= ap_phi_mux_pwm_rgb_unsigned_cha_4_phi_fu_182_p4;
                pwm_rgb_unsigned_cha_8_reg_152 <= ap_phi_mux_pwm_rgb_unsigned_cha_5_phi_fu_194_p4;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_phi_mux_do_init_phi_fu_97_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_1_reg_341 <= tmp_1_fu_314_p2;
                tmp_3_reg_346 <= tmp_3_fu_320_p2;
                tmp_5_reg_351 <= tmp_5_fu_326_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((ap_reset_idle_pp0 = ap_const_logic_0)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_reset_idle_pp0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_158_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
                ap_condition_158 <= ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_block_pp0_stage0_11001, tmp_6_reg_337_pp0_iter2_reg, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_6_reg_337_pp0_iter2_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to2_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0_0to2 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_do_init_phi_fu_97_p6_assign_proc : process(do_init_reg_93, tmp_6_reg_337_pp0_iter1_reg, ap_enable_reg_pp0_iter2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then
            if ((tmp_6_reg_337_pp0_iter1_reg = ap_const_lv1_1)) then 
                ap_phi_mux_do_init_phi_fu_97_p6 <= ap_const_lv1_1;
            elsif ((tmp_6_reg_337_pp0_iter1_reg = ap_const_lv1_0)) then 
                ap_phi_mux_do_init_phi_fu_97_p6 <= ap_const_lv1_0;
            else 
                ap_phi_mux_do_init_phi_fu_97_p6 <= do_init_reg_93;
            end if;
        else 
            ap_phi_mux_do_init_phi_fu_97_p6 <= do_init_reg_93;
        end if; 
    end process;


    ap_phi_mux_i7_phi_fu_113_p6_assign_proc : process(i7_reg_109, i_reg_332, tmp_6_reg_337, ap_condition_158)
    begin
        if ((ap_const_boolean_1 = ap_condition_158)) then
            if ((tmp_6_reg_337 = ap_const_lv1_1)) then 
                ap_phi_mux_i7_phi_fu_113_p6 <= ap_const_lv14_0;
            elsif ((tmp_6_reg_337 = ap_const_lv1_0)) then 
                ap_phi_mux_i7_phi_fu_113_p6 <= i_reg_332;
            else 
                ap_phi_mux_i7_phi_fu_113_p6 <= i7_reg_109;
            end if;
        else 
            ap_phi_mux_i7_phi_fu_113_p6 <= i7_reg_109;
        end if; 
    end process;


    ap_phi_mux_pwm_rgb_unsigned_cha_3_phi_fu_170_p4_assign_proc : process(do_init_reg_93_pp0_iter2_reg, pwm_rgb_unsigned_cha_6_reg_124, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0, ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_3_reg_166)
    begin
        if (((do_init_reg_93_pp0_iter2_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_pwm_rgb_unsigned_cha_3_phi_fu_170_p4 <= pwm_rgb_unsigned_cha_6_reg_124;
        else 
            ap_phi_mux_pwm_rgb_unsigned_cha_3_phi_fu_170_p4 <= ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_3_reg_166;
        end if; 
    end process;


    ap_phi_mux_pwm_rgb_unsigned_cha_4_phi_fu_182_p4_assign_proc : process(do_init_reg_93_pp0_iter2_reg, pwm_rgb_unsigned_cha_7_reg_138, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0, ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_4_reg_178)
    begin
        if (((do_init_reg_93_pp0_iter2_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_pwm_rgb_unsigned_cha_4_phi_fu_182_p4 <= pwm_rgb_unsigned_cha_7_reg_138;
        else 
            ap_phi_mux_pwm_rgb_unsigned_cha_4_phi_fu_182_p4 <= ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_4_reg_178;
        end if; 
    end process;


    ap_phi_mux_pwm_rgb_unsigned_cha_5_phi_fu_194_p4_assign_proc : process(do_init_reg_93_pp0_iter2_reg, pwm_rgb_unsigned_cha_8_reg_152, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0, ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_5_reg_190)
    begin
        if (((do_init_reg_93_pp0_iter2_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_pwm_rgb_unsigned_cha_5_phi_fu_194_p4 <= pwm_rgb_unsigned_cha_8_reg_152;
        else 
            ap_phi_mux_pwm_rgb_unsigned_cha_5_phi_fu_194_p4 <= ap_phi_reg_pp0_iter3_pwm_rgb_unsigned_cha_5_reg_190;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_3_reg_166 <= "XXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_4_reg_178 <= "XXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_pwm_rgb_unsigned_cha_5_reg_190 <= "XXXXXXXXXXXXXX";

    ap_ready_assign_proc : process(tmp_6_fu_208_p2, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_6_fu_208_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to2)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to2 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    b_V_fu_295_p2 <= "1" when (unsigned(i7_reg_109_pp0_iter2_reg) < unsigned(ap_phi_mux_pwm_rgb_unsigned_cha_3_phi_fu_170_p4)) else "0";
    g_V_fu_289_p2 <= "1" when (unsigned(i7_reg_109_pp0_iter2_reg) < unsigned(ap_phi_mux_pwm_rgb_unsigned_cha_4_phi_fu_182_p4)) else "0";
    i_fu_202_p2 <= std_logic_vector(unsigned(ap_phi_mux_i7_phi_fu_113_p6) + unsigned(ap_const_lv14_1));
    mul2_fu_248_p0 <= mul2_fu_248_p00(22 - 1 downto 0);
    mul2_fu_248_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_3_reg_346),46));
    mul2_fu_248_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(mul2_fu_248_p0) * unsigned(ap_const_lv46_404041), 46));
    mul5_fu_229_p0 <= mul5_fu_229_p00(22 - 1 downto 0);
    mul5_fu_229_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_1_reg_341),46));
    mul5_fu_229_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(mul5_fu_229_p0) * unsigned(ap_const_lv46_404041), 46));
    mul_fu_267_p0 <= mul_fu_267_p00(22 - 1 downto 0);
    mul_fu_267_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_5_reg_351),46));
    mul_fu_267_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(mul_fu_267_p0) * unsigned(ap_const_lv46_404041), 46));
    r_V_fu_283_p2 <= "1" when (unsigned(i7_reg_109_pp0_iter2_reg) < unsigned(ap_phi_mux_pwm_rgb_unsigned_cha_5_phi_fu_194_p4)) else "0";
    rgb_V <= ((b_V_fu_295_p2 & g_V_fu_289_p2) & r_V_fu_283_p2);
    tmp_1_fu_314_p0 <= tmp_1_fu_314_p00(8 - 1 downto 0);
    tmp_1_fu_314_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(duty_r),22));
    tmp_1_fu_314_p1 <= ap_const_lv22_2710(15 - 1 downto 0);
    tmp_3_fu_320_p0 <= tmp_3_fu_320_p00(8 - 1 downto 0);
    tmp_3_fu_320_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(duty_g),22));
    tmp_3_fu_320_p1 <= ap_const_lv22_2710(15 - 1 downto 0);
    tmp_5_fu_326_p0 <= tmp_5_fu_326_p00(8 - 1 downto 0);
    tmp_5_fu_326_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(duty_b),22));
    tmp_5_fu_326_p1 <= ap_const_lv22_2710(15 - 1 downto 0);
    tmp_6_fu_208_p2 <= "1" when (ap_phi_mux_i7_phi_fu_113_p6 = ap_const_lv14_270F) else "0";
end behav;
