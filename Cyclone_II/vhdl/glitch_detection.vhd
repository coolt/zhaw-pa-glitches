-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : counter.vhd             
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 05.10.15	| baek     | init
-- 06.10.15 | baek     | add cnt-singal and clock
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity glitch_detection is
	port(	clk: 				in std_logic;
			glitch:			out std_logic; 
			count:			out std_logic;	
			-- Routing
			q_0_out:			out std_logic;
			q_1_out:			out std_logic;
			q_2_out:			out std_logic;
			q_3_out:			out std_logic;
			------
			q_0_in:			in  std_logic;
			q_1_in:			in  std_logic;
			q_2_in:			in  std_logic;
			q_3_in:			in  std_logic
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of glitch_detection is 

signal  cnt:				std_logic					:= '0';
signal  cnt_next:			std_logic					:= '0';  
signal  reset_cnt: 		std_logic 					:= '0';  
signal  glitch1: 			integer range 0 to 15 	:= 0;
signal  next_glitch1: 	integer range 0 to 15 	:= 0;

signal  rout_out:       std_logic_vector(7 downto 0) := "00000000";
signal  rout_in:        std_logic_vector(7 downto 0) := "00000000";




begin

------------------------------------------------------
-- main
------------------------------------------------------	
	ff: process(clk)	
	begin			
		if (rising_edge(clk)) then					
				cnt 			<= cnt_next;	
				glitch1 		<= next_glitch1;
		end if;
	end process;

-- Routing
   rout_out <= std_logic_vector(to_unsigned(glitch1, 8));
   q_0_out  <=  rout_out(0);   
   q_1_out  <=  rout_out(1);
   q_2_out  <=  rout_out(2);
   q_3_out  <=  rout_out(3);  
   ------------------
	rout_in(0)	  <=  q_0_in;   
   rout_in(1)	  <=  q_1_in;
   rout_in(2)	  <=  q_2_in;		


------------------------------------------------------
-- input
------------------------------------------------------	
		
	-- counter
	count_up: process(ALL)	
	begin
		next_glitch1 <= glitch1 + 1;
	end process;

	


	
	
------------------------------------------------------
-- output
------------------------------------------------------	
	set_glitch: process(ALL)	
	begin	
	   -- Detect value 15
		if ( rout_in(0) = '1' AND rout_in(1) = '1' AND rout_out(2) = '1' AND rout_out(3) = '1') then
				reset_cnt <= '1';
		else 
				reset_cnt <= '0';
		end if;	
	end process;

	
	
	reset_counter: process(ALL)	
	begin	
	   -- asynchronous
		if glitch1 = 15 then
			cnt_next <= '1';
		else 
			cnt_next <= '0';
		end if;	
	end process;
		
	
	
	-- Output	
	count <= cnt;
	glitch <= reset_cnt;

end rtl;
