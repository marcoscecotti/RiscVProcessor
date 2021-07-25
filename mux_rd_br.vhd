----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:54 10/24/2019 
-- Design Name: 
-- Module Name:    mux_rd_br - Behavioral 
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

entity mux_rd_br is
    Port ( entrada_mux_rd_br_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_mux_rd_br_sumador4bits : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_mux_rd_br_ram : in  STD_LOGIC_VECTOR (31 downto 0);
           señal_wd : in  STD_LOGIC_VECTOR (1 downto 0);
           salida_mux_rd_br : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_rd_br;

architecture Behavioral of mux_rd_br is

begin
process(entrada_mux_rd_br_alu,entrada_mux_rd_br_sumador4bits,entrada_mux_rd_br_ram,señal_wd)
begin
	CASE señal_wd IS
		WHEN "00" => salida_mux_rd_br <=entrada_mux_rd_br_alu;
		WHEN "01" => salida_mux_rd_br <=entrada_mux_rd_br_sumador4bits;
		WHEN "10" => salida_mux_rd_br <=entrada_mux_rd_br_ram;
		WHEN others => salida_mux_rd_br <= x"00000000";
	end case;
end process;

end Behavioral;

