library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registerP is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           preset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (31 downto 0));
end registerP;

architecture componented of registerP is
component flopenp
port (d,preset,en,clk:in std_logic;q:out std_logic);
end component flopenp;
--for all:c1 use entity work.flopenp port map(i1,i2,i3,i4,o1);
begin
u0to15:for i in 0 to 31 generate 
begin
ui:flopenp port map(d(i),preset,en,clk,q(i));
end generate;

end componented;

