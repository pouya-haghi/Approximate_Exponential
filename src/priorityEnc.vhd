library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priorityEnc is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end priorityEnc;

architecture Behavioral of priorityEnc is

begin
y<= "1111" when a(31)='1' or a(30)='1' else
	"1110" when a(29)='1' or a(28)='1'else
	"1101" when a(27)='1' or a(26)='1'else
	"1100" when a(25)='1' or a(24)='1'else
	"1011" when a(23)='1' or a(22)='1'else
	"1010" when a(21)='1' or a(20)='1'else
	"1001" when a(19)='1' or a(18)='1'else
	"1000" when a(17)='1' or a(16)='1'else
	"0111" when a(15)='1' or a(14)='1'else
	"0110" when a(13)='1' or a(12)='1'else
	"0101" when a(11)='1' or a(10)='1'else
	"0100" when a(9)='1' or a(8)='1'else
	"0011" when a(7)='1' or a(6)='1'else
	"0010" when a(5)='1' or a(4)='1'else
	"0001" when a(3)='1' or a(2)='1'else
	"0000";
end Behavioral;

