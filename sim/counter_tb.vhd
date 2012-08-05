-------------------------------------------------------------------------------
-- Title      : Testbench for design "counter"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : counter_tb.vhd
-- Author     :   <dasdgw@karel.dhcp.heaven>
-- Company    : frankalicious
-- Created    : 2012-08-05
-- Last update: 2012-08-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2012 frankalicious
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-08-05  0.1      dasdgw  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity counter_tb is

end entity counter_tb;

-------------------------------------------------------------------------------

architecture testbench of counter_tb is

  -- component generics
  constant width : natural := 8;

  -- component ports
  signal rst : std_logic;               -- [in]  active high reset
  signal cnt : std_logic_vector(width-1 downto 0);  -- [out] current counter value

  -- clock
  signal clk : std_logic := '1';

begin  -- architecture testbench

  -- component instantiation
  DUT : entity work.counter
    generic map (
      width => width)                   -- [natural]
    port map (
      clk => clk,                       -- [in  std_logic]
      rst => rst,                       -- [in  std_logic] active high reset
      cnt => cnt);  -- [out std_logic_vector(width-1 downto 0)] current counter value

  -- clock generation
  clk <= not clk  after 10 ns;
  rst <= '1', '0' after 50 ns;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here
    
    wait until clk = '1';
  end process WaveGen_Proc;

  

end architecture testbench;

-------------------------------------------------------------------------------

configuration counter_tb_testbench_cfg of counter_tb is
  for testbench
  end for;
end counter_tb_testbench_cfg;

-------------------------------------------------------------------------------
