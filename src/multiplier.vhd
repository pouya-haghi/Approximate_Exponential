library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity multiplier is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplier;

architecture Behavioral of multiplier is
signal temp:std_logic_vector(63 downto 0);
begin
temp<=a*b;
y<=temp(63 downto 32);
end Behavioral;

