-------------------------------------------------------------------------------
-- Title      : S-Box
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : sbox.vhd
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

entity sbox is
  
  port (
    sbox_i : in	 bit5;
    sbox_o : out bit5);

end entity sbox;

architecture sbox_arch of sbox is

  type sbox_t is array (0 to 31) of bit8;
  
  constant sbox_c : sbox_t := (x"04", x"0B", x"1F", x"14", x"1A", x"15", x"09", x"02",
			       x"1B", x"05", x"08", x"12", x"1D", x"03", x"06", x"1C",
			       x"1E", x"13", x"07", x"0E", x"00", x"0D", x"11", x"18",
			       x"10", x"0C", x"01", x"19", x"16", x"0A", x"0F", x"17");
  signal sbox_s : bit8;
  
begin  -- architecture sbox_arch

  sbox_s <= sbox_c(to_integer(unsigned(sbox_i)));
  sbox_o <= sbox_s(4 downto 0);
  
end architecture sbox_arch;
