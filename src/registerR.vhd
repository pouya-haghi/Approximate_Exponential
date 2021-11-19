library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registerR is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (31 downto 0));
end registerR;

architecture componented of registerR is
component flopenr 
port(d,rst,en,clk:in std_logic;q:out std_logic);
end component flopenr;

--for all:c2 use entity work.flopenr port map(i1,i2,i3,i4,o1);
begin
u0to15:for i in 0 to 31 generate 
begin
ui:flopenr port map(d(i),rst,en,clk,q(i));
end generate;
end componented;

