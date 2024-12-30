-------------------------------------------------------------------------------
-- Title      : Diffusion layer
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : diffusion_layer.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-08-25
-- Last update: 2022-08-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:	 couche de diffusion llineaire
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

entity diffusion_layer is
  
  port (
    state_i : in  type_state;
    state_o : out type_state);

end entity diffusion_layer;

architecture diffusion_layer_arch of diffusion_layer is

begin  -- architecture diffusion_layer_arch

--Linear layer (3rd operation of the permutation)
  -- x0 <= x0 xor x0>>19 xor x0>>28
  -- x1 <= x1 xor x1>>61 xor x1>>39
  -- x2 <= x2 xor x2>>1	 xor x2>>6
  -- x3 <= x3 xor x3>>10 xor x3>>17
  -- x4 <= x4 xor x4>>7	 xor x4>>41

  state_o(0) <= state_i(0) xor (state_i(0)(18 downto 0) & state_i(0)(63 downto 19)) xor (state_i(0)(27 downto 0) & state_i(0)(63 downto 28));
  state_o(1) <= state_i(1) xor (state_i(1)(60 downto 0) & state_i(1)(63 downto 61)) xor (state_i(1)(38 downto 0) & state_i(1)(63 downto 39));
  state_o(2) <= state_i(2) xor (state_i(2)(0) & state_i(2)(63 downto 1)) xor (state_i(2)(5 downto 0) & state_i(2)(63 downto 6));
  state_o(3) <= state_i(3) xor (state_i(3)(9 downto 0) & state_i(3)(63 downto 10)) xor (state_i(3)(16 downto 0) & state_i(3)(63 downto 17));
  state_o(4) <= state_i(4) xor (state_i(4)(6 downto 0) & state_i(4)(63 downto 7)) xor (state_i(4)(40 downto 0) & state_i(4)(63 downto 41));


end architecture diffusion_layer_arch;
