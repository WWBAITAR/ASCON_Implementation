----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2023 10:54:27
-- Design Name: 
-- Module Name: Data_display - Data_display_arch
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

library LIB_RTL;
use LIB_RTL.ascon_pack.all;

entity Data_display is
    Port ( data_i : in bit128;
           display_data_i : in bit4;
           data_o : out bit8);
end Data_display;

architecture Data_display_arch of Data_display is

begin

with display_data_i select
data_o <= data_i (7 downto 0) when x"0",
          data_i (15 downto 8) when x"1",
          data_i (23 downto 16) when x"2",
          data_i (31 downto 24) when x"3",
          data_i (39 downto 32) when x"4",
          data_i (47 downto 40) when x"5",
          data_i (55 downto 48) when x"6",
          data_i (63 downto 56) when x"7",
          data_i (71 downto 64) when x"8",
          data_i (79 downto 72) when x"9",
          data_i (87 downto 80) when x"A",
          data_i (95 downto 88) when x"B",
          data_i (103 downto 96) when x"C",
          data_i (111 downto 104) when x"D",
          data_i (119 downto 112) when x"E",
          data_i (127 downto 120) when x"F",
          x"00" when others;

end Data_display_arch;
