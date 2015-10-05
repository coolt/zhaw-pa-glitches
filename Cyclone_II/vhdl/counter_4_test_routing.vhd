-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : counter.vhd             
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 02.10.15	| baek     | init
-- 02.10.15 | baek     | Add: singal cnt_i (so cnt is not touched)
-- 03.10.15 | baek     | Test Routing                    | 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;


entity counter_4 is
	port(	clk: 				in  std_logic;
			counter_reset:	out std_logic; -- to detect glitches
			-- Test routing
			q_0_out:			out std_logic;
			q_0_in:			in  std_logic_vector
	);
end entity;



architecture rtl of counter_4 is 

----------------------------------------------------------------
-- signal definitions
----------------------------------------------------------------
constant cnt_max:    unsigned(7 downto 0)    := X"FC";

signal   cnt : 		unsigned(7 downto 0) := (others=>'0');
signal   next_cnt : 	unsigned(7 downto 0) := (others=>'0');
signal   cnt_i : 		unsigned(7 downto 0) := (others=>'0');
signal   reset_cnt: 	std_logic 				:= '0';           -- asynchronous
signal   q:         	unsigned(7 downto 0) := "00000000";
signal   q_z:       	unsigned(7 downto 0) := "00000000";
signal 	temp: 		std_logic_vector(7 downto 0)   := "00000000";



begin

----------------------------------------------------------------
-- counter
----------------------------------------------------------------

	-- input logic (asynchronous)
	count_up: process(cnt)	
	begin	
		next_cnt <= cnt + 1;
	end process;

	
	-- register
	ff: process(clk, reset_cnt)	
	begin	
		-- asynchrounous
		if (reset_cnt = '1') then				
				cnt <= (others=>'0');	
		-- synchrounous
		elsif (rising_edge(clk)) then	
				cnt <= next_cnt;	
				q <= cnt;
		end if;
	end process;

----------------------------------------------------------------
-- Delay
----------------------------------------------------------------
	temp     <=   q_0_in;
	q_z <= unsigned(temp);

	-- delay because of routing trough GPIO-Pins
	routing: process(q_z)
	begin		
		cnt(0)		<=   q_z(0);
	end process;
	
	


----------------------------------------------------------------
-- Output
----------------------------------------------------------------

	output_reset: process(cnt)	
	begin	
		if (cnt = cnt_max) then			
				reset_cnt <= '1';
		else 				
				reset_cnt <= '0';
		end if;
	
	-- set output
	counter_reset <= reset_cnt; 
	end process;
	
	
	
	output_routing: process(cnt, q)	
	begin			
		if (cnt /= q) then
				-- set output
				q_0_out  <=  q(0);		
		end if;	
	end process;

	--q_z(0)      <=   q_0_in;
end rtl;
