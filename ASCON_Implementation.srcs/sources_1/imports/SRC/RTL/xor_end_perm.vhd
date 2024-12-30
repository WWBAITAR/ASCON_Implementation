
-------------------------------------------------------------------------------
-- Title      : xor end of permution
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : xor_init.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-08-25
-- Last update: 2022-10-12
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:	 xor de la cle en fin de permutation et du pod faible en phase
-- donnee associee
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


entity xor_end_perm is
  
  port (
    state_i	 : in  type_state;
    en_xor_key_i : in  std_logic;
    en_xor_lsb_i : in  std_logic;
    key_i	 : in  bit128;
    state_o	 : out type_state);

end entity xor_end_perm;

architecture xor_end_perm_arch of xor_end_perm is

  signal key_add_s : bit128;
  signal x3_s	   : bit64;
  signal x4_s	   : bit64;
  
begin  -- architecture xor_end_perm_arch

  -- trois premiers mots inchangés
  state_o(0)	    <= state_i(0);
  state_o(1)	    <= state_i(1);
  state_o(2)	    <= state_i(2);
  -- valeurs temporaires
  x3_s		    <= state_i(3);
  -- traitement du 1 en phase de donnees associées
  x4_s(63 downto 1) <= state_i(4)(63 downto 1);
  x4_s(0)	    <= state_i(4)(0) xor en_xor_lsb_i;
  -- xor avec la clé d'entrée en fin d'initialisation
  key_add_s	    <= (x3_s & x4_s) when en_xor_key_i = '0' else
		       (x3_s & x4_s) xor key_i;
  -- finalisation de l'état de sortie
  state_o(3) <= key_add_s(127 downto 64);
  state_o(4) <= key_add_s(63 downto 0);
  

end architecture xor_end_perm_arch;
