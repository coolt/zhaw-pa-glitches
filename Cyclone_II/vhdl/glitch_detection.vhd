-------------------------------------------------------------------------------
-- Project     : Glitches detect through long logic paths
-- Description : glitch_detection.vhd    
-- 				: Detect value 15. Once asynchronous (= glitch), once synchronous (cnt)         
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 05.10.15	| baek     | init
-- 06.10.15 | baek     | add cnt-singal and clock
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity glitch_detection is
	port(	clk: 				in std_logic;
			glitch:			out std_logic; 
			count:			out std_logic;	
			-- Routing
			q_0_out:			out std_logic;
			q_1_out:			out std_logic;
			q_2_out:			out std_logic;
			q_3_out:			out std_logic;
			------
			q_0_in:			in  std_logic;
			q_1_in:			in  std_logic;
			q_2_in:			in  std_logic;
			q_3_in:			in  std_logic
	);
end entity;



architecture rtl of glitch_detection is 

----------------------------------------------------------------------------------
-- signal
----------------------------------------------------------------------------------

signal  cnt_async: 		integer range 0 to 15 		  := 0;
signal  next_cnt_async: integer range 0 to 15 		  := 0;
signal  detect_15_async: std_logic 						  := '0';  

signal  cnt_sync:			std_logic						  := '0';
signal  cnt_sync_next:	std_logic						  := '0';  


signal  rout_out:       std_logic_vector(7 downto 0) := "00000000";
signal  rout_in:        std_logic_vector(7 downto 0) := "00000000";



begin

------------------------------------------------------
-- input
------------------------------------------------------	
		
	count_up: process(ALL)	
	begin
		next_cnt_async <= cnt_async + 1;
	end process;

	
------------------------------------------------------
-- clocked processes
------------------------------------------------------	
	ff: process(clk)	
	begin			
		if (rising_edge(clk)) then		
				cnt_async 		<= next_cnt_async;
				cnt_sync 		<= cnt_sync_next;					
		end if;
	end process;

	
------------------------------------------------------
-- delay
------------------------------------------------------
 
	rout_out <= std_logic_vector(to_unsigned(cnt_async, 8));
   q_0_out  <=  rout_out(0);   
   q_1_out  <=  rout_out(1);
   q_2_out  <=  rout_out(2);
   q_3_out  <=  rout_out(3);  
   ------------------
	rout_in(0)	  <=  q_0_in;   
   rout_in(1)	  <=  q_1_in;
   rout_in(2)	  <=  q_2_in;		
		
		
------------------------------------------------------
-- output
------------------------------------------------------	
	
	reset_counter: process(ALL)	
	begin	
	   -- asynchronous
		if ( rout_in(0) = '1' AND rout_in(1) = '1' AND rout_out(2) = '1' AND rout_out(3) = '1') then  
			detect_15_async <= '1';
			cnt_sync_next <= '1';
		else 
			detect_15_async <= '0';
			cnt_sync_next <= '0';
		end if;	
	end process;
		
	-- set outputs
	count  <= cnt_sync;
	glitch <= detect_15_async;

end rtl;
