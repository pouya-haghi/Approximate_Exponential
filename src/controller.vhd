library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller is
    Port ( rstGlob : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           go : in  STD_LOGIC;
           eq : in  STD_LOGIC;
           preset : out  STD_LOGIC;
           rst : out  STD_LOGIC;
           count : out  STD_LOGIC;
           xEn : out  STD_LOGIC;
           tEn : out  STD_LOGIC;
           rEn : out  STD_LOGIC;
           sel : out  STD_LOGIC;
           ready : out  STD_LOGIC;
           tolEn : out  STD_LOGIC);
end controller;

architecture Behavioral of controller is
type state is(idle,init,load,xMul,krMul,rAdd);
signal pState:state;
signal nState:state;
begin
--state register:
process(clk)
begin
if clk='1' and clk'event then 
if rstGlob='1' then pState<=idle;
else pState<=nState;
end if;
end if;
end process;
--nextstate logic:

process(go,eq,pState)
begin
case pState is 
when idle => if go='0' then nState<=idle;else nState<=init;end if; 
when init => if go='1' then nState<=init;else nState<=load;end if; 
when load => nState<=xMul;
when xMul => nState<=krMul;
when krMul => nState<=rAdd;
when rAdd => if eq='1' then nState<=idle;else nState<=xMul;end if; 
when others => nState<=idle;
end case;
end process;
--output logic:
count<='1' when pState=rAdd else '0';
rst<='1' when pState=init else '0';
preset<='1' when pState=init else '0';
xEn<='1' when pState=load else '0';
tEn<='1' when pState=xMul or pState=krMul else '0';
rEn<='1' when pState=rAdd else '0';
ready<='1' when pState=idle else '0';
sel<='1' when pState=krMul else '0';
tolEn<='1' when pState=load else '0';
end Behavioral;

