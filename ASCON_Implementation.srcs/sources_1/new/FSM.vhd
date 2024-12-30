----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 09:37:22
-- Design Name: 
-- Module Name: FSM - FSM_arch
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

entity FSM is
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           data_valid_i : in STD_LOGIC;
           end_i : in STD_LOGIC;
           cipher_valid_i : in STD_LOGIC;
           reset_counter_o : out STD_LOGIC;
           enable_o : out STD_LOGIC;
           data_valid_o : out STD_LOGIC);
end entity;

architecture FSM_arch of FSM is

type fsm_state is (idle, wait_data, enable_data, next_data, finish);
signal current_state : fsm_state;
signal next_state    : fsm_state;

begin
    seq0 : process (clk_i, reset_i) is
    begin	 -- process seq0
        if (reset_i = '1') then		-- asynchronous reset (active high)
            current_state <= idle;
        elsif (clk_i'event and clk_i = '1') then  -- rising clock edge
            current_state <= next_state;
        end if;
    end process seq0;
    
    comb0 : process (current_state, data_valid_i, cipher_valid_i)
    begin
        case current_state is
        
            when idle =>
                if (data_valid_i = '0') then
                    next_state <= wait_data;
                else
                    next_state <= idle;
                end if;
                
            when wait_data =>
                if (data_valid_i = '1') then
                    next_state <= enable_data;
                else
                    next_state <= wait_data;
                end if;
                
            when enable_data =>
                next_state <= next_data;
                
            when next_data =>
                next_state <= finish; 
                
            when finish => 
                if (cipher_valid_i = '1') then
                    next_state <= idle;
                else 
                    next_state <= finish; 
                end if;
            when others =>
                next_state <= idle;
        end case;
    end process comb0;
    
    comb1: process (current_state) is
    begin
        case current_state is
            when idle =>
                enable_o <= '0';
                data_valid_o <= '0';
                
            when wait_data =>
                enable_o <= '0';
                data_valid_o <= '0';
                
            when enable_data =>
                enable_o <= '1';
                data_valid_o <= '0';
                
            when next_data => 
                enable_o <= '0';
                data_valid_o <= '1';
                
            when finish =>
                enable_o <= '0';
                data_valid_o <= '0';
                
        end case;
    end process comb1;    
        
end FSM_arch;
