----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:41 10/24/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( entradaAlu1 : in  STD_LOGIC_VECTOR (31 downto 0);
           entradaAlu2 : in  STD_LOGIC_VECTOR (31 downto 0);
           señal_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           bandera_Alu : out  STD_LOGIC;
           salida_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

signal entradaAlu1Unsigned: integer;
signal entradaAlu2Unsigned: integer;
signal SalidaALU: STD_LOGIC_VECTOR (31 downto 0);
signal SalidaAux2: integer;
signal SalidaAux: STD_LOGIC_VECTOR (31 downto 0);


	
begin

entradaAlu1Unsigned <= to_integer(unsigned(entradaAlu1));
entradaAlu2Unsigned <= to_integer(unsigned(entradaAlu2));

	SalidaAux <=	entradaAlu1 and entradaAlu2 when(señal_Alu = "011") else
						entradaAlu1 or entradaAlu2 when(señal_Alu = "100") else
						entradaAlu1 xor entradaAlu2 when(señal_Alu = "101") else
						"00000000000000000000000000000001" when(señal_Alu = "110" and entradaAlu1 < entradaAlu2) else
						"00000000000000000000000000000000";
						
	SalidaAux2 <= entradaAlu1Unsigned + entradaAlu2Unsigned when(señal_Alu = "001") else
					 entradaAlu1Unsigned - entradaAlu2Unsigned when(señal_Alu = "010");
					 
	SalidaALU <= std_logic_vector(to_unsigned(SalidaAux2, SalidaALU'length));
		
	bandera_Alu <=	'0' when (señal_Alu = "000" and entradaAlu1=entradaAlu2) else
						'0' when (señal_Alu = "111") else
						'1' when(SalidaAux = "00000000000000000000000000000000000" or SalidaAux2 = 0 ) else
						'0';
						 
	salida_Alu <= 	SalidaAux when (señal_Alu = "011" or señal_Alu = "100" or señal_Alu = "101" or señal_Alu = "110") else
						SalidaALU;
	
						
--	process(entradaAlu1,entradaAlu2,señal_Alu,clk,SalidaAux,entradaAlu1Unsigned,entradaAlu2Unsigned)
--	begin
--
--	
--	--bandera <= '0';
--	if clk'event and clk='1' then
--		CASE señal_Alu IS
--		when "001" =>  -- suma
--			SalidaALU <= entradaAlu1Unsigned + entradaAlu2Unsigned;
--			
--			SalidaAux <= std_logic_vector(to_unsigned(SalidaALU, SalidaAux'length));
--		when "010" => -- resta
--			SalidaALU<= entradaAlu1Unsigned - entradaAlu2Unsigned;
--			
--			SalidaAux <= std_logic_vector(to_unsigned(SalidaALU, SalidaAux'length));
--		when "011" => -- and
--			SalidaAux <= entradaAlu1 and entradaAlu2;
--			
--		when "100" => -- or
--			SalidaAux<= entradaAlu1 or entradaAlu2; 
--			
--		when "101" => -- xor
--			SalidaAux<= entradaAlu1 xor entradaAlu2; 
--				
--		when "111" => -- slt
--			if entradaAlu1<entradaAlu2 then 
--				SalidaAux<=x"00000001";
--			else
--				SalidaAux<=x"00000000"; 
--			end if;
--			
--		when others =>
--			SalidaAux <= x"00000000";  
--			
--		end CASE;
--	end if;
--
--	if SalidaAux = "00000000000000000000000000000000" then
--		bandera_Alu <= '1';
--	else
--		bandera_Alu <= '0';
--	end if;
--	
--	salida_Alu <= SalidaAux;
--	
--	end process;
	

	
	
end Behavioral;