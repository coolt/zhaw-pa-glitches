-------------------------------------------------------------------------------
-- Project     : Glitches detect: TEST
-- Description : counter.vhd
--               Because of fabrication by 8 FF, the counting Number shoud apears not
--               only regluary. 
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
			counter_reset:	out std_logic; 
			counter_synchron:		out std_logic
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of counter is 

signal   cnt: 			integer range 0 to 255 		:= 0;
signal   next_cnt: 	integer range 0 to 255 		:= 0;
signal 	glitch: 		std_logic 						:= '0';  -- asynchronous
signal 	next_zero: 	std_logic 						:= '0';  -- synchrounous
signal 	zero: 		std_logic 						:= '0';

begin

	-- clocked prozess -------------------------------
	ff: process(clk, glitch, next_zero)	
	begin	
		-- asynchrounous
		if (glitch = '1') then				
				cnt <= 0;	
		-- synchrounous
		elsif (rising_edge(clk)) then	
				cnt <= next_cnt;	
				zero <= next_zero;	
		end if;
	end process;
	
	-- input logic process ----------------------------
	count_up: process(cnt)	
	begin	
		-- asynchronous
		next_cnt <= cnt + 1;
	end process;
	
	-- output logic process 1---------------------------
	output: process(cnt)	
	begin	
	   -- asynchronous
		if (cnt = 158) then				
				glitch <= '1';
		else 				
				glitch <= '0';
		end if;		
	end process;
	
	-- output logic process 2---------------------------
	-- for destinguish nois from glitches
	output2:	process(cnt)	
	begin	
		if (cnt = 0) then				
				next_zero <= '1';
		else 				
				next_zero <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	counter_reset <= glitch;
	counter_synchron <= zero;
end rtl;
