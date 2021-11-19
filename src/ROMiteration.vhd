library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROMiteration is
    Port ( add : in  STD_LOGIC_VECTOR (3 downto 0);
           data : out  STD_LOGIC_VECTOR (3 downto 0));
end ROMiteration;

architecture Behavioral of ROMiteration is
begin
with add select
data<="1000" when "0000",
      "1001" when "0001",
	  "1010" when "0010",
	  "1011" when "0011",
	  "1100" when "0100",
	  "1101" when "0101",
	  "1110" when "0110",
	  "1111" when "0111",
	  "0000" when "1000",
      "0001" when "1001",
	  "0010" when "1010",
	  "0011" when "1011",
	  "0100" when "1100",
	  "0101" when "1101",
	  "0110" when "1110",
	  "0111" when "1111",
	  "0000" when others;
end Behavioral;

