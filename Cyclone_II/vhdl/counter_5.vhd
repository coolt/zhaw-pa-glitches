-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : counter.vhd             
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 05.10.15	| baek     | init

-------------------------------------------------------------------------------
-- To Do:
-- Change 8 std_logic IO to std_logic_vector
-- Change cnt type from int -> std_logic_vector
-- Deled typcaste bevor q 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter_5 is
	port(	clk: 				in std_logic;
			counter_reset:	out std_logic; -- to detect glitches
			-- Routing Ports
			q_0_out:			out std_logic;
			q_1_out:			out std_logic;
			q_2_out:			out std_logic;
			q_3_out:			out std_logic;
			q_4_out:			out std_logic;
			q_5_out:			out std_logic;
			q_6_out:			out std_logic;
			q_7_out:			out std_logic;			
			q_0_in:			in  std_logic;
			q_1_in:			in  std_logic;
			q_2_in:			in  std_logic;
			q_3_in:			in  std_logic;
			q_4_in:			in  std_logic;
			q_5_in:			in  std_logic;
			q_6_in:			in  std_logic;
			q_7_in:			in  std_logic
	);
end entity;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture rtl of counter_5 is 

constant cnt_max:    std_logic_vector(7 downto 0):= "10011111";  -- 159

signal  cnt: 			integer range 0 to 7 	:= 0;
signal  next_cnt: 	integer range 0 to 7 	:= 0;
signal  reset_cnt: 	std_logic 					:= '0';  -- asynchronous
signal  q:           std_logic_vector(7 downto 0) := "00000000";
signal  q_z:         std_logic_vector(7 downto 0) := "00000000";
signal  delay:			std_logic					:= '0';

begin

	-- clocked main prozess -------------------------------
	ff: process(clk)	
	begin			
		if (rising_edge(clk)) then	
				cnt <= next_cnt;	
		end if;
	end process;

		-- typcast
		q <= std_logic_vector(to_unsigned(cnt, 8));

		-- delay because of routing trough GPIO-Pins
		routing: process(q, q_z, q_0_in, q_1_in, q_2_in, q_3_in, q_4_in, q_5_in, q_6_in,q_7_in)  
		begin
		  -- Assign Signal q to GPIO Ports
		  q_0_out  <=  q(0);   
		  q_1_out  <=  q(1);
		  q_2_out  <=  q(2);
		  q_3_out  <=  q(3);     
		  q_z(4)   <=  q(4);     -- as quick as possible (no routing)
		  q_5_out  <=  q(5);
		  q_6_out  <=  q(6);   
		  q_7_out  <=  q(7);
		  -- Read Signal q_z from GPIO Ports
		  q_z(0)	  <=  q_0_in;   
		  q_z(1)	  <=  q_1_in;
		  q_z(2)	  <=  q_2_in;
		  --q_z(3)	  <=  q_3_in;  -- delay (-> logic path in process)
		  --q_z(4)	  <=  q_4_in;  -- no routing (direct linking)
		  q_z(5)	  <=  q_5_in;
		  q_z(6)	  <=  q_6_in;  
		  q_z(7)	  <=  q_7_in;
		end process;
	
		-- additional delay
		delay_routing : process(q_3_in)
		begin
				delay	  <=  not q_3_in;	
				q_z(3)  <=  not delay;
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
		if (q_z = cnt_max) then				
				reset_cnt <= '1';
		else 				
				reset_cnt <= '0';
		end if;		
	end process;
	
	
	-- Concourent assignments ---------------------------
	counter_reset <= reset_cnt;

end rtl;
