-------------------------------------------------------------------------------
-- Title      : counter to test simulation and synthesis
-- Project    : 
-------------------------------------------------------------------------------
-- File       : counter.vhd
-- Author     :   <dasdgw@karel.dhcp.heaven>
-- Company    : frankalicious
-- Created    : 2012-08-05
-- Last update: 2012-08-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: see title
-------------------------------------------------------------------------------
-- Copyright (c) 2012 frankalicious
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------

entity counter is
  
  generic (
    width : natural := 8);
  port (
    clk : in  std_logic;
    rst : in  std_logic;                            -- active high reset
    cnt : out std_logic_vector(width-1 downto 0));  -- current counter value
end entity counter;

-------------------------------------------------------------------------------

architecture str of counter is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal cnt_unsigned : unsigned(width-1 downto 0) := (others => '0');

begin  -- architecture str
  main : process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        cnt_unsigned <= (others => '0');
      else
        cnt_unsigned <= cnt_unsigned + 1;
      end if;
    end if;
  end process main;
  cnt <= std_logic_vector(cnt_unsigned);
  
end architecture str;

-------------------------------------------------------------------------------
