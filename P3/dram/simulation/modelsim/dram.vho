-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "05/13/2026 14:55:03"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(9 DOWNTO 8);
	DRAM_CLK : BUFFER std_logic;
	DRAM_ADDR : BUFFER std_logic_vector(12 DOWNTO 0);
	DRAM_BA : BUFFER std_logic_vector(1 DOWNTO 0);
	DRAM_CAS_N : BUFFER std_logic;
	DRAM_CKE : BUFFER std_logic;
	DRAM_CS_N : BUFFER std_logic;
	DRAM_DQM : BUFFER std_logic;
	DRAM_DQ : BUFFER std_logic_vector(7 DOWNTO 0);
	DRAM_RAS_N : BUFFER std_logic;
	DRAM_WE_N : BUFFER std_logic
	);
END top_level;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_CLK	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[0]	=>  Location: PIN_AK14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[1]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[2]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[3]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[5]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[6]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[7]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[8]	=>  Location: PIN_AH15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[9]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[10]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[11]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[12]	=>  Location: PIN_AJ14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_BA[0]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_BA[1]	=>  Location: PIN_AJ12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_CAS_N	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_CKE	=>  Location: PIN_AK13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_CS_N	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQM	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_RAS_N	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_WE_N	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[0]	=>  Location: PIN_AK6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[1]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[2]	=>  Location: PIN_AK7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[3]	=>  Location: PIN_AK8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[4]	=>  Location: PIN_AK9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[5]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[6]	=>  Location: PIN_AK11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_DQ[7]	=>  Location: PIN_AJ11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 8);
SIGNAL ww_DRAM_CLK : std_logic;
SIGNAL ww_DRAM_ADDR : std_logic_vector(12 DOWNTO 0);
SIGNAL ww_DRAM_BA : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_DRAM_CAS_N : std_logic;
SIGNAL ww_DRAM_CKE : std_logic;
SIGNAL ww_DRAM_CS_N : std_logic;
SIGNAL ww_DRAM_DQM : std_logic;
SIGNAL ww_DRAM_DQ : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_DRAM_RAS_N : std_logic;
SIGNAL ww_DRAM_WE_N : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \sys_rst_n~combout\ : std_logic;
SIGNAL \inst_iface|state.ST_WAIT_WRITE~q\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \inst_iface|Selector5~0_combout\ : std_logic;
SIGNAL \inst_iface|state.ST_WAIT_READ~q\ : std_logic;
SIGNAL \inst_iface|process_0~1_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \inst_iface|sw_reg[4]~feeder_combout\ : std_logic;
SIGNAL \inst_iface|Equal0~0_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \inst_iface|sw_reg[9]~feeder_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \inst_iface|Equal0~1_combout\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \inst_iface|Selector4~0_combout\ : std_logic;
SIGNAL \inst_iface|state.ST_REQ_READ~q\ : std_logic;
SIGNAL \inst_iface|req~combout\ : std_logic;
SIGNAL \inst_controller|Selector21~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_ACTIVATE~q\ : std_logic;
SIGNAL \inst_controller|Selector22~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_RCD~q\ : std_logic;
SIGNAL \inst_iface|wEn~combout\ : std_logic;
SIGNAL \inst_controller|req_is_w~feeder_combout\ : std_logic;
SIGNAL \inst_controller|req_is_w~0_combout\ : std_logic;
SIGNAL \inst_controller|req_is_w~q\ : std_logic;
SIGNAL \inst_controller|Selector23~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_READ_CMD~q\ : std_logic;
SIGNAL \inst_controller|Selector24~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_CAS~q\ : std_logic;
SIGNAL \inst_controller|Selector25~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Selector26~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_DPL~q\ : std_logic;
SIGNAL \inst_controller|Selector30~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_RC~q\ : std_logic;
SIGNAL \inst_controller|Selector46~0_combout\ : std_logic;
SIGNAL \inst_controller|ref_init_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Selector44~0_combout\ : std_logic;
SIGNAL \inst_controller|LessThan2~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector18~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_INIT_LOAD_MODE~q\ : std_logic;
SIGNAL \inst_controller|Selector19~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_MRD~q\ : std_logic;
SIGNAL \inst_controller|delay_cnt[10]~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector11~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~9_sumout\ : std_logic;
SIGNAL \inst_controller|Selector14~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~10\ : std_logic;
SIGNAL \inst_controller|Add1~5_sumout\ : std_logic;
SIGNAL \inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|state.S_PRECHARGE~q\ : std_logic;
SIGNAL \inst_controller|WideOr11~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector13~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~6\ : std_logic;
SIGNAL \inst_controller|Add1~1_sumout\ : std_logic;
SIGNAL \inst_controller|Selector12~0_combout\ : std_logic;
SIGNAL \inst_controller|LessThan1~0_combout\ : std_logic;
SIGNAL \inst_controller|LessThan1~3_combout\ : std_logic;
SIGNAL \inst_controller|state.S_INIT_WAIT~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_INIT_WAIT~q\ : std_logic;
SIGNAL \inst_controller|Selector16~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_INIT_PRECHARGE~q\ : std_logic;
SIGNAL \inst_controller|Selector47~0_combout\ : std_logic;
SIGNAL \inst_controller|ref_init_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Selector45~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector20~1_combout\ : std_logic;
SIGNAL \inst_controller|needs_refresh~q\ : std_logic;
SIGNAL \inst_controller|Selector20~2_combout\ : std_logic;
SIGNAL \inst_controller|Selector20~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector20~3_combout\ : std_logic;
SIGNAL \inst_controller|state.S_IDLE~q\ : std_logic;
SIGNAL \inst_controller|Selector27~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector27~1_combout\ : std_logic;
SIGNAL \inst_controller|Selector27~2_combout\ : std_logic;
SIGNAL \inst_controller|state.S_PRECHARGE~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|state.S_WRITE_CMD~q\ : std_logic;
SIGNAL \inst_controller|Selector33~0_combout\ : std_logic;
SIGNAL \inst_controller|WideOr2~combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[10]~1_combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[5]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add1~2\ : std_logic;
SIGNAL \inst_controller|Add1~57_sumout\ : std_logic;
SIGNAL \inst_controller|Selector11~1_combout\ : std_logic;
SIGNAL \inst_controller|Add1~58\ : std_logic;
SIGNAL \inst_controller|Add1~53_sumout\ : std_logic;
SIGNAL \inst_controller|Selector10~0_combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[4]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add1~54\ : std_logic;
SIGNAL \inst_controller|Add1~50\ : std_logic;
SIGNAL \inst_controller|Add1~45_sumout\ : std_logic;
SIGNAL \inst_controller|Selector8~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~46\ : std_logic;
SIGNAL \inst_controller|Add1~41_sumout\ : std_logic;
SIGNAL \inst_controller|Selector7~0_combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[7]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add1~42\ : std_logic;
SIGNAL \inst_controller|Add1~37_sumout\ : std_logic;
SIGNAL \inst_controller|Selector6~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~38\ : std_logic;
SIGNAL \inst_controller|Add1~33_sumout\ : std_logic;
SIGNAL \inst_controller|Selector5~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~34\ : std_logic;
SIGNAL \inst_controller|Add1~29_sumout\ : std_logic;
SIGNAL \inst_controller|Selector4~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~30\ : std_logic;
SIGNAL \inst_controller|Add1~25_sumout\ : std_logic;
SIGNAL \inst_controller|Selector3~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~26\ : std_logic;
SIGNAL \inst_controller|Add1~21_sumout\ : std_logic;
SIGNAL \inst_controller|Selector2~0_combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[12]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add1~22\ : std_logic;
SIGNAL \inst_controller|Add1~17_sumout\ : std_logic;
SIGNAL \inst_controller|Selector1~0_combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[13]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add1~18\ : std_logic;
SIGNAL \inst_controller|Add1~13_sumout\ : std_logic;
SIGNAL \inst_controller|Selector0~0_combout\ : std_logic;
SIGNAL \inst_controller|delay_cnt[14]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|LessThan1~1_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_RP~q\ : std_logic;
SIGNAL \inst_controller|Selector28~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_WAIT_RP~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Selector17~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_INIT_REF_LOOP~q\ : std_logic;
SIGNAL \inst_controller|Selector29~0_combout\ : std_logic;
SIGNAL \inst_controller|state.S_REFRESH_CMD~q\ : std_logic;
SIGNAL \inst_controller|WideOr2~0_combout\ : std_logic;
SIGNAL \inst_controller|Add1~49_sumout\ : std_logic;
SIGNAL \inst_controller|Selector9~0_combout\ : std_logic;
SIGNAL \inst_controller|LessThan1~2_combout\ : std_logic;
SIGNAL \inst_controller|is_init~0_combout\ : std_logic;
SIGNAL \inst_controller|is_init~q\ : std_logic;
SIGNAL \inst_controller|Add0~5_sumout\ : std_logic;
SIGNAL \inst_controller|Add0~6\ : std_logic;
SIGNAL \inst_controller|Add0~42\ : std_logic;
SIGNAL \inst_controller|Add0~37_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~9_combout\ : std_logic;
SIGNAL \inst_controller|refresh_timer[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add0~38\ : std_logic;
SIGNAL \inst_controller|Add0~33_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~8_combout\ : std_logic;
SIGNAL \inst_controller|Add0~34\ : std_logic;
SIGNAL \inst_controller|Add0~29_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~7_combout\ : std_logic;
SIGNAL \inst_controller|refresh_timer[4]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add0~30\ : std_logic;
SIGNAL \inst_controller|Add0~1_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~0_combout\ : std_logic;
SIGNAL \inst_controller|refresh_timer[5]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|refresh_timer~1_combout\ : std_logic;
SIGNAL \inst_controller|refresh_timer[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add0~2\ : std_logic;
SIGNAL \inst_controller|Add0~25_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~6_combout\ : std_logic;
SIGNAL \inst_controller|Add0~26\ : std_logic;
SIGNAL \inst_controller|Add0~21_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~5_combout\ : std_logic;
SIGNAL \inst_controller|Add0~22\ : std_logic;
SIGNAL \inst_controller|Add0~17_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~4_combout\ : std_logic;
SIGNAL \inst_controller|Add0~18\ : std_logic;
SIGNAL \inst_controller|Add0~13_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~3_combout\ : std_logic;
SIGNAL \inst_controller|refresh_timer[9]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|Add0~14\ : std_logic;
SIGNAL \inst_controller|Add0~9_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~2_combout\ : std_logic;
SIGNAL \inst_controller|LessThan0~0_combout\ : std_logic;
SIGNAL \inst_controller|Add0~41_sumout\ : std_logic;
SIGNAL \inst_controller|refresh_timer~10_combout\ : std_logic;
SIGNAL \inst_controller|LessThan0~1_combout\ : std_logic;
SIGNAL \inst_controller|LessThan0~2_combout\ : std_logic;
SIGNAL \inst_controller|needs_refresh~0_combout\ : std_logic;
SIGNAL \inst_controller|needs_refresh~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|state~36_combout\ : std_logic;
SIGNAL \inst_controller|ready~q\ : std_logic;
SIGNAL \inst_iface|state.ST_RESET~0_combout\ : std_logic;
SIGNAL \inst_iface|state.ST_RESET~q\ : std_logic;
SIGNAL \inst_iface|Selector1~0_combout\ : std_logic;
SIGNAL \inst_iface|Selector1~1_combout\ : std_logic;
SIGNAL \inst_iface|state.ST_READY~q\ : std_logic;
SIGNAL \inst_iface|Selector2~0_combout\ : std_logic;
SIGNAL \inst_iface|state.ST_REQ_WRITE~q\ : std_logic;
SIGNAL \inst_iface|Selector3~0_combout\ : std_logic;
SIGNAL \inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[0]~input_o\ : std_logic;
SIGNAL \inst_controller|data_out[3]~0_combout\ : std_logic;
SIGNAL \data_bus[0]~0_combout\ : std_logic;
SIGNAL \inst_controller|dq_out[0]~0_combout\ : std_logic;
SIGNAL \inst_controller|dq_out~1_combout\ : std_logic;
SIGNAL \inst_controller|dq_oe~q\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[1]~input_o\ : std_logic;
SIGNAL \data_bus[1]~1_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[2]~input_o\ : std_logic;
SIGNAL \data_bus[2]~2_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[3]~input_o\ : std_logic;
SIGNAL \data_bus[3]~3_combout\ : std_logic;
SIGNAL \DRAM_DQ[4]~input_o\ : std_logic;
SIGNAL \inst_controller|data_out[4]~feeder_combout\ : std_logic;
SIGNAL \data_bus[4]~4_combout\ : std_logic;
SIGNAL \DRAM_DQ[5]~input_o\ : std_logic;
SIGNAL \data_bus[5]~5_combout\ : std_logic;
SIGNAL \inst_controller|dq_out[5]~feeder_combout\ : std_logic;
SIGNAL \DRAM_DQ[6]~input_o\ : std_logic;
SIGNAL \data_bus[6]~6_combout\ : std_logic;
SIGNAL \DRAM_DQ[7]~input_o\ : std_logic;
SIGNAL \data_bus[7]~7_combout\ : std_logic;
SIGNAL \inst_iface|data_reg[1]~feeder_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux6~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux5~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux4~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux3~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux2~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux1~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|Mux0~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux6~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux5~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux4~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux3~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux2~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux1~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex4|Mux0~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex5|Mux1~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex5|Mux1~1_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex5|Mux1~2_combout\ : std_logic;
SIGNAL \led9_cnt[10]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \led9_cnt~0_combout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \led9_cnt~1_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \led9_cnt~2_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \led9_cnt~3_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \led9_on~3_combout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \led9_cnt~4_combout\ : std_logic;
SIGNAL \led9_cnt[12]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \led9_cnt~5_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \led9_cnt~6_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \led9_on~2_combout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \led9_cnt~7_combout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \led9_cnt~8_combout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \led9_cnt[21]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \led9_cnt~9_combout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \led9_cnt~10_combout\ : std_logic;
SIGNAL \led9_on~1_combout\ : std_logic;
SIGNAL \led9_on~0_combout\ : std_logic;
SIGNAL \led9_on~4_combout\ : std_logic;
SIGNAL \led9_on~q\ : std_logic;
SIGNAL \inst_controller|Selector43~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector42~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector39~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector33~1_combout\ : std_logic;
SIGNAL \inst_controller|Selector32~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector31~0_combout\ : std_logic;
SIGNAL \inst_controller|dram_addr[12]~feeder_combout\ : std_logic;
SIGNAL \inst_controller|Selector48~0_combout\ : std_logic;
SIGNAL \inst_controller|Selector48~1_combout\ : std_logic;
SIGNAL \inst_controller|WideOr10~combout\ : std_logic;
SIGNAL \inst_controller|WideOr9~combout\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst_pll|pll_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst_controller|dq_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_controller|refresh_timer\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst_controller|req_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL led9_cnt : std_logic_vector(23 DOWNTO 0);
SIGNAL \inst_controller|ref_init_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_iface|data_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_controller|dram_addr\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \inst_controller|dram_ba\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst_controller|sdram_cmd\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_controller|data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_iface|sw_reg\ : std_logic_vector(9 DOWNTO 4);
SIGNAL \inst_controller|req_addr\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \inst_controller|delay_cnt\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \inst_iface|ALT_INV_wEn~combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_WAIT_WRITE~q\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\ : std_logic;
SIGNAL \inst_iface|inst_hex4|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst_iface|inst_hex0|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_data_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~57_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~53_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~49_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~45_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~41_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~37_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~33_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL ALT_INV_led9_cnt : std_logic_vector(23 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_ready~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_RP~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_refresh_timer[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_refresh_timer[4]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_refresh_timer[9]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_ref_init_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_ref_init_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[4]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[5]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[7]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[12]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[13]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[14]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_led9_cnt[12]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_led9_cnt[10]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_led9_cnt[21]~DUPLICATE_q\ : std_logic;
SIGNAL \inst_pll|pll_inst|altera_pll_i|ALT_INV_locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_KEY[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_DRAM_DQ[4]~input_o\ : std_logic;
SIGNAL \inst_controller|ALT_INV_data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_req_data\ : std_logic_vector(5 DOWNTO 5);
SIGNAL \inst_controller|ALT_INV_Selector20~2_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector20~1_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector20~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt[10]~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_MRD~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_RP~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_refresh_timer\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_is_init~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_INIT_WAIT~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector27~1_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_DPL~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector27~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_RC~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_ref_init_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_WideOr2~combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_RCD~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_req_is_w~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_req~combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_RESET~q\ : std_logic;
SIGNAL \inst_iface|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_sw_reg\ : std_logic_vector(9 DOWNTO 4);
SIGNAL \inst_iface|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_IDLE~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state~36_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_delay_cnt\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WAIT_CAS~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_WideOr11~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_WideOr2~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_REFRESH_CMD~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector48~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_req_addr\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_Selector31~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_needs_refresh~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_PRECHARGE~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_Selector33~0_combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_ACTIVATE~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_WRITE_CMD~q\ : std_logic;
SIGNAL \inst_controller|ALT_INV_state.S_READ_CMD~q\ : std_logic;
SIGNAL \ALT_INV_led9_on~3_combout\ : std_logic;
SIGNAL \ALT_INV_led9_on~2_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_REQ_READ~q\ : std_logic;
SIGNAL \ALT_INV_led9_on~1_combout\ : std_logic;
SIGNAL \ALT_INV_led9_on~0_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_READY~q\ : std_logic;
SIGNAL \ALT_INV_data_bus[1]~1_combout\ : std_logic;
SIGNAL \inst_iface|ALT_INV_state.ST_WAIT_READ~q\ : std_logic;
SIGNAL \ALT_INV_sys_rst_n~combout\ : std_logic;
SIGNAL \inst_controller|ALT_INV_sdram_cmd\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst_controller|ALT_INV_dram_ba\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \inst_controller|ALT_INV_dram_addr\ : std_logic_vector(12 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
LEDR <= ww_LEDR;
DRAM_CLK <= ww_DRAM_CLK;
DRAM_ADDR <= ww_DRAM_ADDR;
DRAM_BA <= ww_DRAM_BA;
DRAM_CAS_N <= ww_DRAM_CAS_N;
DRAM_CKE <= ww_DRAM_CKE;
DRAM_CS_N <= ww_DRAM_CS_N;
DRAM_DQM <= ww_DRAM_DQM;
DRAM_DQ <= ww_DRAM_DQ;
DRAM_RAS_N <= ww_DRAM_RAS_N;
DRAM_WE_N <= ww_DRAM_WE_N;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \CLOCK_50~input_o\);

\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\inst_iface|ALT_INV_wEn~combout\ <= NOT \inst_iface|wEn~combout\;
\inst_iface|ALT_INV_state.ST_WAIT_WRITE~q\ <= NOT \inst_iface|state.ST_WAIT_WRITE~q\;
\inst_iface|ALT_INV_state.ST_REQ_WRITE~q\ <= NOT \inst_iface|state.ST_REQ_WRITE~q\;
\inst_iface|inst_hex4|ALT_INV_Mux0~0_combout\ <= NOT \inst_iface|inst_hex4|Mux0~0_combout\;
\inst_iface|inst_hex0|ALT_INV_Mux0~0_combout\ <= NOT \inst_iface|inst_hex0|Mux0~0_combout\;
\inst_iface|ALT_INV_data_reg\(3) <= NOT \inst_iface|data_reg\(3);
\inst_iface|ALT_INV_data_reg\(2) <= NOT \inst_iface|data_reg\(2);
\inst_iface|ALT_INV_data_reg\(1) <= NOT \inst_iface|data_reg\(1);
\inst_iface|ALT_INV_data_reg\(0) <= NOT \inst_iface|data_reg\(0);
\inst_controller|ALT_INV_Add0~41_sumout\ <= NOT \inst_controller|Add0~41_sumout\;
\inst_controller|ALT_INV_Add0~37_sumout\ <= NOT \inst_controller|Add0~37_sumout\;
\inst_controller|ALT_INV_Add0~33_sumout\ <= NOT \inst_controller|Add0~33_sumout\;
\inst_controller|ALT_INV_Add0~29_sumout\ <= NOT \inst_controller|Add0~29_sumout\;
\inst_controller|ALT_INV_Add0~25_sumout\ <= NOT \inst_controller|Add0~25_sumout\;
\inst_controller|ALT_INV_Add0~21_sumout\ <= NOT \inst_controller|Add0~21_sumout\;
\inst_controller|ALT_INV_Add0~17_sumout\ <= NOT \inst_controller|Add0~17_sumout\;
\inst_controller|ALT_INV_Add0~13_sumout\ <= NOT \inst_controller|Add0~13_sumout\;
\inst_controller|ALT_INV_Add0~9_sumout\ <= NOT \inst_controller|Add0~9_sumout\;
\inst_controller|ALT_INV_Add0~5_sumout\ <= NOT \inst_controller|Add0~5_sumout\;
\inst_controller|ALT_INV_Add0~1_sumout\ <= NOT \inst_controller|Add0~1_sumout\;
\inst_controller|ALT_INV_Add1~57_sumout\ <= NOT \inst_controller|Add1~57_sumout\;
\inst_controller|ALT_INV_Add1~53_sumout\ <= NOT \inst_controller|Add1~53_sumout\;
\inst_controller|ALT_INV_Add1~49_sumout\ <= NOT \inst_controller|Add1~49_sumout\;
\inst_controller|ALT_INV_Add1~45_sumout\ <= NOT \inst_controller|Add1~45_sumout\;
\inst_controller|ALT_INV_Add1~41_sumout\ <= NOT \inst_controller|Add1~41_sumout\;
\inst_controller|ALT_INV_Add1~37_sumout\ <= NOT \inst_controller|Add1~37_sumout\;
\inst_controller|ALT_INV_Add1~33_sumout\ <= NOT \inst_controller|Add1~33_sumout\;
\inst_controller|ALT_INV_Add1~29_sumout\ <= NOT \inst_controller|Add1~29_sumout\;
\inst_controller|ALT_INV_Add1~25_sumout\ <= NOT \inst_controller|Add1~25_sumout\;
\inst_controller|ALT_INV_Add1~21_sumout\ <= NOT \inst_controller|Add1~21_sumout\;
\inst_controller|ALT_INV_Add1~17_sumout\ <= NOT \inst_controller|Add1~17_sumout\;
\inst_controller|ALT_INV_Add1~13_sumout\ <= NOT \inst_controller|Add1~13_sumout\;
\inst_controller|ALT_INV_Add1~9_sumout\ <= NOT \inst_controller|Add1~9_sumout\;
\inst_controller|ALT_INV_Add1~5_sumout\ <= NOT \inst_controller|Add1~5_sumout\;
\inst_controller|ALT_INV_Add1~1_sumout\ <= NOT \inst_controller|Add1~1_sumout\;
\ALT_INV_Add0~49_sumout\ <= NOT \Add0~49_sumout\;
\ALT_INV_Add0~45_sumout\ <= NOT \Add0~45_sumout\;
\ALT_INV_Add0~41_sumout\ <= NOT \Add0~41_sumout\;
\ALT_INV_Add0~37_sumout\ <= NOT \Add0~37_sumout\;
\ALT_INV_Add0~33_sumout\ <= NOT \Add0~33_sumout\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
ALT_INV_led9_cnt(0) <= NOT led9_cnt(0);
ALT_INV_led9_cnt(2) <= NOT led9_cnt(2);
ALT_INV_led9_cnt(3) <= NOT led9_cnt(3);
ALT_INV_led9_cnt(4) <= NOT led9_cnt(4);
ALT_INV_led9_cnt(7) <= NOT led9_cnt(7);
ALT_INV_led9_cnt(10) <= NOT led9_cnt(10);
ALT_INV_led9_cnt(11) <= NOT led9_cnt(11);
ALT_INV_led9_cnt(18) <= NOT led9_cnt(18);
ALT_INV_led9_cnt(14) <= NOT led9_cnt(14);
ALT_INV_led9_cnt(15) <= NOT led9_cnt(15);
ALT_INV_led9_cnt(16) <= NOT led9_cnt(16);
ALT_INV_led9_cnt(21) <= NOT led9_cnt(21);
ALT_INV_led9_cnt(1) <= NOT led9_cnt(1);
\inst_controller|ALT_INV_ready~q\ <= NOT \inst_controller|ready~q\;
\inst_controller|ALT_INV_state.S_WAIT_RP~DUPLICATE_q\ <= NOT \inst_controller|state.S_WAIT_RP~DUPLICATE_q\;
\inst_controller|ALT_INV_refresh_timer[2]~DUPLICATE_q\ <= NOT \inst_controller|refresh_timer[2]~DUPLICATE_q\;
\inst_controller|ALT_INV_refresh_timer[4]~DUPLICATE_q\ <= NOT \inst_controller|refresh_timer[4]~DUPLICATE_q\;
\inst_controller|ALT_INV_refresh_timer[9]~DUPLICATE_q\ <= NOT \inst_controller|refresh_timer[9]~DUPLICATE_q\;
\inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\ <= NOT \inst_controller|refresh_timer[0]~DUPLICATE_q\;
\inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\ <= NOT \inst_controller|refresh_timer[5]~DUPLICATE_q\;
\inst_controller|ALT_INV_ref_init_cnt[0]~DUPLICATE_q\ <= NOT \inst_controller|ref_init_cnt[0]~DUPLICATE_q\;
\inst_controller|ALT_INV_ref_init_cnt[1]~DUPLICATE_q\ <= NOT \inst_controller|ref_init_cnt[1]~DUPLICATE_q\;
\inst_controller|ALT_INV_delay_cnt[4]~DUPLICATE_q\ <= NOT \inst_controller|delay_cnt[4]~DUPLICATE_q\;
\inst_controller|ALT_INV_delay_cnt[5]~DUPLICATE_q\ <= NOT \inst_controller|delay_cnt[5]~DUPLICATE_q\;
\inst_controller|ALT_INV_delay_cnt[7]~DUPLICATE_q\ <= NOT \inst_controller|delay_cnt[7]~DUPLICATE_q\;
\inst_controller|ALT_INV_delay_cnt[12]~DUPLICATE_q\ <= NOT \inst_controller|delay_cnt[12]~DUPLICATE_q\;
\inst_controller|ALT_INV_delay_cnt[13]~DUPLICATE_q\ <= NOT \inst_controller|delay_cnt[13]~DUPLICATE_q\;
\inst_controller|ALT_INV_delay_cnt[14]~DUPLICATE_q\ <= NOT \inst_controller|delay_cnt[14]~DUPLICATE_q\;
\inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\ <= NOT \inst_controller|needs_refresh~DUPLICATE_q\;
\inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\ <= NOT \inst_controller|state.S_PRECHARGE~DUPLICATE_q\;
\inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\ <= NOT \inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\;
\inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\ <= NOT \inst_controller|state.S_WRITE_CMD~DUPLICATE_q\;
\ALT_INV_led9_cnt[12]~DUPLICATE_q\ <= NOT \led9_cnt[12]~DUPLICATE_q\;
\inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\ <= NOT \inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\;
\ALT_INV_led9_cnt[10]~DUPLICATE_q\ <= NOT \led9_cnt[10]~DUPLICATE_q\;
\ALT_INV_led9_cnt[21]~DUPLICATE_q\ <= NOT \led9_cnt[21]~DUPLICATE_q\;
\inst_pll|pll_inst|altera_pll_i|ALT_INV_locked_wire\(0) <= NOT \inst_pll|pll_inst|altera_pll_i|locked_wire\(0);
\ALT_INV_KEY[3]~input_o\ <= NOT \KEY[3]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_SW[9]~input_o\ <= NOT \SW[9]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_DRAM_DQ[4]~input_o\ <= NOT \DRAM_DQ[4]~input_o\;
\inst_controller|ALT_INV_data_out\(7) <= NOT \inst_controller|data_out\(7);
\inst_controller|ALT_INV_data_out\(6) <= NOT \inst_controller|data_out\(6);
\inst_controller|ALT_INV_data_out\(5) <= NOT \inst_controller|data_out\(5);
\inst_controller|ALT_INV_data_out\(4) <= NOT \inst_controller|data_out\(4);
\inst_controller|ALT_INV_req_data\(5) <= NOT \inst_controller|req_data\(5);
\inst_controller|ALT_INV_Selector20~2_combout\ <= NOT \inst_controller|Selector20~2_combout\;
\inst_controller|ALT_INV_Selector20~1_combout\ <= NOT \inst_controller|Selector20~1_combout\;
\inst_controller|ALT_INV_Selector20~0_combout\ <= NOT \inst_controller|Selector20~0_combout\;
\inst_controller|ALT_INV_Selector11~0_combout\ <= NOT \inst_controller|Selector11~0_combout\;
\inst_controller|ALT_INV_delay_cnt[10]~0_combout\ <= NOT \inst_controller|delay_cnt[10]~0_combout\;
\inst_controller|ALT_INV_state.S_WAIT_MRD~q\ <= NOT \inst_controller|state.S_WAIT_MRD~q\;
\inst_controller|ALT_INV_state.S_WAIT_RP~q\ <= NOT \inst_controller|state.S_WAIT_RP~q\;
\inst_controller|ALT_INV_LessThan0~2_combout\ <= NOT \inst_controller|LessThan0~2_combout\;
\inst_controller|ALT_INV_LessThan0~1_combout\ <= NOT \inst_controller|LessThan0~1_combout\;
\inst_controller|ALT_INV_refresh_timer\(1) <= NOT \inst_controller|refresh_timer\(1);
\inst_controller|ALT_INV_refresh_timer\(2) <= NOT \inst_controller|refresh_timer\(2);
\inst_controller|ALT_INV_refresh_timer\(3) <= NOT \inst_controller|refresh_timer\(3);
\inst_controller|ALT_INV_refresh_timer\(4) <= NOT \inst_controller|refresh_timer\(4);
\inst_controller|ALT_INV_LessThan0~0_combout\ <= NOT \inst_controller|LessThan0~0_combout\;
\inst_controller|ALT_INV_refresh_timer\(6) <= NOT \inst_controller|refresh_timer\(6);
\inst_controller|ALT_INV_refresh_timer\(7) <= NOT \inst_controller|refresh_timer\(7);
\inst_controller|ALT_INV_refresh_timer\(8) <= NOT \inst_controller|refresh_timer\(8);
\inst_controller|ALT_INV_refresh_timer\(9) <= NOT \inst_controller|refresh_timer\(9);
\inst_controller|ALT_INV_refresh_timer\(10) <= NOT \inst_controller|refresh_timer\(10);
\inst_controller|ALT_INV_refresh_timer\(0) <= NOT \inst_controller|refresh_timer\(0);
\inst_controller|ALT_INV_refresh_timer\(5) <= NOT \inst_controller|refresh_timer\(5);
\inst_controller|ALT_INV_is_init~q\ <= NOT \inst_controller|is_init~q\;
\inst_controller|ALT_INV_state.S_INIT_WAIT~q\ <= NOT \inst_controller|state.S_INIT_WAIT~q\;
\inst_controller|ALT_INV_Selector27~1_combout\ <= NOT \inst_controller|Selector27~1_combout\;
\inst_controller|ALT_INV_state.S_WAIT_DPL~q\ <= NOT \inst_controller|state.S_WAIT_DPL~q\;
\inst_controller|ALT_INV_Selector27~0_combout\ <= NOT \inst_controller|Selector27~0_combout\;
\inst_controller|ALT_INV_state.S_WAIT_RC~q\ <= NOT \inst_controller|state.S_WAIT_RC~q\;
\inst_controller|ALT_INV_LessThan2~0_combout\ <= NOT \inst_controller|LessThan2~0_combout\;
\inst_controller|ALT_INV_ref_init_cnt\(0) <= NOT \inst_controller|ref_init_cnt\(0);
\inst_controller|ALT_INV_ref_init_cnt\(1) <= NOT \inst_controller|ref_init_cnt\(1);
\inst_controller|ALT_INV_ref_init_cnt\(2) <= NOT \inst_controller|ref_init_cnt\(2);
\inst_controller|ALT_INV_ref_init_cnt\(3) <= NOT \inst_controller|ref_init_cnt\(3);
\inst_controller|ALT_INV_WideOr2~combout\ <= NOT \inst_controller|WideOr2~combout\;
\inst_controller|ALT_INV_state.S_WAIT_RCD~q\ <= NOT \inst_controller|state.S_WAIT_RCD~q\;
\inst_controller|ALT_INV_req_is_w~q\ <= NOT \inst_controller|req_is_w~q\;
\inst_controller|ALT_INV_LessThan1~3_combout\ <= NOT \inst_controller|LessThan1~3_combout\;
\inst_iface|ALT_INV_req~combout\ <= NOT \inst_iface|req~combout\;
\inst_iface|ALT_INV_Selector1~0_combout\ <= NOT \inst_iface|Selector1~0_combout\;
\inst_iface|ALT_INV_state.ST_RESET~q\ <= NOT \inst_iface|state.ST_RESET~q\;
\inst_iface|ALT_INV_Equal0~1_combout\ <= NOT \inst_iface|Equal0~1_combout\;
\inst_iface|ALT_INV_sw_reg\(9) <= NOT \inst_iface|sw_reg\(9);
\inst_iface|ALT_INV_sw_reg\(8) <= NOT \inst_iface|sw_reg\(8);
\inst_iface|ALT_INV_sw_reg\(7) <= NOT \inst_iface|sw_reg\(7);
\inst_iface|ALT_INV_Equal0~0_combout\ <= NOT \inst_iface|Equal0~0_combout\;
\inst_iface|ALT_INV_sw_reg\(6) <= NOT \inst_iface|sw_reg\(6);
\inst_iface|ALT_INV_sw_reg\(5) <= NOT \inst_iface|sw_reg\(5);
\inst_iface|ALT_INV_sw_reg\(4) <= NOT \inst_iface|sw_reg\(4);
\inst_controller|ALT_INV_state.S_IDLE~q\ <= NOT \inst_controller|state.S_IDLE~q\;
\inst_controller|ALT_INV_state~36_combout\ <= NOT \inst_controller|state~36_combout\;
\inst_controller|ALT_INV_LessThan1~2_combout\ <= NOT \inst_controller|LessThan1~2_combout\;
\inst_controller|ALT_INV_delay_cnt\(3) <= NOT \inst_controller|delay_cnt\(3);
\inst_controller|ALT_INV_delay_cnt\(4) <= NOT \inst_controller|delay_cnt\(4);
\inst_controller|ALT_INV_delay_cnt\(5) <= NOT \inst_controller|delay_cnt\(5);
\inst_controller|ALT_INV_delay_cnt\(6) <= NOT \inst_controller|delay_cnt\(6);
\inst_controller|ALT_INV_delay_cnt\(7) <= NOT \inst_controller|delay_cnt\(7);
\inst_controller|ALT_INV_delay_cnt\(8) <= NOT \inst_controller|delay_cnt\(8);
\inst_controller|ALT_INV_LessThan1~1_combout\ <= NOT \inst_controller|LessThan1~1_combout\;
\inst_controller|ALT_INV_delay_cnt\(9) <= NOT \inst_controller|delay_cnt\(9);
\inst_controller|ALT_INV_delay_cnt\(10) <= NOT \inst_controller|delay_cnt\(10);
\inst_controller|ALT_INV_delay_cnt\(11) <= NOT \inst_controller|delay_cnt\(11);
\inst_controller|ALT_INV_delay_cnt\(12) <= NOT \inst_controller|delay_cnt\(12);
\inst_controller|ALT_INV_delay_cnt\(13) <= NOT \inst_controller|delay_cnt\(13);
\inst_controller|ALT_INV_delay_cnt\(14) <= NOT \inst_controller|delay_cnt\(14);
\inst_controller|ALT_INV_LessThan1~0_combout\ <= NOT \inst_controller|LessThan1~0_combout\;
\inst_controller|ALT_INV_delay_cnt\(0) <= NOT \inst_controller|delay_cnt\(0);
\inst_controller|ALT_INV_delay_cnt\(1) <= NOT \inst_controller|delay_cnt\(1);
\inst_controller|ALT_INV_delay_cnt\(2) <= NOT \inst_controller|delay_cnt\(2);
\inst_controller|ALT_INV_state.S_WAIT_CAS~q\ <= NOT \inst_controller|state.S_WAIT_CAS~q\;
\inst_controller|ALT_INV_WideOr11~0_combout\ <= NOT \inst_controller|WideOr11~0_combout\;
\inst_controller|ALT_INV_WideOr2~0_combout\ <= NOT \inst_controller|WideOr2~0_combout\;
\inst_controller|ALT_INV_state.S_REFRESH_CMD~q\ <= NOT \inst_controller|state.S_REFRESH_CMD~q\;
\inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\ <= NOT \inst_controller|state.S_INIT_REF_LOOP~q\;
\inst_controller|ALT_INV_Selector48~0_combout\ <= NOT \inst_controller|Selector48~0_combout\;
\inst_controller|ALT_INV_req_addr\(25) <= NOT \inst_controller|req_addr\(25);
\inst_controller|ALT_INV_Selector31~0_combout\ <= NOT \inst_controller|Selector31~0_combout\;
\inst_controller|ALT_INV_req_addr\(23) <= NOT \inst_controller|req_addr\(23);
\inst_controller|ALT_INV_req_addr\(22) <= NOT \inst_controller|req_addr\(22);
\inst_controller|ALT_INV_req_addr\(21) <= NOT \inst_controller|req_addr\(21);
\inst_controller|ALT_INV_needs_refresh~q\ <= NOT \inst_controller|needs_refresh~q\;
\inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\ <= NOT \inst_controller|state.S_INIT_PRECHARGE~q\;
\inst_controller|ALT_INV_state.S_PRECHARGE~q\ <= NOT \inst_controller|state.S_PRECHARGE~q\;
\inst_controller|ALT_INV_req_addr\(1) <= NOT \inst_controller|req_addr\(1);
\inst_controller|ALT_INV_req_addr\(0) <= NOT \inst_controller|req_addr\(0);
\inst_controller|ALT_INV_Selector33~0_combout\ <= NOT \inst_controller|Selector33~0_combout\;
\inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~q\ <= NOT \inst_controller|state.S_INIT_LOAD_MODE~q\;
\inst_controller|ALT_INV_state.S_ACTIVATE~q\ <= NOT \inst_controller|state.S_ACTIVATE~q\;
\inst_controller|ALT_INV_state.S_WRITE_CMD~q\ <= NOT \inst_controller|state.S_WRITE_CMD~q\;
\inst_controller|ALT_INV_state.S_READ_CMD~q\ <= NOT \inst_controller|state.S_READ_CMD~q\;
\ALT_INV_led9_on~3_combout\ <= NOT \led9_on~3_combout\;
\ALT_INV_led9_on~2_combout\ <= NOT \led9_on~2_combout\;
\inst_iface|ALT_INV_state.ST_REQ_READ~q\ <= NOT \inst_iface|state.ST_REQ_READ~q\;
\ALT_INV_led9_on~1_combout\ <= NOT \led9_on~1_combout\;
ALT_INV_led9_cnt(23) <= NOT led9_cnt(23);
ALT_INV_led9_cnt(22) <= NOT led9_cnt(22);
ALT_INV_led9_cnt(20) <= NOT led9_cnt(20);
ALT_INV_led9_cnt(19) <= NOT led9_cnt(19);
ALT_INV_led9_cnt(17) <= NOT led9_cnt(17);
\ALT_INV_led9_on~0_combout\ <= NOT \led9_on~0_combout\;
ALT_INV_led9_cnt(13) <= NOT led9_cnt(13);
ALT_INV_led9_cnt(12) <= NOT led9_cnt(12);
ALT_INV_led9_cnt(9) <= NOT led9_cnt(9);
ALT_INV_led9_cnt(8) <= NOT led9_cnt(8);
ALT_INV_led9_cnt(6) <= NOT led9_cnt(6);
ALT_INV_led9_cnt(5) <= NOT led9_cnt(5);
\inst_iface|ALT_INV_state.ST_READY~q\ <= NOT \inst_iface|state.ST_READY~q\;
\inst_controller|ALT_INV_data_out\(3) <= NOT \inst_controller|data_out\(3);
\inst_controller|ALT_INV_data_out\(2) <= NOT \inst_controller|data_out\(2);
\ALT_INV_data_bus[1]~1_combout\ <= NOT \data_bus[1]~1_combout\;
\inst_controller|ALT_INV_data_out\(1) <= NOT \inst_controller|data_out\(1);
\inst_iface|ALT_INV_state.ST_WAIT_READ~q\ <= NOT \inst_iface|state.ST_WAIT_READ~q\;
\ALT_INV_sys_rst_n~combout\ <= NOT \sys_rst_n~combout\;
\inst_controller|ALT_INV_data_out\(0) <= NOT \inst_controller|data_out\(0);
\inst_controller|ALT_INV_sdram_cmd\(0) <= NOT \inst_controller|sdram_cmd\(0);
\inst_controller|ALT_INV_sdram_cmd\(2) <= NOT \inst_controller|sdram_cmd\(2);
\inst_controller|ALT_INV_sdram_cmd\(1) <= NOT \inst_controller|sdram_cmd\(1);
\inst_controller|ALT_INV_dram_ba\(1) <= NOT \inst_controller|dram_ba\(1);
\inst_controller|ALT_INV_dram_addr\(12) <= NOT \inst_controller|dram_addr\(12);
\inst_controller|ALT_INV_dram_addr\(11) <= NOT \inst_controller|dram_addr\(11);
\inst_controller|ALT_INV_dram_addr\(10) <= NOT \inst_controller|dram_addr\(10);
\inst_controller|ALT_INV_dram_addr\(4) <= NOT \inst_controller|dram_addr\(4);
\inst_controller|ALT_INV_dram_addr\(1) <= NOT \inst_controller|dram_addr\(1);
\inst_controller|ALT_INV_dram_addr\(0) <= NOT \inst_controller|dram_addr\(0);

-- Location: IOOBUF_X89_Y8_N39
\HEX0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X89_Y11_N79
\HEX0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X89_Y11_N96
\HEX0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X89_Y4_N79
\HEX0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X89_Y13_N56
\HEX0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X89_Y13_N39
\HEX0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X89_Y4_N96
\HEX0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex0|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOOBUF_X89_Y6_N39
\HEX1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(0));

-- Location: IOOBUF_X89_Y6_N56
\HEX1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(1));

-- Location: IOOBUF_X89_Y16_N39
\HEX1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(2));

-- Location: IOOBUF_X89_Y16_N56
\HEX1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(3));

-- Location: IOOBUF_X89_Y15_N39
\HEX1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(4));

-- Location: IOOBUF_X89_Y15_N56
\HEX1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(5));

-- Location: IOOBUF_X89_Y8_N56
\HEX1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX1(6));

-- Location: IOOBUF_X89_Y11_N45
\HEX4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(0));

-- Location: IOOBUF_X89_Y13_N5
\HEX4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(1));

-- Location: IOOBUF_X89_Y13_N22
\HEX4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(2));

-- Location: IOOBUF_X89_Y8_N22
\HEX4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(3));

-- Location: IOOBUF_X89_Y15_N22
\HEX4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(4));

-- Location: IOOBUF_X89_Y15_N5
\HEX4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(5));

-- Location: IOOBUF_X89_Y20_N45
\HEX4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex4|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(6));

-- Location: IOOBUF_X89_Y20_N62
\HEX5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex5|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(0));

-- Location: IOOBUF_X89_Y21_N56
\HEX5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX5(1));

-- Location: IOOBUF_X89_Y25_N22
\HEX5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex5|Mux1~1_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(2));

-- Location: IOOBUF_X89_Y23_N22
\HEX5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex5|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(3));

-- Location: IOOBUF_X89_Y9_N56
\HEX5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[8]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX5(4));

-- Location: IOOBUF_X89_Y23_N5
\HEX5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|inst_hex5|Mux1~2_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(5));

-- Location: IOOBUF_X89_Y9_N39
\HEX5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SW[9]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX5(6));

-- Location: IOOBUF_X89_Y8_N5
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_iface|wEn~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X89_Y6_N22
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \led9_on~q\,
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOOBUF_X38_Y0_N36
\DRAM_CLK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	devoe => ww_devoe,
	o => ww_DRAM_CLK);

-- Location: IOOBUF_X40_Y0_N53
\DRAM_ADDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(0),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(0));

-- Location: IOOBUF_X30_Y0_N19
\DRAM_ADDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(1),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(1));

-- Location: IOOBUF_X38_Y0_N2
\DRAM_ADDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(2));

-- Location: IOOBUF_X24_Y0_N19
\DRAM_ADDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(3));

-- Location: IOOBUF_X28_Y0_N2
\DRAM_ADDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(4),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(4));

-- Location: IOOBUF_X28_Y0_N19
\DRAM_ADDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(4),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(5));

-- Location: IOOBUF_X24_Y0_N2
\DRAM_ADDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(6));

-- Location: IOOBUF_X32_Y0_N19
\DRAM_ADDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(7));

-- Location: IOOBUF_X38_Y0_N19
\DRAM_ADDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(8));

-- Location: IOOBUF_X26_Y0_N59
\DRAM_ADDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(4),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(9));

-- Location: IOOBUF_X26_Y0_N42
\DRAM_ADDR[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(10),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(10));

-- Location: IOOBUF_X30_Y0_N2
\DRAM_ADDR[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(11),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(11));

-- Location: IOOBUF_X40_Y0_N36
\DRAM_ADDR[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_addr\(12),
	devoe => ww_devoe,
	o => ww_DRAM_ADDR(12));

-- Location: IOOBUF_X22_Y0_N19
\DRAM_BA[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_BA(0));

-- Location: IOOBUF_X38_Y0_N53
\DRAM_BA[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dram_ba\(1),
	devoe => ww_devoe,
	o => ww_DRAM_BA(1));

-- Location: IOOBUF_X18_Y0_N42
\DRAM_CAS_N~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|ALT_INV_sdram_cmd\(1),
	devoe => ww_devoe,
	o => ww_DRAM_CAS_N);

-- Location: IOOBUF_X36_Y0_N53
\DRAM_CKE~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_DRAM_CKE);

-- Location: IOOBUF_X18_Y0_N59
\DRAM_CS_N~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_CS_N);

-- Location: IOOBUF_X89_Y4_N62
\DRAM_DQM~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DRAM_DQM);

-- Location: IOOBUF_X22_Y0_N2
\DRAM_RAS_N~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|ALT_INV_sdram_cmd\(2),
	devoe => ww_devoe,
	o => ww_DRAM_RAS_N);

-- Location: IOOBUF_X20_Y0_N2
\DRAM_WE_N~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|ALT_INV_sdram_cmd\(0),
	devoe => ww_devoe,
	o => ww_DRAM_WE_N);

-- Location: IOOBUF_X24_Y0_N53
\DRAM_DQ[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(0),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(0));

-- Location: IOOBUF_X26_Y0_N93
\DRAM_DQ[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(1),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(1));

-- Location: IOOBUF_X28_Y0_N36
\DRAM_DQ[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(2),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(2));

-- Location: IOOBUF_X28_Y0_N53
\DRAM_DQ[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(3),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(3));

-- Location: IOOBUF_X30_Y0_N53
\DRAM_DQ[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(4),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(4));

-- Location: IOOBUF_X18_Y0_N76
\DRAM_DQ[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(5),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(5));

-- Location: IOOBUF_X34_Y0_N59
\DRAM_DQ[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(6),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(6));

-- Location: IOOBUF_X34_Y0_N42
\DRAM_DQ[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_controller|dq_out\(7),
	oe => \inst_controller|dq_oe~q\,
	devoe => ww_devoe,
	o => ww_DRAM_DQ(7));

-- Location: IOIBUF_X32_Y0_N1
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X36_Y0_N1
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "715.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 12000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 20,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 72,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 71,
	pll_m_cnt_odd_div_duty_en => "true",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 5,
	pll_n_cnt_lo_div => 5,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 1,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \inst_pll|pll_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_KEY[0]~input_o\,
	refclkin => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \inst_pll|pll_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \inst_pll|pll_inst|altera_pll_i|locked_wire\(0),
	tclk => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 3,
	dprio0_cnt_lo_div => 2,
	dprio0_cnt_odd_div_even_duty_en => "true",
	duty_cycle => 50,
	output_clock_frequency => "143.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \inst_pll|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \inst_pll|pll_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G6
\inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \inst_pll|pll_inst|altera_pll_i|outclk_wire\(0),
	outclk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: LABCELL_X24_Y4_N39
sys_rst_n : cyclonev_lcell_comb
-- Equation(s):
-- \sys_rst_n~combout\ = ( !\inst_pll|pll_inst|altera_pll_i|locked_wire\(0) & ( \KEY[0]~input_o\ ) ) # ( \inst_pll|pll_inst|altera_pll_i|locked_wire\(0) & ( !\KEY[0]~input_o\ ) ) # ( !\inst_pll|pll_inst|altera_pll_i|locked_wire\(0) & ( !\KEY[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst_pll|pll_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	dataf => \ALT_INV_KEY[0]~input_o\,
	combout => \sys_rst_n~combout\);

-- Location: FF_X28_Y3_N5
\inst_iface|state.ST_WAIT_WRITE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|Selector3~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_WAIT_WRITE~q\);

-- Location: IOIBUF_X4_Y0_N35
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: MLABCELL_X28_Y3_N42
\inst_iface|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Selector5~0_combout\ = ( \inst_controller|ready~q\ & ( \inst_iface|state.ST_REQ_READ~q\ ) ) # ( !\inst_controller|ready~q\ & ( (\inst_iface|state.ST_WAIT_READ~q\) # (\inst_iface|state.ST_REQ_READ~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_state.ST_REQ_READ~q\,
	datad => \inst_iface|ALT_INV_state.ST_WAIT_READ~q\,
	dataf => \inst_controller|ALT_INV_ready~q\,
	combout => \inst_iface|Selector5~0_combout\);

-- Location: FF_X28_Y3_N44
\inst_iface|state.ST_WAIT_READ\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|Selector5~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_WAIT_READ~q\);

-- Location: MLABCELL_X28_Y3_N45
\inst_iface|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|process_0~1_combout\ = (\inst_controller|ready~q\ & \inst_iface|state.ST_WAIT_READ~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ready~q\,
	datac => \inst_iface|ALT_INV_state.ST_WAIT_READ~q\,
	combout => \inst_iface|process_0~1_combout\);

-- Location: FF_X28_Y3_N38
\inst_iface|sw_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[6]~input_o\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|sw_reg\(6));

-- Location: IOIBUF_X16_Y0_N18
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: FF_X31_Y3_N2
\inst_iface|sw_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[5]~input_o\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|sw_reg\(5));

-- Location: IOIBUF_X2_Y0_N41
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LABCELL_X31_Y3_N51
\inst_iface|sw_reg[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|sw_reg[4]~feeder_combout\ = ( \SW[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_SW[4]~input_o\,
	combout => \inst_iface|sw_reg[4]~feeder_combout\);

-- Location: FF_X31_Y3_N52
\inst_iface|sw_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|sw_reg[4]~feeder_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|sw_reg\(4));

-- Location: MLABCELL_X28_Y3_N36
\inst_iface|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Equal0~0_combout\ = ( \SW[6]~input_o\ & ( \inst_iface|sw_reg\(4) & ( (\inst_iface|sw_reg\(6) & (\SW[4]~input_o\ & (!\SW[5]~input_o\ $ (\inst_iface|sw_reg\(5))))) ) ) ) # ( !\SW[6]~input_o\ & ( \inst_iface|sw_reg\(4) & ( 
-- (!\inst_iface|sw_reg\(6) & (\SW[4]~input_o\ & (!\SW[5]~input_o\ $ (\inst_iface|sw_reg\(5))))) ) ) ) # ( \SW[6]~input_o\ & ( !\inst_iface|sw_reg\(4) & ( (\inst_iface|sw_reg\(6) & (!\SW[4]~input_o\ & (!\SW[5]~input_o\ $ (\inst_iface|sw_reg\(5))))) ) ) ) # ( 
-- !\SW[6]~input_o\ & ( !\inst_iface|sw_reg\(4) & ( (!\inst_iface|sw_reg\(6) & (!\SW[4]~input_o\ & (!\SW[5]~input_o\ $ (\inst_iface|sw_reg\(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000010000010000000000000000100000100000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_sw_reg\(6),
	datab => \ALT_INV_SW[5]~input_o\,
	datac => \inst_iface|ALT_INV_sw_reg\(5),
	datad => \ALT_INV_SW[4]~input_o\,
	datae => \ALT_INV_SW[6]~input_o\,
	dataf => \inst_iface|ALT_INV_sw_reg\(4),
	combout => \inst_iface|Equal0~0_combout\);

-- Location: IOIBUF_X4_Y0_N18
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X2_Y0_N58
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LABCELL_X31_Y3_N48
\inst_iface|sw_reg[9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|sw_reg[9]~feeder_combout\ = ( \SW[9]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_SW[9]~input_o\,
	combout => \inst_iface|sw_reg[9]~feeder_combout\);

-- Location: FF_X31_Y3_N49
\inst_iface|sw_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|sw_reg[9]~feeder_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|sw_reg\(9));

-- Location: FF_X31_Y3_N37
\inst_iface|sw_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[8]~input_o\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|sw_reg\(8));

-- Location: IOIBUF_X4_Y0_N1
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: FF_X31_Y3_N44
\inst_iface|sw_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[7]~input_o\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|sw_reg\(7));

-- Location: LABCELL_X31_Y3_N54
\inst_iface|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Equal0~1_combout\ = ( \SW[7]~input_o\ & ( \inst_iface|sw_reg\(7) & ( (!\SW[8]~input_o\ & (!\inst_iface|sw_reg\(8) & (!\inst_iface|sw_reg\(9) $ (\SW[9]~input_o\)))) # (\SW[8]~input_o\ & (\inst_iface|sw_reg\(8) & (!\inst_iface|sw_reg\(9) $ 
-- (\SW[9]~input_o\)))) ) ) ) # ( !\SW[7]~input_o\ & ( !\inst_iface|sw_reg\(7) & ( (!\SW[8]~input_o\ & (!\inst_iface|sw_reg\(8) & (!\inst_iface|sw_reg\(9) $ (\SW[9]~input_o\)))) # (\SW[8]~input_o\ & (\inst_iface|sw_reg\(8) & (!\inst_iface|sw_reg\(9) $ 
-- (\SW[9]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001001000001000000000000000000000000000000001000001001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[8]~input_o\,
	datab => \inst_iface|ALT_INV_sw_reg\(9),
	datac => \ALT_INV_SW[9]~input_o\,
	datad => \inst_iface|ALT_INV_sw_reg\(8),
	datae => \ALT_INV_SW[7]~input_o\,
	dataf => \inst_iface|ALT_INV_sw_reg\(7),
	combout => \inst_iface|Equal0~1_combout\);

-- Location: IOIBUF_X40_Y0_N18
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: MLABCELL_X28_Y3_N48
\inst_iface|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Selector4~0_combout\ = ( \KEY[3]~input_o\ & ( \inst_controller|ready~q\ & ( ((\inst_iface|state.ST_READY~q\ & ((!\inst_iface|Equal0~0_combout\) # (!\inst_iface|Equal0~1_combout\)))) # (\inst_iface|state.ST_WAIT_WRITE~q\) ) ) ) # ( 
-- !\KEY[3]~input_o\ & ( \inst_controller|ready~q\ & ( \inst_iface|state.ST_WAIT_WRITE~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010111011101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~q\,
	datab => \inst_iface|ALT_INV_state.ST_READY~q\,
	datac => \inst_iface|ALT_INV_Equal0~0_combout\,
	datad => \inst_iface|ALT_INV_Equal0~1_combout\,
	datae => \ALT_INV_KEY[3]~input_o\,
	dataf => \inst_controller|ALT_INV_ready~q\,
	combout => \inst_iface|Selector4~0_combout\);

-- Location: FF_X28_Y2_N56
\inst_iface|state.ST_REQ_READ\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_iface|Selector4~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_REQ_READ~q\);

-- Location: LABCELL_X29_Y2_N27
\inst_iface|req\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|req~combout\ = ( \inst_iface|state.ST_REQ_READ~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ ) ) # ( !\inst_iface|state.ST_REQ_READ~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ ) ) # ( \inst_iface|state.ST_REQ_READ~q\ & ( 
-- !\inst_iface|state.ST_REQ_WRITE~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst_iface|ALT_INV_state.ST_REQ_READ~q\,
	dataf => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	combout => \inst_iface|req~combout\);

-- Location: MLABCELL_X28_Y4_N24
\inst_controller|Selector21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector21~0_combout\ = ( \inst_iface|req~combout\ & ( (\inst_controller|state.S_IDLE~q\ & !\inst_controller|needs_refresh~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110000001100000011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	dataf => \inst_iface|ALT_INV_req~combout\,
	combout => \inst_controller|Selector21~0_combout\);

-- Location: FF_X27_Y4_N35
\inst_controller|state.S_ACTIVATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|Selector21~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_ACTIVATE~q\);

-- Location: LABCELL_X27_Y4_N0
\inst_controller|Selector22~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector22~0_combout\ = ( \inst_controller|state.S_ACTIVATE~q\ ) # ( !\inst_controller|state.S_ACTIVATE~q\ & ( (\inst_controller|state.S_WAIT_RCD~q\ & ((!\inst_controller|LessThan1~1_combout\) # ((!\inst_controller|LessThan1~2_combout\) # 
-- (!\inst_controller|LessThan1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111110000000001111111011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_RCD~q\,
	dataf => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	combout => \inst_controller|Selector22~0_combout\);

-- Location: FF_X27_Y4_N2
\inst_controller|state.S_WAIT_RCD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector22~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_RCD~q\);

-- Location: MLABCELL_X25_Y4_N33
\inst_iface|wEn\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|wEn~combout\ = ( \inst_iface|state.ST_REQ_WRITE~q\ & ( \inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ ) ) # ( !\inst_iface|state.ST_REQ_WRITE~q\ & ( \inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ ) ) # ( \inst_iface|state.ST_REQ_WRITE~q\ & ( 
-- !\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	dataf => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\,
	combout => \inst_iface|wEn~combout\);

-- Location: MLABCELL_X25_Y4_N24
\inst_controller|req_is_w~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|req_is_w~feeder_combout\ = ( \inst_iface|wEn~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst_iface|ALT_INV_wEn~combout\,
	combout => \inst_controller|req_is_w~feeder_combout\);

-- Location: MLABCELL_X28_Y4_N42
\inst_controller|req_is_w~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|req_is_w~0_combout\ = ( \inst_iface|state.ST_REQ_READ~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ & ( (\KEY[0]~input_o\ & (\inst_controller|state.S_IDLE~q\ & (!\inst_controller|needs_refresh~DUPLICATE_q\ & 
-- \inst_pll|pll_inst|altera_pll_i|locked_wire\(0)))) ) ) ) # ( !\inst_iface|state.ST_REQ_READ~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ & ( (\KEY[0]~input_o\ & (\inst_controller|state.S_IDLE~q\ & (!\inst_controller|needs_refresh~DUPLICATE_q\ & 
-- \inst_pll|pll_inst|altera_pll_i|locked_wire\(0)))) ) ) ) # ( \inst_iface|state.ST_REQ_READ~q\ & ( !\inst_iface|state.ST_REQ_WRITE~q\ & ( (\KEY[0]~input_o\ & (\inst_controller|state.S_IDLE~q\ & (!\inst_controller|needs_refresh~DUPLICATE_q\ & 
-- \inst_pll|pll_inst|altera_pll_i|locked_wire\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_KEY[0]~input_o\,
	datab => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	datad => \inst_pll|pll_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	datae => \inst_iface|ALT_INV_state.ST_REQ_READ~q\,
	dataf => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	combout => \inst_controller|req_is_w~0_combout\);

-- Location: FF_X25_Y4_N26
\inst_controller|req_is_w\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|req_is_w~feeder_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_is_w~q\);

-- Location: LABCELL_X27_Y4_N18
\inst_controller|Selector23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector23~0_combout\ = ( !\inst_controller|req_is_w~q\ & ( \inst_controller|state~36_combout\ & ( (\inst_controller|state.S_WAIT_RCD~q\ & (\inst_controller|LessThan1~3_combout\ & \inst_controller|WideOr2~combout\)) ) ) ) # ( 
-- !\inst_controller|req_is_w~q\ & ( !\inst_controller|state~36_combout\ & ( (\inst_controller|state.S_WAIT_RCD~q\ & (!\inst_controller|state.S_IDLE~q\ & (\inst_controller|LessThan1~3_combout\ & \inst_controller|WideOr2~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000000000000000000001010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WAIT_RCD~q\,
	datab => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datac => \inst_controller|ALT_INV_LessThan1~3_combout\,
	datad => \inst_controller|ALT_INV_WideOr2~combout\,
	datae => \inst_controller|ALT_INV_req_is_w~q\,
	dataf => \inst_controller|ALT_INV_state~36_combout\,
	combout => \inst_controller|Selector23~0_combout\);

-- Location: FF_X27_Y4_N19
\inst_controller|state.S_READ_CMD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector23~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_READ_CMD~q\);

-- Location: MLABCELL_X28_Y4_N36
\inst_controller|Selector24~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector24~0_combout\ = ( \inst_controller|state.S_READ_CMD~q\ ) # ( !\inst_controller|state.S_READ_CMD~q\ & ( (\inst_controller|state.S_WAIT_CAS~q\ & ((!\inst_controller|LessThan1~1_combout\) # ((!\inst_controller|LessThan1~0_combout\) # 
-- (!\inst_controller|LessThan1~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111110000000001111111011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_CAS~q\,
	dataf => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	combout => \inst_controller|Selector24~0_combout\);

-- Location: FF_X28_Y4_N38
\inst_controller|state.S_WAIT_CAS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector24~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_CAS~q\);

-- Location: LABCELL_X27_Y4_N24
\inst_controller|Selector25~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector25~0_combout\ = ( \inst_controller|req_is_w~q\ & ( \inst_controller|state~36_combout\ & ( (\inst_controller|state.S_WAIT_RCD~q\ & (\inst_controller|LessThan1~3_combout\ & \inst_controller|WideOr2~combout\)) ) ) ) # ( 
-- \inst_controller|req_is_w~q\ & ( !\inst_controller|state~36_combout\ & ( (\inst_controller|state.S_WAIT_RCD~q\ & (!\inst_controller|state.S_IDLE~q\ & (\inst_controller|LessThan1~3_combout\ & \inst_controller|WideOr2~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010000000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WAIT_RCD~q\,
	datab => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datac => \inst_controller|ALT_INV_LessThan1~3_combout\,
	datad => \inst_controller|ALT_INV_WideOr2~combout\,
	datae => \inst_controller|ALT_INV_req_is_w~q\,
	dataf => \inst_controller|ALT_INV_state~36_combout\,
	combout => \inst_controller|Selector25~0_combout\);

-- Location: FF_X27_Y4_N25
\inst_controller|state.S_WRITE_CMD~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector25~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WRITE_CMD~DUPLICATE_q\);

-- Location: LABCELL_X27_Y4_N48
\inst_controller|Selector26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector26~0_combout\ = ( \inst_controller|LessThan1~0_combout\ & ( ((\inst_controller|state.S_WAIT_DPL~q\ & ((!\inst_controller|LessThan1~2_combout\) # (!\inst_controller|LessThan1~1_combout\)))) # 
-- (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\) ) ) # ( !\inst_controller|LessThan1~0_combout\ & ( (\inst_controller|state.S_WAIT_DPL~q\) # (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011111110110011001111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datab => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_DPL~q\,
	dataf => \inst_controller|ALT_INV_LessThan1~0_combout\,
	combout => \inst_controller|Selector26~0_combout\);

-- Location: FF_X27_Y4_N49
\inst_controller|state.S_WAIT_DPL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector26~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_DPL~q\);

-- Location: LABCELL_X27_Y4_N36
\inst_controller|Selector30~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector30~0_combout\ = ( \inst_controller|LessThan1~0_combout\ & ( (!\inst_controller|WideOr2~0_combout\) # ((\inst_controller|state.S_WAIT_RC~q\ & ((!\inst_controller|LessThan1~1_combout\) # (!\inst_controller|LessThan1~2_combout\)))) ) 
-- ) # ( !\inst_controller|LessThan1~0_combout\ & ( (!\inst_controller|WideOr2~0_combout\) # (\inst_controller|state.S_WAIT_RC~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011111111110011001111111111001100111111101100110011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datab => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_RC~q\,
	dataf => \inst_controller|ALT_INV_LessThan1~0_combout\,
	combout => \inst_controller|Selector30~0_combout\);

-- Location: FF_X27_Y4_N37
\inst_controller|state.S_WAIT_RC\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector30~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_RC~q\);

-- Location: FF_X27_Y3_N40
\inst_controller|ref_init_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector46~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ref_init_cnt\(1));

-- Location: LABCELL_X27_Y3_N39
\inst_controller|Selector46~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector46~0_combout\ = ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( !\inst_controller|ref_init_cnt[0]~DUPLICATE_q\ $ (\inst_controller|ref_init_cnt\(1)) ) ) # ( !\inst_controller|state.S_INIT_REF_LOOP~q\ & ( 
-- (!\inst_controller|state.S_INIT_PRECHARGE~q\ & \inst_controller|ref_init_cnt\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000010101010010101011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ref_init_cnt[0]~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datad => \inst_controller|ALT_INV_ref_init_cnt\(1),
	dataf => \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\,
	combout => \inst_controller|Selector46~0_combout\);

-- Location: FF_X27_Y3_N41
\inst_controller|ref_init_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector46~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ref_init_cnt[1]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y3_N30
\inst_controller|Selector44~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector44~0_combout\ = ( \inst_controller|ref_init_cnt\(3) & ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( ((\inst_controller|ref_init_cnt\(2)) # (\inst_controller|ref_init_cnt[1]~DUPLICATE_q\)) # 
-- (\inst_controller|ref_init_cnt[0]~DUPLICATE_q\) ) ) ) # ( !\inst_controller|ref_init_cnt\(3) & ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( (!\inst_controller|ref_init_cnt[0]~DUPLICATE_q\ & (!\inst_controller|ref_init_cnt[1]~DUPLICATE_q\ & 
-- !\inst_controller|ref_init_cnt\(2))) ) ) ) # ( \inst_controller|ref_init_cnt\(3) & ( !\inst_controller|state.S_INIT_REF_LOOP~q\ ) ) # ( !\inst_controller|ref_init_cnt\(3) & ( !\inst_controller|state.S_INIT_REF_LOOP~q\ & ( 
-- \inst_controller|state.S_INIT_PRECHARGE~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111111111111110000000100000000111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ref_init_cnt[0]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_ref_init_cnt[1]~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_ref_init_cnt\(2),
	datad => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datae => \inst_controller|ALT_INV_ref_init_cnt\(3),
	dataf => \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\,
	combout => \inst_controller|Selector44~0_combout\);

-- Location: FF_X27_Y3_N32
\inst_controller|ref_init_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector44~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ref_init_cnt\(3));

-- Location: LABCELL_X27_Y3_N15
\inst_controller|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan2~0_combout\ = ( !\inst_controller|ref_init_cnt[1]~DUPLICATE_q\ & ( (!\inst_controller|ref_init_cnt[0]~DUPLICATE_q\ & (!\inst_controller|ref_init_cnt\(3) & !\inst_controller|ref_init_cnt\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ref_init_cnt[0]~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_ref_init_cnt\(3),
	datad => \inst_controller|ALT_INV_ref_init_cnt\(2),
	dataf => \inst_controller|ALT_INV_ref_init_cnt[1]~DUPLICATE_q\,
	combout => \inst_controller|LessThan2~0_combout\);

-- Location: LABCELL_X27_Y3_N6
\inst_controller|Selector18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector18~0_combout\ = ( \inst_controller|LessThan1~2_combout\ & ( \inst_controller|LessThan2~0_combout\ & ( (\inst_controller|state.S_WAIT_RC~q\ & (\inst_controller|LessThan1~1_combout\ & (!\inst_controller|needs_refresh~DUPLICATE_q\ & 
-- \inst_controller|LessThan1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WAIT_RC~q\,
	datab => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datae => \inst_controller|ALT_INV_LessThan1~2_combout\,
	dataf => \inst_controller|ALT_INV_LessThan2~0_combout\,
	combout => \inst_controller|Selector18~0_combout\);

-- Location: FF_X27_Y3_N7
\inst_controller|state.S_INIT_LOAD_MODE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector18~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_INIT_LOAD_MODE~q\);

-- Location: LABCELL_X27_Y3_N48
\inst_controller|Selector19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector19~0_combout\ = ( \inst_controller|state.S_INIT_LOAD_MODE~q\ ) # ( !\inst_controller|state.S_INIT_LOAD_MODE~q\ & ( (\inst_controller|state.S_WAIT_MRD~q\ & ((!\inst_controller|LessThan1~2_combout\) # 
-- ((!\inst_controller|LessThan1~0_combout\) # (!\inst_controller|LessThan1~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111110000000001111111011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_MRD~q\,
	dataf => \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~q\,
	combout => \inst_controller|Selector19~0_combout\);

-- Location: FF_X27_Y3_N49
\inst_controller|state.S_WAIT_MRD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector19~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_MRD~q\);

-- Location: LABCELL_X27_Y4_N15
\inst_controller|delay_cnt[10]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|delay_cnt[10]~0_combout\ = ( !\inst_controller|state.S_WAIT_MRD~q\ & ( !\inst_controller|state.S_WAIT_RP~DUPLICATE_q\ & ( (!\inst_controller|state.S_WAIT_RCD~q\ & (!\inst_controller|state.S_WAIT_CAS~q\ & 
-- (!\inst_controller|state.S_WAIT_DPL~q\ & !\inst_controller|state.S_WAIT_RC~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WAIT_RCD~q\,
	datab => \inst_controller|ALT_INV_state.S_WAIT_CAS~q\,
	datac => \inst_controller|ALT_INV_state.S_WAIT_DPL~q\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_RC~q\,
	datae => \inst_controller|ALT_INV_state.S_WAIT_MRD~q\,
	dataf => \inst_controller|ALT_INV_state.S_WAIT_RP~DUPLICATE_q\,
	combout => \inst_controller|delay_cnt[10]~0_combout\);

-- Location: MLABCELL_X28_Y4_N39
\inst_controller|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector11~0_combout\ = ( \inst_controller|state.S_INIT_WAIT~q\ & ( ((\inst_controller|LessThan1~1_combout\ & (\inst_controller|LessThan1~0_combout\ & \inst_controller|LessThan1~2_combout\))) # (\inst_controller|delay_cnt[10]~0_combout\) 
-- ) ) # ( !\inst_controller|state.S_INIT_WAIT~q\ & ( (\inst_controller|LessThan1~1_combout\ & (\inst_controller|LessThan1~0_combout\ & \inst_controller|LessThan1~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100001111000111110000111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datac => \inst_controller|ALT_INV_delay_cnt[10]~0_combout\,
	datad => \inst_controller|ALT_INV_LessThan1~2_combout\,
	dataf => \inst_controller|ALT_INV_state.S_INIT_WAIT~q\,
	combout => \inst_controller|Selector11~0_combout\);

-- Location: LABCELL_X30_Y4_N0
\inst_controller|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~9_sumout\ = SUM(( \inst_controller|delay_cnt\(0) ) + ( VCC ) + ( !VCC ))
-- \inst_controller|Add1~10\ = CARRY(( \inst_controller|delay_cnt\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst_controller|ALT_INV_delay_cnt\(0),
	cin => GND,
	sumout => \inst_controller|Add1~9_sumout\,
	cout => \inst_controller|Add1~10\);

-- Location: LABCELL_X29_Y4_N48
\inst_controller|Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector14~0_combout\ = ( \inst_controller|delay_cnt\(0) & ( \inst_controller|state.S_IDLE~q\ ) ) # ( !\inst_controller|delay_cnt\(0) & ( \inst_controller|state.S_IDLE~q\ & ( (!\inst_controller|WideOr2~0_combout\) # 
-- ((!\inst_controller|Selector11~0_combout\ & \inst_controller|Add1~9_sumout\)) ) ) ) # ( \inst_controller|delay_cnt\(0) & ( !\inst_controller|state.S_IDLE~q\ & ( (!\inst_controller|WideOr2~0_combout\) # ((!\inst_controller|Selector11~0_combout\ & 
-- \inst_controller|Add1~9_sumout\)) ) ) ) # ( !\inst_controller|delay_cnt\(0) & ( !\inst_controller|state.S_IDLE~q\ & ( (!\inst_controller|WideOr2~0_combout\) # ((!\inst_controller|Selector11~0_combout\ & \inst_controller|Add1~9_sumout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010111010101110101011101010111010101110101011101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datab => \inst_controller|ALT_INV_Selector11~0_combout\,
	datac => \inst_controller|ALT_INV_Add1~9_sumout\,
	datae => \inst_controller|ALT_INV_delay_cnt\(0),
	dataf => \inst_controller|ALT_INV_state.S_IDLE~q\,
	combout => \inst_controller|Selector14~0_combout\);

-- Location: FF_X29_Y4_N49
\inst_controller|delay_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector14~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(0));

-- Location: LABCELL_X30_Y4_N3
\inst_controller|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~5_sumout\ = SUM(( \inst_controller|delay_cnt\(1) ) + ( VCC ) + ( \inst_controller|Add1~10\ ))
-- \inst_controller|Add1~6\ = CARRY(( \inst_controller|delay_cnt\(1) ) + ( VCC ) + ( \inst_controller|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_delay_cnt\(1),
	cin => \inst_controller|Add1~10\,
	sumout => \inst_controller|Add1~5_sumout\,
	cout => \inst_controller|Add1~6\);

-- Location: FF_X27_Y3_N8
\inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector18~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\);

-- Location: FF_X27_Y4_N44
\inst_controller|state.S_PRECHARGE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector27~2_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_PRECHARGE~q\);

-- Location: LABCELL_X27_Y4_N51
\inst_controller|WideOr11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|WideOr11~0_combout\ = ( \inst_controller|state.S_PRECHARGE~q\ ) # ( !\inst_controller|state.S_PRECHARGE~q\ & ( ((\inst_controller|state.S_INIT_PRECHARGE~q\) # (\inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\)) # 
-- (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111111111111001111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	dataf => \inst_controller|ALT_INV_state.S_PRECHARGE~q\,
	combout => \inst_controller|WideOr11~0_combout\);

-- Location: MLABCELL_X28_Y4_N18
\inst_controller|Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector13~0_combout\ = ( \inst_controller|delay_cnt\(1) & ( \inst_controller|WideOr11~0_combout\ ) ) # ( !\inst_controller|delay_cnt\(1) & ( \inst_controller|WideOr11~0_combout\ ) ) # ( \inst_controller|delay_cnt\(1) & ( 
-- !\inst_controller|WideOr11~0_combout\ & ( (((\inst_controller|Add1~5_sumout\ & !\inst_controller|Selector11~0_combout\)) # (\inst_controller|state.S_ACTIVATE~q\)) # (\inst_controller|state.S_IDLE~q\) ) ) ) # ( !\inst_controller|delay_cnt\(1) & ( 
-- !\inst_controller|WideOr11~0_combout\ & ( ((\inst_controller|Add1~5_sumout\ & !\inst_controller|Selector11~0_combout\)) # (\inst_controller|state.S_ACTIVATE~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100110011011111110111011111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datab => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datac => \inst_controller|ALT_INV_Add1~5_sumout\,
	datad => \inst_controller|ALT_INV_Selector11~0_combout\,
	datae => \inst_controller|ALT_INV_delay_cnt\(1),
	dataf => \inst_controller|ALT_INV_WideOr11~0_combout\,
	combout => \inst_controller|Selector13~0_combout\);

-- Location: FF_X28_Y4_N19
\inst_controller|delay_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector13~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(1));

-- Location: LABCELL_X30_Y4_N6
\inst_controller|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~1_sumout\ = SUM(( \inst_controller|delay_cnt\(2) ) + ( VCC ) + ( \inst_controller|Add1~6\ ))
-- \inst_controller|Add1~2\ = CARRY(( \inst_controller|delay_cnt\(2) ) + ( VCC ) + ( \inst_controller|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_delay_cnt\(2),
	cin => \inst_controller|Add1~6\,
	sumout => \inst_controller|Add1~1_sumout\,
	cout => \inst_controller|Add1~2\);

-- Location: MLABCELL_X28_Y4_N12
\inst_controller|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector12~0_combout\ = ( \inst_controller|state.S_READ_CMD~q\ ) # ( !\inst_controller|state.S_READ_CMD~q\ & ( (!\inst_controller|state.S_IDLE~q\ & (!\inst_controller|Selector11~0_combout\ & (\inst_controller|Add1~1_sumout\))) # 
-- (\inst_controller|state.S_IDLE~q\ & (((!\inst_controller|Selector11~0_combout\ & \inst_controller|Add1~1_sumout\)) # (\inst_controller|delay_cnt\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001011101000011000101110111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datab => \inst_controller|ALT_INV_Selector11~0_combout\,
	datac => \inst_controller|ALT_INV_Add1~1_sumout\,
	datad => \inst_controller|ALT_INV_delay_cnt\(2),
	dataf => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	combout => \inst_controller|Selector12~0_combout\);

-- Location: FF_X28_Y4_N13
\inst_controller|delay_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector12~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(2));

-- Location: LABCELL_X30_Y4_N57
\inst_controller|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan1~0_combout\ = ( !\inst_controller|delay_cnt\(0) & ( (!\inst_controller|delay_cnt\(2) & !\inst_controller|delay_cnt\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000010100000101000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_delay_cnt\(2),
	datac => \inst_controller|ALT_INV_delay_cnt\(1),
	datae => \inst_controller|ALT_INV_delay_cnt\(0),
	combout => \inst_controller|LessThan1~0_combout\);

-- Location: LABCELL_X27_Y3_N24
\inst_controller|LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan1~3_combout\ = ( \inst_controller|LessThan1~0_combout\ & ( (\inst_controller|LessThan1~2_combout\ & \inst_controller|LessThan1~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~1_combout\,
	dataf => \inst_controller|ALT_INV_LessThan1~0_combout\,
	combout => \inst_controller|LessThan1~3_combout\);

-- Location: LABCELL_X27_Y4_N54
\inst_controller|state.S_INIT_WAIT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|state.S_INIT_WAIT~0_combout\ = ( \inst_controller|WideOr2~combout\ & ( ((!\inst_controller|state.S_IDLE~q\ & (\inst_controller|LessThan1~3_combout\)) # (\inst_controller|state.S_IDLE~q\ & ((!\inst_controller|state~36_combout\)))) # 
-- (\inst_controller|state.S_INIT_WAIT~q\) ) ) # ( !\inst_controller|WideOr2~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101110100111111110111010011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~3_combout\,
	datab => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datac => \inst_controller|ALT_INV_state~36_combout\,
	datad => \inst_controller|ALT_INV_state.S_INIT_WAIT~q\,
	dataf => \inst_controller|ALT_INV_WideOr2~combout\,
	combout => \inst_controller|state.S_INIT_WAIT~0_combout\);

-- Location: FF_X27_Y4_N55
\inst_controller|state.S_INIT_WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|state.S_INIT_WAIT~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_INIT_WAIT~q\);

-- Location: MLABCELL_X28_Y4_N27
\inst_controller|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector16~0_combout\ = ( \inst_controller|LessThan1~1_combout\ & ( (\inst_controller|LessThan1~2_combout\ & (!\inst_controller|state.S_INIT_WAIT~q\ & \inst_controller|LessThan1~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010100000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datac => \inst_controller|ALT_INV_state.S_INIT_WAIT~q\,
	datad => \inst_controller|ALT_INV_LessThan1~0_combout\,
	dataf => \inst_controller|ALT_INV_LessThan1~1_combout\,
	combout => \inst_controller|Selector16~0_combout\);

-- Location: FF_X28_Y4_N28
\inst_controller|state.S_INIT_PRECHARGE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector16~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_INIT_PRECHARGE~q\);

-- Location: FF_X27_Y3_N4
\inst_controller|ref_init_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector47~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ref_init_cnt\(0));

-- Location: LABCELL_X27_Y3_N3
\inst_controller|Selector47~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector47~0_combout\ = ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( !\inst_controller|ref_init_cnt\(0) ) ) # ( !\inst_controller|state.S_INIT_REF_LOOP~q\ & ( (!\inst_controller|state.S_INIT_PRECHARGE~q\ & 
-- \inst_controller|ref_init_cnt\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datad => \inst_controller|ALT_INV_ref_init_cnt\(0),
	dataf => \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\,
	combout => \inst_controller|Selector47~0_combout\);

-- Location: FF_X27_Y3_N5
\inst_controller|ref_init_cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector47~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ref_init_cnt[0]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y3_N36
\inst_controller|Selector45~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector45~0_combout\ = ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( !\inst_controller|ref_init_cnt\(2) $ (((\inst_controller|ref_init_cnt\(1)) # (\inst_controller|ref_init_cnt[0]~DUPLICATE_q\))) ) ) # ( 
-- !\inst_controller|state.S_INIT_REF_LOOP~q\ & ( (!\inst_controller|state.S_INIT_PRECHARGE~q\ & \inst_controller|ref_init_cnt\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110010100000010111111010000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ref_init_cnt[0]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datac => \inst_controller|ALT_INV_ref_init_cnt\(1),
	datad => \inst_controller|ALT_INV_ref_init_cnt\(2),
	dataf => \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\,
	combout => \inst_controller|Selector45~0_combout\);

-- Location: FF_X27_Y3_N38
\inst_controller|ref_init_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector45~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ref_init_cnt\(2));

-- Location: LABCELL_X27_Y3_N54
\inst_controller|Selector20~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector20~1_combout\ = ( \inst_controller|state.S_WAIT_RP~DUPLICATE_q\ & ( !\inst_controller|ref_init_cnt\(0) & ( (!\inst_controller|ref_init_cnt\(2) & (!\inst_controller|ref_init_cnt\(3) & (!\inst_controller|needs_refresh~DUPLICATE_q\ & 
-- !\inst_controller|ref_init_cnt[1]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ref_init_cnt\(2),
	datab => \inst_controller|ALT_INV_ref_init_cnt\(3),
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_ref_init_cnt[1]~DUPLICATE_q\,
	datae => \inst_controller|ALT_INV_state.S_WAIT_RP~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_ref_init_cnt\(0),
	combout => \inst_controller|Selector20~1_combout\);

-- Location: FF_X27_Y4_N32
\inst_controller|needs_refresh\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|needs_refresh~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|needs_refresh~q\);

-- Location: LABCELL_X27_Y4_N57
\inst_controller|Selector20~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector20~2_combout\ = ( \inst_controller|state.S_WAIT_RC~q\ & ( (!\inst_controller|needs_refresh~q\ & !\inst_controller|state.S_WAIT_MRD~q\) ) ) # ( !\inst_controller|state.S_WAIT_RC~q\ & ( !\inst_controller|state.S_WAIT_MRD~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_needs_refresh~q\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_MRD~q\,
	dataf => \inst_controller|ALT_INV_state.S_WAIT_RC~q\,
	combout => \inst_controller|Selector20~2_combout\);

-- Location: LABCELL_X27_Y3_N12
\inst_controller|Selector20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector20~0_combout\ = ( \inst_controller|state.S_IDLE~q\ & ( (!\inst_iface|state.ST_REQ_READ~q\ & (!\inst_iface|state.ST_REQ_WRITE~q\ & !\inst_controller|needs_refresh~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_state.ST_REQ_READ~q\,
	datac => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	datad => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_state.S_IDLE~q\,
	combout => \inst_controller|Selector20~0_combout\);

-- Location: LABCELL_X27_Y3_N18
\inst_controller|Selector20~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector20~3_combout\ = ( \inst_controller|LessThan1~2_combout\ & ( \inst_controller|Selector20~0_combout\ ) ) # ( !\inst_controller|LessThan1~2_combout\ & ( \inst_controller|Selector20~0_combout\ ) ) # ( 
-- \inst_controller|LessThan1~2_combout\ & ( !\inst_controller|Selector20~0_combout\ & ( (\inst_controller|LessThan1~1_combout\ & (\inst_controller|LessThan1~0_combout\ & ((!\inst_controller|Selector20~2_combout\) # 
-- (\inst_controller|Selector20~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000011000111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_Selector20~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datac => \inst_controller|ALT_INV_Selector20~2_combout\,
	datad => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datae => \inst_controller|ALT_INV_LessThan1~2_combout\,
	dataf => \inst_controller|ALT_INV_Selector20~0_combout\,
	combout => \inst_controller|Selector20~3_combout\);

-- Location: FF_X27_Y3_N20
\inst_controller|state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector20~3_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_IDLE~q\);

-- Location: LABCELL_X27_Y4_N33
\inst_controller|Selector27~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector27~0_combout\ = ( \inst_controller|needs_refresh~q\ & ( \inst_controller|state.S_IDLE~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_state.S_IDLE~q\,
	dataf => \inst_controller|ALT_INV_needs_refresh~q\,
	combout => \inst_controller|Selector27~0_combout\);

-- Location: LABCELL_X27_Y4_N9
\inst_controller|Selector27~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector27~1_combout\ = (!\inst_controller|state.S_WAIT_CAS~q\ & !\inst_controller|state.S_WAIT_DPL~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_state.S_WAIT_CAS~q\,
	datac => \inst_controller|ALT_INV_state.S_WAIT_DPL~q\,
	combout => \inst_controller|Selector27~1_combout\);

-- Location: LABCELL_X27_Y4_N42
\inst_controller|Selector27~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector27~2_combout\ = ( \inst_controller|state.S_PRECHARGE~q\ & ( \inst_controller|LessThan1~0_combout\ & ( (!\inst_controller|Selector27~1_combout\) # (\inst_controller|Selector27~0_combout\) ) ) ) # ( 
-- !\inst_controller|state.S_PRECHARGE~q\ & ( \inst_controller|LessThan1~0_combout\ & ( ((!\inst_controller|Selector27~1_combout\ & (\inst_controller|LessThan1~1_combout\ & \inst_controller|LessThan1~2_combout\))) # (\inst_controller|Selector27~0_combout\) ) 
-- ) ) # ( \inst_controller|state.S_PRECHARGE~q\ & ( !\inst_controller|LessThan1~0_combout\ & ( (!\inst_controller|Selector27~1_combout\) # (\inst_controller|Selector27~0_combout\) ) ) ) # ( !\inst_controller|state.S_PRECHARGE~q\ & ( 
-- !\inst_controller|LessThan1~0_combout\ & ( \inst_controller|Selector27~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101110111011101110101010101010111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_Selector27~0_combout\,
	datab => \inst_controller|ALT_INV_Selector27~1_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datad => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datae => \inst_controller|ALT_INV_state.S_PRECHARGE~q\,
	dataf => \inst_controller|ALT_INV_LessThan1~0_combout\,
	combout => \inst_controller|Selector27~2_combout\);

-- Location: FF_X27_Y4_N43
\inst_controller|state.S_PRECHARGE~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector27~2_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_PRECHARGE~DUPLICATE_q\);

-- Location: FF_X27_Y4_N26
\inst_controller|state.S_WRITE_CMD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector25~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WRITE_CMD~q\);

-- Location: LABCELL_X27_Y4_N6
\inst_controller|Selector33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector33~0_combout\ = ( !\inst_controller|state.S_READ_CMD~q\ & ( (!\inst_controller|state.S_WRITE_CMD~q\ & (!\inst_controller|state.S_ACTIVATE~q\ & !\inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WRITE_CMD~q\,
	datac => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datad => \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	combout => \inst_controller|Selector33~0_combout\);

-- Location: LABCELL_X29_Y4_N21
\inst_controller|WideOr2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|WideOr2~combout\ = ( \inst_controller|Selector33~0_combout\ & ( (\inst_controller|WideOr2~0_combout\ & (!\inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & !\inst_controller|state.S_INIT_PRECHARGE~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000100000000000100010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datab => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	dataf => \inst_controller|ALT_INV_Selector33~0_combout\,
	combout => \inst_controller|WideOr2~combout\);

-- Location: MLABCELL_X28_Y4_N54
\inst_controller|delay_cnt[10]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|delay_cnt[10]~1_combout\ = ( \inst_controller|LessThan1~0_combout\ & ( \inst_controller|LessThan1~2_combout\ & ( (!\inst_controller|state.S_IDLE~q\ & ((!\inst_controller|LessThan1~1_combout\) # ((\inst_controller|state.S_INIT_WAIT~q\ & 
-- \inst_controller|delay_cnt[10]~0_combout\)))) ) ) ) # ( !\inst_controller|LessThan1~0_combout\ & ( \inst_controller|LessThan1~2_combout\ & ( !\inst_controller|state.S_IDLE~q\ ) ) ) # ( \inst_controller|LessThan1~0_combout\ & ( 
-- !\inst_controller|LessThan1~2_combout\ & ( !\inst_controller|state.S_IDLE~q\ ) ) ) # ( !\inst_controller|LessThan1~0_combout\ & ( !\inst_controller|LessThan1~2_combout\ & ( !\inst_controller|state.S_IDLE~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001000100010001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datab => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datac => \inst_controller|ALT_INV_state.S_INIT_WAIT~q\,
	datad => \inst_controller|ALT_INV_delay_cnt[10]~0_combout\,
	datae => \inst_controller|ALT_INV_LessThan1~0_combout\,
	dataf => \inst_controller|ALT_INV_LessThan1~2_combout\,
	combout => \inst_controller|delay_cnt[10]~1_combout\);

-- Location: FF_X29_Y4_N28
\inst_controller|delay_cnt[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector9~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt[5]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y4_N9
\inst_controller|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~57_sumout\ = SUM(( !\inst_controller|delay_cnt\(3) ) + ( VCC ) + ( \inst_controller|Add1~2\ ))
-- \inst_controller|Add1~58\ = CARRY(( !\inst_controller|delay_cnt\(3) ) + ( VCC ) + ( \inst_controller|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_delay_cnt\(3),
	cin => \inst_controller|Add1~2\,
	sumout => \inst_controller|Add1~57_sumout\,
	cout => \inst_controller|Add1~58\);

-- Location: MLABCELL_X28_Y4_N15
\inst_controller|Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector11~1_combout\ = ( \inst_controller|Add1~57_sumout\ & ( (\inst_controller|Selector11~0_combout\ & (\inst_controller|WideOr2~0_combout\ & ((!\inst_controller|state.S_IDLE~q\) # (\inst_controller|delay_cnt\(3))))) ) ) # ( 
-- !\inst_controller|Add1~57_sumout\ & ( (\inst_controller|WideOr2~0_combout\ & ((!\inst_controller|state.S_IDLE~q\) # (\inst_controller|delay_cnt\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001111000010100000111100000010000000110000001000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_IDLE~q\,
	datab => \inst_controller|ALT_INV_Selector11~0_combout\,
	datac => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datad => \inst_controller|ALT_INV_delay_cnt\(3),
	dataf => \inst_controller|ALT_INV_Add1~57_sumout\,
	combout => \inst_controller|Selector11~1_combout\);

-- Location: FF_X28_Y4_N16
\inst_controller|delay_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector11~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(3));

-- Location: LABCELL_X30_Y4_N12
\inst_controller|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~53_sumout\ = SUM(( !\inst_controller|delay_cnt[4]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~58\ ))
-- \inst_controller|Add1~54\ = CARRY(( !\inst_controller|delay_cnt[4]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_delay_cnt[4]~DUPLICATE_q\,
	cin => \inst_controller|Add1~58\,
	sumout => \inst_controller|Add1~53_sumout\,
	cout => \inst_controller|Add1~54\);

-- Location: LABCELL_X29_Y4_N12
\inst_controller|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector10~0_combout\ = ( \inst_controller|Add1~53_sumout\ & ( ((!\inst_controller|Selector33~0_combout\) # ((!\inst_controller|WideOr2~0_combout\) # (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\))) # 
-- (\inst_controller|state.S_INIT_PRECHARGE~q\) ) ) # ( !\inst_controller|Add1~53_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111101111111111111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datad => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_Add1~53_sumout\,
	combout => \inst_controller|Selector10~0_combout\);

-- Location: FF_X29_Y4_N13
\inst_controller|delay_cnt[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector10~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt[4]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y4_N15
\inst_controller|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~49_sumout\ = SUM(( !\inst_controller|delay_cnt[5]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~54\ ))
-- \inst_controller|Add1~50\ = CARRY(( !\inst_controller|delay_cnt[5]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst_controller|ALT_INV_delay_cnt[5]~DUPLICATE_q\,
	cin => \inst_controller|Add1~54\,
	sumout => \inst_controller|Add1~49_sumout\,
	cout => \inst_controller|Add1~50\);

-- Location: LABCELL_X30_Y4_N18
\inst_controller|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~45_sumout\ = SUM(( \inst_controller|delay_cnt\(6) ) + ( VCC ) + ( \inst_controller|Add1~50\ ))
-- \inst_controller|Add1~46\ = CARRY(( \inst_controller|delay_cnt\(6) ) + ( VCC ) + ( \inst_controller|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_delay_cnt\(6),
	cin => \inst_controller|Add1~50\,
	sumout => \inst_controller|Add1~45_sumout\,
	cout => \inst_controller|Add1~46\);

-- Location: LABCELL_X29_Y4_N24
\inst_controller|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector8~0_combout\ = ( \inst_controller|Add1~45_sumout\ & ( (\inst_controller|WideOr2~0_combout\ & (\inst_controller|Selector33~0_combout\ & (!\inst_controller|state.S_INIT_PRECHARGE~q\ & 
-- !\inst_controller|state.S_PRECHARGE~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datad => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_Add1~45_sumout\,
	combout => \inst_controller|Selector8~0_combout\);

-- Location: FF_X29_Y4_N25
\inst_controller|delay_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector8~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(6));

-- Location: LABCELL_X30_Y4_N21
\inst_controller|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~41_sumout\ = SUM(( !\inst_controller|delay_cnt[7]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~46\ ))
-- \inst_controller|Add1~42\ = CARRY(( !\inst_controller|delay_cnt[7]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_delay_cnt[7]~DUPLICATE_q\,
	cin => \inst_controller|Add1~46\,
	sumout => \inst_controller|Add1~41_sumout\,
	cout => \inst_controller|Add1~42\);

-- Location: LABCELL_X29_Y4_N18
\inst_controller|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector7~0_combout\ = ( \inst_controller|Selector33~0_combout\ & ( (!\inst_controller|WideOr2~0_combout\) # (((!\inst_controller|Add1~41_sumout\) # (\inst_controller|state.S_INIT_PRECHARGE~q\)) # 
-- (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\)) ) ) # ( !\inst_controller|Selector33~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111101111111111111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datab => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datad => \inst_controller|ALT_INV_Add1~41_sumout\,
	dataf => \inst_controller|ALT_INV_Selector33~0_combout\,
	combout => \inst_controller|Selector7~0_combout\);

-- Location: FF_X29_Y4_N19
\inst_controller|delay_cnt[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector7~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt[7]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y4_N24
\inst_controller|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~37_sumout\ = SUM(( !\inst_controller|delay_cnt\(8) ) + ( VCC ) + ( \inst_controller|Add1~42\ ))
-- \inst_controller|Add1~38\ = CARRY(( !\inst_controller|delay_cnt\(8) ) + ( VCC ) + ( \inst_controller|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_delay_cnt\(8),
	cin => \inst_controller|Add1~42\,
	sumout => \inst_controller|Add1~37_sumout\,
	cout => \inst_controller|Add1~38\);

-- Location: LABCELL_X29_Y4_N15
\inst_controller|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector6~0_combout\ = ( \inst_controller|Add1~37_sumout\ & ( ((!\inst_controller|Selector33~0_combout\) # ((!\inst_controller|WideOr2~0_combout\) # (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\))) # 
-- (\inst_controller|state.S_INIT_PRECHARGE~q\) ) ) # ( !\inst_controller|Add1~37_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111101111111111111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datad => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_Add1~37_sumout\,
	combout => \inst_controller|Selector6~0_combout\);

-- Location: FF_X29_Y4_N16
\inst_controller|delay_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector6~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(8));

-- Location: LABCELL_X30_Y4_N27
\inst_controller|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~33_sumout\ = SUM(( !\inst_controller|delay_cnt\(9) ) + ( VCC ) + ( \inst_controller|Add1~38\ ))
-- \inst_controller|Add1~34\ = CARRY(( !\inst_controller|delay_cnt\(9) ) + ( VCC ) + ( \inst_controller|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_delay_cnt\(9),
	cin => \inst_controller|Add1~38\,
	sumout => \inst_controller|Add1~33_sumout\,
	cout => \inst_controller|Add1~34\);

-- Location: LABCELL_X29_Y4_N54
\inst_controller|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector5~0_combout\ = ( \inst_controller|Add1~33_sumout\ & ( ((!\inst_controller|Selector33~0_combout\) # ((!\inst_controller|WideOr2~0_combout\) # (\inst_controller|state.S_INIT_PRECHARGE~q\))) # 
-- (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\) ) ) # ( !\inst_controller|Add1~33_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111101111111111111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datad => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	dataf => \inst_controller|ALT_INV_Add1~33_sumout\,
	combout => \inst_controller|Selector5~0_combout\);

-- Location: FF_X29_Y4_N56
\inst_controller|delay_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector5~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(9));

-- Location: LABCELL_X30_Y4_N30
\inst_controller|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~29_sumout\ = SUM(( !\inst_controller|delay_cnt\(10) ) + ( VCC ) + ( \inst_controller|Add1~34\ ))
-- \inst_controller|Add1~30\ = CARRY(( !\inst_controller|delay_cnt\(10) ) + ( VCC ) + ( \inst_controller|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_delay_cnt\(10),
	cin => \inst_controller|Add1~34\,
	sumout => \inst_controller|Add1~29_sumout\,
	cout => \inst_controller|Add1~30\);

-- Location: LABCELL_X29_Y4_N9
\inst_controller|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector4~0_combout\ = ( \inst_controller|Add1~29_sumout\ & ( !\inst_controller|WideOr2~combout\ ) ) # ( !\inst_controller|Add1~29_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~combout\,
	dataf => \inst_controller|ALT_INV_Add1~29_sumout\,
	combout => \inst_controller|Selector4~0_combout\);

-- Location: FF_X29_Y4_N10
\inst_controller|delay_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector4~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(10));

-- Location: FF_X29_Y4_N58
\inst_controller|delay_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector0~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(14));

-- Location: LABCELL_X30_Y4_N33
\inst_controller|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~25_sumout\ = SUM(( !\inst_controller|delay_cnt\(11) ) + ( VCC ) + ( \inst_controller|Add1~30\ ))
-- \inst_controller|Add1~26\ = CARRY(( !\inst_controller|delay_cnt\(11) ) + ( VCC ) + ( \inst_controller|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_delay_cnt\(11),
	cin => \inst_controller|Add1~30\,
	sumout => \inst_controller|Add1~25_sumout\,
	cout => \inst_controller|Add1~26\);

-- Location: LABCELL_X29_Y4_N6
\inst_controller|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector3~0_combout\ = ( \inst_controller|Add1~25_sumout\ & ( !\inst_controller|WideOr2~combout\ ) ) # ( !\inst_controller|Add1~25_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~combout\,
	dataf => \inst_controller|ALT_INV_Add1~25_sumout\,
	combout => \inst_controller|Selector3~0_combout\);

-- Location: FF_X29_Y4_N7
\inst_controller|delay_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector3~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(11));

-- Location: LABCELL_X30_Y4_N36
\inst_controller|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~21_sumout\ = SUM(( \inst_controller|delay_cnt[12]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~26\ ))
-- \inst_controller|Add1~22\ = CARRY(( \inst_controller|delay_cnt[12]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_delay_cnt[12]~DUPLICATE_q\,
	cin => \inst_controller|Add1~26\,
	sumout => \inst_controller|Add1~21_sumout\,
	cout => \inst_controller|Add1~22\);

-- Location: LABCELL_X29_Y4_N33
\inst_controller|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector2~0_combout\ = (\inst_controller|WideOr2~combout\ & \inst_controller|Add1~21_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~combout\,
	datac => \inst_controller|ALT_INV_Add1~21_sumout\,
	combout => \inst_controller|Selector2~0_combout\);

-- Location: FF_X29_Y4_N34
\inst_controller|delay_cnt[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector2~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt[12]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y4_N39
\inst_controller|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~17_sumout\ = SUM(( !\inst_controller|delay_cnt[13]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~22\ ))
-- \inst_controller|Add1~18\ = CARRY(( !\inst_controller|delay_cnt[13]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_delay_cnt[13]~DUPLICATE_q\,
	cin => \inst_controller|Add1~22\,
	sumout => \inst_controller|Add1~17_sumout\,
	cout => \inst_controller|Add1~18\);

-- Location: LABCELL_X29_Y4_N30
\inst_controller|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector1~0_combout\ = ( \inst_controller|Add1~17_sumout\ & ( !\inst_controller|WideOr2~combout\ ) ) # ( !\inst_controller|Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~combout\,
	dataf => \inst_controller|ALT_INV_Add1~17_sumout\,
	combout => \inst_controller|Selector1~0_combout\);

-- Location: FF_X29_Y4_N31
\inst_controller|delay_cnt[13]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector1~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt[13]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y4_N42
\inst_controller|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add1~13_sumout\ = SUM(( !\inst_controller|delay_cnt\(14) ) + ( VCC ) + ( \inst_controller|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_delay_cnt\(14),
	cin => \inst_controller|Add1~18\,
	sumout => \inst_controller|Add1~13_sumout\);

-- Location: LABCELL_X29_Y4_N57
\inst_controller|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector0~0_combout\ = ( \inst_controller|Add1~13_sumout\ & ( !\inst_controller|WideOr2~combout\ ) ) # ( !\inst_controller|Add1~13_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst_controller|ALT_INV_WideOr2~combout\,
	dataf => \inst_controller|ALT_INV_Add1~13_sumout\,
	combout => \inst_controller|Selector0~0_combout\);

-- Location: FF_X29_Y4_N59
\inst_controller|delay_cnt[14]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector0~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt[14]~DUPLICATE_q\);

-- Location: FF_X29_Y4_N32
\inst_controller|delay_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector1~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(13));

-- Location: FF_X29_Y4_N35
\inst_controller|delay_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector2~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(12));

-- Location: LABCELL_X29_Y4_N42
\inst_controller|LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan1~1_combout\ = ( \inst_controller|delay_cnt\(11) & ( !\inst_controller|delay_cnt\(12) & ( (\inst_controller|delay_cnt\(10) & (\inst_controller|delay_cnt[14]~DUPLICATE_q\ & (\inst_controller|delay_cnt\(9) & 
-- \inst_controller|delay_cnt\(13)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_delay_cnt\(10),
	datab => \inst_controller|ALT_INV_delay_cnt[14]~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_delay_cnt\(9),
	datad => \inst_controller|ALT_INV_delay_cnt\(13),
	datae => \inst_controller|ALT_INV_delay_cnt\(11),
	dataf => \inst_controller|ALT_INV_delay_cnt\(12),
	combout => \inst_controller|LessThan1~1_combout\);

-- Location: FF_X28_Y3_N56
\inst_controller|state.S_WAIT_RP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector28~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_RP~q\);

-- Location: MLABCELL_X28_Y3_N54
\inst_controller|Selector28~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector28~0_combout\ = ( \inst_controller|state.S_WAIT_RP~q\ & ( \inst_controller|state.S_INIT_PRECHARGE~q\ ) ) # ( !\inst_controller|state.S_WAIT_RP~q\ & ( \inst_controller|state.S_INIT_PRECHARGE~q\ ) ) # ( 
-- \inst_controller|state.S_WAIT_RP~q\ & ( !\inst_controller|state.S_INIT_PRECHARGE~q\ & ( (!\inst_controller|LessThan1~2_combout\) # ((!\inst_controller|LessThan1~1_combout\) # ((!\inst_controller|LessThan1~0_combout\) # 
-- (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\))) ) ) ) # ( !\inst_controller|state.S_WAIT_RP~q\ & ( !\inst_controller|state.S_INIT_PRECHARGE~q\ & ( \inst_controller|state.S_PRECHARGE~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111110111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datac => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datae => \inst_controller|ALT_INV_state.S_WAIT_RP~q\,
	dataf => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	combout => \inst_controller|Selector28~0_combout\);

-- Location: FF_X28_Y3_N55
\inst_controller|state.S_WAIT_RP~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector28~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_WAIT_RP~DUPLICATE_q\);

-- Location: LABCELL_X27_Y3_N42
\inst_controller|Selector17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector17~0_combout\ = ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( \inst_controller|LessThan2~0_combout\ & ( (!\inst_controller|LessThan1~3_combout\ & ((\inst_controller|state.S_WAIT_RC~q\) # 
-- (\inst_controller|state.S_WAIT_RP~DUPLICATE_q\))) ) ) ) # ( \inst_controller|state.S_INIT_REF_LOOP~q\ & ( !\inst_controller|LessThan2~0_combout\ & ( (!\inst_controller|needs_refresh~DUPLICATE_q\ & (((\inst_controller|state.S_WAIT_RC~q\)) # 
-- (\inst_controller|state.S_WAIT_RP~DUPLICATE_q\))) # (\inst_controller|needs_refresh~DUPLICATE_q\ & (!\inst_controller|LessThan1~3_combout\ & ((\inst_controller|state.S_WAIT_RC~q\) # (\inst_controller|state.S_WAIT_RP~DUPLICATE_q\)))) ) ) ) # ( 
-- !\inst_controller|state.S_INIT_REF_LOOP~q\ & ( !\inst_controller|LessThan2~0_combout\ & ( (!\inst_controller|needs_refresh~DUPLICATE_q\ & (\inst_controller|LessThan1~3_combout\ & ((\inst_controller|state.S_WAIT_RC~q\) # 
-- (\inst_controller|state.S_WAIT_RP~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000001010001100101111101000000000000000000011000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_state.S_WAIT_RP~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_LessThan1~3_combout\,
	datad => \inst_controller|ALT_INV_state.S_WAIT_RC~q\,
	datae => \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\,
	dataf => \inst_controller|ALT_INV_LessThan2~0_combout\,
	combout => \inst_controller|Selector17~0_combout\);

-- Location: FF_X27_Y3_N43
\inst_controller|state.S_INIT_REF_LOOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector17~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_INIT_REF_LOOP~q\);

-- Location: MLABCELL_X28_Y3_N24
\inst_controller|Selector29~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector29~0_combout\ = ( \inst_controller|needs_refresh~DUPLICATE_q\ & ( \inst_controller|LessThan1~0_combout\ & ( (\inst_controller|LessThan1~2_combout\ & (\inst_controller|LessThan1~1_combout\ & \inst_controller|state.S_WAIT_RP~q\)) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~1_combout\,
	datac => \inst_controller|ALT_INV_state.S_WAIT_RP~q\,
	datae => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_LessThan1~0_combout\,
	combout => \inst_controller|Selector29~0_combout\);

-- Location: FF_X28_Y3_N25
\inst_controller|state.S_REFRESH_CMD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector29~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|state.S_REFRESH_CMD~q\);

-- Location: MLABCELL_X28_Y3_N33
\inst_controller|WideOr2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|WideOr2~0_combout\ = ( !\inst_controller|state.S_REFRESH_CMD~q\ & ( !\inst_controller|state.S_INIT_REF_LOOP~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_state.S_INIT_REF_LOOP~q\,
	dataf => \inst_controller|ALT_INV_state.S_REFRESH_CMD~q\,
	combout => \inst_controller|WideOr2~0_combout\);

-- Location: LABCELL_X29_Y4_N27
\inst_controller|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector9~0_combout\ = ( \inst_controller|Add1~49_sumout\ & ( (!\inst_controller|WideOr2~0_combout\) # ((!\inst_controller|Selector33~0_combout\) # ((\inst_controller|state.S_INIT_PRECHARGE~q\) # 
-- (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\))) ) ) # ( !\inst_controller|Add1~49_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111101111111111111110111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	dataf => \inst_controller|ALT_INV_Add1~49_sumout\,
	combout => \inst_controller|Selector9~0_combout\);

-- Location: FF_X29_Y4_N29
\inst_controller|delay_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector9~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(5));

-- Location: FF_X29_Y4_N20
\inst_controller|delay_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector7~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(7));

-- Location: FF_X29_Y4_N14
\inst_controller|delay_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector10~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|delay_cnt[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|delay_cnt\(4));

-- Location: LABCELL_X29_Y4_N36
\inst_controller|LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan1~2_combout\ = ( \inst_controller|delay_cnt\(8) & ( \inst_controller|delay_cnt\(4) & ( (\inst_controller|delay_cnt\(5) & (\inst_controller|delay_cnt\(3) & (\inst_controller|delay_cnt\(7) & !\inst_controller|delay_cnt\(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_delay_cnt\(5),
	datab => \inst_controller|ALT_INV_delay_cnt\(3),
	datac => \inst_controller|ALT_INV_delay_cnt\(7),
	datad => \inst_controller|ALT_INV_delay_cnt\(6),
	datae => \inst_controller|ALT_INV_delay_cnt\(8),
	dataf => \inst_controller|ALT_INV_delay_cnt\(4),
	combout => \inst_controller|LessThan1~2_combout\);

-- Location: LABCELL_X27_Y3_N51
\inst_controller|is_init~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|is_init~0_combout\ = ( \inst_controller|LessThan1~1_combout\ & ( ((\inst_controller|LessThan1~2_combout\ & (\inst_controller|LessThan1~0_combout\ & \inst_controller|state.S_WAIT_MRD~q\))) # (\inst_controller|is_init~q\) ) ) # ( 
-- !\inst_controller|LessThan1~1_combout\ & ( \inst_controller|is_init~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111110000000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datab => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datac => \inst_controller|ALT_INV_state.S_WAIT_MRD~q\,
	datad => \inst_controller|ALT_INV_is_init~q\,
	dataf => \inst_controller|ALT_INV_LessThan1~1_combout\,
	combout => \inst_controller|is_init~0_combout\);

-- Location: FF_X27_Y3_N53
\inst_controller|is_init\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|is_init~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|is_init~q\);

-- Location: LABCELL_X27_Y2_N0
\inst_controller|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~5_sumout\ = SUM(( \inst_controller|refresh_timer[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))
-- \inst_controller|Add0~6\ = CARRY(( \inst_controller|refresh_timer[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	cin => GND,
	sumout => \inst_controller|Add0~5_sumout\,
	cout => \inst_controller|Add0~6\);

-- Location: FF_X28_Y2_N46
\inst_controller|refresh_timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(0));

-- Location: LABCELL_X27_Y2_N3
\inst_controller|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~41_sumout\ = SUM(( \inst_controller|refresh_timer\(1) ) + ( VCC ) + ( \inst_controller|Add0~6\ ))
-- \inst_controller|Add0~42\ = CARRY(( \inst_controller|refresh_timer\(1) ) + ( VCC ) + ( \inst_controller|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer\(1),
	cin => \inst_controller|Add0~6\,
	sumout => \inst_controller|Add0~41_sumout\,
	cout => \inst_controller|Add0~42\);

-- Location: LABCELL_X27_Y2_N6
\inst_controller|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~37_sumout\ = SUM(( !\inst_controller|refresh_timer[2]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~42\ ))
-- \inst_controller|Add0~38\ = CARRY(( !\inst_controller|refresh_timer[2]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer[2]~DUPLICATE_q\,
	cin => \inst_controller|Add0~42\,
	sumout => \inst_controller|Add0~37_sumout\,
	cout => \inst_controller|Add0~38\);

-- Location: LABCELL_X27_Y2_N51
\inst_controller|refresh_timer~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~9_combout\ = ( \inst_controller|LessThan0~1_combout\ & ( (!\inst_controller|Add0~37_sumout\ & (((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer[5]~DUPLICATE_q\)) # 
-- (\inst_controller|refresh_timer[0]~DUPLICATE_q\))) ) ) # ( !\inst_controller|LessThan0~1_combout\ & ( !\inst_controller|Add0~37_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011010000111100001101000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datac => \inst_controller|ALT_INV_Add0~37_sumout\,
	datad => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_LessThan0~1_combout\,
	combout => \inst_controller|refresh_timer~9_combout\);

-- Location: FF_X27_Y2_N53
\inst_controller|refresh_timer[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~9_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer[2]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y2_N9
\inst_controller|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~33_sumout\ = SUM(( !\inst_controller|refresh_timer\(3) ) + ( VCC ) + ( \inst_controller|Add0~38\ ))
-- \inst_controller|Add0~34\ = CARRY(( !\inst_controller|refresh_timer\(3) ) + ( VCC ) + ( \inst_controller|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer\(3),
	cin => \inst_controller|Add0~38\,
	sumout => \inst_controller|Add0~33_sumout\,
	cout => \inst_controller|Add0~34\);

-- Location: FF_X28_Y2_N7
\inst_controller|refresh_timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(5));

-- Location: MLABCELL_X28_Y2_N48
\inst_controller|refresh_timer~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~8_combout\ = ( \inst_controller|refresh_timer\(0) & ( !\inst_controller|Add0~33_sumout\ ) ) # ( !\inst_controller|refresh_timer\(0) & ( (!\inst_controller|Add0~33_sumout\ & ((!\inst_controller|LessThan0~1_combout\) # 
-- ((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer\(5))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000011110000111000001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datac => \inst_controller|ALT_INV_Add0~33_sumout\,
	datad => \inst_controller|ALT_INV_refresh_timer\(5),
	dataf => \inst_controller|ALT_INV_refresh_timer\(0),
	combout => \inst_controller|refresh_timer~8_combout\);

-- Location: FF_X28_Y2_N50
\inst_controller|refresh_timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~8_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(3));

-- Location: LABCELL_X27_Y2_N12
\inst_controller|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~29_sumout\ = SUM(( \inst_controller|refresh_timer[4]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~34\ ))
-- \inst_controller|Add0~30\ = CARRY(( \inst_controller|refresh_timer[4]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer[4]~DUPLICATE_q\,
	cin => \inst_controller|Add0~34\,
	sumout => \inst_controller|Add0~29_sumout\,
	cout => \inst_controller|Add0~30\);

-- Location: MLABCELL_X28_Y2_N51
\inst_controller|refresh_timer~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~7_combout\ = ( \inst_controller|refresh_timer\(0) & ( \inst_controller|Add0~29_sumout\ ) ) # ( !\inst_controller|refresh_timer\(0) & ( (\inst_controller|Add0~29_sumout\ & ((!\inst_controller|LessThan0~1_combout\) # 
-- ((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer[5]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101111000000001110111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datac => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_Add0~29_sumout\,
	dataf => \inst_controller|ALT_INV_refresh_timer\(0),
	combout => \inst_controller|refresh_timer~7_combout\);

-- Location: FF_X28_Y2_N52
\inst_controller|refresh_timer[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~7_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer[4]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y2_N15
\inst_controller|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~1_sumout\ = SUM(( \inst_controller|refresh_timer[5]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~30\ ))
-- \inst_controller|Add0~2\ = CARRY(( \inst_controller|refresh_timer[5]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	cin => \inst_controller|Add0~30\,
	sumout => \inst_controller|Add0~1_sumout\,
	cout => \inst_controller|Add0~2\);

-- Location: MLABCELL_X28_Y2_N6
\inst_controller|refresh_timer~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~0_combout\ = ( \inst_controller|refresh_timer\(5) & ( \inst_controller|refresh_timer\(0) & ( \inst_controller|Add0~1_sumout\ ) ) ) # ( !\inst_controller|refresh_timer\(5) & ( \inst_controller|refresh_timer\(0) & ( 
-- \inst_controller|Add0~1_sumout\ ) ) ) # ( \inst_controller|refresh_timer\(5) & ( !\inst_controller|refresh_timer\(0) & ( \inst_controller|Add0~1_sumout\ ) ) ) # ( !\inst_controller|refresh_timer\(5) & ( !\inst_controller|refresh_timer\(0) & ( 
-- (\inst_controller|Add0~1_sumout\ & ((!\inst_controller|LessThan0~1_combout\) # (!\inst_controller|LessThan0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100100010001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datab => \inst_controller|ALT_INV_Add0~1_sumout\,
	datad => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datae => \inst_controller|ALT_INV_refresh_timer\(5),
	dataf => \inst_controller|ALT_INV_refresh_timer\(0),
	combout => \inst_controller|refresh_timer~0_combout\);

-- Location: FF_X28_Y2_N8
\inst_controller|refresh_timer[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer[5]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y2_N45
\inst_controller|refresh_timer~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~1_combout\ = ( \inst_controller|refresh_timer[5]~DUPLICATE_q\ & ( \inst_controller|Add0~5_sumout\ ) ) # ( !\inst_controller|refresh_timer[5]~DUPLICATE_q\ & ( (\inst_controller|Add0~5_sumout\ & 
-- ((!\inst_controller|LessThan0~1_combout\) # ((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001111000011100000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datac => \inst_controller|ALT_INV_Add0~5_sumout\,
	datad => \inst_controller|ALT_INV_refresh_timer\(0),
	dataf => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	combout => \inst_controller|refresh_timer~1_combout\);

-- Location: FF_X28_Y2_N47
\inst_controller|refresh_timer[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer[0]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y2_N18
\inst_controller|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~25_sumout\ = SUM(( !\inst_controller|refresh_timer\(6) ) + ( VCC ) + ( \inst_controller|Add0~2\ ))
-- \inst_controller|Add0~26\ = CARRY(( !\inst_controller|refresh_timer\(6) ) + ( VCC ) + ( \inst_controller|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer\(6),
	cin => \inst_controller|Add0~2\,
	sumout => \inst_controller|Add0~25_sumout\,
	cout => \inst_controller|Add0~26\);

-- Location: LABCELL_X27_Y2_N48
\inst_controller|refresh_timer~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~6_combout\ = ( \inst_controller|LessThan0~1_combout\ & ( (!\inst_controller|Add0~25_sumout\ & (((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer[5]~DUPLICATE_q\)) # 
-- (\inst_controller|refresh_timer[0]~DUPLICATE_q\))) ) ) # ( !\inst_controller|LessThan0~1_combout\ & ( !\inst_controller|Add0~25_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011010000111100001101000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datac => \inst_controller|ALT_INV_Add0~25_sumout\,
	datad => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_LessThan0~1_combout\,
	combout => \inst_controller|refresh_timer~6_combout\);

-- Location: FF_X27_Y2_N50
\inst_controller|refresh_timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~6_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(6));

-- Location: LABCELL_X27_Y2_N21
\inst_controller|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~21_sumout\ = SUM(( \inst_controller|refresh_timer\(7) ) + ( VCC ) + ( \inst_controller|Add0~26\ ))
-- \inst_controller|Add0~22\ = CARRY(( \inst_controller|refresh_timer\(7) ) + ( VCC ) + ( \inst_controller|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer\(7),
	cin => \inst_controller|Add0~26\,
	sumout => \inst_controller|Add0~21_sumout\,
	cout => \inst_controller|Add0~22\);

-- Location: LABCELL_X27_Y2_N45
\inst_controller|refresh_timer~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~5_combout\ = ( \inst_controller|refresh_timer[0]~DUPLICATE_q\ & ( \inst_controller|Add0~21_sumout\ ) ) # ( !\inst_controller|refresh_timer[0]~DUPLICATE_q\ & ( (\inst_controller|Add0~21_sumout\ & 
-- (((!\inst_controller|LessThan0~1_combout\) # (!\inst_controller|LessThan0~0_combout\)) # (\inst_controller|refresh_timer[5]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111101000000001111110100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datac => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datad => \inst_controller|ALT_INV_Add0~21_sumout\,
	dataf => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	combout => \inst_controller|refresh_timer~5_combout\);

-- Location: FF_X27_Y2_N47
\inst_controller|refresh_timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~5_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(7));

-- Location: LABCELL_X27_Y2_N24
\inst_controller|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~17_sumout\ = SUM(( \inst_controller|refresh_timer\(8) ) + ( VCC ) + ( \inst_controller|Add0~22\ ))
-- \inst_controller|Add0~18\ = CARRY(( \inst_controller|refresh_timer\(8) ) + ( VCC ) + ( \inst_controller|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_refresh_timer\(8),
	cin => \inst_controller|Add0~22\,
	sumout => \inst_controller|Add0~17_sumout\,
	cout => \inst_controller|Add0~18\);

-- Location: LABCELL_X27_Y2_N42
\inst_controller|refresh_timer~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~4_combout\ = ( \inst_controller|refresh_timer[0]~DUPLICATE_q\ & ( \inst_controller|Add0~17_sumout\ ) ) # ( !\inst_controller|refresh_timer[0]~DUPLICATE_q\ & ( (\inst_controller|Add0~17_sumout\ & 
-- (((!\inst_controller|LessThan0~1_combout\) # (!\inst_controller|LessThan0~0_combout\)) # (\inst_controller|refresh_timer[5]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001101000011110000110100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datac => \inst_controller|ALT_INV_Add0~17_sumout\,
	datad => \inst_controller|ALT_INV_LessThan0~0_combout\,
	dataf => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	combout => \inst_controller|refresh_timer~4_combout\);

-- Location: FF_X27_Y2_N44
\inst_controller|refresh_timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~4_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(8));

-- Location: LABCELL_X27_Y2_N27
\inst_controller|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~13_sumout\ = SUM(( \inst_controller|refresh_timer[9]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~18\ ))
-- \inst_controller|Add0~14\ = CARRY(( \inst_controller|refresh_timer[9]~DUPLICATE_q\ ) + ( VCC ) + ( \inst_controller|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[9]~DUPLICATE_q\,
	cin => \inst_controller|Add0~18\,
	sumout => \inst_controller|Add0~13_sumout\,
	cout => \inst_controller|Add0~14\);

-- Location: LABCELL_X27_Y2_N39
\inst_controller|refresh_timer~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~3_combout\ = ( \inst_controller|refresh_timer[0]~DUPLICATE_q\ & ( \inst_controller|Add0~13_sumout\ ) ) # ( !\inst_controller|refresh_timer[0]~DUPLICATE_q\ & ( (\inst_controller|Add0~13_sumout\ & 
-- (((!\inst_controller|LessThan0~1_combout\) # (!\inst_controller|LessThan0~0_combout\)) # (\inst_controller|refresh_timer[5]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001101000011110000110100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datac => \inst_controller|ALT_INV_Add0~13_sumout\,
	datad => \inst_controller|ALT_INV_LessThan0~0_combout\,
	dataf => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	combout => \inst_controller|refresh_timer~3_combout\);

-- Location: FF_X27_Y2_N41
\inst_controller|refresh_timer[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~3_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer[9]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y2_N30
\inst_controller|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Add0~9_sumout\ = SUM(( !\inst_controller|refresh_timer\(10) ) + ( VCC ) + ( \inst_controller|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_refresh_timer\(10),
	cin => \inst_controller|Add0~14\,
	sumout => \inst_controller|Add0~9_sumout\);

-- Location: LABCELL_X27_Y2_N36
\inst_controller|refresh_timer~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~2_combout\ = ( !\inst_controller|Add0~9_sumout\ & ( ((!\inst_controller|LessThan0~1_combout\) # ((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer[0]~DUPLICATE_q\))) # 
-- (\inst_controller|refresh_timer[5]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111011111111111111101111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datac => \inst_controller|ALT_INV_refresh_timer[0]~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_LessThan0~0_combout\,
	dataf => \inst_controller|ALT_INV_Add0~9_sumout\,
	combout => \inst_controller|refresh_timer~2_combout\);

-- Location: FF_X27_Y2_N38
\inst_controller|refresh_timer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~2_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(10));

-- Location: FF_X27_Y2_N40
\inst_controller|refresh_timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~3_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(9));

-- Location: LABCELL_X27_Y2_N54
\inst_controller|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan0~0_combout\ = ( !\inst_controller|refresh_timer\(7) & ( !\inst_controller|refresh_timer\(9) & ( (\inst_controller|refresh_timer\(6) & (\inst_controller|refresh_timer\(10) & !\inst_controller|refresh_timer\(8))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_refresh_timer\(6),
	datac => \inst_controller|ALT_INV_refresh_timer\(10),
	datad => \inst_controller|ALT_INV_refresh_timer\(8),
	datae => \inst_controller|ALT_INV_refresh_timer\(7),
	dataf => \inst_controller|ALT_INV_refresh_timer\(9),
	combout => \inst_controller|LessThan0~0_combout\);

-- Location: MLABCELL_X28_Y2_N42
\inst_controller|refresh_timer~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|refresh_timer~10_combout\ = ( \inst_controller|refresh_timer\(0) & ( \inst_controller|Add0~41_sumout\ ) ) # ( !\inst_controller|refresh_timer\(0) & ( (\inst_controller|Add0~41_sumout\ & ((!\inst_controller|LessThan0~1_combout\) # 
-- ((!\inst_controller|LessThan0~0_combout\) # (\inst_controller|refresh_timer\(5))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001111000011100000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datab => \inst_controller|ALT_INV_LessThan0~0_combout\,
	datac => \inst_controller|ALT_INV_Add0~41_sumout\,
	datad => \inst_controller|ALT_INV_refresh_timer\(5),
	dataf => \inst_controller|ALT_INV_refresh_timer\(0),
	combout => \inst_controller|refresh_timer~10_combout\);

-- Location: FF_X28_Y2_N44
\inst_controller|refresh_timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~10_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(1));

-- Location: FF_X28_Y2_N53
\inst_controller|refresh_timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~7_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(4));

-- Location: FF_X27_Y2_N52
\inst_controller|refresh_timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|refresh_timer~9_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_controller|is_init~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|refresh_timer\(2));

-- Location: MLABCELL_X28_Y2_N24
\inst_controller|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan0~1_combout\ = ( \inst_controller|refresh_timer\(3) & ( (!\inst_controller|refresh_timer\(1) & (!\inst_controller|refresh_timer\(4) & \inst_controller|refresh_timer\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000110000000000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_refresh_timer\(1),
	datac => \inst_controller|ALT_INV_refresh_timer\(4),
	datad => \inst_controller|ALT_INV_refresh_timer\(2),
	dataf => \inst_controller|ALT_INV_refresh_timer\(3),
	combout => \inst_controller|LessThan0~1_combout\);

-- Location: MLABCELL_X28_Y2_N27
\inst_controller|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|LessThan0~2_combout\ = ( !\inst_controller|refresh_timer\(0) & ( (\inst_controller|LessThan0~1_combout\ & (!\inst_controller|refresh_timer[5]~DUPLICATE_q\ & \inst_controller|LessThan0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010000000000000101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_LessThan0~1_combout\,
	datac => \inst_controller|ALT_INV_refresh_timer[5]~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_LessThan0~0_combout\,
	dataf => \inst_controller|ALT_INV_refresh_timer\(0),
	combout => \inst_controller|LessThan0~2_combout\);

-- Location: LABCELL_X27_Y4_N30
\inst_controller|needs_refresh~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|needs_refresh~0_combout\ = ( \inst_controller|state.S_WAIT_RC~q\ & ( (!\inst_controller|needs_refresh~q\ & (\inst_controller|is_init~q\ & (\inst_controller|LessThan0~2_combout\))) # (\inst_controller|needs_refresh~q\ & 
-- (((!\inst_controller|LessThan1~3_combout\)))) ) ) # ( !\inst_controller|state.S_WAIT_RC~q\ & ( ((\inst_controller|is_init~q\ & \inst_controller|LessThan0~2_combout\)) # (\inst_controller|needs_refresh~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111111111000100011111111100010001111100000001000111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_is_init~q\,
	datab => \inst_controller|ALT_INV_LessThan0~2_combout\,
	datac => \inst_controller|ALT_INV_LessThan1~3_combout\,
	datad => \inst_controller|ALT_INV_needs_refresh~q\,
	dataf => \inst_controller|ALT_INV_state.S_WAIT_RC~q\,
	combout => \inst_controller|needs_refresh~0_combout\);

-- Location: FF_X27_Y4_N31
\inst_controller|needs_refresh~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|needs_refresh~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|needs_refresh~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y3_N30
\inst_controller|state~36\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|state~36_combout\ = ( !\inst_iface|state.ST_REQ_WRITE~q\ & ( (!\inst_iface|state.ST_REQ_READ~q\ & !\inst_controller|needs_refresh~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_state.ST_REQ_READ~q\,
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	dataf => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	combout => \inst_controller|state~36_combout\);

-- Location: FF_X28_Y3_N1
\inst_controller|ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|state~36_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sclr => \inst_controller|ALT_INV_state.S_IDLE~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|ready~q\);

-- Location: MLABCELL_X28_Y3_N15
\inst_iface|state.ST_RESET~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|state.ST_RESET~0_combout\ = ( \inst_controller|ready~q\ ) # ( !\inst_controller|ready~q\ & ( \inst_iface|state.ST_RESET~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst_iface|ALT_INV_state.ST_RESET~q\,
	dataf => \inst_controller|ALT_INV_ready~q\,
	combout => \inst_iface|state.ST_RESET~0_combout\);

-- Location: FF_X28_Y3_N17
\inst_iface|state.ST_RESET\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|state.ST_RESET~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_RESET~q\);

-- Location: MLABCELL_X28_Y3_N12
\inst_iface|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Selector1~0_combout\ = ( \inst_iface|state.ST_WAIT_READ~q\ & ( \inst_controller|ready~q\ ) ) # ( !\inst_iface|state.ST_WAIT_READ~q\ & ( (\inst_controller|ready~q\ & !\inst_iface|state.ST_RESET~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ready~q\,
	datab => \inst_iface|ALT_INV_state.ST_RESET~q\,
	dataf => \inst_iface|ALT_INV_state.ST_WAIT_READ~q\,
	combout => \inst_iface|Selector1~0_combout\);

-- Location: MLABCELL_X28_Y3_N18
\inst_iface|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Selector1~1_combout\ = ( \inst_iface|state.ST_READY~q\ & ( \inst_iface|Equal0~0_combout\ & ( (!\inst_controller|ready~q\) # (((\KEY[3]~input_o\ & \inst_iface|Equal0~1_combout\)) # (\inst_iface|Selector1~0_combout\)) ) ) ) # ( 
-- !\inst_iface|state.ST_READY~q\ & ( \inst_iface|Equal0~0_combout\ & ( \inst_iface|Selector1~0_combout\ ) ) ) # ( \inst_iface|state.ST_READY~q\ & ( !\inst_iface|Equal0~0_combout\ & ( (!\inst_controller|ready~q\) # (\inst_iface|Selector1~0_combout\) ) ) ) # 
-- ( !\inst_iface|state.ST_READY~q\ & ( !\inst_iface|Equal0~0_combout\ & ( \inst_iface|Selector1~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111101010101111111100000000111111111010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_ready~q\,
	datab => \ALT_INV_KEY[3]~input_o\,
	datac => \inst_iface|ALT_INV_Equal0~1_combout\,
	datad => \inst_iface|ALT_INV_Selector1~0_combout\,
	datae => \inst_iface|ALT_INV_state.ST_READY~q\,
	dataf => \inst_iface|ALT_INV_Equal0~0_combout\,
	combout => \inst_iface|Selector1~1_combout\);

-- Location: FF_X28_Y3_N20
\inst_iface|state.ST_READY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|Selector1~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_READY~q\);

-- Location: MLABCELL_X28_Y3_N6
\inst_iface|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Selector2~0_combout\ = ( !\KEY[3]~input_o\ & ( \inst_controller|ready~q\ & ( \inst_iface|state.ST_READY~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_iface|ALT_INV_state.ST_READY~q\,
	datae => \ALT_INV_KEY[3]~input_o\,
	dataf => \inst_controller|ALT_INV_ready~q\,
	combout => \inst_iface|Selector2~0_combout\);

-- Location: FF_X28_Y3_N8
\inst_iface|state.ST_REQ_WRITE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|Selector2~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_REQ_WRITE~q\);

-- Location: MLABCELL_X28_Y3_N3
\inst_iface|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|Selector3~0_combout\ = ( \inst_iface|state.ST_WAIT_WRITE~q\ & ( \inst_controller|ready~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ ) ) ) # ( !\inst_iface|state.ST_WAIT_WRITE~q\ & ( \inst_controller|ready~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ ) 
-- ) ) # ( \inst_iface|state.ST_WAIT_WRITE~q\ & ( !\inst_controller|ready~q\ ) ) # ( !\inst_iface|state.ST_WAIT_WRITE~q\ & ( !\inst_controller|ready~q\ & ( \inst_iface|state.ST_REQ_WRITE~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011111111111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	datae => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~q\,
	dataf => \inst_controller|ALT_INV_ready~q\,
	combout => \inst_iface|Selector3~0_combout\);

-- Location: FF_X28_Y3_N4
\inst_iface|state.ST_WAIT_WRITE~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|Selector3~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\);

-- Location: IOIBUF_X12_Y0_N18
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X24_Y0_N52
\DRAM_DQ[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(0),
	o => \DRAM_DQ[0]~input_o\);

-- Location: MLABCELL_X28_Y4_N6
\inst_controller|data_out[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|data_out[3]~0_combout\ = ( \inst_pll|pll_inst|altera_pll_i|locked_wire\(0) & ( \inst_controller|LessThan1~1_combout\ & ( (\inst_controller|state.S_WAIT_CAS~q\ & (\inst_controller|LessThan1~2_combout\ & (\KEY[0]~input_o\ & 
-- \inst_controller|LessThan1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WAIT_CAS~q\,
	datab => \inst_controller|ALT_INV_LessThan1~2_combout\,
	datac => \ALT_INV_KEY[0]~input_o\,
	datad => \inst_controller|ALT_INV_LessThan1~0_combout\,
	datae => \inst_pll|pll_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	dataf => \inst_controller|ALT_INV_LessThan1~1_combout\,
	combout => \inst_controller|data_out[3]~0_combout\);

-- Location: FF_X28_Y4_N11
\inst_controller|data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[0]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(0));

-- Location: MLABCELL_X25_Y4_N36
\data_bus[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[0]~0_combout\ = ( \inst_controller|data_out\(0) & ( ((!\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ & !\inst_iface|state.ST_REQ_WRITE~q\)) # (\SW[0]~input_o\) ) ) # ( !\inst_controller|data_out\(0) & ( (\SW[0]~input_o\ & 
-- ((\inst_iface|state.ST_REQ_WRITE~q\) # (\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001110000011110001111100011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\,
	datab => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	datac => \ALT_INV_SW[0]~input_o\,
	dataf => \inst_controller|ALT_INV_data_out\(0),
	combout => \data_bus[0]~0_combout\);

-- Location: FF_X25_Y4_N38
\inst_controller|req_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[0]~0_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(0));

-- Location: LABCELL_X24_Y4_N0
\inst_controller|dq_out[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|dq_out[0]~0_combout\ = ( \inst_pll|pll_inst|altera_pll_i|locked_wire\(0) & ( \KEY[0]~input_o\ & ( (\inst_controller|state.S_WAIT_DPL~q\) # (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_state.S_WAIT_DPL~q\,
	datae => \inst_pll|pll_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	dataf => \ALT_INV_KEY[0]~input_o\,
	combout => \inst_controller|dq_out[0]~0_combout\);

-- Location: FF_X25_Y4_N2
\inst_controller|dq_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(0),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(0));

-- Location: LABCELL_X24_Y4_N48
\inst_controller|dq_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|dq_out~1_combout\ = ( \inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ ) # ( !\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ & ( \inst_controller|state.S_WAIT_DPL~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_state.S_WAIT_DPL~q\,
	datae => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	combout => \inst_controller|dq_out~1_combout\);

-- Location: FF_X24_Y4_N49
\inst_controller|dq_oe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|dq_out~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_oe~q\);

-- Location: IOIBUF_X16_Y0_N1
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\DRAM_DQ[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(1),
	o => \DRAM_DQ[1]~input_o\);

-- Location: FF_X25_Y4_N13
\inst_controller|data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[1]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(1));

-- Location: MLABCELL_X25_Y4_N39
\data_bus[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[1]~1_combout\ = ( \inst_controller|data_out\(1) & ( ((!\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ & !\inst_iface|state.ST_REQ_WRITE~q\)) # (\SW[1]~input_o\) ) ) # ( !\inst_controller|data_out\(1) & ( (\SW[1]~input_o\ & 
-- ((\inst_iface|state.ST_REQ_WRITE~q\) # (\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001110111000000000111011110001000111111111000100011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\,
	datab => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	datad => \ALT_INV_SW[1]~input_o\,
	dataf => \inst_controller|ALT_INV_data_out\(1),
	combout => \data_bus[1]~1_combout\);

-- Location: FF_X25_Y4_N41
\inst_controller|req_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[1]~1_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(1));

-- Location: FF_X25_Y4_N34
\inst_controller|dq_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(1),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(1));

-- Location: IOIBUF_X8_Y0_N35
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\DRAM_DQ[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(2),
	o => \DRAM_DQ[2]~input_o\);

-- Location: FF_X28_Y4_N46
\inst_controller|data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[2]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(2));

-- Location: MLABCELL_X25_Y4_N51
\data_bus[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[2]~2_combout\ = ( \inst_controller|data_out\(2) & ( ((!\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ & !\inst_iface|state.ST_REQ_WRITE~q\)) # (\SW[2]~input_o\) ) ) # ( !\inst_controller|data_out\(2) & ( (\SW[2]~input_o\ & 
-- ((\inst_iface|state.ST_REQ_WRITE~q\) # (\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001110000011110001111100011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\,
	datab => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	datac => \ALT_INV_SW[2]~input_o\,
	dataf => \inst_controller|ALT_INV_data_out\(2),
	combout => \data_bus[2]~2_combout\);

-- Location: FF_X25_Y4_N53
\inst_controller|req_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[2]~2_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(2));

-- Location: FF_X25_Y4_N10
\inst_controller|dq_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(2),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(2));

-- Location: IOIBUF_X4_Y0_N52
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X28_Y0_N52
\DRAM_DQ[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(3),
	o => \DRAM_DQ[3]~input_o\);

-- Location: FF_X28_Y4_N49
\inst_controller|data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[3]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(3));

-- Location: MLABCELL_X25_Y4_N48
\data_bus[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[3]~3_combout\ = ( \inst_controller|data_out\(3) & ( ((!\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\ & !\inst_iface|state.ST_REQ_WRITE~q\)) # (\SW[3]~input_o\) ) ) # ( !\inst_controller|data_out\(3) & ( (\SW[3]~input_o\ & 
-- ((\inst_iface|state.ST_REQ_WRITE~q\) # (\inst_iface|state.ST_WAIT_WRITE~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001110000011110001111100011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_state.ST_WAIT_WRITE~DUPLICATE_q\,
	datab => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	datac => \ALT_INV_SW[3]~input_o\,
	dataf => \inst_controller|ALT_INV_data_out\(3),
	combout => \data_bus[3]~3_combout\);

-- Location: FF_X25_Y4_N50
\inst_controller|req_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[3]~3_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(3));

-- Location: FF_X25_Y4_N44
\inst_controller|dq_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(3),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(3));

-- Location: IOIBUF_X30_Y0_N52
\DRAM_DQ[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(4),
	o => \DRAM_DQ[4]~input_o\);

-- Location: MLABCELL_X28_Y4_N48
\inst_controller|data_out[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|data_out[4]~feeder_combout\ = ( \DRAM_DQ[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_DRAM_DQ[4]~input_o\,
	combout => \inst_controller|data_out[4]~feeder_combout\);

-- Location: FF_X28_Y4_N50
\inst_controller|data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|data_out[4]~feeder_combout\,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(4));

-- Location: MLABCELL_X25_Y4_N21
\data_bus[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[4]~4_combout\ = ( \inst_controller|data_out\(4) & ( !\inst_iface|wEn~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_wEn~combout\,
	dataf => \inst_controller|ALT_INV_data_out\(4),
	combout => \data_bus[4]~4_combout\);

-- Location: FF_X25_Y4_N23
\inst_controller|req_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[4]~4_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(4));

-- Location: FF_X25_Y4_N46
\inst_controller|dq_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(4),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(4));

-- Location: IOIBUF_X18_Y0_N75
\DRAM_DQ[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(5),
	o => \DRAM_DQ[5]~input_o\);

-- Location: FF_X25_Y4_N16
\inst_controller|data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[5]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(5));

-- Location: MLABCELL_X25_Y4_N18
\data_bus[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[5]~5_combout\ = ( \inst_controller|data_out\(5) & ( !\inst_iface|wEn~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_wEn~combout\,
	dataf => \inst_controller|ALT_INV_data_out\(5),
	combout => \data_bus[5]~5_combout\);

-- Location: FF_X25_Y4_N20
\inst_controller|req_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[5]~5_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(5));

-- Location: LABCELL_X24_Y4_N24
\inst_controller|dq_out[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|dq_out[5]~feeder_combout\ = \inst_controller|req_data\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_req_data\(5),
	combout => \inst_controller|dq_out[5]~feeder_combout\);

-- Location: FF_X24_Y4_N25
\inst_controller|dq_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|dq_out[5]~feeder_combout\,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(5));

-- Location: IOIBUF_X34_Y0_N58
\DRAM_DQ[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(6),
	o => \DRAM_DQ[6]~input_o\);

-- Location: FF_X28_Y4_N32
\inst_controller|data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[6]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(6));

-- Location: MLABCELL_X25_Y4_N57
\data_bus[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[6]~6_combout\ = ( \inst_controller|data_out\(6) & ( !\inst_iface|wEn~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_wEn~combout\,
	dataf => \inst_controller|ALT_INV_data_out\(6),
	combout => \data_bus[6]~6_combout\);

-- Location: FF_X25_Y4_N59
\inst_controller|req_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[6]~6_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(6));

-- Location: FF_X25_Y4_N4
\inst_controller|dq_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(6),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(6));

-- Location: IOIBUF_X34_Y0_N41
\DRAM_DQ[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DRAM_DQ(7),
	o => \DRAM_DQ[7]~input_o\);

-- Location: FF_X28_Y4_N34
\inst_controller|data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DRAM_DQ[7]~input_o\,
	sload => VCC,
	ena => \inst_controller|data_out[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|data_out\(7));

-- Location: MLABCELL_X25_Y4_N54
\data_bus[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_bus[7]~7_combout\ = ( \inst_controller|data_out\(7) & ( !\inst_iface|wEn~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_wEn~combout\,
	dataf => \inst_controller|ALT_INV_data_out\(7),
	combout => \data_bus[7]~7_combout\);

-- Location: FF_X25_Y4_N56
\inst_controller|req_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \data_bus[7]~7_combout\,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_data\(7));

-- Location: FF_X25_Y4_N31
\inst_controller|dq_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|req_data\(7),
	sload => VCC,
	ena => \inst_controller|dq_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dq_out\(7));

-- Location: FF_X28_Y2_N38
\inst_iface|data_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \data_bus[2]~2_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|data_reg\(2));

-- Location: MLABCELL_X28_Y2_N39
\inst_iface|data_reg[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|data_reg[1]~feeder_combout\ = ( \data_bus[1]~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_data_bus[1]~1_combout\,
	combout => \inst_iface|data_reg[1]~feeder_combout\);

-- Location: FF_X28_Y2_N41
\inst_iface|data_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_iface|data_reg[1]~feeder_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|data_reg\(1));

-- Location: FF_X28_Y2_N14
\inst_iface|data_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \data_bus[3]~3_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|data_reg\(3));

-- Location: FF_X28_Y2_N32
\inst_iface|data_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \data_bus[0]~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	ena => \inst_iface|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_iface|data_reg\(0));

-- Location: MLABCELL_X28_Y2_N18
\inst_iface|inst_hex0|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux6~0_combout\ = ( \inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(2) & (!\inst_iface|data_reg\(1) $ (\inst_iface|data_reg\(3)))) # (\inst_iface|data_reg\(2) & (!\inst_iface|data_reg\(1) & \inst_iface|data_reg\(3))) ) ) # ( 
-- !\inst_iface|data_reg\(0) & ( (\inst_iface|data_reg\(2) & (!\inst_iface|data_reg\(1) & !\inst_iface|data_reg\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000010000000100000010000110100001101000011010000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_data_reg\(2),
	datab => \inst_iface|ALT_INV_data_reg\(1),
	datac => \inst_iface|ALT_INV_data_reg\(3),
	dataf => \inst_iface|ALT_INV_data_reg\(0),
	combout => \inst_iface|inst_hex0|Mux6~0_combout\);

-- Location: MLABCELL_X28_Y2_N21
\inst_iface|inst_hex0|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux5~0_combout\ = ( \inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(1) & (\inst_iface|data_reg\(2) & !\inst_iface|data_reg\(3))) # (\inst_iface|data_reg\(1) & ((\inst_iface|data_reg\(3)))) ) ) # ( !\inst_iface|data_reg\(0) & ( 
-- (\inst_iface|data_reg\(2) & ((\inst_iface|data_reg\(3)) # (\inst_iface|data_reg\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010101000001010101010101010000000011110101000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_data_reg\(2),
	datac => \inst_iface|ALT_INV_data_reg\(1),
	datad => \inst_iface|ALT_INV_data_reg\(3),
	dataf => \inst_iface|ALT_INV_data_reg\(0),
	combout => \inst_iface|inst_hex0|Mux5~0_combout\);

-- Location: MLABCELL_X28_Y2_N12
\inst_iface|inst_hex0|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux4~0_combout\ = ( \inst_iface|data_reg\(0) & ( (\inst_iface|data_reg\(2) & (\inst_iface|data_reg\(1) & \inst_iface|data_reg\(3))) ) ) # ( !\inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(2) & (\inst_iface|data_reg\(1) & 
-- !\inst_iface|data_reg\(3))) # (\inst_iface|data_reg\(2) & ((\inst_iface|data_reg\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001010101001000100101010100000000000100010000000000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_data_reg\(2),
	datab => \inst_iface|ALT_INV_data_reg\(1),
	datad => \inst_iface|ALT_INV_data_reg\(3),
	dataf => \inst_iface|ALT_INV_data_reg\(0),
	combout => \inst_iface|inst_hex0|Mux4~0_combout\);

-- Location: MLABCELL_X28_Y2_N15
\inst_iface|inst_hex0|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux3~0_combout\ = ( \inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(2) & (!\inst_iface|data_reg\(1) & !\inst_iface|data_reg\(3))) # (\inst_iface|data_reg\(2) & (\inst_iface|data_reg\(1))) ) ) # ( !\inst_iface|data_reg\(0) & ( 
-- (!\inst_iface|data_reg\(2) & (\inst_iface|data_reg\(1) & \inst_iface|data_reg\(3))) # (\inst_iface|data_reg\(2) & (!\inst_iface|data_reg\(1) & !\inst_iface|data_reg\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001001000010010000100100001010010001100100011001000110010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_iface|ALT_INV_data_reg\(2),
	datab => \inst_iface|ALT_INV_data_reg\(1),
	datac => \inst_iface|ALT_INV_data_reg\(3),
	dataf => \inst_iface|ALT_INV_data_reg\(0),
	combout => \inst_iface|inst_hex0|Mux3~0_combout\);

-- Location: MLABCELL_X28_Y2_N33
\inst_iface|inst_hex0|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux2~0_combout\ = ( \inst_iface|data_reg\(2) & ( \inst_iface|data_reg\(0) & ( !\inst_iface|data_reg\(3) ) ) ) # ( !\inst_iface|data_reg\(2) & ( \inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(1)) # (!\inst_iface|data_reg\(3)) ) 
-- ) ) # ( \inst_iface|data_reg\(2) & ( !\inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(1) & !\inst_iface|data_reg\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110000001100000011111100111111001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_data_reg\(1),
	datac => \inst_iface|ALT_INV_data_reg\(3),
	datae => \inst_iface|ALT_INV_data_reg\(2),
	dataf => \inst_iface|ALT_INV_data_reg\(0),
	combout => \inst_iface|inst_hex0|Mux2~0_combout\);

-- Location: MLABCELL_X28_Y2_N57
\inst_iface|inst_hex0|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux1~0_combout\ = ( \inst_iface|data_reg\(2) & ( \inst_iface|data_reg\(3) & ( (!\inst_iface|data_reg\(1) & \inst_iface|data_reg\(0)) ) ) ) # ( \inst_iface|data_reg\(2) & ( !\inst_iface|data_reg\(3) & ( (\inst_iface|data_reg\(1) & 
-- \inst_iface|data_reg\(0)) ) ) ) # ( !\inst_iface|data_reg\(2) & ( !\inst_iface|data_reg\(3) & ( (\inst_iface|data_reg\(0)) # (\inst_iface|data_reg\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111000000110000001100000000000000000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_data_reg\(1),
	datac => \inst_iface|ALT_INV_data_reg\(0),
	datae => \inst_iface|ALT_INV_data_reg\(2),
	dataf => \inst_iface|ALT_INV_data_reg\(3),
	combout => \inst_iface|inst_hex0|Mux1~0_combout\);

-- Location: MLABCELL_X28_Y2_N0
\inst_iface|inst_hex0|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex0|Mux0~0_combout\ = ( \inst_iface|data_reg\(2) & ( \inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(1)) # (\inst_iface|data_reg\(3)) ) ) ) # ( !\inst_iface|data_reg\(2) & ( \inst_iface|data_reg\(0) & ( (\inst_iface|data_reg\(1)) # 
-- (\inst_iface|data_reg\(3)) ) ) ) # ( \inst_iface|data_reg\(2) & ( !\inst_iface|data_reg\(0) & ( (!\inst_iface|data_reg\(3)) # (\inst_iface|data_reg\(1)) ) ) ) # ( !\inst_iface|data_reg\(2) & ( !\inst_iface|data_reg\(0) & ( (\inst_iface|data_reg\(1)) # 
-- (\inst_iface|data_reg\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111110011001111111100110011111111111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_data_reg\(3),
	datad => \inst_iface|ALT_INV_data_reg\(1),
	datae => \inst_iface|ALT_INV_data_reg\(2),
	dataf => \inst_iface|ALT_INV_data_reg\(0),
	combout => \inst_iface|inst_hex0|Mux0~0_combout\);

-- Location: LABCELL_X31_Y3_N33
\inst_iface|inst_hex4|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux6~0_combout\ = ( \SW[7]~input_o\ & ( (\SW[4]~input_o\ & (!\SW[5]~input_o\ $ (!\SW[6]~input_o\))) ) ) # ( !\SW[7]~input_o\ & ( (!\SW[5]~input_o\ & (!\SW[4]~input_o\ $ (!\SW[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000000101000001010001001000010010000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datab => \ALT_INV_SW[5]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	datae => \ALT_INV_SW[7]~input_o\,
	combout => \inst_iface|inst_hex4|Mux6~0_combout\);

-- Location: LABCELL_X31_Y3_N39
\inst_iface|inst_hex4|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux5~0_combout\ = ( \SW[7]~input_o\ & ( \SW[5]~input_o\ & ( (\SW[6]~input_o\) # (\SW[4]~input_o\) ) ) ) # ( !\SW[7]~input_o\ & ( \SW[5]~input_o\ & ( (!\SW[4]~input_o\ & \SW[6]~input_o\) ) ) ) # ( \SW[7]~input_o\ & ( !\SW[5]~input_o\ 
-- & ( (!\SW[4]~input_o\ & \SW[6]~input_o\) ) ) ) # ( !\SW[7]~input_o\ & ( !\SW[5]~input_o\ & ( (\SW[4]~input_o\ & \SW[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000010100000101000001010000010100101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	datae => \ALT_INV_SW[7]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \inst_iface|inst_hex4|Mux5~0_combout\);

-- Location: LABCELL_X31_Y3_N45
\inst_iface|inst_hex4|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux4~0_combout\ = ( \SW[5]~input_o\ & ( (!\SW[6]~input_o\ & (!\SW[4]~input_o\ & !\SW[7]~input_o\)) # (\SW[6]~input_o\ & ((\SW[7]~input_o\))) ) ) # ( !\SW[5]~input_o\ & ( (!\SW[4]~input_o\ & (\SW[6]~input_o\ & \SW[7]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001010000011100000111000001110000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[7]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \inst_iface|inst_hex4|Mux4~0_combout\);

-- Location: LABCELL_X31_Y3_N21
\inst_iface|inst_hex4|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux3~0_combout\ = ( \SW[7]~input_o\ & ( \SW[5]~input_o\ & ( !\SW[4]~input_o\ $ (\SW[6]~input_o\) ) ) ) # ( !\SW[7]~input_o\ & ( \SW[5]~input_o\ & ( (\SW[4]~input_o\ & \SW[6]~input_o\) ) ) ) # ( !\SW[7]~input_o\ & ( !\SW[5]~input_o\ & 
-- ( !\SW[4]~input_o\ $ (!\SW[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010000000000000000000000101000001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	datae => \ALT_INV_SW[7]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \inst_iface|inst_hex4|Mux3~0_combout\);

-- Location: LABCELL_X31_Y3_N24
\inst_iface|inst_hex4|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux2~0_combout\ = ( !\SW[7]~input_o\ & ( \SW[5]~input_o\ & ( \SW[4]~input_o\ ) ) ) # ( \SW[7]~input_o\ & ( !\SW[5]~input_o\ & ( (!\SW[6]~input_o\ & \SW[4]~input_o\) ) ) ) # ( !\SW[7]~input_o\ & ( !\SW[5]~input_o\ & ( 
-- (\SW[4]~input_o\) # (\SW[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111000011000000110000001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	datae => \ALT_INV_SW[7]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \inst_iface|inst_hex4|Mux2~0_combout\);

-- Location: LABCELL_X31_Y3_N42
\inst_iface|inst_hex4|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux1~0_combout\ = ( \SW[5]~input_o\ & ( (!\SW[7]~input_o\ & ((!\SW[6]~input_o\) # (\SW[4]~input_o\))) ) ) # ( !\SW[5]~input_o\ & ( (\SW[4]~input_o\ & (!\SW[6]~input_o\ $ (\SW[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000010001010001000001000111011101000000001101110100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[7]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \inst_iface|inst_hex4|Mux1~0_combout\);

-- Location: LABCELL_X31_Y3_N0
\inst_iface|inst_hex4|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex4|Mux0~0_combout\ = ( \SW[5]~input_o\ & ( ((!\SW[4]~input_o\) # (!\SW[6]~input_o\)) # (\SW[7]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (!\SW[7]~input_o\ & ((\SW[6]~input_o\))) # (\SW[7]~input_o\ & ((!\SW[6]~input_o\) # 
-- (\SW[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001111001100111100111111111111111100111111111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[7]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	datad => \ALT_INV_SW[6]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \inst_iface|inst_hex4|Mux0~0_combout\);

-- Location: LABCELL_X88_Y21_N33
\inst_iface|inst_hex5|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex5|Mux1~0_combout\ = ( \SW[8]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[9]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	combout => \inst_iface|inst_hex5|Mux1~0_combout\);

-- Location: LABCELL_X88_Y21_N36
\inst_iface|inst_hex5|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex5|Mux1~1_combout\ = ( !\SW[8]~input_o\ & ( \SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000000000000000110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[9]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	combout => \inst_iface|inst_hex5|Mux1~1_combout\);

-- Location: LABCELL_X88_Y21_N42
\inst_iface|inst_hex5|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_iface|inst_hex5|Mux1~2_combout\ = ( \SW[8]~input_o\ ) # ( !\SW[8]~input_o\ & ( \SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011111111111111111100110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[9]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	combout => \inst_iface|inst_hex5|Mux1~2_combout\);

-- Location: FF_X30_Y2_N2
\led9_cnt[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~73_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led9_cnt[10]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y3_N30
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( led9_cnt(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~94\ = CARRY(( led9_cnt(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(0),
	cin => GND,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X30_Y3_N31
\led9_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~93_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(0));

-- Location: LABCELL_X30_Y3_N33
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( led9_cnt(1) ) + ( VCC ) + ( \Add0~94\ ))
-- \Add0~2\ = CARRY(( led9_cnt(1) ) + ( VCC ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(1),
	cin => \Add0~94\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X30_Y3_N35
\led9_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~1_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(1));

-- Location: LABCELL_X30_Y3_N36
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( led9_cnt(2) ) + ( VCC ) + ( \Add0~2\ ))
-- \Add0~90\ = CARRY(( led9_cnt(2) ) + ( VCC ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(2),
	cin => \Add0~2\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X30_Y3_N38
\led9_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~89_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(2));

-- Location: LABCELL_X30_Y3_N39
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( led9_cnt(3) ) + ( VCC ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( led9_cnt(3) ) + ( VCC ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(3),
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X30_Y3_N40
\led9_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~85_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(3));

-- Location: LABCELL_X30_Y3_N42
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( led9_cnt(4) ) + ( VCC ) + ( \Add0~86\ ))
-- \Add0~82\ = CARRY(( led9_cnt(4) ) + ( VCC ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_led9_cnt(4),
	cin => \Add0~86\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X30_Y3_N43
\led9_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~81_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(4));

-- Location: LABCELL_X30_Y3_N45
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( led9_cnt(5) ) + ( VCC ) + ( \Add0~82\ ))
-- \Add0~10\ = CARRY(( led9_cnt(5) ) + ( VCC ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_led9_cnt(5),
	cin => \Add0~82\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X30_Y3_N0
\led9_cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~0_combout\ = (\Add0~9_sumout\) # (\inst_iface|req~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	datad => \ALT_INV_Add0~9_sumout\,
	combout => \led9_cnt~0_combout\);

-- Location: FF_X30_Y3_N2
\led9_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~0_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(5));

-- Location: LABCELL_X30_Y3_N48
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( led9_cnt(6) ) + ( VCC ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( led9_cnt(6) ) + ( VCC ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(6),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: LABCELL_X30_Y3_N3
\led9_cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~1_combout\ = ( \Add0~13_sumout\ ) # ( !\Add0~13_sumout\ & ( \inst_iface|req~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~13_sumout\,
	combout => \led9_cnt~1_combout\);

-- Location: FF_X30_Y3_N5
\led9_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~1_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(6));

-- Location: LABCELL_X30_Y3_N51
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( led9_cnt(7) ) + ( VCC ) + ( \Add0~14\ ))
-- \Add0~78\ = CARRY(( led9_cnt(7) ) + ( VCC ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(7),
	cin => \Add0~14\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X30_Y3_N52
\led9_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~77_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(7));

-- Location: LABCELL_X30_Y3_N54
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( led9_cnt(8) ) + ( VCC ) + ( \Add0~78\ ))
-- \Add0~18\ = CARRY(( led9_cnt(8) ) + ( VCC ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(8),
	cin => \Add0~78\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: LABCELL_X30_Y3_N6
\led9_cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~2_combout\ = (\Add0~17_sumout\) # (\inst_iface|req~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	datac => \ALT_INV_Add0~17_sumout\,
	combout => \led9_cnt~2_combout\);

-- Location: FF_X30_Y3_N7
\led9_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~2_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(8));

-- Location: LABCELL_X30_Y3_N57
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( led9_cnt(9) ) + ( VCC ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( led9_cnt(9) ) + ( VCC ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(9),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: LABCELL_X30_Y3_N9
\led9_cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~3_combout\ = (\Add0~21_sumout\) # (\inst_iface|req~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	datac => \ALT_INV_Add0~21_sumout\,
	combout => \led9_cnt~3_combout\);

-- Location: FF_X30_Y3_N11
\led9_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~3_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(9));

-- Location: LABCELL_X30_Y2_N0
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( \led9_cnt[10]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~22\ ))
-- \Add0~74\ = CARRY(( \led9_cnt[10]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_led9_cnt[10]~DUPLICATE_q\,
	cin => \Add0~22\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X30_Y2_N1
\led9_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~73_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(10));

-- Location: LABCELL_X30_Y3_N24
\led9_on~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_on~3_combout\ = ( !led9_cnt(7) & ( !led9_cnt(0) & ( (!led9_cnt(10) & (!led9_cnt(3) & (!led9_cnt(2) & !led9_cnt(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(10),
	datab => ALT_INV_led9_cnt(3),
	datac => ALT_INV_led9_cnt(2),
	datad => ALT_INV_led9_cnt(4),
	datae => ALT_INV_led9_cnt(7),
	dataf => ALT_INV_led9_cnt(0),
	combout => \led9_on~3_combout\);

-- Location: LABCELL_X30_Y2_N3
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( led9_cnt(11) ) + ( VCC ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( led9_cnt(11) ) + ( VCC ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_led9_cnt(11),
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X30_Y2_N5
\led9_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~69_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(11));

-- Location: LABCELL_X30_Y2_N6
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \led9_cnt[12]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~70\ ))
-- \Add0~26\ = CARRY(( \led9_cnt[12]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_led9_cnt[12]~DUPLICATE_q\,
	cin => \Add0~70\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: LABCELL_X30_Y2_N45
\led9_cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~4_combout\ = ( \Add0~25_sumout\ ) # ( !\Add0~25_sumout\ & ( \inst_iface|req~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~25_sumout\,
	combout => \led9_cnt~4_combout\);

-- Location: FF_X30_Y2_N47
\led9_cnt[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~4_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led9_cnt[12]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y2_N9
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( led9_cnt(13) ) + ( VCC ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( led9_cnt(13) ) + ( VCC ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_led9_cnt(13),
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: LABCELL_X29_Y3_N3
\led9_cnt~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~5_combout\ = ( \inst_iface|req~combout\ & ( \Add0~29_sumout\ ) ) # ( !\inst_iface|req~combout\ & ( \Add0~29_sumout\ ) ) # ( \inst_iface|req~combout\ & ( !\Add0~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~29_sumout\,
	combout => \led9_cnt~5_combout\);

-- Location: FF_X30_Y3_N14
\led9_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \led9_cnt~5_combout\,
	sload => VCC,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(13));

-- Location: LABCELL_X30_Y2_N12
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( led9_cnt(14) ) + ( VCC ) + ( \Add0~30\ ))
-- \Add0~62\ = CARRY(( led9_cnt(14) ) + ( VCC ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_led9_cnt(14),
	cin => \Add0~30\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X30_Y2_N14
\led9_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~61_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(14));

-- Location: LABCELL_X30_Y2_N15
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( led9_cnt(15) ) + ( VCC ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( led9_cnt(15) ) + ( VCC ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(15),
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X30_Y2_N17
\led9_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~57_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(15));

-- Location: LABCELL_X30_Y2_N18
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( led9_cnt(16) ) + ( VCC ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( led9_cnt(16) ) + ( VCC ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(16),
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X30_Y2_N20
\led9_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~53_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(16));

-- Location: LABCELL_X30_Y2_N21
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( led9_cnt(17) ) + ( VCC ) + ( \Add0~54\ ))
-- \Add0~34\ = CARRY(( led9_cnt(17) ) + ( VCC ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(17),
	cin => \Add0~54\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: LABCELL_X30_Y2_N51
\led9_cnt~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~6_combout\ = ( \Add0~33_sumout\ ) # ( !\Add0~33_sumout\ & ( \inst_iface|req~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~33_sumout\,
	combout => \led9_cnt~6_combout\);

-- Location: FF_X30_Y2_N53
\led9_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~6_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(17));

-- Location: LABCELL_X30_Y2_N24
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( led9_cnt(18) ) + ( VCC ) + ( \Add0~34\ ))
-- \Add0~66\ = CARRY(( led9_cnt(18) ) + ( VCC ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(18),
	cin => \Add0~34\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X30_Y2_N26
\led9_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~65_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(18));

-- Location: LABCELL_X29_Y2_N48
\led9_on~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_on~2_combout\ = ( !\inst_iface|state.ST_REQ_READ~q\ & ( !\inst_iface|state.ST_REQ_WRITE~q\ & ( (!led9_cnt(11) & (!led9_cnt(14) & (!led9_cnt(15) & !led9_cnt(18)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(11),
	datab => ALT_INV_led9_cnt(14),
	datac => ALT_INV_led9_cnt(15),
	datad => ALT_INV_led9_cnt(18),
	datae => \inst_iface|ALT_INV_state.ST_REQ_READ~q\,
	dataf => \inst_iface|ALT_INV_state.ST_REQ_WRITE~q\,
	combout => \led9_on~2_combout\);

-- Location: FF_X30_Y2_N35
\led9_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~5_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(21));

-- Location: LABCELL_X30_Y2_N27
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( led9_cnt(19) ) + ( VCC ) + ( \Add0~66\ ))
-- \Add0~38\ = CARRY(( led9_cnt(19) ) + ( VCC ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(19),
	cin => \Add0~66\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: LABCELL_X29_Y2_N6
\led9_cnt~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~7_combout\ = ( \inst_iface|req~combout\ & ( \Add0~37_sumout\ ) ) # ( !\inst_iface|req~combout\ & ( \Add0~37_sumout\ ) ) # ( \inst_iface|req~combout\ & ( !\Add0~37_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~37_sumout\,
	combout => \led9_cnt~7_combout\);

-- Location: FF_X29_Y2_N7
\led9_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~7_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(19));

-- Location: LABCELL_X30_Y2_N30
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( led9_cnt(20) ) + ( VCC ) + ( \Add0~38\ ))
-- \Add0~42\ = CARRY(( led9_cnt(20) ) + ( VCC ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_led9_cnt(20),
	cin => \Add0~38\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: LABCELL_X29_Y2_N45
\led9_cnt~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~8_combout\ = ( \inst_iface|req~combout\ & ( \Add0~41_sumout\ ) ) # ( !\inst_iface|req~combout\ & ( \Add0~41_sumout\ ) ) # ( \inst_iface|req~combout\ & ( !\Add0~41_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~41_sumout\,
	combout => \led9_cnt~8_combout\);

-- Location: FF_X29_Y2_N46
\led9_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~8_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(20));

-- Location: LABCELL_X30_Y2_N33
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( led9_cnt(21) ) + ( VCC ) + ( \Add0~42\ ))
-- \Add0~6\ = CARRY(( led9_cnt(21) ) + ( VCC ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(21),
	cin => \Add0~42\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X30_Y2_N34
\led9_cnt[21]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~5_sumout\,
	sclr => \inst_iface|req~combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led9_cnt[21]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y2_N36
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( led9_cnt(22) ) + ( VCC ) + ( \Add0~6\ ))
-- \Add0~46\ = CARRY(( led9_cnt(22) ) + ( VCC ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_led9_cnt(22),
	cin => \Add0~6\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: LABCELL_X30_Y2_N42
\led9_cnt~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~9_combout\ = (\Add0~45_sumout\) # (\inst_iface|req~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	datac => \ALT_INV_Add0~45_sumout\,
	combout => \led9_cnt~9_combout\);

-- Location: FF_X30_Y2_N44
\led9_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~9_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(22));

-- Location: LABCELL_X30_Y2_N39
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( led9_cnt(23) ) + ( VCC ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(23),
	cin => \Add0~46\,
	sumout => \Add0~49_sumout\);

-- Location: LABCELL_X30_Y2_N48
\led9_cnt~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_cnt~10_combout\ = ( \Add0~49_sumout\ ) # ( !\Add0~49_sumout\ & ( \inst_iface|req~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_iface|ALT_INV_req~combout\,
	dataf => \ALT_INV_Add0~49_sumout\,
	combout => \led9_cnt~10_combout\);

-- Location: FF_X30_Y2_N50
\led9_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~10_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(23));

-- Location: LABCELL_X30_Y2_N54
\led9_on~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_on~1_combout\ = ( !led9_cnt(19) & ( !led9_cnt(17) & ( (!led9_cnt(23) & (!led9_cnt(22) & (!led9_cnt(16) & !led9_cnt(20)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(23),
	datab => ALT_INV_led9_cnt(22),
	datac => ALT_INV_led9_cnt(16),
	datad => ALT_INV_led9_cnt(20),
	datae => ALT_INV_led9_cnt(19),
	dataf => ALT_INV_led9_cnt(17),
	combout => \led9_on~1_combout\);

-- Location: FF_X30_Y2_N46
\led9_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \led9_cnt~4_combout\,
	ena => \led9_on~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => led9_cnt(12));

-- Location: LABCELL_X30_Y3_N18
\led9_on~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_on~0_combout\ = ( !led9_cnt(5) & ( !led9_cnt(13) & ( (!led9_cnt(6) & (!led9_cnt(9) & (!led9_cnt(8) & !led9_cnt(12)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_led9_cnt(6),
	datab => ALT_INV_led9_cnt(9),
	datac => ALT_INV_led9_cnt(8),
	datad => ALT_INV_led9_cnt(12),
	datae => ALT_INV_led9_cnt(5),
	dataf => ALT_INV_led9_cnt(13),
	combout => \led9_on~0_combout\);

-- Location: LABCELL_X30_Y3_N12
\led9_on~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \led9_on~4_combout\ = ( \led9_on~1_combout\ & ( \led9_on~0_combout\ & ( (!\led9_on~3_combout\) # ((!\led9_on~2_combout\) # ((\led9_cnt[21]~DUPLICATE_q\) # (led9_cnt(1)))) ) ) ) # ( !\led9_on~1_combout\ & ( \led9_on~0_combout\ ) ) # ( \led9_on~1_combout\ & 
-- ( !\led9_on~0_combout\ ) ) # ( !\led9_on~1_combout\ & ( !\led9_on~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111110111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_led9_on~3_combout\,
	datab => \ALT_INV_led9_on~2_combout\,
	datac => ALT_INV_led9_cnt(1),
	datad => \ALT_INV_led9_cnt[21]~DUPLICATE_q\,
	datae => \ALT_INV_led9_on~1_combout\,
	dataf => \ALT_INV_led9_on~0_combout\,
	combout => \led9_on~4_combout\);

-- Location: FF_X30_Y2_N37
led9_on : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \led9_on~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led9_on~q\);

-- Location: FF_X24_Y4_N16
\inst_controller|req_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_addr\(0));

-- Location: LABCELL_X24_Y4_N33
\inst_controller|Selector43~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector43~0_combout\ = ( \inst_controller|dram_addr\(0) & ( \inst_controller|req_addr\(0) & ( ((\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\) # (\inst_controller|Selector33~0_combout\)) # (\inst_controller|state.S_READ_CMD~q\) ) ) ) # 
-- ( !\inst_controller|dram_addr\(0) & ( \inst_controller|req_addr\(0) & ( (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\) # (\inst_controller|state.S_READ_CMD~q\) ) ) ) # ( \inst_controller|dram_addr\(0) & ( !\inst_controller|req_addr\(0) & ( 
-- \inst_controller|Selector33~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001101011111010111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	datae => \inst_controller|ALT_INV_dram_addr\(0),
	dataf => \inst_controller|ALT_INV_req_addr\(0),
	combout => \inst_controller|Selector43~0_combout\);

-- Location: FF_X24_Y4_N34
\inst_controller|dram_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector43~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_addr\(0));

-- Location: FF_X30_Y4_N56
\inst_controller|req_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_addr\(1));

-- Location: LABCELL_X30_Y4_N51
\inst_controller|Selector42~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector42~0_combout\ = ( \inst_controller|dram_addr\(1) & ( \inst_controller|Selector33~0_combout\ ) ) # ( !\inst_controller|dram_addr\(1) & ( \inst_controller|Selector33~0_combout\ & ( (\inst_controller|req_addr\(1) & 
-- ((\inst_controller|state.S_READ_CMD~q\) # (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\))) ) ) ) # ( \inst_controller|dram_addr\(1) & ( !\inst_controller|Selector33~0_combout\ & ( (\inst_controller|req_addr\(1) & ((\inst_controller|state.S_READ_CMD~q\) 
-- # (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\))) ) ) ) # ( !\inst_controller|dram_addr\(1) & ( !\inst_controller|Selector33~0_combout\ & ( (\inst_controller|req_addr\(1) & ((\inst_controller|state.S_READ_CMD~q\) # 
-- (\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111100000000010111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	datad => \inst_controller|ALT_INV_req_addr\(1),
	datae => \inst_controller|ALT_INV_dram_addr\(1),
	dataf => \inst_controller|ALT_INV_Selector33~0_combout\,
	combout => \inst_controller|Selector42~0_combout\);

-- Location: FF_X30_Y4_N53
\inst_controller|dram_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector42~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_addr\(1));

-- Location: LABCELL_X27_Y4_N3
\inst_controller|Selector39~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector39~0_combout\ = ( \inst_controller|Selector33~0_combout\ & ( (\inst_controller|dram_addr\(4)) # (\inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\) ) ) # ( !\inst_controller|Selector33~0_combout\ & ( 
-- \inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_dram_addr\(4),
	dataf => \inst_controller|ALT_INV_Selector33~0_combout\,
	combout => \inst_controller|Selector39~0_combout\);

-- Location: FF_X27_Y4_N5
\inst_controller|dram_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector39~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_addr\(4));

-- Location: FF_X29_Y4_N40
\inst_controller|req_addr[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_addr\(21));

-- Location: MLABCELL_X28_Y4_N0
\inst_controller|Selector33~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector33~1_combout\ = ( !\inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & ( ((!\inst_controller|dram_addr\(10) & (\inst_controller|state.S_ACTIVATE~q\ & ((\inst_controller|req_addr\(21))))) # (\inst_controller|dram_addr\(10) & 
-- (((\inst_controller|state.S_ACTIVATE~q\ & \inst_controller|req_addr\(21))) # (\inst_controller|Selector33~0_combout\)))) # (\inst_controller|state.S_INIT_PRECHARGE~q\) ) ) # ( \inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & ( 
-- ((((\inst_controller|state.S_ACTIVATE~q\ & \inst_controller|req_addr\(21))) # (\inst_controller|state.S_INIT_PRECHARGE~q\)) # (\inst_controller|needs_refresh~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000010111111111000011111111111100110111111111110011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_dram_addr\(10),
	datab => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datae => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_req_addr\(21),
	datag => \inst_controller|ALT_INV_Selector33~0_combout\,
	combout => \inst_controller|Selector33~1_combout\);

-- Location: FF_X28_Y4_N2
\inst_controller|dram_addr[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector33~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_addr\(10));

-- Location: FF_X31_Y3_N31
\inst_controller|req_addr[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_addr\(22));

-- Location: LABCELL_X31_Y3_N6
\inst_controller|Selector32~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector32~0_combout\ = ( \inst_controller|dram_addr\(11) & ( \inst_controller|req_addr\(22) & ( (\inst_controller|state.S_ACTIVATE~q\) # (\inst_controller|Selector33~0_combout\) ) ) ) # ( !\inst_controller|dram_addr\(11) & ( 
-- \inst_controller|req_addr\(22) & ( \inst_controller|state.S_ACTIVATE~q\ ) ) ) # ( \inst_controller|dram_addr\(11) & ( !\inst_controller|req_addr\(22) & ( \inst_controller|Selector33~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100001111000011110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_Selector33~0_combout\,
	datac => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datae => \inst_controller|ALT_INV_dram_addr\(11),
	dataf => \inst_controller|ALT_INV_req_addr\(22),
	combout => \inst_controller|Selector32~0_combout\);

-- Location: FF_X31_Y3_N8
\inst_controller|dram_addr[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector32~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_addr\(11));

-- Location: FF_X31_Y3_N17
\inst_controller|req_addr[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[8]~input_o\,
	sload => VCC,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_addr\(23));

-- Location: LABCELL_X31_Y3_N15
\inst_controller|Selector31~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector31~0_combout\ = ( \inst_controller|req_addr\(23) & ( \inst_controller|dram_addr\(12) & ( (\inst_controller|Selector33~0_combout\) # (\inst_controller|state.S_ACTIVATE~q\) ) ) ) # ( !\inst_controller|req_addr\(23) & ( 
-- \inst_controller|dram_addr\(12) & ( \inst_controller|Selector33~0_combout\ ) ) ) # ( \inst_controller|req_addr\(23) & ( !\inst_controller|dram_addr\(12) & ( \inst_controller|state.S_ACTIVATE~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100001111000011110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datac => \inst_controller|ALT_INV_Selector33~0_combout\,
	datae => \inst_controller|ALT_INV_req_addr\(23),
	dataf => \inst_controller|ALT_INV_dram_addr\(12),
	combout => \inst_controller|Selector31~0_combout\);

-- Location: LABCELL_X29_Y2_N33
\inst_controller|dram_addr[12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|dram_addr[12]~feeder_combout\ = ( \inst_controller|Selector31~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst_controller|ALT_INV_Selector31~0_combout\,
	combout => \inst_controller|dram_addr[12]~feeder_combout\);

-- Location: FF_X29_Y2_N34
\inst_controller|dram_addr[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|dram_addr[12]~feeder_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_addr\(12));

-- Location: MLABCELL_X28_Y4_N30
\inst_controller|Selector48~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector48~0_combout\ = ( \inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & ( \inst_controller|needs_refresh~DUPLICATE_q\ & ( (!\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ & (!\inst_controller|state.S_READ_CMD~q\ & 
-- !\inst_controller|state.S_ACTIVATE~q\)) ) ) ) # ( !\inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & ( \inst_controller|needs_refresh~DUPLICATE_q\ & ( (!\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ & (!\inst_controller|state.S_READ_CMD~q\ & 
-- !\inst_controller|state.S_ACTIVATE~q\)) ) ) ) # ( !\inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & ( !\inst_controller|needs_refresh~DUPLICATE_q\ & ( (!\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ & (!\inst_controller|state.S_READ_CMD~q\ & 
-- !\inst_controller|state.S_ACTIVATE~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000000000000000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	datab => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	datac => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datae => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	combout => \inst_controller|Selector48~0_combout\);

-- Location: FF_X29_Y4_N47
\inst_controller|req_addr[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \SW[9]~input_o\,
	sload => VCC,
	ena => \inst_controller|req_is_w~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|req_addr\(25));

-- Location: LABCELL_X29_Y4_N0
\inst_controller|Selector48~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|Selector48~1_combout\ = ( \inst_controller|dram_ba\(1) & ( \inst_controller|Selector33~0_combout\ & ( (!\inst_controller|state.S_PRECHARGE~DUPLICATE_q\) # (((!\inst_controller|Selector48~0_combout\ & \inst_controller|req_addr\(25))) # 
-- (\inst_controller|needs_refresh~DUPLICATE_q\)) ) ) ) # ( !\inst_controller|dram_ba\(1) & ( \inst_controller|Selector33~0_combout\ & ( (!\inst_controller|Selector48~0_combout\ & \inst_controller|req_addr\(25)) ) ) ) # ( \inst_controller|dram_ba\(1) & ( 
-- !\inst_controller|Selector33~0_combout\ & ( (!\inst_controller|Selector48~0_combout\ & (((\inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & \inst_controller|needs_refresh~DUPLICATE_q\)) # (\inst_controller|req_addr\(25)))) # 
-- (\inst_controller|Selector48~0_combout\ & (\inst_controller|state.S_PRECHARGE~DUPLICATE_q\ & (\inst_controller|needs_refresh~DUPLICATE_q\))) ) ) ) # ( !\inst_controller|dram_ba\(1) & ( !\inst_controller|Selector33~0_combout\ & ( 
-- (!\inst_controller|Selector48~0_combout\ & \inst_controller|req_addr\(25)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000111010101100000000101010101100111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_Selector48~0_combout\,
	datab => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_needs_refresh~DUPLICATE_q\,
	datad => \inst_controller|ALT_INV_req_addr\(25),
	datae => \inst_controller|ALT_INV_dram_ba\(1),
	dataf => \inst_controller|ALT_INV_Selector33~0_combout\,
	combout => \inst_controller|Selector48~1_combout\);

-- Location: FF_X29_Y4_N2
\inst_controller|dram_ba[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|Selector48~1_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|dram_ba\(1));

-- Location: LABCELL_X27_Y4_N39
\inst_controller|WideOr10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|WideOr10~combout\ = ( \inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ ) # ( !\inst_controller|state.S_WRITE_CMD~DUPLICATE_q\ & ( (!\inst_controller|WideOr2~0_combout\) # ((\inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\) # 
-- (\inst_controller|state.S_READ_CMD~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111111111111110011111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst_controller|ALT_INV_WideOr2~0_combout\,
	datac => \inst_controller|ALT_INV_state.S_READ_CMD~q\,
	datad => \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_state.S_WRITE_CMD~DUPLICATE_q\,
	combout => \inst_controller|WideOr10~combout\);

-- Location: FF_X27_Y4_N40
\inst_controller|sdram_cmd[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|WideOr10~combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|sdram_cmd\(1));

-- Location: LABCELL_X27_Y3_N0
\inst_controller|WideOr9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst_controller|WideOr9~combout\ = ( \inst_controller|WideOr2~0_combout\ & ( (((\inst_controller|state.S_PRECHARGE~DUPLICATE_q\) # (\inst_controller|state.S_ACTIVATE~q\)) # (\inst_controller|state.S_INIT_LOAD_MODE~DUPLICATE_q\)) # 
-- (\inst_controller|state.S_INIT_PRECHARGE~q\) ) ) # ( !\inst_controller|WideOr2~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101111111111111110111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst_controller|ALT_INV_state.S_INIT_PRECHARGE~q\,
	datab => \inst_controller|ALT_INV_state.S_INIT_LOAD_MODE~DUPLICATE_q\,
	datac => \inst_controller|ALT_INV_state.S_ACTIVATE~q\,
	datad => \inst_controller|ALT_INV_state.S_PRECHARGE~DUPLICATE_q\,
	dataf => \inst_controller|ALT_INV_WideOr2~0_combout\,
	combout => \inst_controller|WideOr9~combout\);

-- Location: FF_X27_Y3_N2
\inst_controller|sdram_cmd[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst_controller|WideOr9~combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|sdram_cmd\(2));

-- Location: FF_X27_Y4_N17
\inst_controller|sdram_cmd[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_pll|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \inst_controller|WideOr11~0_combout\,
	clrn => \ALT_INV_sys_rst_n~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_controller|sdram_cmd\(0));

-- Location: IOIBUF_X36_Y0_N18
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: LABCELL_X88_Y9_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


