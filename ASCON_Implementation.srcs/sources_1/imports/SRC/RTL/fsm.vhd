-------------------------------------------------------------------------------
-- Title      : FSM pour init phase
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : permutation_full.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-08-25
-- Last update: 2022-10-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: machine d'états qui gère la phase d'inittalisation
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2022-08-25  1.0	rigaud	Created
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.ascon_pack.all;

entity fsm is
  
  port (
    clock_i	 : in std_logic;
    resetb_i	 : in std_logic;
    start_i	 : in std_logic;
    data_valid_i : in std_logic;
    round_i	 : in bit4;
    block_i	 : in bit4;

    data_sel_o	   : out std_logic;
    en_reg_state_o : out std_logic;
    en_cipher_o	   : out std_logic;
    en_tag_o	   : out std_logic;
    cipher_valid_o : out std_logic;
    end_o	   : out std_logic;

    en_cpt_o	 : out std_logic;
    en_cpt_2_o	 : out std_logic;
    init_a_o	 : out std_logic;
    init_b_o	 : out std_logic;
    init_cpt_2_o : out std_logic;

    en_xor_key_full_o  : out std_logic;
    en_xor_lsb_o       : out std_logic;
    en_xor_data_o      : out std_logic;
    en_xor_key_final_o : out std_logic);

end entity fsm;

architecture fsm_arch of fsm is

  type fsm_state is (idle, conf_init, end_conf_init, init, end_init,
		     wait_da, idle_da, conf_da, end_conf_da, da, end_da,
		     wait_m1, idle_m1, conf_m1, end_conf_m1, m1, end_m1,
		     conf_final, end_conf_final, final, end_final,
		     idle_start, re_start);
  signal current_state : fsm_state;
  signal next_state    : fsm_state;
  
begin  -- architecture fsm_arch

  seq0 : process (clock_i, resetb_i) is
  begin	 -- process seq0
    if (resetb_i = '0') then		-- asynchronous reset (active low)
      current_state <= idle;
    elsif (clock_i'event and clock_i = '1') then  -- rising clock edge
      current_state <= next_state;
    end if;
  end process seq0;

  comb_0 : process (current_state, start_i, data_valid_i, round_i, block_i) is
  begin	 -- process comb_0
    case current_state is
      when idle =>
	if (start_i = '1') then
	  next_state <= conf_init;
	else
	  next_state <= idle;
	end if;
      when conf_init =>
	next_state <= end_conf_init;
      when end_conf_init =>
	next_state <= init;
      when init =>
	if (round_i = x"A") then
	  next_state <= end_init;
	else
	  next_state <= init;
	end if;
      when end_init=>
	next_state <= wait_da;
	  when wait_da => 
	if (data_valid_i = '0') then
	  next_state <= idle_da;
	else
	  next_state <= wait_da;
	end if;
      when idle_da =>
	if (data_valid_i = '1') then
	  next_state <= conf_da;
	else
	  next_state <= idle_da;
	end if;
      when conf_da =>
	next_state <= end_conf_da;
      when end_conf_da =>
	next_state <= da;
      when da =>
	if (round_i = x"A") then
	  next_state <= end_da;
	else
	  next_state <= da;
	end if;
      when end_da =>
	next_state <= wait_m1;
	  when wait_m1 => 
	if (data_valid_i = '0') then
	   next_state <= idle_m1;
	else
	   next_state <= wait_m1;
	end if;
      when idle_m1 =>
	if (data_valid_i = '1') then
	  if (block_i = x"3") then
	    next_state <= conf_final;
	  else
	    next_state <= conf_m1;
	  end if;
	else
	  next_state <= idle_m1;
	end if;
      when conf_m1 =>
	next_state <= end_conf_m1;
      when end_conf_m1 =>
	next_state <= m1;
      when m1 =>
	if (round_i = x"A") then
	  next_state <= end_m1;
	else
	  next_state <= m1;
	end if;
      when end_m1 =>
	next_state <= wait_m1;

      when conf_final =>
	next_state <= end_conf_final;
      when end_conf_final =>
	next_state <= final;
      when final =>
	if (round_i = x"A") then
	  next_state <= end_final;
	else
	  next_state <= final;
	end if;
      when end_final =>
	next_state <= idle_start;
      when idle_start =>
	if (start_i = '0') then
	  next_state <= re_start;
	else
	  next_state <= idle_start;
	end if;
      when re_start =>
	if (start_i = '1') then
	  next_state <= conf_init;
	else
	  next_state <= re_start;
	end if;
      when others => next_state <= idle;
    end case;
  end process comb_0;

  comb_1 : process (current_state) is
  begin	 -- process comb_1
    case current_state is
      when idle =>
	data_sel_o     <= '0';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when conf_init =>
	data_sel_o     <= '0';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '1';
	init_b_o     <= '0';
	en_cpt_2_o   <= '1';
	init_cpt_2_o <= '1';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_conf_init =>
	data_sel_o     <= '0';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when init =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_init =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '1';

      when wait_da =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when idle_da =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when conf_da =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '1';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_conf_da =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '1';
	en_xor_key_final_o <= '0';

      when da =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_da =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '1';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when wait_m1 =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when idle_m1 =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when conf_m1 =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '1';
	en_cpt_2_o   <= '1';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_conf_m1 =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '1';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '1';
	en_xor_key_final_o <= '0';

      when m1 =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_m1 =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when conf_final =>
	data_sel_o     <= '1';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '1';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_conf_final =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '1';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '1';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '1';
	en_xor_key_final_o <= '0';

      when final =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '0';

	en_cpt_o     <= '1';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when end_final =>
	data_sel_o     <= '1';
	en_reg_state_o <= '1';
	en_cipher_o    <= '0';
	en_tag_o       <= '1';
	cipher_valid_o <= '1';
	end_o	       <= '1';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '1';
	
      when idle_start =>
	data_sel_o     <= '0';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '1';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when re_start =>
	data_sel_o     <= '0';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '1';
	end_o	       <= '1';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';

      when others =>
	data_sel_o     <= '0';
	en_reg_state_o <= '0';
	en_cipher_o    <= '0';
	en_tag_o       <= '0';
	cipher_valid_o <= '0';
	end_o	       <= '0';

	en_cpt_o     <= '0';
	init_a_o     <= '0';
	init_b_o     <= '0';
	en_cpt_2_o   <= '0';
	init_cpt_2_o <= '0';

	en_xor_key_full_o  <= '0';
	en_xor_lsb_o	   <= '0';
	en_xor_data_o	   <= '0';
	en_xor_key_final_o <= '0';
    end case;
  end process comb_1;
end architecture fsm_arch;
