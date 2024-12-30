-- File	      : xor_begin_perm.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-08-25
-- Last update: 2022-09-28
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:	 xor en debut de permutation (donnee associee ou plain text)
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

entity xor_begin_perm is
  
  port (
    state_i	  : in	type_state;
    key_i	  : in	bit128;
    data_i	  : in	bit64;
    en_xor_data_i : in	std_logic;  --active xor donnée associée ou plaintext
    en_xor_key_i  : in	std_logic;  --active xor avec cle pour la finalisation
    state_o	  : out type_state);

end entity xor_begin_perm;

architecture xor_begin_perm_arch of xor_begin_perm is

  signal key_add_s : bit128;
  signal x1_s	   : bit64;
  signal x2_s	   : bit64;

begin  -- architecture xor_begin_perm_arch

  -- premier mot de l'état
  state_o(0) <= state_i(0) xor data_i when en_xor_data_i = '1' else
		state_i(0);

  -- deuxieme et troisième mot
  x1_s	    <= state_i(1);
  x2_s	    <= state_i(2);
  key_add_s <= (x1_s & x2_s) xor key_i when en_xor_key_i = '1' else
	       (x1_s & x2_s);
  state_o(1) <= key_add_s(127 downto 64);
  state_o(2) <= key_add_s(63 downto 0);

-- troisieme mot de l'état
  state_o(3) <= state_i(3);
  state_o(4) <= state_i(4);
  
  

end architecture xor_begin_perm_arch;
