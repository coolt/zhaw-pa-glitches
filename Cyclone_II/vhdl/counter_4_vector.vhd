library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_v is
   port(
      CLK          : in  std_logic;
      FR_COUNT_OUT : out unsigned(3 downto 0)
   );
end counter_v;


architecture bhv of counter_v is

----------------------------------------------------------------
-- signal definitions
----------------------------------------------------------------

--counter signals
constant count_stop : unsigned(3 downto 0) := X"C";
signal cnt : unsigned(3 downto 0);

begin

----------------------------------------------------------------
-- counter
----------------------------------------------------------------

--counter
process(CLK,cnt)
begin
   if(rising_edge(CLK)) then
     
      --intitialize counters on reset
--      if(RST='1') then
--         cnt <= (others=>'0');
--      else        
         cnt <= cnt + 1;                
--      end if;
   end if;
end process;

----------------------------------------------------------------
-- outputs
----------------------------------------------------------------

--module output registers
process(CLK)
begin
   if(rising_edge(CLK)) then
         FR_COUNT_OUT <= cnt;
   end if;
end process;


end bhv;