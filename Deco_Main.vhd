----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:22 11/12/2019 
-- Design Name: 
-- Module Name:    Deco_Main - Behavioral 
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

entity Deco_Main is
    Port ( op_code : in  STD_LOGIC_VECTOR (5 downto 0);
           we_br : in  STD_LOGIC;
           alu_op : in  STD_LOGIC_VECTOR (2 downto 0);
           señal_op2 : in  STD_LOGIC;
           señal_wd : in  STD_LOGIC_VECTOR (1 downto 0);
           señal_imm : in  STD_LOGIC_VECTOR (1 downto 0);
           señal_branch : in  STD_LOGIC;
           señal_jump : in  STD_LOGIC);
end Deco_Main;

architecture Behavioral of Deco_Main is

begin


end Behavioral;

