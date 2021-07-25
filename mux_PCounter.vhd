----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:25 10/24/2019 
-- Design Name: 
-- Module Name:    mux_PCounter - Behavioral 
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

entity mux_PCounter is
    Port ( entrada_mux_PCounter_Sumador4bits : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_mux_PCounter_SumadorBranch  : in  STD_LOGIC_VECTOR (31 downto 0);
           señal_branch : in  STD_LOGIC;
           salida_mux_PCounter  : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_PCounter;

architecture Behavioral of mux_PCounter is

begin
process(entrada_mux_PCounter_Sumador4bits,entrada_mux_PCounter_SumadorBranch,señal_branch)
begin
	CASE señal_branch IS
		WHEN '0' => salida_mux_PCounter <=entrada_mux_PCounter_Sumador4bits;
		WHEN '1' => salida_mux_PCounter <=entrada_mux_PCounter_SumadorBranch;
		WHEN others => salida_mux_PCounter <= x"00000000";
	end case;
end process;


end Behavioral;

