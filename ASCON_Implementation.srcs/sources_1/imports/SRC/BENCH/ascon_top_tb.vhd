-------------------------------------------------------------------------------
-- Title      : ASCON TOP LEVEL CIRCUIT test bench
-- Project    : ASCON PCSN
-------------------------------------------------------------------------------
-- File	      : ascon_top_tb.vhd
-- Author     : Jean-Baptiste RIGAUD  <rigaud@tallinn.emse.fr>
-- Company    : MINES SAINT ETIENNE
-- Created    : 2022-10-14
-- Last update: 2022-10-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: test bench for achitecture structurelle du circuit ASCON au top level
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

entity ascon_top_tb is

end entity ascon_top_tb;

architecture ascon_top_tb_arch of ascon_top_tb is

  component ascon_top is
    port (
      clock_i	     : in  std_logic;
      resetb_i	     : in  std_logic;
      start_i	     : in  std_logic;
      data_i	     : in  bit64;
      data_valid_i   : in  std_logic;
      key_i	     : in  bit128;
      nonce_i	     : in  bit128;
      cipher_o	     : out bit64;
      cipher_valid_o : out std_logic;
      tag_o	     : out bit128;
      end_o	     : out std_logic);
  end component ascon_top;

  signal clock_s	: std_logic := '0';
  signal resetb_s	: std_logic;
  signal start_s	: std_logic;
  signal data_s		: bit64;
  signal data_valid_s	: std_logic;
  signal key_s		: bit128;
  signal nonce_s	: bit128;
  signal cipher_s	: bit64;
  signal cipher_valid_s : std_logic;
  signal tag_s		: bit128;
  signal end_s		: std_logic;
  
begin  -- architecture ascon_top_tb_arch

  DUT : ascon_top
    port map (
      clock_i	     => clock_s,
      resetb_i	     => resetb_s,
      start_i	     => start_s,
      data_i	     => data_s,
      data_valid_i   => data_valid_s,
      key_i	     => key_s,
      nonce_i	     => nonce_s,
      cipher_o	     => cipher_s,
      cipher_valid_o => cipher_valid_s,
      tag_o	     => tag_s,
      end_o	     => end_s);

--stimuli
-- modelisation de l'horloge
  
  clock_s <= not clock_s after 10 ns;
  key_s	  <= x"000102030405060708090A0B0C0D0E0F";
  nonce_s <= x"000102030405060708090A0B0C0D0E0F";

  P0 : process is
  begin	 -- process P0
    resetb_s	 <= '0';
    start_s	 <= '0';
    data_valid_s <= '0';
    data_s	 <= (others => '0');

    wait for 105 ns;
    resetb_s	 <= '1';

    wait for 25 ns;
    start_s	 <= '1';

    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    --donnee associees
    data_s	 <= x"3230323280000000";
    wait for 20 ns;
    data_valid_s <= '1';
    wait for 20 ns;
    data_valid_s <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    --1 bloc message
    data_s	 <= x"446576656c6f7070";
    wait for 20 ns;
    data_valid_s <= '1';
    wait for 20 ns;
    data_valid_s <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    --2 bloc message
    data_s	 <= x"657a204153434f4e";
    wait for 20 ns;
    data_valid_s <= '1';
    wait for 20 ns;
    data_valid_s <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    --3 bloc message
    data_s	 <= x"20656e206c616e67";
    wait for 20 ns;
    data_valid_s <= '1';
    wait for 20 ns;
    data_valid_s <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    --4 bloc message
    data_s	 <= x"6167652056484480";
    wait for 20 ns;
    data_valid_s <= '1';
    wait for 20 ns;
    data_valid_s <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    start_s	 <= '0';
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
    wait for 20 ns;
   assert (start_s = '1') report "end of simulation" severity failure;
--    assert (cpt_s /= "1100") report "end of simulation" severity failure;
  end process P0;

end architecture ascon_top_tb_arch;

library LIB_RTL;
use LIB_RTL.all;

configuration ascon_top_tb_conf of ascon_top_tb is

  for ascon_top_tb_arch
    for DUT : ascon_top
      use configuration LIB_RTL.ascon_top_conf;
    end for;
  end for;

end configuration ascon_top_tb_conf;

