
-------------------------------------------------------------------------------
-- Title      : Permutation block fully completed en for reg_state
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
-- Description:	 assemblage des 3 transformations et des differents xors qui
-- les entourent
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2022-08-25  1.0	rigaud	Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.ascon_pack.all;

entity permutation_full_w_en is
  
  port (
    clock_i	       : in  std_logic;
    resetb_i	       : in  std_logic;
    data_sel_i	       : in  std_logic;
    en_reg_state_i     : in  std_logic;
    en_cipher_i	       : in  std_logic;
    en_tag_i	       : in  std_logic;
    en_xor_key_full_i  : in  std_logic;
    en_xor_lsb_i       : in  std_logic;
    en_xor_data_i      : in  std_logic;
    en_xor_key_final_i : in  std_logic;
    key_i	       : in  bit128;
    data_i	       : in  bit64;
    round_i	       : in  bit4;
    state_i	       : in  type_state;
    state_o	       : out type_state;
    cipher_o	       : out bit64;
    tag_o	       : out bit128);

end entity permutation_full_w_en;

architecture permutation_full_w_en_arch of permutation_full_w_en is

  component mux_state is
    port (
      sel_i   : in  std_logic;
      data1_i : in  type_state;
      data2_i : in  type_state;
      data_o  : out type_state);
  end component mux_state;

  component xor_begin_perm is
    port (
      state_i	    : in  type_state;
      key_i	    : in  bit128;
      data_i	    : in  bit64;
      en_xor_data_i : in  std_logic;
      en_xor_key_i  : in  std_logic;
      state_o	    : out type_state);
  end component xor_begin_perm;

  component register_w_en is
    generic (
      nb_bits_g : natural);
    port (
      clock_i  : in  std_logic;
      resetb_i : in  std_logic;
      en_i     : in  std_logic;
      data_i   : in  std_logic_vector(nb_bits_g-1 downto 0);
      data_o   : out std_logic_vector(nb_bits_g-1 downto 0));
  end component register_w_en;

  component constant_addition is
    port (
      state_i : in  type_state;
      round_i : in  bit4;
      state_o : out type_state);
  end component constant_addition;

  component substitution_layer is
    port (
      state_i : in  type_state;
      state_o : out type_state);
  end component substitution_layer;

  component diffusion_layer is
    port (
      state_i : in  type_state;
      state_o : out type_state);
  end component diffusion_layer;

  component xor_end_perm is
    port (
      state_i	   : in	 type_state;
      en_xor_key_i : in	 std_logic;
      en_xor_lsb_i : in	 std_logic;
      key_i	   : in	 bit128;
      state_o	   : out type_state);
  end component xor_end_perm;

  component state_register_w_en is
    port (
      clock_i  : in  std_logic;
      resetb_i : in  std_logic;
      en_i     : in  std_logic;
      data_i   : in  type_state;
      data_o   : out type_state);
  end component state_register_w_en;

  signal state_mux_s		: type_state;  -- sortie du multiplexeur
  signal state_xor_begin_perm_s : type_state;  -- sortie du xor en debut de permutation
  signal state_constadd_s	: type_state;  -- sortie de l'additionn de constante
  signal state_sub_s		: type_state;  -- sortie de la substitution
  signal state_diff_s		: type_state;  -- sortie de la diffuion lineaire
  signal state_xor_end_perm_s	: type_state;  -- sortie du xor en fin de perm
  signal state_perm_s		: type_state;  -- sortie du registre

  signal tag_s : bit128;
  
begin  -- architecture permutation_full_w_en_arch

  mux_state_1 : mux_state
    port map (
      sel_i   => data_sel_i,
      data1_i => state_i,
      data2_i => state_perm_s,
      data_o  => state_mux_s);

  xor_begin_perm_1 : xor_begin_perm
    port map (
      state_i	    => state_mux_s,
      key_i	    => key_i,
      data_i	    => data_i,
      en_xor_data_i => en_xor_data_i,
      en_xor_key_i  => en_xor_key_full_i,
      state_o	    => state_xor_begin_perm_s);

  --reg pour cipherenable sur en_cypher_i
  register_w_en_1 : register_w_en
    generic map (
      nb_bits_g => 64)
    port map (
      clock_i  => clock_i,
      resetb_i => resetb_i,
      en_i     => en_cipher_i,
      data_i   => state_xor_begin_perm_s(0),
      data_o   => cipher_o);

  constant_addition_1 : constant_addition
    port map (
      state_i => state_xor_begin_perm_s,
      round_i => round_i,
      state_o => state_constadd_s);

  substitution_layer_1 : substitution_layer
    port map (
      state_i => state_constadd_s,
      state_o => state_sub_s);

  diffusion_layer_1 : diffusion_layer
    port map (
      state_i => state_sub_s,
      state_o => state_diff_s);

  xor_end_perm_1 : xor_end_perm
    port map (
      state_i	   => state_diff_s,
      en_xor_key_i => en_xor_key_final_i,
      en_xor_lsb_i => en_xor_lsb_i,
      key_i	   => key_i,
      state_o	   => state_xor_end_perm_s);

  state_register_1 : state_register_w_en
    port map (
      clock_i  => clock_i,
      resetb_i => resetb_i,
      en_i     => en_reg_state_i,
      data_i   => state_xor_end_perm_s,
      data_o   => state_perm_s);

  state_o <= state_perm_s;

  tag_s <= state_xor_end_perm_s(3)&state_xor_end_perm_s(4);

  register_w_en_2 : register_w_en
    generic map (
      nb_bits_g => 128)
    port map (
      clock_i  => clock_i,
      resetb_i => resetb_i,
      en_i     => en_tag_i,
      data_i   => tag_s,
      data_o   => tag_o);
end architecture permutation_full_w_en_arch;

configuration permutation_full_w_en_conf of permutation_full_w_en is

  for permutation_full_w_en_arch
    for all : mux_state
      use entity lib_rtl.mux_state(mux_state_arch);
    end for;

    for all : xor_begin_perm
      use entity lib_rtl.xor_begin_perm(xor_begin_perm_arch);
    end for;

    for all : constant_addition
      use entity LIB_RTL.constant_addition(constant_addition_arch);
    end for;
    for all : substitution_layer
      use configuration LIB_RTL.substitution_layer_conf;
    end for;
    for all : diffusion_layer
      use entity LIB_RTL.diffusion_layer(diffusion_layer_arch);
    end for;
    for all : state_register_w_en
      use entity LIB_RTL.state_register_w_en(state_register_w_en_arch);
    end for;
    for all : register_w_en
      use entity LIB_RTL.register_w_en(register_w_en_arch);
    end for;
  end for;

end configuration permutation_full_w_en_conf;
