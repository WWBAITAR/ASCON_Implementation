----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2023 10:26:55
-- Design Name: 
-- Module Name: Tag_display - Tag_display_arch
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

entity Tag_display is
    Port ( cipher_i : in bit64;
           tag_i : in bit128;
           display_tag_i : in STD_LOGIC;
           data_o : out bit128);
end Tag_display;

architecture Tag_display_arch of Tag_display is

begin
data_o <= (x"0000000000000000" & cipher_i) when display_tag_i = '0' else tag_i;

end Tag_display_arch;
