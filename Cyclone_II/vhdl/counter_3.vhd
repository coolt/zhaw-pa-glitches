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
-- 2.10.15  | baek     | Signal set out of 2. process
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
signal  cnt_i:       integer;
signal  reset_cnt: 	std_logic 					:= '0';  -- asynchronous
signal  q:           std_logic_vector(7 downto 0);
signal  q_z:         std_logic_vector(7 downto 0);


begin

q <= std_logic_vector(to_unsigned(cnt, 8));



	-- clocked main prozess -------------------------------
	ff: process(clk, reset_cnt)	
	begin	
		-- asynchrounous
		if (reset_cnt = '1') then				
				cnt <= 0;	
		-- synchrounous
		elsif (rising_edge(clk)) then	
				cnt <= next_cnt;	
		end if;
	end process;

	
	-- second clocked prozess ------------------------------------
   -- creating logic nodes (delays with ff)	
	delay: process(q, q_z)		
	begin		
	
	-- asynchrounous logic		
		if (q(3) = '1') then				
				q_z(3) <= '0';	
				q_z(4) <= '1';
		elsif(q(3) = '0')then 
				q_z(3) <= '1';	
		
	-- synchrounous
		elsif (rising_edge(clk)) then	
				q_z <= q;
		end if;

		cnt_i <= to_integer(unsigned(q_z));
	end process;	
		
		
	-- input logic process ----------------------------
	count_up: process(cnt)	
	begin	
		-- asynchronous
		next_cnt <= cnt + 1;
	end process;
	
	-- output logic process ---------------------------
	output: process(cnt_i)	
	begin	
	   -- asynchronous
		if (cnt_i = 212) then				
				reset_cnt <= '1';
		else 				
				reset_cnt <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	counter_reset <= reset_cnt;

end rtl;
