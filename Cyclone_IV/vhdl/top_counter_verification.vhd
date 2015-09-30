-------------------------------------------------------------------------------
-- Project     : Glitches detect
-- Description : top_counter_verification.vhd
-- Author      : Katrin Bächli
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 21.09.15	| baek     | init
-- 23.09.15	| baek     | all components in counter-block included
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

 
ENTITY top_counter_verification IS
      PORT(    CLOCK_50: 			IN std_logic;
					KEY_0: 				IN std_logic;
					GPIO_0:		   OUT std_logic;  
					GPIO_1:		   OUT std_logic  
		);
END top_counter_verification;


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------

ARCHITECTURE blocks OF top_counter_verification IS


		COMPONENT counter
				  PORT(	clk: 				IN std_logic;
							rst_n: 			IN std_logic;
							verification:	OUT std_logic; 
							zero_out:		OUT std_logic
					);
		END COMPONENT; 
		
				
    -- Signals: 
	 
	 
		
	 -- Instantiation of components: 
		BEGIN
   
		inst_counter: counter
		PORT MAP(		clk 				=> CLOCK_50,
							rst_n 			=> KEY_0,
							verification	=> GPIO_0,
							zero_out 		=> GPIO_1
		);
	 
		
----------------------------------------------------------------------------------
-- Processes
----------------------------------------------------------------------------------



    -- Concurrent Assignments  
	 
    -- Assign outputs from intermediate signals


end blocks;

