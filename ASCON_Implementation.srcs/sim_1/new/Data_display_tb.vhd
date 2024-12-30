----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2023 11:13:01
-- Design Name: 
-- Module Name: Data_display_tb - Data_display_tb_arch
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


entity Data_display_tb is
end Data_display_tb;      

architecture Data_display_tb_arch of Data_display_tb is

component Data_display is 
    Port ( data_i : in STD_LOGIC_VECTOR (127 downto 0);
           display_data_i : in STD_LOGIC_VECTOR (3 downto 0);
           data_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;  

signal data_i_s : STD_LOGIC_VECTOR (127 downto 0); 
signal display_data_i_s : STD_LOGIC_VECTOR (3 downto 0);
signal data_o_s : STD_LOGIC_VECTOR (7 downto 0);

begin

DUT : Data_display port map(
    data_i => data_i_s,
    display_data_i => display_data_i_s,
    data_o => data_o_s);
    
-- Stimuli

data_i_s <= x"00112233445566778899AABBCCDDEEFF";
display_data_i_s <= ('0' & x"0"), ('0' & x"1") after 20 ns, ('0' & x"2") after 50 ns, ('0' & x"3") after 60 ns;

end Data_display_tb_arch;
