-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : counter.vhd             
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 01.10.15	| baek     | init
-- 2.10.15  | baek     | deleted zero-out (Port, Signal, Process)
--                     | Renamed glitch -output in counter_reset
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter is
	port(	clk: 				in std_logic;
			counter_reset:	out std_logic -- to detect glitches
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of counter is 

signal  cnt: 			integer range 0 to 255 	:= 0;
signal  next_cnt: 	integer range 0 to 255 	:= 0;
signal  reset_cnt: 	std_logic 					:= '0';  -- asynchronous

begin

	-- clocked main prozess -------------------------------
	ff: process(clk, reset_cnt)	
	begin	
		-- asynchrounous
		if (reset_cnt = '1') then				
				cnt <= 0;	
		-- synchrounous
		elsif (rising_edge(clk)) then	
				cnt <= next_cnt;	
				-- zero <= next_zero;	
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
				reset_cnt <= '1';
		else 				
				reset_cnt <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	counter_reset <= reset_cnt;

end rtl;
