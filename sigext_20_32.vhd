----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:09 10/24/2019 
-- Design Name: 
-- Module Name:    sigext_20_32 - Behavioral 
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

entity sigext_20_32 is
    Port ( entrada_sigext_20_32 : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_sigext_20_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end sigext_20_32;

architecture Behavioral of sigext_20_32 is

signal auxentrada : STD_LOGIC_VECTOR(19 downto 0);
signal aux : STD_LOGIC_VECTOR(11 downto 0);

begin

process(entrada_sigext_20_32)

begin

auxentrada <= entrada_sigext_20_32(31 downto 12);

-- Veo el MSB

	salida_sigext_20_32(0) <= entrada_sigext_20_32(12);
	salida_sigext_20_32(1) <= entrada_sigext_20_32(13);
	salida_sigext_20_32(2) <= entrada_sigext_20_32(14);
	salida_sigext_20_32(3) <= entrada_sigext_20_32(15);
	salida_sigext_20_32(4) <= entrada_sigext_20_32(16);
	salida_sigext_20_32(5) <= entrada_sigext_20_32(17);
	salida_sigext_20_32(6) <= entrada_sigext_20_32(18);
	salida_sigext_20_32(7) <= entrada_sigext_20_32(19);
	salida_sigext_20_32(8) <= entrada_sigext_20_32(20);
	salida_sigext_20_32(9) <= entrada_sigext_20_32(21);
	salida_sigext_20_32(10) <= entrada_sigext_20_32(22);
	salida_sigext_20_32(11) <= entrada_sigext_20_32(23);
	salida_sigext_20_32(12) <= entrada_sigext_20_32(24);
	salida_sigext_20_32(13) <= entrada_sigext_20_32(25);
	salida_sigext_20_32(14) <= entrada_sigext_20_32(26);
	salida_sigext_20_32(15) <= entrada_sigext_20_32(27);
	salida_sigext_20_32(16) <= entrada_sigext_20_32(28);
	salida_sigext_20_32(17) <= entrada_sigext_20_32(29);
	salida_sigext_20_32(18) <= entrada_sigext_20_32(30);
	salida_sigext_20_32(19) <= entrada_sigext_20_32(31);
	
	
	if auxentrada(19) = '0' then
	aux <= "111111111111";
	else aux <= "000000000000";
	end if;
	
	salida_sigext_20_32(31 downto 20) <= aux;

	
end process;
end Behavioral;


