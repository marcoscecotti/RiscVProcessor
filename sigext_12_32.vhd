----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:05 10/24/2019 
-- Design Name: 
-- Module Name:    sigext_12_32 - Behavioral 
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

entity sigext_12_32 is
    Port ( entrada_sigext_12_32 : in  STD_LOGIC_VECTOR (11 downto 0);
           salida_sigext_12_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end sigext_12_32;

architecture Behavioral of sigext_12_32 is

begin

process(entrada_sigext_12_32)

begin

-- Veo el MSB
if entrada_sigext_12_32(11) = '0' then
	salida_sigext_12_32 <= "00000000000000000000000000000000";
	salida_sigext_12_32(0) <= entrada_sigext_12_32(0);
	salida_sigext_12_32(1) <= entrada_sigext_12_32(1);
	salida_sigext_12_32(2) <= entrada_sigext_12_32(2);
	salida_sigext_12_32(3) <= entrada_sigext_12_32(3);
	salida_sigext_12_32(4) <= entrada_sigext_12_32(4);
	salida_sigext_12_32(5) <= entrada_sigext_12_32(5);
	salida_sigext_12_32(6) <= entrada_sigext_12_32(6);
	salida_sigext_12_32(7) <= entrada_sigext_12_32(7);
	salida_sigext_12_32(8) <= entrada_sigext_12_32(8);
	salida_sigext_12_32(9) <= entrada_sigext_12_32(9);
	salida_sigext_12_32(10) <= entrada_sigext_12_32(10);
	salida_sigext_12_32(11) <= entrada_sigext_12_32(11);
	
	else
	
	salida_sigext_12_32 <= "11111111111111111111111111111111";
	salida_sigext_12_32(0) <= entrada_sigext_12_32(0);
	salida_sigext_12_32(1) <= entrada_sigext_12_32(1);
	salida_sigext_12_32(2) <= entrada_sigext_12_32(2);
	salida_sigext_12_32(3) <= entrada_sigext_12_32(3);
	salida_sigext_12_32(4) <= entrada_sigext_12_32(4);
	salida_sigext_12_32(5) <= entrada_sigext_12_32(5);
	salida_sigext_12_32(6) <= entrada_sigext_12_32(6);
	salida_sigext_12_32(7) <= entrada_sigext_12_32(7);
	salida_sigext_12_32(8) <= entrada_sigext_12_32(8);
	salida_sigext_12_32(9) <= entrada_sigext_12_32(9);
	salida_sigext_12_32(10) <= entrada_sigext_12_32(10);
	salida_sigext_12_32(11) <= entrada_sigext_12_32(11);
end if;

	
end process;
end Behavioral;

