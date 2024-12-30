-------------------------------------------------------------------------------
-- Title      : ASCON TOP LEVEL CIRCUIT
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : ascon_top.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-10-14
-- Last update: 2022-10-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: achitecture structurelle du circuit ASCON au top level
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2022-10-14  1.0	rigaud	Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.ascon_pack.all;

entity ascon_top is
  port(
    clock_i	   : in	 std_logic;
    resetb_i	   : in	 std_logic;
    start_i	   : in	 std_logic;
    data_i	   : in	 bit64;
    data_valid_i   : in	 std_logic;
    key_i	   : in	 bit128;
    nonce_i	   : in	 bit128;
    cipher_o	   : out bit64;
    cipher_valid_o : out std_logic;
    tag_o	   : out bit128;
    end_o	   : out std_logic
    );
end entity ascon_top;


architecture ascon_top_arch of ascon_top is

  component fsm is
    port (
      clock_i		 : in  std_logic;
      resetb_i		 : in  std_logic;
      start_i		 : in  std_logic;
      data_valid_i	 : in  std_logic;
      round_i		 : in  bit4;
      block_i		 : in  bit4;
      data_sel_o	 : out std_logic;
      en_reg_state_o	 : out std_logic;
      en_cipher_o	 : out std_logic;
      en_tag_o		 : out std_logic;
      cipher_valid_o	 : out std_logic;
      end_o		 : out std_logic;
      en_cpt_o		 : out std_logic;
      en_cpt_2_o	 : out std_logic;
      init_a_o		 : out std_logic;
      init_b_o		 : out std_logic;
      init_cpt_2_o	 : out std_logic;
      en_xor_key_full_o	 : out std_logic;
      en_xor_lsb_o	 : out std_logic;
      en_xor_data_o	 : out std_logic;
      en_xor_key_final_o : out std_logic);
  end component fsm;

  component permutation_full_w_en is
    port (
      clock_i		 : in  std_logic;
      resetb_i		 : in  std_logic;
      data_sel_i	 : in  std_logic;
      en_reg_state_i	 : in  std_logic;
      en_cipher_i	 : in  std_logic;
      en_tag_i		 : in  std_logic;
      en_xor_key_full_i	 : in  std_logic;
      en_xor_lsb_i	 : in  std_logic;
      en_xor_data_i	 : in  std_logic;
      en_xor_key_final_i : in  std_logic;
      key_i		 : in  bit128;
      data_i		 : in  bit64;
      round_i		 : in  bit4;
      state_i		 : in  type_state;
      state_o		 : out type_state;
      cipher_o		 : out bit64;
      tag_o		 : out bit128);
  end component permutation_full_w_en;

  component compteur_double_init is
    port (
      clock_i  : in  std_logic;
      resetb_i : in  std_logic;
      en_i     : in  std_logic;
      init_a_i : in  std_logic;
      init_b_i : in  std_logic;
      cpt_o    : out bit4);
  end component compteur_double_init;

  component compteur_simple_init is
    port (
      clock_i  : in  std_logic;
      resetb_i : in  std_logic;
      en_i     : in  std_logic;
      init_a_i : in  std_logic;
      cpt_o    : out bit4);
  end component compteur_simple_init;

  signal init_a_s     : std_logic;
  signal init_b_s     : std_logic;
  signal en_cpt_s     : std_logic;
  signal en_cpt_2_s   : std_logic;
  signal init_cpt_2_s : std_logic;


  signal data_sel_s	    : std_logic;
  signal en_reg_state_s	    : std_logic;
  signal en_tag_s	    : std_logic;
  signal en_cipher_s	    : std_logic;
  signal round_s	    : bit4;
  signal block_s	    : bit4;
  signal state_i_s	    : type_state;
  signal state_o_s	    : type_state;
  signal en_xor_key_full_s  : std_logic;
  signal en_xor_lsb_s	    : std_logic;
  signal en_xor_data_s	    : std_logic;
  signal en_xor_key_final_s : std_logic;
  signal key_s		    : bit128;
  signal tag_s		    : bit128;


begin  -- architecture ascon_top_arch

  state_i_s(0) <= x"80400C0600000000";	   -- IV de ref constant
  state_i_s(1) <= key_i(127 downto 64);	   -- key de ref MSB
  state_i_s(2) <= key_i(63 downto 0);	   -- key de ref LSB
  state_i_s(3) <= nonce_i(127 downto 64);  -- nonce MSB
  state_i_s(4) <= nonce_i(63 downto 0);	   -- nonce LSB

  permutation_full_w_en_1 : permutation_full_w_en
    port map (
      clock_i		 => clock_i,
      resetb_i		 => resetb_i,
      data_sel_i	 => data_sel_s,
      en_reg_state_i	 => en_reg_state_s,
      en_cipher_i	 => en_cipher_s,
      en_tag_i		 => en_tag_s,
      en_xor_key_full_i	 => en_xor_key_full_s,
      en_xor_lsb_i	 => en_xor_lsb_s,
      en_xor_data_i	 => en_xor_data_s,
      en_xor_key_final_i => en_xor_key_final_s,
      key_i		 => key_i,
      data_i		 => data_i,
      round_i		 => round_s,
      state_i		 => state_i_s,
      state_o		 => state_o_s,
      cipher_o		 => cipher_o,
      tag_o		 => tag_o);

  compteur_double_init_1 : compteur_double_init
    port map (
      clock_i  => clock_i,
      resetb_i => resetb_i,
      en_i     => en_cpt_s,
      init_a_i => init_a_s,
      init_b_i => init_b_s,
      cpt_o    => round_s);

  compteur_simple_init_1 : compteur_simple_init
    port map (
      clock_i  => clock_i,
      resetb_i => resetb_i,
      en_i     => en_cpt_2_s,
      init_a_i => init_cpt_2_s,
      cpt_o    => block_s);

  fsm_1 : fsm
    port map (
      clock_i		 => clock_i,
      resetb_i		 => resetb_i,
      start_i		 => start_i,
      data_valid_i	 => data_valid_i,
      round_i		 => round_s,
      block_i		 => block_s,
      data_sel_o	 => data_sel_s,
      en_reg_state_o	 => en_reg_state_s,
      en_cipher_o	 => en_cipher_s,
      en_tag_o		 => en_tag_s,
      cipher_valid_o	 => cipher_valid_o,
      end_o		 => end_o,
      en_cpt_o		 => en_cpt_s,
      init_a_o		 => init_a_s,
      init_b_o		 => init_b_s,
      en_cpt_2_o	 => en_cpt_2_s,
      init_cpt_2_o	 => init_cpt_2_s,
      en_xor_key_full_o	 => en_xor_key_full_s,
      en_xor_lsb_o	 => en_xor_lsb_s,
      en_xor_data_o	 => en_xor_data_s,
      en_xor_key_final_o => en_xor_key_final_s);

end architecture ascon_top_arch;

configuration ascon_top_conf of ascon_top is

  for ascon_top_arch

    for all : fsm
      use entity LIB_RTL.fsm(fsm_arch);
    end for;
    for all : permutation_full_w_en
      use configuration LIB_RTL.permutation_full_w_en_conf;
    end for;
    for all : compteur_double_init
      use entity LIB_RTL.compteur_double_init(compteur_double_init_arch);
    end for;
    for all : compteur_simple_init
      use entity LIB_RTL.compteur_simple_init(compteur_simple_init_arch);
    end for;
    
  end for;

end configuration ascon_top_conf;
