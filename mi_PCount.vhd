----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:05 10/24/2019 
-- Design Name: 
-- Module Name:    mi_PCount - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mi_PCount is
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mi_PCount;

architecture Behavioral of mi_PCount is

begin
process(clk,reset)
begin
if reset='1' then
	pc_out <= "00000000000000000000000000000000";
	else
	if (clk'event and clk='1') then
		pc_out <= pc_in;
	end if;
end if;

end process;

end Behavioral;

