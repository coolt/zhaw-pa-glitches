-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : counter.vhd             
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 31.09.15	| baek     | init
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

signal  cnt: 		integer range 0 to 255 		:= 0;
signal  next_cnt: 	integer range 0 to 255 	:= 0;
signal 	glitch: 	std_logic 						:= '0';  -- asynchronous
signal 	next_zero: 	std_logic 					:= '0';
signal 	zero: 		std_logic 					:= '0';

begin

	-- clocked main prozess -------------------------------
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
	
	-- second clocked prozess ------------------------------------
   -- creating logic nodes (delays with ff)
	
--	delay: process(clk, glitch, next_zero)	
--	begin	
--		-- asynchrounous
--		if (q(3) = '1') then				
--				q_z(3) <= '1';	
--		ELSE q_z(3) <= '0';	
--		-- synchrounous
--		elsif (rising_edge(clk)) then	
--				Q_Z(3) <= q(3);	
--				zero <= next_zero;	
--		end if;
--	end process;
	
	
	-- input logic process ----------------------------
	count_up: process(cnt)	
	begin	
		-- asynchronous
		next_cnt <= cnt + 1;
	end process;
	
	-- output logic process ---------------------------
	output: process(cnt)	
	begin	
	   -- asynchronous
		if (cnt = 158) then				
				glitch <= '1';
		else 				
				glitch <= '0';
		end if;		
	end process;
	
	-- output logic process ---------------------------
	output2:	process(cnt)	
	begin	
		if (cnt = 0) then				
				next_zero <= '1';
		else 				
				next_zero <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	verification <= glitch;
	zero_out <= zero;
end rtl;
