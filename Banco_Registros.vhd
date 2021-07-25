----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:11 10/24/2019 
-- Design Name: 
-- Module Name:    Banco_Registros - Behavioral 
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

entity Banco_Registros is
    Port ( clk : in  STD_LOGIC;
           we3 : in  STD_LOGIC;
           ra1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ra2 : in  STD_LOGIC_VECTOR (4 downto 0);
           wa3 : in  STD_LOGIC_VECTOR (4 downto 0);
           wd3 : in  STD_LOGIC_VECTOR (31 downto 0);
           rd1 : out  STD_LOGIC_VECTOR (31 downto 0);
           rd2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Banco_Registros;

architecture Behavioral of Banco_Registros is
type ramtype is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal mem: ramtype;
	
begin
	process(clk)
	begin
	if (clk'event and clk='1') then
		if we3='1' then
			mem(to_integer(unsigned(wa3))) <= wd3;
		end if;
	end if;
	
	end process;
	
	process(ra1,ra2,mem)
	begin
		if(to_integer(unsigned(ra1))=0) then
			rd1 <= X"00000000";
				else
			rd1 <= mem(to_integer(unsigned(ra1)));
		end if;
		if(to_integer(unsigned(ra2))=0) then
			rd2 <= X"00000000";
		else
			rd2 <= mem(to_integer(unsigned(ra2)));
		end if;
	end process;
end Behavioral;

