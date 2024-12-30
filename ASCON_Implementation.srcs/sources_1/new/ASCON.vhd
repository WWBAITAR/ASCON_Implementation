----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 11:04:15
-- Design Name: 
-- Module Name: ASCON - ASCON_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library LIB_RTL;
use LIB_RTL.ascon_pack.all;

entity ASCON is
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           start_i : in STD_LOGIC;
           data_valid_i : in STD_LOGIC;
           DisplayTag_i : in STD_LOGIC;
           DisplayData_i : in STD_LOGIC_VECTOR (3 downto 0);
           Leds_o : out STD_LOGIC_VECTOR (7 downto 0));
end ASCON;

architecture ASCON_arch of ASCON is

------------------- COMPONENTS DECLARATION --------------------------

component ascon_top is
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
end component ascon_top;
 
component FSM is
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           data_valid_i : in STD_LOGIC;
           end_i : in STD_LOGIC;
           cipher_valid_i : in STD_LOGIC;
           reset_counter_o : out STD_LOGIC;
           enable_o : out STD_LOGIC;
           data_valid_o : out STD_LOGIC);
end component FSM;

component ascon_datain_memory is
    Port ( clka : in STD_LOGIC;
           addra : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           douta : out STD_LOGIC_VECTOR(63 DOWNTO 0));
end component ascon_datain_memory;

component counter is
    Port ( clk_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           a_i : in STD_LOGIC;
           cpt_o : out STD_LOGIC_VECTOR(2 downto 0));
end component counter;

component Data_display is
    Port ( data_i : in STD_LOGIC_VECTOR (127 downto 0);
           display_data_i : in STD_LOGIC_VECTOR (3 downto 0);
           data_o : out STD_LOGIC_VECTOR (7 downto 0));
end component Data_display;

component Tag_display is
    Port ( cipher_i : in STD_LOGIC_VECTOR (63 downto 0);
           tag_i : in STD_LOGIC_VECTOR (127 downto 0);
           display_tag_i : in STD_LOGIC;
           data_o : out STD_LOGIC_VECTOR (127 downto 0));
end component Tag_display;

component clk_wiz_0
    Port ( clk_out_o: out std_logic;
           globalClock_i: in std_logic);
end component clk_wiz_0;

-----------------------------------------------------------------------

------------------ SIGNALS DECLARATION --------------------------------

signal PlainText_s : bit64;                  
signal Cipher_s : bit64;
signal Tag_s : bit128;
signal Mux1Result_s : bit128;
signal counter_out_s : std_logic_vector (2 downto 0);

signal Cipher_valid_s : std_logic;
signal end_s : std_logic;
signal DataValid_s : std_logic;
signal Enable_counter_s : std_logic;   
signal Reset_counter_s : std_logic; 

signal clk_80Mhz_out_s : std_logic;

signal reset_s : std_logic;
signal key_s : bit128;
signal nonce_s : bit128;

------------------------------------------------------------------------

begin

 ----- LA CLE ET LE NONCE ------------------------------
    key_s   <= x"000102030405060708090A0B0C0D0E0F";
    nonce_s <= x"000102030405060708090A0B0C0D0E0F";
 -------------------------------------------------------   
 
    reset_s <= not(reset_i); -- ASCON TOP A UN RESET NIVEAU BAS ALORS QUE LE SYSTEME GLOBALE A UN RESET NIVEAU HAUT
    
 ------------------------ COMPONENTS INSTANTIATION -------------------------------------   
  
     U0: ascon_top port map ( 
        clock_i => clk_80MHz_out_s,
        resetb_i => reset_s,
        start_i => start_i,
        data_i => PlainText_s,
        data_valid_i => DataValid_s,
        key_i => key_s,
        nonce_i => nonce_s,
        cipher_o => Cipher_s,
        cipher_valid_o => Cipher_valid_s,
        tag_o => Tag_s,
        end_o => end_s);
        
     U1: Tag_display port map (
         cipher_i => Cipher_s,
         tag_i => Tag_s,
         display_tag_i => DisplayTag_i,
         data_o => Mux1Result_s);
         
     U2: Data_display port map (
         data_i => Mux1Result_s,
         display_data_i => DisplayData_i,
         data_o => Leds_o);
     
     U3: ascon_datain_memory port map (
         clka => clk_80MHz_out_s,
         addra => counter_out_s,
         douta => PlainText_s);
         
     U4: counter port map (
         clk_i => clk_80MHz_out_s,
         reset_i => Reset_counter_s,
         a_i => Enable_counter_s,
         cpt_o => counter_out_s);
     
     U5: FSM port map (
         clk_i => clk_80MHz_out_s,
         reset_i => reset_i,
         data_valid_i => data_valid_i,
         end_i => end_s,
         cipher_valid_i => Cipher_valid_s,
         reset_counter_o => reset_counter_s,
         enable_o => Enable_counter_s,
         data_valid_o => Datavalid_s);
      
      U6: clk_wiz_0 port map (
         globalClock_i => clk_i,
         clk_out_o => clk_80MHz_out_s);   
     
   
   ---------------------------------------------------------------------------------------      
     

end architecture ASCON_arch;
