----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:29 10/24/2019 
-- Design Name: 
-- Module Name:    and_saltos - Behavioral 
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

entity and_saltos is
    Port ( entrada_and_saltos_Bandera : in  STD_LOGIC;
           entrada_and_saltos_señal_Branch : in  STD_LOGIC;
           salida_and_saltos : out  STD_LOGIC);
end and_saltos;

architecture Behavioral of and_saltos is

begin

salida_and_saltos<=not(entrada_and_saltos_Bandera) AND entrada_and_saltos_señal_Branch;

end Behavioral;

