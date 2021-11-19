library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flopenp is
    Port ( d : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end flopenp;

architecture blocked of flopenp is

begin
process(clk)
begin
if clk='1' and clk'event then
if preset='1' then q<='1';
else if en='1' then q<=d;
end if; 
end if;
end if;
end process;
end blocked;

