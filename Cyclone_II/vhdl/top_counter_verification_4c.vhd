-------------------------------------------------------------------------------
-- Project     : Glitches detect
-- Description : top_counter_verification.vhd
-- Author      : Katrin Bächli
-- FPGA        : Cylcone II
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 2.10.15  | baek     | init: Get Latency trough paths through GPIO-Pins
-- 2.10.15  | baek     | Add: GPIO_1_0, GPIO_1_1 for routing

-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

 
ENTITY top_counter_verification_4c IS
      PORT(    CLOCK_50: 			IN std_logic;
					GPIO_0_0:		   OUT std_logic; 
					-- Test routing
					GPIO_1_0:			OUT std_logic;
					GPIO_1_2:			OUT std_logic;
					GPIO_1_4:			OUT std_logic;
					GPIO_1_6:			OUT std_logic;
					GPIO_1_8:			OUT std_logic;
					GPIO_1_10:			OUT std_logic;
					GPIO_1_12:			OUT std_logic;
					GPIO_1_14:			OUT std_logic;
				
					GPIO_1_1:			IN std_logic;
					GPIO_1_3:			IN std_logic;
					GPIO_1_5:			IN std_logic;
					GPIO_1_7:			IN std_logic;
					GPIO_1_9:			IN std_logic;
					GPIO_1_11:			IN std_logic;
					GPIO_1_13:			IN std_logic;
					GPIO_1_15:			IN std_logic
		);
END top_counter_verification_4c;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------

ARCHITECTURE blocks OF top_counter_verification_4c IS


		COMPONENT counter_4_c
				  PORT(	clk: 				IN std_logic;
							counter_reset:	OUT std_logic;
							-- Test routing
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
		END COMPONENT; 
		
				
    -- Signals: 

	 -- Instantiation of components: 
		BEGIN
   
		inst_counter: counter_4_c
		PORT MAP(		clk 				=> CLOCK_50,
							counter_reset	=> GPIO_0_0,	
							-- Test routing
							q_0_out			=> GPIO_1_0,							
							q_1_out			=> GPIO_1_2,
							q_2_out			=> GPIO_1_4,
							q_3_out			=> GPIO_1_6,
							q_4_out			=> GPIO_1_8,
							q_5_out			=> GPIO_1_10,
							q_6_out			=> GPIO_1_12,
							q_7_out			=> GPIO_1_14,
						
							q_0_in			=> GPIO_1_1,
							q_1_in			=> GPIO_1_3,
							q_2_in			=> GPIO_1_5,
							q_3_in			=> GPIO_1_7,
							q_4_in			=> GPIO_1_9,
							q_5_in			=> GPIO_1_11,
							q_6_in			=> GPIO_1_13,
							q_7_in			=> GPIO_1_15
		);
	 

----------------------------------------------------------------------------------
-- Processes
----------------------------------------------------------------------------------
    -- Concurrent Assignments  
	 
    -- Assign outputs from intermediate signals

end blocks;

