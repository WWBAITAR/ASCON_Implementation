-------------------------------------------------------------------------------
-- Title      : Addition of Constant
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : constant_addition.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-08-25
-- Last update: 2022-08-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:	 conception du chiffrement leger ASCON
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

entity constant_addition is
  
  port (
    state_i : in  type_state;
    round_i : in  bit4;
    state_o : out type_state);

end entity constant_addition;

architecture constant_addition_arch of constant_addition is

  signal build_cons_s : bit64;
  
begin  -- architecture constant_addition_arch

  -- construction de la constante en piochant dans le tableau du package
  
  build_cons_s(63 downto 8) <= (others => '0');
  build_cons_s(7 downto 0)  <= round_constant(to_integer(unsigned(round_i)));

  -- fabrication de la sortie seul x2 subit une transformation booleenne

  state_o(0) <= state_i(0);
  state_o(1) <= state_i(1);
  state_o(2) <= state_i(2) xor build_cons_s;
  state_o(3) <= state_i(3);
  state_o(4) <= state_i(4);
  
end architecture constant_addition_arch;
