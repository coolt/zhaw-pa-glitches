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
			count_async:	out std_logic; 
			count_sync:		out std_logic
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of counter is 

signal   cnt: 			integer range 0 to 7 		:=  0;
signal   next_cnt: 	integer range 0 to 7 		:=  0;

signal 	async_max: 	std_logic 						:= '0';  

signal 	next_sync_cnt: std_logic 					:= '0'; 
signal 	sync_cnt: 	std_logic 						:= '0';  

begin

	-------------------------------------------------------
	-- clocked prozess 
	-------------------------------------------------------	
	ff: process(clk, next_cnt, next_sync_cnt)	
	begin	
		if (next_sync_cnt  = '1') then				
				cnt  <=  0 ;
		elsif (rising_edge(clk)) then	
				cnt  <= next_cnt;								
				sync_cnt <= next_sync_cnt;	 -- ff für synchronisation vor ausgang
		end if;
	end process;

	
	-------------------------------------------------------
	-- input logic
	-------------------------------------------------------
	counter: process(cnt)	
	begin	
		next_cnt <= cnt + 1;
	end process;

	-------------------------------------------------------
	-- output 
	-------------------------------------------------------
	decoder: process(cnt)	
	begin	
		if (cnt = 2)  then	 			
				async_max    <= '1';			
				next_sync_cnt 	 <= '1';
		elsif (cnt = 3) or(cnt = 4) or (cnt = 5) or (cnt = 6) or (cnt = 7) or (cnt = 8) then
				async_max    <= '1';	
		else 				
				async_max    <= '0';
				next_sync_cnt <= '0';
		end if;		
	end process;
	
	count_async 	<= async_max;
	count_sync     <= next_sync_cnt;
	
	
end rtl;
