LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  ENTITY testTop IS
  END testTop;

  ARCHITECTURE timed OF testTop IS 
  -- Component Declaration
          -- COMPONENT cc
          -- PORT(
                  -- i1 : IN std_logic;
                  -- i2 : IN std_logic;       
                  -- i3 : IN std_logic;
				  -- i4 : IN std_logic_vector(15 downto 0);
				  -- i5 : IN std_logic_vector(3 downto 0);
				  -- o1 : OUT std_logic_vector(17 downto 0);
				  -- o2 : OUT std_logic
                  -- );
          -- END COMPONENT cc;
          SIGNAL go,ready,clk,rstGlob :  std_logic;
          SIGNAL tolerance :  std_logic_vector(3 downto 0);
          SIGNAL x :  std_logic_vector(31 downto 0);
          SIGNAL y :  std_logic_vector(33 downto 0);      
  BEGIN
  -- Component Instantiation
          -- uut: cc PORT MAP(
                  -- i1 => go,
                  -- i2 => rstGlob,
				  -- i3=> clk,
				  -- i4=> x,
				  -- i5=>tolerance,
				  -- o1=>y,
				  -- o2=>ready
          -- );
		  uut: entity work.top port map (go=>go,rstGlob=>rstGlob,clk=>clk,x=>x,tolerance=>tolerance,y=>y,ready=>ready);
  --  clock generation:
  CG:process 
  begin 
  clk<='0';
  wait for 10 ns;
  clk<='1';
  wait for 10 ns;
  end process CG;
  --  Test Bench Statements
     tb : PROCESS
     BEGIN
		rstGlob<='0','1' after 5 ns,'0' after 40 ns;
		go<='0','1' after 55 ns,'0' after 85 ns,'1' after 1005 ns,'0' after 1040 ns;
		x<=(others=>'1');
		tolerance<="1111","0000" after 1000 ns;
        wait; -- will wait forever
     END PROCESS tb;
  END architecture timed;
