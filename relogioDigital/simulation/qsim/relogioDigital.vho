-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "04/07/2018 18:11:30"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
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

ENTITY 	relogioDigital IS
    PORT (
	clk : IN std_logic;
	enable : IN std_logic;
	load : IN std_logic;
	clear : IN std_logic;
	seletor : IN std_logic;
	carga1 : IN std_logic_vector(3 DOWNTO 0);
	carga2 : IN std_logic_vector(3 DOWNTO 0);
	saida1 : OUT std_logic_vector(6 DOWNTO 0);
	saida2 : OUT std_logic_vector(6 DOWNTO 0)
	);
END relogioDigital;

-- Design Ports Information
-- saida1[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida1[1]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida1[2]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida1[3]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida1[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida1[5]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida1[6]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[0]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[1]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[2]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[3]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[4]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[5]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida2[6]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seletor	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga1[0]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga1[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga1[2]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga1[3]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga2[0]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga2[1]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga2[2]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carga2[3]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF relogioDigital IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_load : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_seletor : std_logic;
SIGNAL ww_carga1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_carga2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_saida1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_saida2 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \Bloco_1|clkout1Hz_signal~0_combout\ : std_logic;
SIGNAL \Bloco_1|clkout1Hz_signal~q\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \seletor~input_o\ : std_logic;
SIGNAL \carga1[3]~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \Bloco_2|temp~6_combout\ : std_logic;
SIGNAL \carga1[2]~input_o\ : std_logic;
SIGNAL \Bloco_2|temp~8_combout\ : std_logic;
SIGNAL \carga1[0]~input_o\ : std_logic;
SIGNAL \Bloco_2|temp~7_combout\ : std_logic;
SIGNAL \Bloco_2|temp~2_combout\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \Bloco_2|temp~0_combout\ : std_logic;
SIGNAL \carga1[1]~input_o\ : std_logic;
SIGNAL \Bloco_2|temp~1_combout\ : std_logic;
SIGNAL \Bloco_2|temp~3_combout\ : std_logic;
SIGNAL \Bloco_2|temp~4_combout\ : std_logic;
SIGNAL \Bloco_2|temp~5_combout\ : std_logic;
SIGNAL \Bloco_4|Mux6~0_combout\ : std_logic;
SIGNAL \Bloco_4|Mux5~0_combout\ : std_logic;
SIGNAL \Bloco_4|Mux4~0_combout\ : std_logic;
SIGNAL \Bloco_4|Mux3~0_combout\ : std_logic;
SIGNAL \Bloco_4|Mux2~0_combout\ : std_logic;
SIGNAL \Bloco_4|Mux1~0_combout\ : std_logic;
SIGNAL \Bloco_4|Mux0~0_combout\ : std_logic;
SIGNAL \carga2[3]~input_o\ : std_logic;
SIGNAL \carga2[2]~input_o\ : std_logic;
SIGNAL \Bloco_3|temp~7_combout\ : std_logic;
SIGNAL \Bloco_3|temp~4_combout\ : std_logic;
SIGNAL \Bloco_3|Add1~0_combout\ : std_logic;
SIGNAL \Bloco_3|temp~5_combout\ : std_logic;
SIGNAL \carga2[0]~input_o\ : std_logic;
SIGNAL \Bloco_3|temp~6_combout\ : std_logic;
SIGNAL \Bloco_3|temp~2_combout\ : std_logic;
SIGNAL \Bloco_3|temp~0_combout\ : std_logic;
SIGNAL \carga2[1]~input_o\ : std_logic;
SIGNAL \Bloco_3|temp~1_combout\ : std_logic;
SIGNAL \Bloco_3|temp~3_combout\ : std_logic;
SIGNAL \Bloco_5|Mux6~0_combout\ : std_logic;
SIGNAL \Bloco_5|Mux5~0_combout\ : std_logic;
SIGNAL \Bloco_5|Mux4~0_combout\ : std_logic;
SIGNAL \Bloco_5|Mux3~0_combout\ : std_logic;
SIGNAL \Bloco_5|Mux2~0_combout\ : std_logic;
SIGNAL \Bloco_5|Mux1~0_combout\ : std_logic;
SIGNAL \Bloco_5|Mux0~0_combout\ : std_logic;
SIGNAL \Bloco_2|temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Bloco_3|temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Bloco_4|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \Bloco_3|ALT_INV_temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Bloco_5|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \Bloco_2|ALT_INV_temp~0_combout\ : std_logic;
SIGNAL \Bloco_2|ALT_INV_temp~1_combout\ : std_logic;
SIGNAL \Bloco_1|ALT_INV_clkout1Hz_signal~q\ : std_logic;
SIGNAL \Bloco_3|ALT_INV_temp~0_combout\ : std_logic;
SIGNAL \Bloco_3|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \Bloco_3|ALT_INV_temp~1_combout\ : std_logic;
SIGNAL \Bloco_2|ALT_INV_temp~6_combout\ : std_logic;
SIGNAL \Bloco_2|ALT_INV_temp~7_combout\ : std_logic;
SIGNAL \Bloco_2|ALT_INV_temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_carga2[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_carga2[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_carga2[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_carga2[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_carga1[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_carga1[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_carga1[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_clear~input_o\ : std_logic;
SIGNAL \ALT_INV_carga1[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_seletor~input_o\ : std_logic;
SIGNAL \ALT_INV_enable~input_o\ : std_logic;
SIGNAL \ALT_INV_load~input_o\ : std_logic;
SIGNAL \Bloco_3|ALT_INV_temp~7_combout\ : std_logic;
SIGNAL \Bloco_3|ALT_INV_temp~6_combout\ : std_logic;
SIGNAL \Bloco_2|ALT_INV_temp~8_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_enable <= enable;
ww_load <= load;
ww_clear <= clear;
ww_seletor <= seletor;
ww_carga1 <= carga1;
ww_carga2 <= carga2;
saida1 <= ww_saida1;
saida2 <= ww_saida2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\Bloco_4|ALT_INV_Mux0~0_combout\ <= NOT \Bloco_4|Mux0~0_combout\;
\Bloco_3|ALT_INV_temp\(0) <= NOT \Bloco_3|temp\(0);
\Bloco_3|ALT_INV_temp\(1) <= NOT \Bloco_3|temp\(1);
\Bloco_3|ALT_INV_temp\(2) <= NOT \Bloco_3|temp\(2);
\Bloco_3|ALT_INV_temp\(3) <= NOT \Bloco_3|temp\(3);
\Bloco_5|ALT_INV_Mux0~0_combout\ <= NOT \Bloco_5|Mux0~0_combout\;
\Bloco_2|ALT_INV_temp~0_combout\ <= NOT \Bloco_2|temp~0_combout\;
\Bloco_2|ALT_INV_temp~1_combout\ <= NOT \Bloco_2|temp~1_combout\;
\Bloco_1|ALT_INV_clkout1Hz_signal~q\ <= NOT \Bloco_1|clkout1Hz_signal~q\;
\Bloco_3|ALT_INV_temp~0_combout\ <= NOT \Bloco_3|temp~0_combout\;
\Bloco_3|ALT_INV_Add1~0_combout\ <= NOT \Bloco_3|Add1~0_combout\;
\Bloco_3|ALT_INV_temp~1_combout\ <= NOT \Bloco_3|temp~1_combout\;
\Bloco_2|ALT_INV_temp~6_combout\ <= NOT \Bloco_2|temp~6_combout\;
\Bloco_2|ALT_INV_temp~7_combout\ <= NOT \Bloco_2|temp~7_combout\;
\Bloco_2|ALT_INV_temp\(2) <= NOT \Bloco_2|temp\(2);
\Bloco_2|ALT_INV_temp\(3) <= NOT \Bloco_2|temp\(3);
\Bloco_2|ALT_INV_temp\(0) <= NOT \Bloco_2|temp\(0);
\Bloco_2|ALT_INV_temp\(1) <= NOT \Bloco_2|temp\(1);
\ALT_INV_carga2[3]~input_o\ <= NOT \carga2[3]~input_o\;
\ALT_INV_carga2[2]~input_o\ <= NOT \carga2[2]~input_o\;
\ALT_INV_carga2[1]~input_o\ <= NOT \carga2[1]~input_o\;
\ALT_INV_carga2[0]~input_o\ <= NOT \carga2[0]~input_o\;
\ALT_INV_carga1[3]~input_o\ <= NOT \carga1[3]~input_o\;
\ALT_INV_carga1[2]~input_o\ <= NOT \carga1[2]~input_o\;
\ALT_INV_carga1[1]~input_o\ <= NOT \carga1[1]~input_o\;
\ALT_INV_clear~input_o\ <= NOT \clear~input_o\;
\ALT_INV_carga1[0]~input_o\ <= NOT \carga1[0]~input_o\;
\ALT_INV_seletor~input_o\ <= NOT \seletor~input_o\;
\ALT_INV_enable~input_o\ <= NOT \enable~input_o\;
\ALT_INV_load~input_o\ <= NOT \load~input_o\;
\Bloco_3|ALT_INV_temp~7_combout\ <= NOT \Bloco_3|temp~7_combout\;
\Bloco_3|ALT_INV_temp~6_combout\ <= NOT \Bloco_3|temp~6_combout\;
\Bloco_2|ALT_INV_temp~8_combout\ <= NOT \Bloco_2|temp~8_combout\;

-- Location: IOOBUF_X18_Y0_N2
\saida1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(0));

-- Location: IOOBUF_X19_Y0_N53
\saida1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(1));

-- Location: IOOBUF_X19_Y0_N2
\saida1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(2));

-- Location: IOOBUF_X18_Y0_N53
\saida1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(3));

-- Location: IOOBUF_X16_Y0_N93
\saida1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(4));

-- Location: IOOBUF_X16_Y0_N59
\saida1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(5));

-- Location: IOOBUF_X16_Y0_N42
\saida1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_4|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_saida1(6));

-- Location: IOOBUF_X11_Y0_N53
\saida2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(0));

-- Location: IOOBUF_X11_Y0_N2
\saida2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(1));

-- Location: IOOBUF_X11_Y0_N19
\saida2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(2));

-- Location: IOOBUF_X12_Y0_N2
\saida2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(3));

-- Location: IOOBUF_X10_Y0_N93
\saida2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(4));

-- Location: IOOBUF_X14_Y0_N2
\saida2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(5));

-- Location: IOOBUF_X14_Y0_N19
\saida2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Bloco_5|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_saida2(6));

-- Location: IOIBUF_X11_Y0_N35
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: LABCELL_X10_Y1_N6
\Bloco_1|clkout1Hz_signal~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_1|clkout1Hz_signal~0_combout\ = ( !\Bloco_1|clkout1Hz_signal~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Bloco_1|ALT_INV_clkout1Hz_signal~q\,
	combout => \Bloco_1|clkout1Hz_signal~0_combout\);

-- Location: FF_X10_Y1_N11
\Bloco_1|clkout1Hz_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \Bloco_1|clkout1Hz_signal~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_1|clkout1Hz_signal~q\);

-- Location: IOIBUF_X12_Y0_N35
\load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\seletor~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_seletor,
	o => \seletor~input_o\);

-- Location: IOIBUF_X19_Y0_N18
\carga1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga1(3),
	o => \carga1[3]~input_o\);

-- Location: IOIBUF_X12_Y0_N52
\enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: LABCELL_X10_Y1_N42
\Bloco_2|temp~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~6_combout\ = ( \enable~input_o\ & ( (!\load~input_o\ & (!\seletor~input_o\)) # (\load~input_o\ & ((!\carga1[3]~input_o\))) ) ) # ( !\enable~input_o\ & ( (!\carga1[3]~input_o\ & \load~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011001100111100001100110011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_seletor~input_o\,
	datac => \ALT_INV_carga1[3]~input_o\,
	datad => \ALT_INV_load~input_o\,
	dataf => \ALT_INV_enable~input_o\,
	combout => \Bloco_2|temp~6_combout\);

-- Location: IOIBUF_X18_Y0_N35
\carga1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga1(2),
	o => \carga1[2]~input_o\);

-- Location: LABCELL_X12_Y1_N0
\Bloco_2|temp~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~8_combout\ = ( \load~input_o\ & ( \carga1[2]~input_o\ ) ) # ( !\load~input_o\ & ( \carga1[2]~input_o\ & ( (!\seletor~input_o\ & \enable~input_o\) ) ) ) # ( !\load~input_o\ & ( !\carga1[2]~input_o\ & ( (!\seletor~input_o\ & \enable~input_o\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000000000000000000001100000011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_seletor~input_o\,
	datac => \ALT_INV_enable~input_o\,
	datae => \ALT_INV_load~input_o\,
	dataf => \ALT_INV_carga1[2]~input_o\,
	combout => \Bloco_2|temp~8_combout\);

-- Location: IOIBUF_X16_Y0_N75
\carga1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga1(0),
	o => \carga1[0]~input_o\);

-- Location: LABCELL_X10_Y1_N12
\Bloco_2|temp~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~7_combout\ = ( \enable~input_o\ & ( (!\load~input_o\ & (!\seletor~input_o\)) # (\load~input_o\ & ((!\carga1[0]~input_o\))) ) ) # ( !\enable~input_o\ & ( (\load~input_o\ & !\carga1[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000011001111110000001100111111000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_seletor~input_o\,
	datac => \ALT_INV_load~input_o\,
	datad => \ALT_INV_carga1[0]~input_o\,
	dataf => \ALT_INV_enable~input_o\,
	combout => \Bloco_2|temp~7_combout\);

-- Location: LABCELL_X10_Y1_N18
\Bloco_2|temp~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~2_combout\ = ( \Bloco_2|temp\(2) & ( \Bloco_2|temp\(0) & ( (!\Bloco_2|temp~7_combout\) # ((\Bloco_2|temp\(3) & !\load~input_o\)) ) ) ) # ( !\Bloco_2|temp\(2) & ( \Bloco_2|temp\(0) & ( (!\Bloco_2|temp~7_combout\) # ((\Bloco_2|temp\(3) & 
-- (\Bloco_2|temp\(1) & !\load~input_o\))) ) ) ) # ( \Bloco_2|temp\(2) & ( !\Bloco_2|temp\(0) & ( (!\Bloco_2|temp~7_combout\ & ((\load~input_o\) # (\Bloco_2|temp\(3)))) # (\Bloco_2|temp~7_combout\ & ((!\load~input_o\))) ) ) ) # ( !\Bloco_2|temp\(2) & ( 
-- !\Bloco_2|temp\(0) & ( (!\Bloco_2|temp~7_combout\ & (((\Bloco_2|temp\(3) & \Bloco_2|temp\(1))) # (\load~input_o\))) # (\Bloco_2|temp~7_combout\ & (((!\load~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011111001100011101111100110011001101110011001101110111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(3),
	datab => \Bloco_2|ALT_INV_temp~7_combout\,
	datac => \Bloco_2|ALT_INV_temp\(1),
	datad => \ALT_INV_load~input_o\,
	datae => \Bloco_2|ALT_INV_temp\(2),
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_2|temp~2_combout\);

-- Location: IOIBUF_X10_Y0_N58
\clear~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: FF_X10_Y1_N26
\Bloco_2|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	asdata => \Bloco_2|temp~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_2|temp\(0));

-- Location: LABCELL_X10_Y1_N15
\Bloco_2|temp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~0_combout\ = ( \Bloco_2|temp\(0) & ( \Bloco_2|temp\(1) ) ) # ( !\Bloco_2|temp\(0) & ( !\Bloco_2|temp\(1) $ (((!\enable~input_o\) # (\seletor~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110100101010101011010010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(1),
	datac => \ALT_INV_seletor~input_o\,
	datad => \ALT_INV_enable~input_o\,
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_2|temp~0_combout\);

-- Location: IOIBUF_X10_Y0_N41
\carga1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga1(1),
	o => \carga1[1]~input_o\);

-- Location: LABCELL_X10_Y1_N57
\Bloco_2|temp~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~1_combout\ = ( \enable~input_o\ & ( \Bloco_2|temp\(0) & ( \Bloco_2|temp\(3) ) ) ) # ( !\enable~input_o\ & ( \Bloco_2|temp\(0) & ( \Bloco_2|temp\(3) ) ) ) # ( \enable~input_o\ & ( !\Bloco_2|temp\(0) & ( !\Bloco_2|temp\(3) $ 
-- ((((\seletor~input_o\) # (\Bloco_2|temp\(2))) # (\Bloco_2|temp\(1)))) ) ) ) # ( !\enable~input_o\ & ( !\Bloco_2|temp\(0) & ( \Bloco_2|temp\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111100000000111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(1),
	datab => \Bloco_2|ALT_INV_temp\(2),
	datac => \ALT_INV_seletor~input_o\,
	datad => \Bloco_2|ALT_INV_temp\(3),
	datae => \ALT_INV_enable~input_o\,
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_2|temp~1_combout\);

-- Location: LABCELL_X10_Y1_N36
\Bloco_2|temp~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~3_combout\ = ( \Bloco_2|temp~1_combout\ & ( (\carga1[1]~input_o\ & \load~input_o\) ) ) # ( !\Bloco_2|temp~1_combout\ & ( (!\load~input_o\ & (\Bloco_2|temp~0_combout\)) # (\load~input_o\ & ((\carga1[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Bloco_2|ALT_INV_temp~0_combout\,
	datac => \ALT_INV_carga1[1]~input_o\,
	datad => \ALT_INV_load~input_o\,
	dataf => \Bloco_2|ALT_INV_temp~1_combout\,
	combout => \Bloco_2|temp~3_combout\);

-- Location: FF_X10_Y1_N38
\Bloco_2|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	d => \Bloco_2|temp~3_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_2|temp\(1));

-- Location: LABCELL_X10_Y1_N51
\Bloco_2|temp~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~4_combout\ = ( \Bloco_2|temp\(1) & ( \Bloco_2|temp\(0) & ( (!\load~input_o\ & (((\Bloco_2|temp\(2) & !\Bloco_2|temp\(3))))) # (\load~input_o\ & (\Bloco_2|temp~8_combout\)) ) ) ) # ( !\Bloco_2|temp\(1) & ( \Bloco_2|temp\(0) & ( 
-- (!\load~input_o\ & (((\Bloco_2|temp\(2) & !\Bloco_2|temp\(3))))) # (\load~input_o\ & (\Bloco_2|temp~8_combout\)) ) ) ) # ( \Bloco_2|temp\(1) & ( !\Bloco_2|temp\(0) & ( (!\load~input_o\ & (((\Bloco_2|temp\(2) & !\Bloco_2|temp\(3))))) # (\load~input_o\ & 
-- (\Bloco_2|temp~8_combout\)) ) ) ) # ( !\Bloco_2|temp\(1) & ( !\Bloco_2|temp\(0) & ( (!\load~input_o\ & ((!\Bloco_2|temp~8_combout\ & (\Bloco_2|temp\(2) & !\Bloco_2|temp\(3))) # (\Bloco_2|temp~8_combout\ & (!\Bloco_2|temp\(2) & \Bloco_2|temp\(3))))) # 
-- (\load~input_o\ & (\Bloco_2|temp~8_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100110001000110110001000100011011000100010001101100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \Bloco_2|ALT_INV_temp~8_combout\,
	datac => \Bloco_2|ALT_INV_temp\(2),
	datad => \Bloco_2|ALT_INV_temp\(3),
	datae => \Bloco_2|ALT_INV_temp\(1),
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_2|temp~4_combout\);

-- Location: FF_X10_Y1_N47
\Bloco_2|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	asdata => \Bloco_2|temp~4_combout\,
	clrn => \ALT_INV_clear~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_2|temp\(2));

-- Location: LABCELL_X10_Y1_N33
\Bloco_2|temp~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_2|temp~5_combout\ = ( \Bloco_2|temp\(1) & ( \Bloco_2|temp\(0) & ( (!\load~input_o\ & ((\Bloco_2|temp\(3)))) # (\load~input_o\ & (!\Bloco_2|temp~6_combout\)) ) ) ) # ( !\Bloco_2|temp\(1) & ( \Bloco_2|temp\(0) & ( (!\load~input_o\ & 
-- ((\Bloco_2|temp\(3)))) # (\load~input_o\ & (!\Bloco_2|temp~6_combout\)) ) ) ) # ( \Bloco_2|temp\(1) & ( !\Bloco_2|temp\(0) & ( (!\load~input_o\ & ((\Bloco_2|temp\(3)))) # (\load~input_o\ & (!\Bloco_2|temp~6_combout\)) ) ) ) # ( !\Bloco_2|temp\(1) & ( 
-- !\Bloco_2|temp\(0) & ( (!\load~input_o\ & (!\Bloco_2|temp\(3) $ (((!\Bloco_2|temp~6_combout\) # (\Bloco_2|temp\(2)))))) # (\load~input_o\ & (!\Bloco_2|temp~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010011001110010001001110111001000100111011100100010011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \Bloco_2|ALT_INV_temp~6_combout\,
	datac => \Bloco_2|ALT_INV_temp\(2),
	datad => \Bloco_2|ALT_INV_temp\(3),
	datae => \Bloco_2|ALT_INV_temp\(1),
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_2|temp~5_combout\);

-- Location: FF_X10_Y1_N2
\Bloco_2|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	asdata => \Bloco_2|temp~5_combout\,
	clrn => \ALT_INV_clear~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_2|temp\(3));

-- Location: LABCELL_X10_Y1_N39
\Bloco_4|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux6~0_combout\ = ( \Bloco_2|temp\(2) & ( (!\Bloco_2|temp\(1) & (!\Bloco_2|temp\(3) $ (\Bloco_2|temp\(0)))) ) ) # ( !\Bloco_2|temp\(2) & ( (\Bloco_2|temp\(0) & (!\Bloco_2|temp\(3) $ (\Bloco_2|temp\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100101000000001010010110100000010100001010000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(3),
	datac => \Bloco_2|ALT_INV_temp\(1),
	datad => \Bloco_2|ALT_INV_temp\(0),
	dataf => \Bloco_2|ALT_INV_temp\(2),
	combout => \Bloco_4|Mux6~0_combout\);

-- Location: LABCELL_X10_Y1_N45
\Bloco_4|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux5~0_combout\ = ( \Bloco_2|temp\(0) & ( (!\Bloco_2|temp\(3) & (!\Bloco_2|temp\(1) & \Bloco_2|temp\(2))) # (\Bloco_2|temp\(3) & (\Bloco_2|temp\(1))) ) ) # ( !\Bloco_2|temp\(0) & ( (\Bloco_2|temp\(2) & ((\Bloco_2|temp\(1)) # (\Bloco_2|temp\(3)))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111100000101101001010000010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(3),
	datac => \Bloco_2|ALT_INV_temp\(1),
	datad => \Bloco_2|ALT_INV_temp\(2),
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_4|Mux5~0_combout\);

-- Location: LABCELL_X10_Y1_N9
\Bloco_4|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux4~0_combout\ = ( \Bloco_2|temp\(3) & ( (\Bloco_2|temp\(2) & ((!\Bloco_2|temp\(0)) # (\Bloco_2|temp\(1)))) ) ) # ( !\Bloco_2|temp\(3) & ( (!\Bloco_2|temp\(2) & (!\Bloco_2|temp\(0) & \Bloco_2|temp\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100001000101010001010100010101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(2),
	datab => \Bloco_2|ALT_INV_temp\(0),
	datac => \Bloco_2|ALT_INV_temp\(1),
	dataf => \Bloco_2|ALT_INV_temp\(3),
	combout => \Bloco_4|Mux4~0_combout\);

-- Location: LABCELL_X10_Y1_N0
\Bloco_4|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux3~0_combout\ = ( \Bloco_2|temp\(0) & ( (!\Bloco_2|temp\(2) & (!\Bloco_2|temp\(1) & !\Bloco_2|temp\(3))) # (\Bloco_2|temp\(2) & (\Bloco_2|temp\(1))) ) ) # ( !\Bloco_2|temp\(0) & ( (!\Bloco_2|temp\(2) & (\Bloco_2|temp\(1) & \Bloco_2|temp\(3))) # 
-- (\Bloco_2|temp\(2) & (!\Bloco_2|temp\(1) & !\Bloco_2|temp\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000100010010001000010001010011001000100011001100100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(2),
	datab => \Bloco_2|ALT_INV_temp\(1),
	datad => \Bloco_2|ALT_INV_temp\(3),
	dataf => \Bloco_2|ALT_INV_temp\(0),
	combout => \Bloco_4|Mux3~0_combout\);

-- Location: LABCELL_X10_Y1_N3
\Bloco_4|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux2~0_combout\ = (!\Bloco_2|temp\(1) & ((!\Bloco_2|temp\(2) & (\Bloco_2|temp\(0))) # (\Bloco_2|temp\(2) & ((!\Bloco_2|temp\(3)))))) # (\Bloco_2|temp\(1) & (((\Bloco_2|temp\(0) & !\Bloco_2|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111100001000010011110000100001001111000010000100111100001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(2),
	datab => \Bloco_2|ALT_INV_temp\(1),
	datac => \Bloco_2|ALT_INV_temp\(0),
	datad => \Bloco_2|ALT_INV_temp\(3),
	combout => \Bloco_4|Mux2~0_combout\);

-- Location: LABCELL_X10_Y1_N24
\Bloco_4|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux1~0_combout\ = ( \Bloco_2|temp\(3) & ( (\Bloco_2|temp\(2) & (!\Bloco_2|temp\(1) & \Bloco_2|temp\(0))) ) ) # ( !\Bloco_2|temp\(3) & ( (!\Bloco_2|temp\(2) & ((\Bloco_2|temp\(0)) # (\Bloco_2|temp\(1)))) # (\Bloco_2|temp\(2) & (\Bloco_2|temp\(1) & 
-- \Bloco_2|temp\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001010111011001000101011101100000000010001000000000001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(2),
	datab => \Bloco_2|ALT_INV_temp\(1),
	datad => \Bloco_2|ALT_INV_temp\(0),
	dataf => \Bloco_2|ALT_INV_temp\(3),
	combout => \Bloco_4|Mux1~0_combout\);

-- Location: LABCELL_X10_Y1_N27
\Bloco_4|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_4|Mux0~0_combout\ = (!\Bloco_2|temp\(0) & ((!\Bloco_2|temp\(2) $ (!\Bloco_2|temp\(3))) # (\Bloco_2|temp\(1)))) # (\Bloco_2|temp\(0) & ((!\Bloco_2|temp\(2) $ (!\Bloco_2|temp\(1))) # (\Bloco_2|temp\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011010111111011101101011111101110110101111110111011010111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_2|ALT_INV_temp\(2),
	datab => \Bloco_2|ALT_INV_temp\(1),
	datac => \Bloco_2|ALT_INV_temp\(0),
	datad => \Bloco_2|ALT_INV_temp\(3),
	combout => \Bloco_4|Mux0~0_combout\);

-- Location: IOIBUF_X14_Y0_N52
\carga2[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga2(3),
	o => \carga2[3]~input_o\);

-- Location: IOIBUF_X10_Y0_N75
\carga2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga2(2),
	o => \carga2[2]~input_o\);

-- Location: MLABCELL_X9_Y1_N6
\Bloco_3|temp~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~7_combout\ = ( \enable~input_o\ & ( (!\load~input_o\ & ((\seletor~input_o\))) # (\load~input_o\ & (\carga2[2]~input_o\)) ) ) # ( !\enable~input_o\ & ( (\carga2[2]~input_o\ & \load~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001100001111001100110000111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_carga2[2]~input_o\,
	datac => \ALT_INV_seletor~input_o\,
	datad => \ALT_INV_load~input_o\,
	dataf => \ALT_INV_enable~input_o\,
	combout => \Bloco_3|temp~7_combout\);

-- Location: MLABCELL_X9_Y1_N39
\Bloco_3|temp~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~4_combout\ = ( \Bloco_3|temp\(0) & ( \Bloco_3|temp\(2) & ( (!\load~input_o\ & (!\Bloco_3|temp\(3))) # (\load~input_o\ & ((\Bloco_3|temp~7_combout\))) ) ) ) # ( !\Bloco_3|temp\(0) & ( \Bloco_3|temp\(2) & ( (!\load~input_o\ & 
-- (!\Bloco_3|temp\(3) & ((!\Bloco_3|temp~7_combout\) # (\Bloco_3|temp\(1))))) # (\load~input_o\ & (((\Bloco_3|temp~7_combout\)))) ) ) ) # ( \Bloco_3|temp\(0) & ( !\Bloco_3|temp\(2) & ( (\load~input_o\ & \Bloco_3|temp~7_combout\) ) ) ) # ( !\Bloco_3|temp\(0) 
-- & ( !\Bloco_3|temp\(2) & ( (\Bloco_3|temp~7_combout\ & (((\Bloco_3|temp\(3) & !\Bloco_3|temp\(1))) # (\load~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001110101000000000101010110001000010111011000100011011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \Bloco_3|ALT_INV_temp\(3),
	datac => \Bloco_3|ALT_INV_temp\(1),
	datad => \Bloco_3|ALT_INV_temp~7_combout\,
	datae => \Bloco_3|ALT_INV_temp\(0),
	dataf => \Bloco_3|ALT_INV_temp\(2),
	combout => \Bloco_3|temp~4_combout\);

-- Location: FF_X9_Y1_N20
\Bloco_3|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	asdata => \Bloco_3|temp~4_combout\,
	clrn => \ALT_INV_clear~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_3|temp\(2));

-- Location: MLABCELL_X9_Y1_N9
\Bloco_3|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|Add1~0_combout\ = ( !\Bloco_3|temp\(1) & ( (!\Bloco_3|temp\(2) & !\Bloco_3|temp\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(2),
	datad => \Bloco_3|ALT_INV_temp\(0),
	dataf => \Bloco_3|ALT_INV_temp\(1),
	combout => \Bloco_3|Add1~0_combout\);

-- Location: MLABCELL_X9_Y1_N30
\Bloco_3|temp~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~5_combout\ = ( \seletor~input_o\ & ( \Bloco_3|Add1~0_combout\ & ( (!\load~input_o\ & (!\enable~input_o\ $ (((!\Bloco_3|temp\(3)))))) # (\load~input_o\ & (((\carga2[3]~input_o\)))) ) ) ) # ( !\seletor~input_o\ & ( \Bloco_3|Add1~0_combout\ & ( 
-- (!\load~input_o\ & ((\Bloco_3|temp\(3)))) # (\load~input_o\ & (\carga2[3]~input_o\)) ) ) ) # ( \seletor~input_o\ & ( !\Bloco_3|Add1~0_combout\ & ( (!\load~input_o\ & ((\Bloco_3|temp\(3)))) # (\load~input_o\ & (\carga2[3]~input_o\)) ) ) ) # ( 
-- !\seletor~input_o\ & ( !\Bloco_3|Add1~0_combout\ & ( (!\load~input_o\ & ((\Bloco_3|temp\(3)))) # (\load~input_o\ & (\carga2[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100000011111100110101001110100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_enable~input_o\,
	datab => \ALT_INV_carga2[3]~input_o\,
	datac => \ALT_INV_load~input_o\,
	datad => \Bloco_3|ALT_INV_temp\(3),
	datae => \ALT_INV_seletor~input_o\,
	dataf => \Bloco_3|ALT_INV_Add1~0_combout\,
	combout => \Bloco_3|temp~5_combout\);

-- Location: FF_X9_Y1_N44
\Bloco_3|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	asdata => \Bloco_3|temp~5_combout\,
	clrn => \ALT_INV_clear~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_3|temp\(3));

-- Location: IOIBUF_X18_Y0_N18
\carga2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga2(0),
	o => \carga2[0]~input_o\);

-- Location: MLABCELL_X9_Y1_N21
\Bloco_3|temp~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~6_combout\ = ( \enable~input_o\ & ( (!\load~input_o\ & ((\seletor~input_o\))) # (\load~input_o\ & (!\carga2[0]~input_o\)) ) ) # ( !\enable~input_o\ & ( (!\carga2[0]~input_o\ & \load~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001111110011000000111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_carga2[0]~input_o\,
	datac => \ALT_INV_seletor~input_o\,
	datad => \ALT_INV_load~input_o\,
	dataf => \ALT_INV_enable~input_o\,
	combout => \Bloco_3|temp~6_combout\);

-- Location: MLABCELL_X9_Y1_N0
\Bloco_3|temp~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~2_combout\ = ( \Bloco_3|temp~6_combout\ & ( \Bloco_3|temp\(2) & ( (!\load~input_o\ & ((!\Bloco_3|temp\(0)) # (\Bloco_3|temp\(3)))) ) ) ) # ( !\Bloco_3|temp~6_combout\ & ( \Bloco_3|temp\(2) & ( ((\Bloco_3|temp\(0)) # (\Bloco_3|temp\(3))) # 
-- (\load~input_o\) ) ) ) # ( \Bloco_3|temp~6_combout\ & ( !\Bloco_3|temp\(2) & ( (!\load~input_o\ & ((!\Bloco_3|temp\(0)) # ((\Bloco_3|temp\(3) & \Bloco_3|temp\(1))))) ) ) ) # ( !\Bloco_3|temp~6_combout\ & ( !\Bloco_3|temp\(2) & ( (((\Bloco_3|temp\(3) & 
-- \Bloco_3|temp\(1))) # (\Bloco_3|temp\(0))) # (\load~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101111111101000001010001001111111011111111010001010100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \Bloco_3|ALT_INV_temp\(3),
	datac => \Bloco_3|ALT_INV_temp\(0),
	datad => \Bloco_3|ALT_INV_temp\(1),
	datae => \Bloco_3|ALT_INV_temp~6_combout\,
	dataf => \Bloco_3|ALT_INV_temp\(2),
	combout => \Bloco_3|temp~2_combout\);

-- Location: FF_X9_Y1_N56
\Bloco_3|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	asdata => \Bloco_3|temp~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_3|temp\(0));

-- Location: MLABCELL_X9_Y1_N48
\Bloco_3|temp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~0_combout\ = ( \enable~input_o\ & ( !\Bloco_3|temp\(1) $ (((!\seletor~input_o\) # (\Bloco_3|temp\(0)))) ) ) # ( !\enable~input_o\ & ( \Bloco_3|temp\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011110000110011001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Bloco_3|ALT_INV_temp\(1),
	datac => \Bloco_3|ALT_INV_temp\(0),
	datad => \ALT_INV_seletor~input_o\,
	dataf => \ALT_INV_enable~input_o\,
	combout => \Bloco_3|temp~0_combout\);

-- Location: IOIBUF_X14_Y0_N35
\carga2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carga2(1),
	o => \carga2[1]~input_o\);

-- Location: MLABCELL_X9_Y1_N27
\Bloco_3|temp~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~1_combout\ = ( \seletor~input_o\ & ( \Bloco_3|temp\(2) & ( \Bloco_3|temp\(3) ) ) ) # ( !\seletor~input_o\ & ( \Bloco_3|temp\(2) & ( \Bloco_3|temp\(3) ) ) ) # ( \seletor~input_o\ & ( !\Bloco_3|temp\(2) & ( !\Bloco_3|temp\(3) $ 
-- ((((!\enable~input_o\) # (\Bloco_3|temp\(1))) # (\Bloco_3|temp\(0)))) ) ) ) # ( !\seletor~input_o\ & ( !\Bloco_3|temp\(2) & ( \Bloco_3|temp\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011111000011100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(0),
	datab => \Bloco_3|ALT_INV_temp\(1),
	datac => \Bloco_3|ALT_INV_temp\(3),
	datad => \ALT_INV_enable~input_o\,
	datae => \ALT_INV_seletor~input_o\,
	dataf => \Bloco_3|ALT_INV_temp\(2),
	combout => \Bloco_3|temp~1_combout\);

-- Location: MLABCELL_X9_Y1_N12
\Bloco_3|temp~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_3|temp~3_combout\ = ( \Bloco_3|temp~1_combout\ & ( (\load~input_o\ & \carga2[1]~input_o\) ) ) # ( !\Bloco_3|temp~1_combout\ & ( (!\load~input_o\ & (\Bloco_3|temp~0_combout\)) # (\load~input_o\ & ((\carga2[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp~0_combout\,
	datac => \ALT_INV_load~input_o\,
	datad => \ALT_INV_carga2[1]~input_o\,
	dataf => \Bloco_3|ALT_INV_temp~1_combout\,
	combout => \Bloco_3|temp~3_combout\);

-- Location: FF_X9_Y1_N14
\Bloco_3|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Bloco_1|clkout1Hz_signal~q\,
	d => \Bloco_3|temp~3_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Bloco_3|temp\(1));

-- Location: MLABCELL_X9_Y1_N18
\Bloco_5|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux6~0_combout\ = ( \Bloco_3|temp\(3) & ( (\Bloco_3|temp\(0) & (!\Bloco_3|temp\(1) $ (!\Bloco_3|temp\(2)))) ) ) # ( !\Bloco_3|temp\(3) & ( (!\Bloco_3|temp\(1) & (!\Bloco_3|temp\(0) $ (!\Bloco_3|temp\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010100000000010101010000000000101000010100000010100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(1),
	datac => \Bloco_3|ALT_INV_temp\(0),
	datad => \Bloco_3|ALT_INV_temp\(2),
	dataf => \Bloco_3|ALT_INV_temp\(3),
	combout => \Bloco_5|Mux6~0_combout\);

-- Location: MLABCELL_X9_Y1_N54
\Bloco_5|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux5~0_combout\ = ( \Bloco_3|temp\(3) & ( (!\Bloco_3|temp\(0) & ((\Bloco_3|temp\(2)))) # (\Bloco_3|temp\(0) & (\Bloco_3|temp\(1))) ) ) # ( !\Bloco_3|temp\(3) & ( (\Bloco_3|temp\(2) & (!\Bloco_3|temp\(1) $ (!\Bloco_3|temp\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100100010000100010010001000110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(1),
	datab => \Bloco_3|ALT_INV_temp\(2),
	datad => \Bloco_3|ALT_INV_temp\(0),
	dataf => \Bloco_3|ALT_INV_temp\(3),
	combout => \Bloco_5|Mux5~0_combout\);

-- Location: MLABCELL_X9_Y1_N15
\Bloco_5|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux4~0_combout\ = ( \Bloco_3|temp\(2) & ( (\Bloco_3|temp\(3) & ((!\Bloco_3|temp\(0)) # (\Bloco_3|temp\(1)))) ) ) # ( !\Bloco_3|temp\(2) & ( (!\Bloco_3|temp\(0) & (!\Bloco_3|temp\(3) & \Bloco_3|temp\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000001100000011110000110000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Bloco_3|ALT_INV_temp\(0),
	datac => \Bloco_3|ALT_INV_temp\(3),
	datad => \Bloco_3|ALT_INV_temp\(1),
	dataf => \Bloco_3|ALT_INV_temp\(2),
	combout => \Bloco_5|Mux4~0_combout\);

-- Location: MLABCELL_X9_Y1_N57
\Bloco_5|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux3~0_combout\ = (!\Bloco_3|temp\(1) & (!\Bloco_3|temp\(3) & (!\Bloco_3|temp\(2) $ (!\Bloco_3|temp\(0))))) # (\Bloco_3|temp\(1) & ((!\Bloco_3|temp\(2) & (!\Bloco_3|temp\(0) & \Bloco_3|temp\(3))) # (\Bloco_3|temp\(2) & (\Bloco_3|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100101000001001010010100000100101001010000010010100101000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(1),
	datab => \Bloco_3|ALT_INV_temp\(2),
	datac => \Bloco_3|ALT_INV_temp\(0),
	datad => \Bloco_3|ALT_INV_temp\(3),
	combout => \Bloco_5|Mux3~0_combout\);

-- Location: MLABCELL_X9_Y1_N51
\Bloco_5|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux2~0_combout\ = ( \Bloco_3|temp\(2) & ( (!\Bloco_3|temp\(3) & ((!\Bloco_3|temp\(1)) # (\Bloco_3|temp\(0)))) ) ) # ( !\Bloco_3|temp\(2) & ( (\Bloco_3|temp\(0) & ((!\Bloco_3|temp\(1)) # (!\Bloco_3|temp\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010001010100010101000101010011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(0),
	datab => \Bloco_3|ALT_INV_temp\(1),
	datac => \Bloco_3|ALT_INV_temp\(3),
	dataf => \Bloco_3|ALT_INV_temp\(2),
	combout => \Bloco_5|Mux2~0_combout\);

-- Location: MLABCELL_X9_Y1_N42
\Bloco_5|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux1~0_combout\ = (!\Bloco_3|temp\(0) & (!\Bloco_3|temp\(2) & (\Bloco_3|temp\(1) & !\Bloco_3|temp\(3)))) # (\Bloco_3|temp\(0) & (!\Bloco_3|temp\(3) $ (((\Bloco_3|temp\(2) & !\Bloco_3|temp\(1))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110100010000010011010001000001001101000100000100110100010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(0),
	datab => \Bloco_3|ALT_INV_temp\(2),
	datac => \Bloco_3|ALT_INV_temp\(1),
	datad => \Bloco_3|ALT_INV_temp\(3),
	combout => \Bloco_5|Mux1~0_combout\);

-- Location: MLABCELL_X9_Y1_N45
\Bloco_5|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Bloco_5|Mux0~0_combout\ = (!\Bloco_3|temp\(0) & ((!\Bloco_3|temp\(2) $ (!\Bloco_3|temp\(3))) # (\Bloco_3|temp\(1)))) # (\Bloco_3|temp\(0) & ((!\Bloco_3|temp\(2) $ (!\Bloco_3|temp\(1))) # (\Bloco_3|temp\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110111101111001111011110111100111101111011110011110111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Bloco_3|ALT_INV_temp\(0),
	datab => \Bloco_3|ALT_INV_temp\(2),
	datac => \Bloco_3|ALT_INV_temp\(3),
	datad => \Bloco_3|ALT_INV_temp\(1),
	combout => \Bloco_5|Mux0~0_combout\);

-- Location: LABCELL_X26_Y42_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


