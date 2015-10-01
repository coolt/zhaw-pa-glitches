-------------------------------------------------------------------------------
-- Project     : Glitches detect
-- Description : counter.vhd
--               Has the counter gained a certain value, 
--               the reset signal transmitt a HIGH
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 21.09.15	| baek     | init
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter is
	port(	clk: 				in std_logic;
			verification:	out std_logic; 
			zero_out:		out std_logic
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of counter is 

signal   s_cnt: 			integer range 0 to 255 		:= 0;
signal   s_next_cnt: 	integer range 0 to 255 		:= 0;
signal 	s_glitch: 		std_logic 						:= '0';  -- asynchronous
signal 	s_next_zero: 	std_logic 						:= '0';  -- synchronous
signal 	s_zero: 			std_logic 						:= '0';  -- synchronous

begin

	-- clocked prozess -------------------------------
	ff: process(clk, s_glitch, s_next_cnt, s_next_zero)	
	begin	
		-- asynchrounous: from compare logic
		if (s_glitch = '1') then				
				s_cnt <= 0;	
				
		-- synchrounous
		elsif (rising_edge(clk)) then	
				s_cnt  <= s_next_cnt;	
				s_zero <= s_next_zero;	
		end if;
	end process;

	
	-- input logic process ----------------------------
	count_up: process(s_cnt)	
	begin	
		-- asynchronous
		s_next_cnt <= s_cnt + 1;
	end process;

	
	-- output compare logic process ---------------------------
	output: process(s_cnt)	
	begin	
	   -- asynchronous
		if (s_cnt = 158) then				
				s_glitch <= '1';
		else 				
				s_glitch <= '0';
		end if;		
	end process;

	
	-- output show zero logic process ---------------------------
	output2:	process(cnt)	
	begin	
		if (s_cnt = 0) then				
				s_next_zero <= '1';
		else 				
				s_next_zero <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	verification <= s_glitch;
end rtl;
