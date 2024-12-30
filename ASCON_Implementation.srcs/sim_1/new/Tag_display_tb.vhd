----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2023 11:13:01
-- Design Name: 
-- Module Name: Tag_display_tb - Tag_display_tb_arch
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


entity Tag_display_tb is
end Tag_display_tb;

architecture Tag_display_tb_arch of Tag_display_tb is

component Tag_display is 
    Port ( cipher_i : in STD_LOGIC_VECTOR (63 downto 0);
           tag_i : in STD_LOGIC_VECTOR (127 downto 0);
           display_tag_i : in STD_LOGIC;
           data_o : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal cipher_i_s : STD_LOGIC_VECTOR (63 downto 0);
signal tag_i_s : STD_LOGIC_VECTOR (127 downto 0);
signal display_tag_i_s : STD_LOGIC;
signal data_o_s : STD_LOGIC_VECTOR (127 downto 0);

begin

DUT : Tag_display port map(
    cipher_i => cipher_i_s,
    tag_i => tag_i_s,
    display_tag_i => display_tag_i_s,
    data_o => data_o_s);
 
 -- Stimuli
 
 cipher_i_s <= x"ABCDABCD98765432";
 tag_i_s <= x"FFFFEEEEDDDDCCCCBBBBAAAA99998888";
 display_tag_i_s <= '0', '1' after 30 ns, '0' after 40ns;  


end Tag_display_tb_arch;
