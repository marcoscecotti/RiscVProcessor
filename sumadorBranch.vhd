----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:43 10/24/2019 
-- Design Name: 
-- Module Name:    sumadorBranch - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumadorBranch is
    Port ( entrada_sumadorBranch_PCounter : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_sumadorBranch_mux : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_sumadorBranch : out  STD_LOGIC_VECTOR (31 downto 0));
end sumadorBranch;

architecture Behavioral of sumadorBranch is

begin
salida_sumadorBranch<=entrada_sumadorBranch_PCounter+entrada_sumadorBranch_mux;

end Behavioral;




