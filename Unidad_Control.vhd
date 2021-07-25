----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:08 10/24/2019 
-- Design Name: 
-- Module Name:    Unidad_Control - Behavioral 
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

entity Unidad_Control is
    Port ( f7 : in  STD_LOGIC;
           f3 : in  STD_LOGIC_VECTOR (2 downto 0);
           op_code : in  STD_LOGIC_VECTOR (4 downto 0);
           we_br : out  STD_LOGIC;
           alu_op : out  STD_LOGIC_VECTOR (2 downto 0);
           señal_op2 : out  STD_LOGIC;
           señal_wd : out  STD_LOGIC_VECTOR (1 downto 0);
           señal_imm : out  STD_LOGIC_VECTOR (1 downto 0);
           señal_branch : out  STD_LOGIC;
           señal_jump : out  STD_LOGIC);
end Unidad_Control;

architecture Behavioral of Unidad_Control is

signal f7yf3 : STD_LOGIC_VECTOR(3 downto 0);
signal sTMP: std_logic_vector(10 downto 0);
	
begin

f7yf3 <= f7 & f3;
	
sTMP <= --TIPO R
	"10010000000" when (op_code="01100" and f7yf3="0000" ) else --add
	"10100000000" when (op_code="01100" and f7yf3="1000" ) else --sub
	"10110000000" when (op_code="01100" and f7yf3="0111" ) else --and
	"11000000000" when (op_code="01100" and f7yf3="0110" ) else --or
	"11010000000" when (op_code="01100" and f7yf3="0100" ) else --xor
	"11100000000" when (op_code="01100" and f7yf3="0010" ) else --slt
	
		
	-- TIPO I
	"10011000000" when (op_code="00100" and f7yf3="0000" ) else --addi
	"10111000000" when (op_code="00100" and f7yf3="0111" ) else --andi
	"11001000000" when (op_code="00100" and f7yf3="0110" ) else --ori
	"11011000000" when (op_code="00100" and f7yf3="0100" ) else --xori
	"11101000000" when (op_code="00100" and f7yf3="0001" ) else --slti
					
	-- TIPO L
	"10001010000" when (op_code="00000" and (f7yf3="0010" or f7yf3="1010")) else
	
	-- TIPO S
	"00001110100" when (op_code="01000" and (f7yf3="0010" or f7yf3="1010")) else
   
	-- TIPO B
	"00000111010" when (op_code="11000" and (f7yf3="0000" or f7yf3="1000")) else
								
	-- TIPO J
	"01110111011" when (op_code="11011" and (f7yf3="0000" or f7yf3="1111")) else
   
	-- OTROS
	"00000000000";
	
	we_br <= sTMP(10);
	alu_op <= sTMP(9 downto 7);
	señal_op2 <= sTMP(6);
	señal_wd <= sTMP(5 downto 4);
	señal_imm <= sTMP(3 downto 2);
	señal_branch <= sTMP(1);
	señal_jump <= sTMP(0);	
	
end Behavioral;

