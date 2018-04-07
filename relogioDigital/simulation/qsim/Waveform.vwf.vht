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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "04/07/2018 18:11:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          relogioDigital
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY relogioDigital_vhd_vec_tst IS
END relogioDigital_vhd_vec_tst;
ARCHITECTURE relogioDigital_arch OF relogioDigital_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carga1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL carga2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL clear : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL load : STD_LOGIC;
SIGNAL saida1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL saida2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL seletor : STD_LOGIC;
COMPONENT relogioDigital
	PORT (
	carga1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	carga2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	clear : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	load : IN STD_LOGIC;
	saida1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	saida2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	seletor : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : relogioDigital
	PORT MAP (
-- list connections between master ports and signals
	carga1 => carga1,
	carga2 => carga2,
	clear => clear,
	clk => clk,
	enable => enable,
	load => load,
	saida1 => saida1,
	saida2 => saida2,
	seletor => seletor
	);
-- carga1[3]
t_prcs_carga1_3: PROCESS
BEGIN
	carga1(3) <= '0';
WAIT;
END PROCESS t_prcs_carga1_3;
-- carga1[2]
t_prcs_carga1_2: PROCESS
BEGIN
	carga1(2) <= '1';
WAIT;
END PROCESS t_prcs_carga1_2;
-- carga1[1]
t_prcs_carga1_1: PROCESS
BEGIN
	carga1(1) <= '1';
WAIT;
END PROCESS t_prcs_carga1_1;
-- carga1[0]
t_prcs_carga1_0: PROCESS
BEGIN
	carga1(0) <= '0';
WAIT;
END PROCESS t_prcs_carga1_0;
-- carga2[3]
t_prcs_carga2_3: PROCESS
BEGIN
	carga2(3) <= '0';
WAIT;
END PROCESS t_prcs_carga2_3;
-- carga2[2]
t_prcs_carga2_2: PROCESS
BEGIN
	carga2(2) <= '1';
WAIT;
END PROCESS t_prcs_carga2_2;
-- carga2[1]
t_prcs_carga2_1: PROCESS
BEGIN
	carga2(1) <= '1';
WAIT;
END PROCESS t_prcs_carga2_1;
-- carga2[0]
t_prcs_carga2_0: PROCESS
BEGIN
	carga2(0) <= '0';
WAIT;
END PROCESS t_prcs_carga2_0;

-- clear
t_prcs_clear: PROCESS
BEGIN
	clear <= '0';
	WAIT FOR 910000 ps;
	clear <= '1';
WAIT;
END PROCESS t_prcs_clear;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- enable
t_prcs_enable: PROCESS
BEGIN
	enable <= '1';
WAIT;
END PROCESS t_prcs_enable;

-- load
t_prcs_load: PROCESS
BEGIN
	load <= '1';
	WAIT FOR 80000 ps;
	load <= '0';
WAIT;
END PROCESS t_prcs_load;

-- seletor
t_prcs_seletor: PROCESS
BEGIN
	seletor <= '1';
	WAIT FOR 390000 ps;
	seletor <= '0';
WAIT;
END PROCESS t_prcs_seletor;
END relogioDigital_arch;
