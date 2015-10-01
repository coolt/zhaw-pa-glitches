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
-- 30.09.15 | baek     | Redesign: Signal glitch not through FF
--                     | Process Compare asyncronous
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

signal   s_cnt: 			integer range 0 to 255 		:=  0;
signal   s_next_cnt: 	integer range 0 to 255 		:=  0;
signal 	s_glitch: 		std_logic 						:= '0';  -- asynchronous
signal 	s_next_zero: 	std_logic 						:= '0';  -- synchronous
signal 	s_zero: 			std_logic 						:= '0';  -- synchronous

begin

	-- clocked prozess -------------------------------
	ff: process(clk, s_next_cnt, s_next_zero)	
	begin	
		-- asynchronous
		if (s_next_zero = '1') then				
				s_cnt  <=  0 ;
				
		-- synchronous
		elsif (rising_edge(clk)) then	
				s_cnt  <= s_next_cnt;	
				s_zero <= s_next_zero;	
		end if;
	end process;

	
	-- input logic process ----------------------------
	count_up: process(s_cnt)	
	begin	
		s_next_cnt <= s_cnt + 1;
	end process;

	
	-- output compare logic process 1 ---------------------------
	compare: process(s_cnt)	
	begin	
		if (s_cnt = 158) then				
				s_glitch    <= '1';			
				s_next_zero <= '1';
		else 				
				s_glitch    <= '0';
				s_next_zero <= '0';
		end if;		
	end process;

 
	
	
	-- Concourent assignments ---------------------------
	verification <= s_glitch;
	zero_out     <= s_zero;
end rtl;
