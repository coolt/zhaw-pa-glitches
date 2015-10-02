-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : counter.vhd             
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 02.10.15	| baek     | init
-- 2.10.15  | baek     | Add: singal cnt_i (so cnt is not touched)
--                     | 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter is
	port(	clk: 				in std_logic;
			counter_reset:	out std_logic; -- to detect glitches
			-- Test routing
			q_0_out:			out std_logic;
			q_0_in:			in  std_logic
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of counter is 

signal  cnt: 			integer range 0 to 255 	:= 0;
signal  next_cnt: 	integer range 0 to 255 	:= 0;
signal  cnt_i: 		integer range 0 to 255 	:= 0;
signal  reset_cnt: 	std_logic 					:= '0';  -- asynchronous
signal  q:           std_logic_vector(7 downto 0) := "00000000";
signal  q_z:         std_logic_vector(7 downto 0) := "00000000";


begin

	-- clocked main prozess -------------------------------
	-- reset counter
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

	
--	-- second clocked prozess ------------------------------------
--   -- creating logic nodes (delays with ff)	
--	delay: process(clk, q, q_z)		
--	begin		
--	-- asynchrounous logic		
--		if (q(3) = '1') then				
--				q_z(3) <= '1';	
--		--elsif(q(3) = '0')then 				-- producing a latch
--				--q_z(3) <= '0';	
--		
--	-- synchrounous
--		--elsif (rising_edge(clk)) then	
--				-- q_z <= q;
--		end if;
--	end process;
	
		q <= std_logic_vector(to_unsigned(cnt, 8));

		-- delay because of routing trough GPIO-Pins
		routing: process(q, q_z)
		begin
		  q_0_out  <=  q(0);
		q(0)      <=   q_0_in;
		end process;
	
	
	-- input logic process ----------------------------
	count_up: process(cnt)	
	begin	
		-- asynchronous
		next_cnt <= cnt + 1;
	end process;
	
	-- output logic process ---------------------------
	output: process(q_z)	
	begin	
	   -- asynchronous
		if (q_z = "10011110") then			-- = 158	
				reset_cnt <= '1';
		else 				
				reset_cnt <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	counter_reset <= reset_cnt;

end rtl;
