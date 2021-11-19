library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( go : in  STD_LOGIC;
           rstGlob : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (31 downto 0);
           tolerance : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (33 downto 0);
           ready : out  STD_LOGIC);
end top;

architecture structural of top is
--signal declaration:
signal iterNum,mag,countNum,temp2,temp5,tolReg:std_logic_vector(3 downto 0);
signal temp1,xReg,fact,t,tReg,r,rReg:std_logic_vector(31 downto 0);
signal borrow,cout1,cout2,r16,rReg16,r17,rReg17,rst,preset,count,xEn,tEn,rEn,sel,eq,temp3,temp4,tolEn:std_logic;
--component declaration:
component c3_ROMfact
port(c_add:in std_logic_vector(3 downto 0);c_data:out std_logic_vector(31 downto 0));
end component c3_ROMfact;
component c4_ROMiteration
port(c_add:in std_logic_vector(3 downto 0);c_data:out std_logic_vector(3 downto 0));
end component c4_ROMiteration;
component c5_adder32
Port ( c_a : in  STD_LOGIC_VECTOR (31 downto 0);
           c_b : in  STD_LOGIC_VECTOR (31 downto 0);
           c_y : out  STD_LOGIC_VECTOR (31 downto 0);
           c_cout : out  STD_LOGIC);
end component c5_adder32;
component c6_comparator
Port ( c_a : in  STD_LOGIC_vector(3 downto 0);
           c_b : in  STD_LOGIC_vector(3 downto 0);
           c_eq : out  STD_LOGIC);
end component c6_comparator;
component c7_controller
Port ( c_rstGlob : in  STD_LOGIC;
           c_clk : in  STD_LOGIC;
           c_go : in  STD_LOGIC;
           c_eq : in  STD_LOGIC;
           c_preset : out  STD_LOGIC;
           c_rst : out  STD_LOGIC;
           c_count : out  STD_LOGIC;
           c_xEn : out  STD_LOGIC;
           c_tEn : out  STD_LOGIC;
           c_rEn : out  STD_LOGIC;
           c_sel : out  STD_LOGIC;
           c_ready : out  STD_LOGIC;
		   c_tolEn : out std_logic);
end component c7_controller;
component c8_counter
Port ( c_rst : in  STD_LOGIC;
           c_clk : in  STD_LOGIC;
           c_count : in  STD_LOGIC;
           c_q : out  STD_LOGIC_VECTOR (3 downto 0));
end component c8_counter;
component c9_halfAdder
Port ( c_a : in  STD_LOGIC;
           c_b : in  STD_LOGIC;
           c_y : out  STD_LOGIC;
           c_cout : out  STD_LOGIC);
end component c9_halfAdder;
component c10_multiplier
Port ( c_a : in  STD_LOGIC_VECTOR (31 downto 0);
           c_b : in  STD_LOGIC_VECTOR (31 downto 0);
           c_y : out  STD_LOGIC_VECTOR (31 downto 0));
end component c10_multiplier;
component c11_mux2
Port ( c_a : in  STD_LOGIC_vector (31 downto 0);
           c_b : in  STD_LOGIC_vector(31 downto 0);
           c_s : in  STD_LOGIC;
           c_y : out  STD_LOGIC_vector(31 downto 0));
end component c11_mux2;
component c12_priorityEnc
Port ( c_a : in  STD_LOGIC_VECTOR (31 downto 0);
           c_y : out  STD_LOGIC_VECTOR (3 downto 0));
end component c12_priorityEnc;
component c13_registerP
Port ( c_d : in  STD_LOGIC_VECTOR (31 downto 0);
           c_preset : in  STD_LOGIC;
           c_en : in  STD_LOGIC;
           c_clk : in  STD_LOGIC;
           c_q : out  STD_LOGIC_VECTOR (31 downto 0));
end component c13_registerP;
component c14_registerR
Port ( c_d : in  STD_LOGIC_VECTOR (31 downto 0);
           c_rst : in  STD_LOGIC;
           c_en : in  STD_LOGIC;
           c_clk : in  STD_LOGIC;
           c_q : out  STD_LOGIC_VECTOR (31 downto 0));
end component c14_registerR;
component c15_subtractor4
Port ( c_a : in  STD_LOGIC_VECTOR (3 downto 0);
           c_b : in  STD_LOGIC_VECTOR (3 downto 0);
           c_y : out  STD_LOGIC_VECTOR (3 downto 0);
           c_borrow : out  STD_LOGIC);
end component c15_subtractor4;
component c16_flopenr 
port (c_d,c_rst,c_en,c_clk:in std_logic;c_q:out std_logic);
end component c16_flopenr;
component c17_flopenp
Port ( c_d : in  STD_LOGIC;
           c_preset : in  STD_LOGIC;
           c_en : in  STD_LOGIC;
           c_clk : in  STD_LOGIC;
           c_q : out  STD_LOGIC);
end component c17_flopenp;		  
component c18_registerR4 
Port ( c_d : in  STD_LOGIC_VECTOR (3 downto 0);
           c_rst : in  STD_LOGIC;
           c_en : in  STD_LOGIC;
           c_clk : in  STD_LOGIC;
           c_q : out  STD_LOGIC_VECTOR (3 downto 0));
end component c18_registerR4;
--configuration specification:
for all:c3_ROMfact use entity work.ROMfact port map(c_add,c_data);
for all:c4_ROMiteration use entity work.ROMiteration port map(c_add,c_data);
for all:c5_adder32 use entity work.adder32 port map(c_a,c_b,c_y,c_cout);
for all:c6_comparator use entity work.comparator port map(c_a,c_b,c_eq);
for all:c7_controller use entity work.controller port map(c_rstGlob,c_clk,c_go,c_eq,c_preset,c_rst,c_count,c_xEn,c_tEn,c_rEn,c_sel,c_ready,c_tolEn);
for all:c8_counter use entity work.counter port map(c_rst,c_clk,c_count,c_q);
for all:c9_halfAdder use entity work.halfAdder port map(c_a,c_b,c_y,c_cout);
for all:c10_multiplier use entity work.multiplier port map(c_a,c_b,c_y);
for all:c11_mux2 use entity work.mux2 port map(c_a,c_b,c_s,c_y);
for all:c12_priorityEnc use entity work.priorityEnc port map(c_a,c_y);
for all:c13_registerP use entity work.registerP port map(c_d,c_preset,c_en,c_clk,c_q);
for all:c14_registerR use entity work.registerR port map(c_d,c_rst,c_en,c_clk,c_q);
for all:c15_subtractor4 use entity work.subtractor4 port map(c_a,c_b,c_y,c_borrow);
for all:c16_flopenr use entity work.flopenr port map(c_d,c_rst,c_en,c_clk,c_q);
for all:c17_flopenp use entity work.flopenp port map(c_d,c_preset,c_en,c_clk,c_q);
for all:c18_registerR4 use entity work.registerR4 port map(c_d,c_rst,c_en,c_clk,c_q);

begin
u1:c12_priorityEnc port map(x,mag);
u2:c15_subtractor4 port map(mag,tolReg,temp2,borrow);
u3:c4_ROMiteration port map(temp5,iterNum);
u4:c6_comparator port map(iterNum,countNum,eq);
u5:c8_counter port map(temp4,clk,count,countNum);
u6:c3_ROMfact port map(countNum,fact);
u7:c14_registerR port map(x,temp4,xEn,clk,xReg);
u8:c11_mux2 port map(xReg,fact,sel,temp1);
u9:c10_multiplier port map(temp1,tReg,t);
u10:c13_registerP port map(t,temp3,tEn,clk,tReg);
u11:c5_adder32 port map(tReg,rReg,r,cout1);
u12:c14_registerR port map(r,temp4,rEn,clk,rReg);
u13:c9_halfAdder port map(cout1,rReg16,r16,cout2);
u14:c9_halfAdder port map(cout2,rReg17,r17,open);
u15:c7_controller port map(rstGlob,clk,go,eq,preset,rst,count,xEn,tEn,rEn,sel,ready,tolEn);
u16:c17_flopenp port map(r16,temp3,rEn,clk,rReg16);
u17:c16_flopenr port map(r17,temp4,rEn,clk,rReg17);
u18:c18_registerR4 port map(tolerance,temp4,tolEn,clk,tolReg);
--assignments:
temp3<=rstGlob or preset;
temp4<=rstGlob or rst;
temp5<=(borrow&temp2(3 downto 1));
y<=(rReg17&rReg16&rReg);
end structural;

