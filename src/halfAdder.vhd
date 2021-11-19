
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end halfAdder;

architecture expression of halfAdder is

begin
y<=a xor b;
cout<=a and b;
end expression;

