library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flopenr is
port (d,rst,en,clk:in std_logic;q:out std_logic);
end flopenr;

architecture blocked of flopenr is

begin
process(clk)
begin
if clk='1' and clk'event then
if rst='1' then q<='0';
else if en='1' then q<=d;
end if; 
end if;
end if;
end process;
end blocked;

