----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:18 10/24/2019 
-- Design Name: 
-- Module Name:    mem_ROM - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_ROM is
    Port ( clk : in  STD_LOGIC;
           entrada_ROM : in  STD_LOGIC_VECTOR (31 downto 0);
           dout_ROM : out  STD_LOGIC_VECTOR (31 downto 0));
end mem_ROM;

architecture Behavioral of mem_ROM is

type rom_type is array (0 to 121) of std_logic_vector (31 downto 0);

-- Definición de una memoria de instrucciones con un codigo de prueba 
signal ROM: rom_type:=(
X"00300413",
X"00100493",
X"01000913",
X"009462b3",
X"00947333",
X"009403b3",
X"40940e33",
X"40848eb3",
X"00942f33",
X"0084afb3",
X"009ea8b3",
X"00100293",
X"00000313",
X"01228863",
X"005282b3",
X"00130313",
X"ff5ff06f",
X"000004b3",
X"00000293",
X"00a00313",
X"00628863",
X"008484b3",
X"00128293",
X"ff5ff06f",
X"00802023",
X"00902223",
X"01202423",
X"00002503",
X"00402583",
X"00802603",
			
others => X"00000000");

begin

dout_ROM <= ROM(to_integer(unsigned(entrada_ROM))/4);  -- se convierte la direccion de hexa a decimal y se divide por 4 ya que una instruccion utiliza 4 bytes.

end Behavioral;
