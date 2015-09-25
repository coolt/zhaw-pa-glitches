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

-- DATE "09/23/2015 13:18:31"

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
	GPIO_0 : OUT std_logic
	);
END top_counter_verification;

-- Design Ports Information
-- GPIO_0	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY_0	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_counter|cnt[4]~16_combout\ : std_logic;
SIGNAL \GPIO_0~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst_counter|cnt[0]~8_combout\ : std_logic;
SIGNAL \KEY_0~input_o\ : std_logic;
SIGNAL \inst_counter|cnt[0]~9\ : std_logic;
SIGNAL \inst_counter|cnt[1]~11\ : std_logic;
SIGNAL \inst_counter|cnt[2]~12_combout\ : std_logic;
SIGNAL \inst_counter|cnt[2]~13\ : std_logic;
SIGNAL \inst_counter|cnt[3]~15\ : std_logic;
SIGNAL \inst_counter|cnt[4]~17\ : std_logic;
SIGNAL \inst_counter|cnt[5]~18_combout\ : std_logic;
SIGNAL \inst_counter|cnt[5]~19\ : std_logic;
SIGNAL \inst_counter|cnt[6]~20_combout\ : std_logic;
SIGNAL \inst_counter|cnt[6]~21\ : std_logic;
SIGNAL \inst_counter|cnt[7]~22_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~1_combout\ : std_logic;
SIGNAL \inst_counter|cnt[1]~10_combout\ : std_logic;
SIGNAL \inst_counter|cnt[3]~14_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~0_combout\ : std_logic;
SIGNAL \inst_counter|Equal0~2_combout\ : std_logic;
SIGNAL \inst_counter|reset~q\ : std_logic;
SIGNAL \inst_counter|cnt\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY_0 <= KEY_0;
GPIO_0 <= ww_GPIO_0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

-- Location: FF_X112_Y8_N13
\inst_counter|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[4]~16_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(4));

-- Location: LCCOMB_X112_Y8_N12
\inst_counter|cnt[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[4]~16_combout\ = (\inst_counter|cnt\(4) & (\inst_counter|cnt[3]~15\ $ (GND))) # (!\inst_counter|cnt\(4) & (!\inst_counter|cnt[3]~15\ & VCC))
-- \inst_counter|cnt[4]~17\ = CARRY((\inst_counter|cnt\(4) & !\inst_counter|cnt[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(4),
	datad => VCC,
	cin => \inst_counter|cnt[3]~15\,
	combout => \inst_counter|cnt[4]~16_combout\,
	cout => \inst_counter|cnt[4]~17\);

-- Location: IOOBUF_X107_Y0_N2
\GPIO_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter|reset~q\,
	devoe => ww_devoe,
	o => \GPIO_0~output_o\);

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

-- Location: LCCOMB_X112_Y8_N4
\inst_counter|cnt[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[0]~8_combout\ = \inst_counter|cnt\(0) $ (VCC)
-- \inst_counter|cnt[0]~9\ = CARRY(\inst_counter|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(0),
	datad => VCC,
	combout => \inst_counter|cnt[0]~8_combout\,
	cout => \inst_counter|cnt[0]~9\);

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

-- Location: FF_X112_Y8_N5
\inst_counter|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[0]~8_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(0));

-- Location: LCCOMB_X112_Y8_N6
\inst_counter|cnt[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[1]~10_combout\ = (\inst_counter|cnt\(1) & (!\inst_counter|cnt[0]~9\)) # (!\inst_counter|cnt\(1) & ((\inst_counter|cnt[0]~9\) # (GND)))
-- \inst_counter|cnt[1]~11\ = CARRY((!\inst_counter|cnt[0]~9\) # (!\inst_counter|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(1),
	datad => VCC,
	cin => \inst_counter|cnt[0]~9\,
	combout => \inst_counter|cnt[1]~10_combout\,
	cout => \inst_counter|cnt[1]~11\);

-- Location: LCCOMB_X112_Y8_N8
\inst_counter|cnt[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[2]~12_combout\ = (\inst_counter|cnt\(2) & (\inst_counter|cnt[1]~11\ $ (GND))) # (!\inst_counter|cnt\(2) & (!\inst_counter|cnt[1]~11\ & VCC))
-- \inst_counter|cnt[2]~13\ = CARRY((\inst_counter|cnt\(2) & !\inst_counter|cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(2),
	datad => VCC,
	cin => \inst_counter|cnt[1]~11\,
	combout => \inst_counter|cnt[2]~12_combout\,
	cout => \inst_counter|cnt[2]~13\);

-- Location: FF_X112_Y8_N9
\inst_counter|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[2]~12_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(2));

-- Location: LCCOMB_X112_Y8_N10
\inst_counter|cnt[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[3]~14_combout\ = (\inst_counter|cnt\(3) & (!\inst_counter|cnt[2]~13\)) # (!\inst_counter|cnt\(3) & ((\inst_counter|cnt[2]~13\) # (GND)))
-- \inst_counter|cnt[3]~15\ = CARRY((!\inst_counter|cnt[2]~13\) # (!\inst_counter|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(3),
	datad => VCC,
	cin => \inst_counter|cnt[2]~13\,
	combout => \inst_counter|cnt[3]~14_combout\,
	cout => \inst_counter|cnt[3]~15\);

-- Location: LCCOMB_X112_Y8_N14
\inst_counter|cnt[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[5]~18_combout\ = (\inst_counter|cnt\(5) & (!\inst_counter|cnt[4]~17\)) # (!\inst_counter|cnt\(5) & ((\inst_counter|cnt[4]~17\) # (GND)))
-- \inst_counter|cnt[5]~19\ = CARRY((!\inst_counter|cnt[4]~17\) # (!\inst_counter|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(5),
	datad => VCC,
	cin => \inst_counter|cnt[4]~17\,
	combout => \inst_counter|cnt[5]~18_combout\,
	cout => \inst_counter|cnt[5]~19\);

-- Location: FF_X112_Y8_N15
\inst_counter|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[5]~18_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(5));

-- Location: LCCOMB_X112_Y8_N16
\inst_counter|cnt[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[6]~20_combout\ = (\inst_counter|cnt\(6) & (\inst_counter|cnt[5]~19\ $ (GND))) # (!\inst_counter|cnt\(6) & (!\inst_counter|cnt[5]~19\ & VCC))
-- \inst_counter|cnt[6]~21\ = CARRY((\inst_counter|cnt\(6) & !\inst_counter|cnt[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_counter|cnt\(6),
	datad => VCC,
	cin => \inst_counter|cnt[5]~19\,
	combout => \inst_counter|cnt[6]~20_combout\,
	cout => \inst_counter|cnt[6]~21\);

-- Location: FF_X112_Y8_N17
\inst_counter|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[6]~20_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(6));

-- Location: LCCOMB_X112_Y8_N18
\inst_counter|cnt[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|cnt[7]~22_combout\ = \inst_counter|cnt[6]~21\ $ (\inst_counter|cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst_counter|cnt\(7),
	cin => \inst_counter|cnt[6]~21\,
	combout => \inst_counter|cnt[7]~22_combout\);

-- Location: FF_X112_Y8_N19
\inst_counter|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[7]~22_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(7));

-- Location: LCCOMB_X112_Y8_N0
\inst_counter|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~1_combout\ = (\inst_counter|cnt\(4) & (\inst_counter|cnt\(7) & (\inst_counter|cnt\(5) & \inst_counter|cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(4),
	datab => \inst_counter|cnt\(7),
	datac => \inst_counter|cnt\(5),
	datad => \inst_counter|cnt\(6),
	combout => \inst_counter|Equal0~1_combout\);

-- Location: FF_X112_Y8_N7
\inst_counter|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[1]~10_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(1));

-- Location: FF_X112_Y8_N11
\inst_counter|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|cnt[3]~14_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|cnt\(3));

-- Location: LCCOMB_X112_Y8_N2
\inst_counter|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_counter|Equal0~0_combout\ = (\inst_counter|cnt\(2) & (\inst_counter|cnt\(1) & (\inst_counter|cnt\(0) & \inst_counter|cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter|cnt\(2),
	datab => \inst_counter|cnt\(1),
	datac => \inst_counter|cnt\(0),
	datad => \inst_counter|cnt\(3),
	combout => \inst_counter|Equal0~0_combout\);

-- Location: LCCOMB_X112_Y8_N24
\inst_counter|Equal0~2\ : cycloneive_lcell_comb
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

-- Location: FF_X112_Y8_N25
\inst_counter|reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_counter|Equal0~2_combout\,
	clrn => \KEY_0~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter|reset~q\);

ww_GPIO_0 <= \GPIO_0~output_o\;
END structure;


