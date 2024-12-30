----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 09:10:17
-- Design Name: 
-- Module Name: counter_tb - counter_tb_arch
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

entity counter_tb is
end counter_tb;

architecture counter_tb_arch of counter_tb is

component counter is
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           a_i : in STD_LOGIC;
           cpt_o : out STD_LOGIC_VECTOR(1 downto 0));
end component;

signal clk_i_s : std_logic;
signal reset_i_s : std_logic;
signal a_i_s : std_logic;
signal cpt_o_s : std_logic_vector (1 downto 0);

begin

    DUT: counter port map (
        clk_i => clk_i_s,
        reset_i => reset_i_s,
        a_i => a_i_s,
        cpt_o => cpt_o_s);
        
    -- STIMULIS
    
    tb: process
    begin
        clk_i_s <= '0'; wait for 20 ns;
        clk_i_s <= '1'; wait for 20 ns;
    end process;
    
    reset_i_s <= '1', '0' after 60 ns;
    a_i_s <= '0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns;

end counter_tb_arch;
