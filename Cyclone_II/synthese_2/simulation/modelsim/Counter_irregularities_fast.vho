-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "10/01/2015 13:57:58"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_counter_verification IS
    PORT (
	CLOCK_50 : IN std_logic;
	GPIO_0_0 : OUT std_logic;
	GPIO_0_1 : OUT std_logic
	);
END top_counter_verification;

-- Design Ports Information
-- GPIO_0_0	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: 8mA
-- GPIO_0_1	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_counter_verification IS
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
SIGNAL ww_GPIO_0_0 : std_logic;
SIGNAL ww_GPIO_0_1 : std_logic;
SIGNAL \CLOCK_50~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_counter|s_cnt[2]~9_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt[4]~13_combout\ : std_logic;
SIGNAL \CLOCK_50~combout\ : std_logic;
SIGNAL \CLOCK_50~clkctrl_outclk\ : std_logic;
SIGNAL \inst_counter|s_cnt[1]~7_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt[1]~8\ : std_logic;
SIGNAL \inst_counter|s_cnt[2]~10\ : std_logic;
SIGNAL \inst_counter|s_cnt[3]~11_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt[3]~12\ : std_logic;
SIGNAL \inst_counter|s_cnt[4]~14\ : std_logic;
SIGNAL \inst_counter|s_cnt[5]~15_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt[5]~16\ : std_logic;
SIGNAL \inst_counter|s_cnt[6]~18\ : std_logic;
SIGNAL \inst_counter|s_cnt[7]~19_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt[6]~17_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~1_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt[0]~21_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~0_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~2_combout\ : std_logic;
SIGNAL \inst_counter|s_cnt\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
GPIO_0_0 <= ww_GPIO_0_0;
GPIO_0_1 <= ww_GPIO_0_1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLOCK_50~combout\);

-- Location: LCFF_X64_Y31_N7
\inst_counter|s_cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[2]~9_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(2));

-- Location: LCFF_X64_Y31_N11
\inst_counter|s_cnt[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[4]~13_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(4));

-- Location: LCCOMB_X64_Y31_N6
\inst_counter|s_cnt[2]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[2]~9_combout\ = (\inst_counter|s_cnt\(2) & (!\inst_counter|s_cnt[1]~8\)) # (!\inst_counter|s_cnt\(2) & ((\inst_counter|s_cnt[1]~8\) # (GND)))
-- \inst_counter|s_cnt[2]~10\ = CARRY((!\inst_counter|s_cnt[1]~8\) # (!\inst_counter|s_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(2),
	datad => VCC,
	cin => \inst_counter|s_cnt[1]~8\,
	combout => \inst_counter|s_cnt[2]~9_combout\,
	cout => \inst_counter|s_cnt[2]~10\);

-- Location: LCCOMB_X64_Y31_N10
\inst_counter|s_cnt[4]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[4]~13_combout\ = (\inst_counter|s_cnt\(4) & (!\inst_counter|s_cnt[3]~12\)) # (!\inst_counter|s_cnt\(4) & ((\inst_counter|s_cnt[3]~12\) # (GND)))
-- \inst_counter|s_cnt[4]~14\ = CARRY((!\inst_counter|s_cnt[3]~12\) # (!\inst_counter|s_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(4),
	datad => VCC,
	cin => \inst_counter|s_cnt[3]~12\,
	combout => \inst_counter|s_cnt[4]~13_combout\,
	cout => \inst_counter|s_cnt[4]~14\);

-- Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
\CLOCK_50~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLOCK_50,
	combout => \CLOCK_50~combout\);

-- Location: CLKCTRL_G2
\CLOCK_50~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~clkctrl_outclk\);

-- Location: LCCOMB_X64_Y31_N4
\inst_counter|s_cnt[1]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[1]~7_combout\ = (\inst_counter|s_cnt\(0) & (\inst_counter|s_cnt\(1) $ (VCC))) # (!\inst_counter|s_cnt\(0) & (\inst_counter|s_cnt\(1) & VCC))
-- \inst_counter|s_cnt[1]~8\ = CARRY((\inst_counter|s_cnt\(0) & \inst_counter|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(0),
	datab => \inst_counter|s_cnt\(1),
	datad => VCC,
	combout => \inst_counter|s_cnt[1]~7_combout\,
	cout => \inst_counter|s_cnt[1]~8\);

-- Location: LCFF_X64_Y31_N5
\inst_counter|s_cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[1]~7_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(1));

-- Location: LCCOMB_X64_Y31_N8
\inst_counter|s_cnt[3]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[3]~11_combout\ = (\inst_counter|s_cnt\(3) & (\inst_counter|s_cnt[2]~10\ $ (GND))) # (!\inst_counter|s_cnt\(3) & (!\inst_counter|s_cnt[2]~10\ & VCC))
-- \inst_counter|s_cnt[3]~12\ = CARRY((\inst_counter|s_cnt\(3) & !\inst_counter|s_cnt[2]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|s_cnt\(3),
	datad => VCC,
	cin => \inst_counter|s_cnt[2]~10\,
	combout => \inst_counter|s_cnt[3]~11_combout\,
	cout => \inst_counter|s_cnt[3]~12\);

-- Location: LCFF_X64_Y31_N9
\inst_counter|s_cnt[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[3]~11_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(3));

-- Location: LCCOMB_X64_Y31_N12
\inst_counter|s_cnt[5]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[5]~15_combout\ = (\inst_counter|s_cnt\(5) & (\inst_counter|s_cnt[4]~14\ $ (GND))) # (!\inst_counter|s_cnt\(5) & (!\inst_counter|s_cnt[4]~14\ & VCC))
-- \inst_counter|s_cnt[5]~16\ = CARRY((\inst_counter|s_cnt\(5) & !\inst_counter|s_cnt[4]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(5),
	datad => VCC,
	cin => \inst_counter|s_cnt[4]~14\,
	combout => \inst_counter|s_cnt[5]~15_combout\,
	cout => \inst_counter|s_cnt[5]~16\);

-- Location: LCFF_X64_Y31_N13
\inst_counter|s_cnt[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[5]~15_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(5));

-- Location: LCCOMB_X64_Y31_N14
\inst_counter|s_cnt[6]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[6]~17_combout\ = (\inst_counter|s_cnt\(6) & (!\inst_counter|s_cnt[5]~16\)) # (!\inst_counter|s_cnt\(6) & ((\inst_counter|s_cnt[5]~16\) # (GND)))
-- \inst_counter|s_cnt[6]~18\ = CARRY((!\inst_counter|s_cnt[5]~16\) # (!\inst_counter|s_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(6),
	datad => VCC,
	cin => \inst_counter|s_cnt[5]~16\,
	combout => \inst_counter|s_cnt[6]~17_combout\,
	cout => \inst_counter|s_cnt[6]~18\);

-- Location: LCCOMB_X64_Y31_N16
\inst_counter|s_cnt[7]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[7]~19_combout\ = \inst_counter|s_cnt[6]~18\ $ (!\inst_counter|s_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst_counter|s_cnt\(7),
	cin => \inst_counter|s_cnt[6]~18\,
	combout => \inst_counter|s_cnt[7]~19_combout\);

-- Location: LCFF_X64_Y31_N17
\inst_counter|s_cnt[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[7]~19_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(7));

-- Location: LCFF_X64_Y31_N15
\inst_counter|s_cnt[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[6]~17_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(6));

-- Location: LCCOMB_X64_Y31_N22
\inst_counter|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~1_combout\ = (\inst_counter|s_cnt\(4) & (!\inst_counter|s_cnt\(5) & (\inst_counter|s_cnt\(7) & !\inst_counter|s_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(4),
	datab => \inst_counter|s_cnt\(5),
	datac => \inst_counter|s_cnt\(7),
	datad => \inst_counter|s_cnt\(6),
	combout => \inst_counter|Equal0~1_combout\);

-- Location: LCCOMB_X64_Y31_N20
\inst_counter|s_cnt[0]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|s_cnt[0]~21_combout\ = !\inst_counter|s_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_counter|s_cnt\(0),
	combout => \inst_counter|s_cnt[0]~21_combout\);

-- Location: LCFF_X64_Y31_N21
\inst_counter|s_cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|s_cnt[0]~21_combout\,
	aclr => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|s_cnt\(0));

-- Location: LCCOMB_X64_Y31_N30
\inst_counter|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~0_combout\ = (\inst_counter|s_cnt\(2) & (!\inst_counter|s_cnt\(0) & (\inst_counter|s_cnt\(3) & \inst_counter|s_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|s_cnt\(2),
	datab => \inst_counter|s_cnt\(0),
	datac => \inst_counter|s_cnt\(3),
	datad => \inst_counter|s_cnt\(1),
	combout => \inst_counter|Equal0~0_combout\);

-- Location: LCCOMB_X64_Y31_N24
\inst_counter|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~2_combout\ = (\inst_counter|Equal0~1_combout\ & \inst_counter|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|Equal0~1_combout\,
	datad => \inst_counter|Equal0~0_combout\,
	combout => \inst_counter|Equal0~2_combout\);

-- Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: 8mA
\GPIO_0_0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst_counter|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_GPIO_0_0);

-- Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: 8mA
\GPIO_0_1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_GPIO_0_1);
END structure;


