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

-- DATE "10/02/2015 15:57:40"

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
	GPIO_0_0 : OUT std_logic
	);
END top_counter_verification;

-- Design Ports Information
-- GPIO_0_0	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: 8mA
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
SIGNAL \CLOCK_50~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_counter|cnt[0]~9_combout\ : std_logic;
SIGNAL \CLOCK_50~combout\ : std_logic;
SIGNAL \CLOCK_50~clkctrl_outclk\ : std_logic;
SIGNAL \inst_counter|cnt[1]~3_combout\ : std_logic;
SIGNAL \inst_counter|cnt[1]~4\ : std_logic;
SIGNAL \inst_counter|cnt[2]~5_combout\ : std_logic;
SIGNAL \inst_counter|cnt[2]~6\ : std_logic;
SIGNAL \inst_counter|cnt[3]~7_combout\ : std_logic;
SIGNAL \inst_counter|cnt\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
GPIO_0_0 <= ww_GPIO_0_0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLOCK_50~combout\);

-- Location: LCFF_X64_Y31_N11
\inst_counter|cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|cnt[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|cnt\(0));

-- Location: LCCOMB_X64_Y31_N10
\inst_counter|cnt[0]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[0]~9_combout\ = !\inst_counter|cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_counter|cnt\(0),
	combout => \inst_counter|cnt[0]~9_combout\);

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

-- Location: LCCOMB_X64_Y31_N0
\inst_counter|cnt[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[1]~3_combout\ = (\inst_counter|cnt\(0) & (\inst_counter|cnt\(1) $ (VCC))) # (!\inst_counter|cnt\(0) & (\inst_counter|cnt\(1) & VCC))
-- \inst_counter|cnt[1]~4\ = CARRY((\inst_counter|cnt\(0) & \inst_counter|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(0),
	datab => \inst_counter|cnt\(1),
	datad => VCC,
	combout => \inst_counter|cnt[1]~3_combout\,
	cout => \inst_counter|cnt[1]~4\);

-- Location: LCFF_X64_Y31_N1
\inst_counter|cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|cnt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|cnt\(1));

-- Location: LCCOMB_X64_Y31_N2
\inst_counter|cnt[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[2]~5_combout\ = (\inst_counter|cnt\(2) & (!\inst_counter|cnt[1]~4\)) # (!\inst_counter|cnt\(2) & ((\inst_counter|cnt[1]~4\) # (GND)))
-- \inst_counter|cnt[2]~6\ = CARRY((!\inst_counter|cnt[1]~4\) # (!\inst_counter|cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(2),
	datad => VCC,
	cin => \inst_counter|cnt[1]~4\,
	combout => \inst_counter|cnt[2]~5_combout\,
	cout => \inst_counter|cnt[2]~6\);

-- Location: LCFF_X64_Y31_N3
\inst_counter|cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|cnt[2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|cnt\(2));

-- Location: LCCOMB_X64_Y31_N4
\inst_counter|cnt[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[3]~7_combout\ = \inst_counter|cnt\(3) $ (!\inst_counter|cnt[2]~6\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(3),
	cin => \inst_counter|cnt[2]~6\,
	combout => \inst_counter|cnt[3]~7_combout\);

-- Location: LCFF_X64_Y31_N5
\inst_counter|cnt[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_counter|cnt[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_counter|cnt\(3));

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
	datain => \inst_counter|cnt\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_GPIO_0_0);
END structure;


