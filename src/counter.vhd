
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity counter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           count : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is
signal temp : STD_LOGIC_VECTOR (3 downto 0);
begin
process(clk)
begin
if clk='1' and clk'event then
if rst='1' then temp<=(others=>'0');
else if count='1' then temp<=temp+"0001";
end if;
end if;
end if;
end process;
q<=temp;
end Behavioral;

