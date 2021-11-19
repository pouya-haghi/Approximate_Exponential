library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
    Port ( a : in  STD_LOGIC_vector(3 downto 0);
           b : in  STD_LOGIC_vector(3 downto 0);
           eq : out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin
eq<='1' when a=b else '0';

end Behavioral;

