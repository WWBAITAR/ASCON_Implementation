----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 08:38:08
-- Design Name: 
-- Module Name: counter - counter_arch
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
USE IEEE.numeric_std.all;

entity counter is
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           a_i : in STD_LOGIC;
           cpt_o : out STD_LOGIC_VECTOR(2 downto 0));
end counter;

architecture counter_arch of counter is

signal cpt_s : integer range 0 to 4;

begin
    seq: process(clk_i, reset_i, a_i)
    begin
        if reset_i = '1' then
            cpt_s <= 0;
        elsif clk_i'event and clk_i = '1' then
            if a_i = '1' then
                if cpt_s >= 4 then
                    cpt_s <= 0;
                else 
                    cpt_s <= cpt_s + 1;
                end if;
            else
                cpt_s <= cpt_s;
            end if; 
        end if;
    end process;
    
    cpt_o <= std_logic_vector(to_unsigned(cpt_s, 3));

end counter_arch;
