# Copyright (C) 1991-2010 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: top_gpsUhr.tcl
# Generated on: Wed May 05 18:36:46 2010

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "top_gpsUhr"]} {
		puts "Project top_gpsUhr is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists top_gpsUhr]} {
		project_open -revision top_gpsUhr top_gpsUhr
	} else {
		project_new -revision top_gpsUhr top_gpsUhr
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "MAX II"
	set_global_assignment -name DEVICE EPM2210F324C3
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION "9.1 SP2"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "17:04:10  MAY 05, 2010"
	set_global_assignment -name LAST_QUARTUS_VERSION "9.1 SP2"
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim (VHDL)"
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name USE_GENERATED_PHYSICAL_CONSTRAINTS OFF -section_id eda_blast_fpga
	set_global_assignment -name VHDL_FILE ../../source/baud_rate_generator.vhd
	set_global_assignment -name VHDL_FILE ../../source/daten_buffer.vhd
	set_global_assignment -name VHDL_FILE ../../source/edge_detect.vhd
	set_global_assignment -name VHDL_FILE ../../source/flnkn_det_block.vhd
	set_global_assignment -name VHDL_FILE ../../source/gpsdecoder.vhd
	set_global_assignment -name VHDL_FILE ../../source/lcdcontrol.vhd
	set_global_assignment -name VHDL_FILE ../../source/lcddriver.vhd
	set_global_assignment -name VHDL_FILE ../../source/steuerung.vhd
	set_global_assignment -name VHDL_FILE ../../source/tick_generator.vhd
	set_global_assignment -name VHDL_FILE ../../source/top.vhd
	set_global_assignment -name VHDL_FILE ../../source/top_gpsUhr.vhd
	set_global_assignment -name VHDL_FILE ../../source/top_infrastructure.vhd
	set_global_assignment -name VHDL_FILE ../../source/top_uart.vhd
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_EXT_SUPPLY_VOLTAGE_TO_REGULATOR 3.3V
	set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
	set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"
	set_global_assignment -name MISC_FILE "Y:/005 DT2_Projekt/VHDL_Code/top_gpsUhr_daten/synthese/quartus/top_gpsUhr.dpf"
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
	set_location_assignment PIN_F3 -to gps_lcdDaten[2]
	set_location_assignment PIN_U4 -to gps_led_8
	set_location_assignment PIN_V13 -to gps_led_2
	set_location_assignment PIN_U14 -to gps_taste_3
	set_location_assignment PIN_A2 -to gps_lcdDaten[7]
	set_location_assignment PIN_H18 -to gps_seg_5
	set_location_assignment PIN_G3 -to gps_lcdDaten[1]
	set_location_assignment PIN_V4 -to gps_led_7
	set_location_assignment PIN_U13 -to gps_led_1
	set_location_assignment PIN_H4 -to gps_lcdRW
	set_location_assignment PIN_V15 -to gps_taste_2
	set_location_assignment PIN_V14 -to gps_reset
	set_location_assignment PIN_J17 -to gps_seg_7
	set_location_assignment PIN_B3 -to gps_lcdDaten[6]
	set_location_assignment PIN_J13 -to gps_seg_4
	set_location_assignment PIN_E3 -to gps_lcdDaten[3]
	set_location_assignment PIN_H17 -to gps_seg_1
	set_location_assignment PIN_G4 -to gps_lcdDaten[0]
	set_location_assignment PIN_U5 -to gps_led_6
	set_location_assignment PIN_U12 -to gps_led_3
	set_location_assignment PIN_C4 -to gps_lcdRST_N
	set_location_assignment PIN_J3 -to gps_lcdRS
	set_location_assignment PIN_U15 -to gps_taste_1
	set_location_assignment PIN_J6 -to gps_clk_in
	set_location_assignment PIN_J18 -to gps_seg_6
	set_location_assignment PIN_D3 -to gps_lcdDaten[5]
	set_location_assignment PIN_F18 -to gps_seg_3
	set_location_assignment PIN_V5 -to gps_led_5
	set_location_assignment PIN_H3 -to gps_lcdE
	set_location_assignment PIN_M17 -to gps_serial_in
	set_location_assignment PIN_C3 -to gps_lcdDaten[4]
	set_location_assignment PIN_F17 -to gps_seg_2
	set_location_assignment PIN_V12 -to gps_led_4
	set_location_assignment PIN_L17 -to gps_recever_rst_n

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
