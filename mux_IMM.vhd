----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:59 10/24/2019 
-- Design Name: 
-- Module Name:    mux_IMM - Behavioral 
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

entity mux_IMM is
    Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           z : in  STD_LOGIC_VECTOR (31 downto 0);
           señal_IMM : in  STD_LOGIC_VECTOR (1 downto 0);
           salida_mux_IMM : out  STD_LOGIC_VECTOR (11 downto 0));
end mux_IMM;

architecture Behavioral of mux_IMM is

signal xaux : STD_LOGIC_VECTOR (11 downto 0);
signal yaux : STD_LOGIC_VECTOR (11 downto 0);
signal zaux : STD_LOGIC_VECTOR (11 downto 0);

begin
xaux <= x(31 downto 20); -- Tipo I
yaux <= y(31 downto 25) & y(11 downto 7); -- Tipo S
zaux <= z(31 downto 20);
process(xaux,yaux,zaux,señal_IMM)
begin



	CASE señal_IMM IS
		WHEN "00" => salida_mux_IMM <=xaux;
		WHEN "01" => salida_mux_IMM <=yaux;
		WHEN "10" => salida_mux_IMM <=zaux;
		WHEN others => salida_mux_IMM <= "000000000000";
	end case;
end process;

end Behavioral;

