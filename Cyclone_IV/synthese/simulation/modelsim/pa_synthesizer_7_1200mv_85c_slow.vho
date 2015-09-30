-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Full Version"

-- DATE "09/25/2015 14:55:45"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_counter_verification IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY_0 : IN std_logic;
	GPIO_0 : OUT std_logic;
	GPIO_1 : OUT std_logic
	);
END top_counter_verification;

-- Design Ports Information
-- KEY_0	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GPIO_0	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- GPIO_1	=>  Location: PIN_AC15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


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
SIGNAL ww_KEY_0 : std_logic;
SIGNAL ww_GPIO_0 : std_logic;
SIGNAL ww_GPIO_1 : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY_0~input_o\ : std_logic;
SIGNAL \GPIO_0~output_o\ : std_logic;
SIGNAL \GPIO_1~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst_counter|cnt[0]~21_combout\ : std_logic;
SIGNAL \inst_counter|cnt[1]~7_combout\ : std_logic;
SIGNAL \inst_counter|cnt[1]~8\ : std_logic;
SIGNAL \inst_counter|cnt[2]~9_combout\ : std_logic;
SIGNAL \inst_counter|cnt[2]~10\ : std_logic;
SIGNAL \inst_counter|cnt[3]~11_combout\ : std_logic;
SIGNAL \inst_counter|cnt[3]~12\ : std_logic;
SIGNAL \inst_counter|cnt[4]~13_combout\ : std_logic;
SIGNAL \inst_counter|cnt[4]~14\ : std_logic;
SIGNAL \inst_counter|cnt[5]~15_combout\ : std_logic;
SIGNAL \inst_counter|cnt[5]~16\ : std_logic;
SIGNAL \inst_counter|cnt[6]~17_combout\ : std_logic;
SIGNAL \inst_counter|cnt[6]~18\ : std_logic;
SIGNAL \inst_counter|cnt[7]~19_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~1_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~0_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~2_combout\ : std_logic;
SIGNAL \inst_counter|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_counter|ALT_INV_Equal0~2_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY_0 <= KEY_0;
GPIO_0 <= ww_GPIO_0;
GPIO_1 <= ww_GPIO_1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\inst_counter|ALT_INV_Equal0~2_combout\ <= NOT \inst_counter|Equal0~2_combout\;

-- Location: IOOBUF_X107_Y0_N2
\GPIO_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter|Equal0~2_combout\,
	devoe => ww_devoe,
	o => \GPIO_0~output_o\);

-- Location: IOOBUF_X60_Y0_N23
\GPIO_1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \GPIO_1~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X108_Y1_N28
\inst_counter|cnt[0]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[0]~21_combout\ = !\inst_counter|cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_counter|cnt\(0),
	combout => \inst_counter|cnt[0]~21_combout\);

-- Location: FF_X108_Y1_N29
\inst_counter|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[0]~21_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(0));

-- Location: LCCOMB_X108_Y1_N4
\inst_counter|cnt[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[1]~7_combout\ = (\inst_counter|cnt\(0) & (\inst_counter|cnt\(1) $ (VCC))) # (!\inst_counter|cnt\(0) & (\inst_counter|cnt\(1) & VCC))
-- \inst_counter|cnt[1]~8\ = CARRY((\inst_counter|cnt\(0) & \inst_counter|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(0),
	datab => \inst_counter|cnt\(1),
	datad => VCC,
	combout => \inst_counter|cnt[1]~7_combout\,
	cout => \inst_counter|cnt[1]~8\);

-- Location: FF_X108_Y1_N5
\inst_counter|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[1]~7_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(1));

-- Location: LCCOMB_X108_Y1_N6
\inst_counter|cnt[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[2]~9_combout\ = (\inst_counter|cnt\(2) & (!\inst_counter|cnt[1]~8\)) # (!\inst_counter|cnt\(2) & ((\inst_counter|cnt[1]~8\) # (GND)))
-- \inst_counter|cnt[2]~10\ = CARRY((!\inst_counter|cnt[1]~8\) # (!\inst_counter|cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(2),
	datad => VCC,
	cin => \inst_counter|cnt[1]~8\,
	combout => \inst_counter|cnt[2]~9_combout\,
	cout => \inst_counter|cnt[2]~10\);

-- Location: FF_X108_Y1_N7
\inst_counter|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[2]~9_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(2));

-- Location: LCCOMB_X108_Y1_N8
\inst_counter|cnt[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[3]~11_combout\ = (\inst_counter|cnt\(3) & (\inst_counter|cnt[2]~10\ $ (GND))) # (!\inst_counter|cnt\(3) & (!\inst_counter|cnt[2]~10\ & VCC))
-- \inst_counter|cnt[3]~12\ = CARRY((\inst_counter|cnt\(3) & !\inst_counter|cnt[2]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(3),
	datad => VCC,
	cin => \inst_counter|cnt[2]~10\,
	combout => \inst_counter|cnt[3]~11_combout\,
	cout => \inst_counter|cnt[3]~12\);

-- Location: FF_X108_Y1_N9
\inst_counter|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[3]~11_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(3));

-- Location: LCCOMB_X108_Y1_N10
\inst_counter|cnt[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[4]~13_combout\ = (\inst_counter|cnt\(4) & (!\inst_counter|cnt[3]~12\)) # (!\inst_counter|cnt\(4) & ((\inst_counter|cnt[3]~12\) # (GND)))
-- \inst_counter|cnt[4]~14\ = CARRY((!\inst_counter|cnt[3]~12\) # (!\inst_counter|cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(4),
	datad => VCC,
	cin => \inst_counter|cnt[3]~12\,
	combout => \inst_counter|cnt[4]~13_combout\,
	cout => \inst_counter|cnt[4]~14\);

-- Location: FF_X108_Y1_N11
\inst_counter|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[4]~13_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(4));

-- Location: LCCOMB_X108_Y1_N12
\inst_counter|cnt[5]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[5]~15_combout\ = (\inst_counter|cnt\(5) & (\inst_counter|cnt[4]~14\ $ (GND))) # (!\inst_counter|cnt\(5) & (!\inst_counter|cnt[4]~14\ & VCC))
-- \inst_counter|cnt[5]~16\ = CARRY((\inst_counter|cnt\(5) & !\inst_counter|cnt[4]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(5),
	datad => VCC,
	cin => \inst_counter|cnt[4]~14\,
	combout => \inst_counter|cnt[5]~15_combout\,
	cout => \inst_counter|cnt[5]~16\);

-- Location: FF_X108_Y1_N13
\inst_counter|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[5]~15_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(5));

-- Location: LCCOMB_X108_Y1_N14
\inst_counter|cnt[6]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[6]~17_combout\ = (\inst_counter|cnt\(6) & (!\inst_counter|cnt[5]~16\)) # (!\inst_counter|cnt\(6) & ((\inst_counter|cnt[5]~16\) # (GND)))
-- \inst_counter|cnt[6]~18\ = CARRY((!\inst_counter|cnt[5]~16\) # (!\inst_counter|cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(6),
	datad => VCC,
	cin => \inst_counter|cnt[5]~16\,
	combout => \inst_counter|cnt[6]~17_combout\,
	cout => \inst_counter|cnt[6]~18\);

-- Location: FF_X108_Y1_N15
\inst_counter|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[6]~17_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(6));

-- Location: LCCOMB_X108_Y1_N16
\inst_counter|cnt[7]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[7]~19_combout\ = \inst_counter|cnt\(7) $ (!\inst_counter|cnt[6]~18\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(7),
	cin => \inst_counter|cnt[6]~18\,
	combout => \inst_counter|cnt[7]~19_combout\);

-- Location: FF_X108_Y1_N17
\inst_counter|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[7]~19_combout\,
	clrn => \inst_counter|ALT_INV_Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(7));

-- Location: LCCOMB_X108_Y1_N30
\inst_counter|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~1_combout\ = (!\inst_counter|cnt\(5) & (\inst_counter|cnt\(7) & (!\inst_counter|cnt\(6) & \inst_counter|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(5),
	datab => \inst_counter|cnt\(7),
	datac => \inst_counter|cnt\(6),
	datad => \inst_counter|cnt\(4),
	combout => \inst_counter|Equal0~1_combout\);

-- Location: LCCOMB_X108_Y1_N2
\inst_counter|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~0_combout\ = (\inst_counter|cnt\(2) & (!\inst_counter|cnt\(0) & (\inst_counter|cnt\(3) & \inst_counter|cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(2),
	datab => \inst_counter|cnt\(0),
	datac => \inst_counter|cnt\(3),
	datad => \inst_counter|cnt\(1),
	combout => \inst_counter|Equal0~0_combout\);

-- Location: LCCOMB_X108_Y1_N24
\inst_counter|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~2_combout\ = (\inst_counter|Equal0~1_combout\ & \inst_counter|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_counter|Equal0~1_combout\,
	datad => \inst_counter|Equal0~0_combout\,
	combout => \inst_counter|Equal0~2_combout\);

-- Location: IOIBUF_X115_Y40_N8
\KEY_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY_0,
	o => \KEY_0~input_o\);

ww_GPIO_0 <= \GPIO_0~output_o\;

ww_GPIO_1 <= \GPIO_1~output_o\;
END structure;


