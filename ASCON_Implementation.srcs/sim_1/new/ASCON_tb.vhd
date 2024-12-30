----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 13:39:25
-- Design Name: 
-- Module Name: ASCON_tb - ASCON_tb_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASCON_tb is
end ASCON_tb;

architecture ASCON_tb_arch of ASCON_tb is

--------- COMPONENT DECLARATION -------------

component ASCON is 
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           start_i : in STD_LOGIC;
           data_valid_i : in STD_LOGIC;
           DisplayTag_i : in STD_LOGIC;
           DisplayData_i : in STD_LOGIC_VECTOR (3 downto 0);
           Leds_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

----------- SIGNALS DECLARATION --------------

signal clk_i_s : STD_LOGIC := '0';
signal reset_i_s : STD_LOGIC;
signal start_i_s : STD_LOGIC;
signal data_valid_i_s : STD_LOGIC;
signal DisplayTag_i_s : STD_LOGIC;
signal DisplayData_i_s : STD_LOGIC_VECTOR (3 downto 0);
signal Leds_o_s : STD_LOGIC_VECTOR (7 downto 0);

begin -- BEGIN ARCHITECTURE

----------- COMPONENT INSTATIATION -----------------------

DUT: ASCON port map (
    clk_i => clk_i_s,
    reset_i => reset_i_s,
    start_i => start_i_s,
    data_valid_i => data_valid_i_s,
    DisplayTag_i => DisplayTag_i_s,
    DisplayData_i => DisplayData_i_s,
    Leds_o => Leds_o_s);
    
-- STIMULIS  
  
clk_i_s <= not clk_i_s after 10 ns;
  
P0: process is 
begin
    reset_i_s <= '1';
    start_i_s <= '0';
    data_valid_i_s <= '0';
    DisplayTag_i_s <= '0';
    DisplayData_i_s <= "0000";
    
    wait for 105 ns;
    reset_i_s <= '0';
    
    wait for 25 ns;
    start_i_s <= '1';
    
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    data_valid_i_s <= '1';
    wait for 20 ns;
    data_valid_i_s <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;

    
--    data_valid_i_s <= '1';
--    DisplayTag_i_s <= '0';
--    DisplayData_i_s <= "0001";
--    wait for 20 ns;
--    data_valid_i_s <= '0';
--    wait for 20 ns;
--    wait for 20 ns;
    
--    data_valid_i_s <= '1';
--    DisplayTag_i_s <= '0';
--    DisplayData_i_s <= "0010";
--    wait for 20 ns;
--    data_valid_i_s <= '0';
--    wait for 20 ns;
--    wait for 20 ns;

--    data_valid_i_s <= '1';
--    wait for 20 ns;
--    data_valid_i_s <= '0';
--    wait for 20 ns;
--    wait for 20 ns;

--    data_valid_i_s <= '1';
--    wait for 20 ns;
--    data_valid_i_s <= '0';
--    wait for 20 ns;
--    wait for 20 ns;
    
    
    wait for 20 ns;
    wait for 20 ns;
    start_i_s	 <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    
end process;
      
end ASCON_tb_arch;
