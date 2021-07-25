----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:49 10/24/2019 
-- Design Name: 
-- Module Name:    mux_Jump - Behavioral 
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

entity mux_Jump is
    Port ( entrada_mux_jump_IMM : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_mux_jump_Shift : in  STD_LOGIC_VECTOR (31 downto 0);
           señal_jump : in  STD_LOGIC;
           salida_mux_jump : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_Jump;

architecture Behavioral of mux_Jump is

begin
process (entrada_mux_jump_IMM,entrada_mux_jump_Shift,señal_jump)
begin
	CASE señal_jump IS
		WHEN '0' => salida_mux_jump <=entrada_mux_jump_IMM;
		WHEN '1' => salida_mux_jump <=entrada_mux_jump_Shift;
		WHEN others => salida_mux_jump <= x"00000000";
	end case;
end process;

end Behavioral;

