-------------------------------------------------------------------------------
-- Project     : Glitches detect
-- Description : top_glitch_detection.vhd
--             : 3 signals go out on a KO: glitch, count, clock
--             : 4 signals are routed out and in for the aim of get delay
-- Author      : Katrin Bächli
-- FPGA        : Cylcone II
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 5.10.15  | baek     | init: Get Latency trough intelligent paths through GPIO-pins
-- 13.12.15 | baek     | finished.
--                     | synchronized counter commented out
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


 
ENTITY top_glitch_detection IS
      PORT(    CLOCK_50: 			IN std_logic;
		
					-- Signals for KO
					GPIO_0_0:		   OUT std_logic;    -- glitch 				
					--GPIO_1_14:			OUT std_logic;    -- synch. counter
					GPIO_1_8:			OUT std_logic;    -- clk
					
					-- Routing signals for delay
					GPIO_1_0:			OUT std_logic;
					GPIO_1_2:			OUT std_logic;
					GPIO_1_1:			IN std_logic;
					GPIO_1_3:			IN std_logic
		);
END top_glitch_detection;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------

ARCHITECTURE blocks OF top_glitch_detection IS

		COMPONENT glitch_detection
				  PORT(	clk: 				in std_logic;
							glitch:			out std_logic;    
							--count:			out std_logic;		
							
							-- Routing
							q_0_out:			out std_logic;
							q_1_out:			out std_logic;
							q_0_in:			in  std_logic;
							q_1_in:			in  std_logic
					);
		END COMPONENT; 
		

	 -- Instantiation of components: 
		BEGIN
   
		inst_counter: glitch_detection
		PORT MAP(		clk 				=> CLOCK_50,
							glitch			=> GPIO_0_0,	  
							--count				=> GPIO_1_14,    
							
							-- Routing
							q_0_out			=> GPIO_1_0,							
							q_1_out			=> GPIO_1_2,
							q_0_in			=> GPIO_1_1,
							q_1_in			=> GPIO_1_3
		);
	 

 
 -- Clock assignments  
	 GPIO_1_8 <= CLOCK_50;
     
end blocks;

