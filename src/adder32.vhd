library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity adder32 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC);
end adder32;

architecture expression of adder32 is
signal temp:std_logic_vector(32 downto 0);
begin
temp<=('0'&a)+('0'&b);
y<=temp(31 downto 0);
cout<=temp(32);
end expression;

