----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:37 10/24/2019 
-- Design Name: 
-- Module Name:    mem_RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_RAM is
    Port ( wa3_RAM : in  STD_LOGIC_VECTOR (5 downto 0);
           we3_RAM : in  STD_LOGIC;
           wd3_RAM : in  STD_LOGIC_VECTOR (31 downto 0);
           dout_RAM : out  STD_LOGIC_VECTOR (31 downto 0));
end mem_RAM;

architecture Behavioral of mem_RAM is
	type mem_array is array (15 downto 0) of std_logic_vector(31 downto 0);
signal ram: mem_array:=( OTHERS => "00000000000000000000000000000000");
	
begin

process(we3_RAM,wa3_RAM,wd3_RAM,ram)
begin
if ( (to_integer(unsigned(wa3_RAM)) < 16 and to_integer(unsigned(wa3_RAM)) >= 0) ) then
				if we3_RAM = '1' then
					ram(to_integer(unsigned(wa3_RAM))) <= wd3_RAM;
				end if;
end if;
	 
if (to_integer(unsigned(wa3_RAM)) < 16 and  (to_integer(unsigned(wa3_RAM))) >= 0) then 
				dout_RAM(31 downto 0) <= ram(to_integer(unsigned(wa3_RAM)));
		else
				dout_RAM <="00000000000000000000000000000000";
			end if;

end process;
end Behavioral;
