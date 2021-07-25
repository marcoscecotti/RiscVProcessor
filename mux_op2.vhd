----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:23 10/24/2019 
-- Design Name: 
-- Module Name:    mux_op2 - Behavioral 
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

entity mux_op2 is
    Port ( entrada_mux_op2_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_mux_op2_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           señal_op2 : in  STD_LOGIC;
           salida_mux_op2 : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_op2;

architecture Behavioral of mux_op2 is

begin
process (entrada_mux_op2_1,entrada_mux_op2_2,señal_op2)
begin
	CASE señal_op2 IS
		WHEN '0' => salida_mux_op2 <=entrada_mux_op2_1;
		WHEN '1' => salida_mux_op2 <=entrada_mux_op2_2;
		WHEN others => salida_mux_op2 <= entrada_mux_op2_1;
	end case;
end process;

end Behavioral;

