
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity subtractor4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0);
           borrow : out  STD_LOGIC);
end subtractor4;

architecture Behavioral of subtractor4 is
signal temp:std_logic_vector(4 downto 0);
begin
temp<=('0'&a)-('0'&b);
y<=temp(3 downto 0);
borrow<=temp(4);
end Behavioral;

