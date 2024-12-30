-------------------------------------------------------------------------------
-- Title      : Substitution layer
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : substitution_layer.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-08-25
-- Last update: 2022-10-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:	 instantiation de 32 sboxes en colonne 
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

entity substitution_layer is
  
  port (
    state_i : in  type_state;
    state_o : out type_state);

end entity substitution_layer;

architecture substitution_layer_arch of substitution_layer is

  type tran_state_t is array (0 to 63) of bit5;

  signal tran_state_1_s : tran_state_t;
  signal tran_state_2_s : tran_state_t;

  component sbox is
    port (
      sbox_i : in  bit5;
      sbox_o : out bit5);
  end component sbox;
  
begin  -- architecture substitution_layer_arch

  GEN_0 : for i in 0 to 63 generate
    tran_state_1_s(i) <= state_i(0)(63-i)&state_i(1)(63-i)&state_i(2)(63-i)&state_i(3)(63-i)&state_i(4)(63-i);
  end generate GEN_0;

  GEN_1 : for i in 0 to 63 generate
    sbox_1 : sbox
      port map (
	sbox_i => tran_state_1_s(i),
	sbox_o => tran_state_2_s(i));
  end generate GEN_1;

  --GEN_1 : for i in 0 to 63 generate
  --  sbox_1 : sbox
  --	port map (
  --	sbox_i => state_i(0)(63-i)&state_i(1)(63-i)&state_i(2)(63-i)&state_i(3)(63-i)&state_i(4)(63-i),
  --	sbox_o => state_o(0)(63-i)&state_o(1)(63-i)&state_o(2)(63-i)&state_o(3)(63-i)&state_o(4)(63-i));
  --end generate GEN_1;

  GEN_3 : for i in 0 to 4 generate
    state_o(4-i) <= tran_state_2_s(0)(i)&tran_state_2_s(1)(i)&tran_state_2_s(2)(i)&tran_state_2_s(3)(i)&tran_state_2_s(4)(i)&tran_state_2_s(5)(i)&tran_state_2_s(6)(i)&tran_state_2_s(7)(i)&tran_state_2_s(8)(i)&tran_state_2_s(9)(i)&tran_state_2_s(10)(i)&tran_state_2_s(11)(i)&tran_state_2_s(12)(i)&tran_state_2_s(13)(i)&tran_state_2_s(14)(i)&tran_state_2_s(15)(i)&tran_state_2_s(16)(i)&tran_state_2_s(17)(i)&tran_state_2_s(18)(i)&tran_state_2_s(19)(i)&tran_state_2_s(20)(i)&tran_state_2_s(21)(i)&tran_state_2_s(22)(i)&tran_state_2_s(23)(i)&tran_state_2_s(24)(i)&tran_state_2_s(25)(i)&tran_state_2_s(26)(i)&tran_state_2_s(27)(i)&tran_state_2_s(28)(i)&tran_state_2_s(29)(i)&tran_state_2_s(30)(i)&tran_state_2_s(31)(i)&tran_state_2_s(32)(i)&tran_state_2_s(33)(i)&tran_state_2_s(34)(i)&tran_state_2_s(35)(i)&tran_state_2_s(36)(i)&tran_state_2_s(37)(i)&tran_state_2_s(38)(i)&tran_state_2_s(39)(i)&tran_state_2_s(40)(i)&tran_state_2_s(41)(i)&tran_state_2_s(42)(i)&tran_state_2_s(43)(i)&tran_state_2_s(44)(i)&tran_state_2_s(45)(i)&tran_state_2_s(46)(i)&tran_state_2_s(47)(i)&tran_state_2_s(48)(i)&tran_state_2_s(49)(i)&tran_state_2_s(50)(i)&tran_state_2_s(51)(i)&tran_state_2_s(52)(i)&tran_state_2_s(53)(i)&tran_state_2_s(54)(i)&tran_state_2_s(55)(i)&tran_state_2_s(56)(i)&tran_state_2_s(57)(i)&tran_state_2_s(58)(i)&tran_state_2_s(59)(i)&tran_state_2_s(60)(i)&tran_state_2_s(61)(i)&tran_state_2_s(62)(i)&tran_state_2_s(63)(i);
  end generate GEN_3;

end architecture substitution_layer_arch;

configuration substitution_layer_conf of substitution_layer is

  for substitution_layer_arch
    for GEN_1
      for all : sbox
	use entity lib_rtl.sbox(sbox_arch);
      end for;
    end for;
  end for;

end configuration substitution_layer_conf;
