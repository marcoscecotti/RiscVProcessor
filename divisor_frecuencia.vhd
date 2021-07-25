----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:27 10/24/2019 
-- Design Name: 
-- Module Name:    divisor_frecuencia - Behavioral 
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

entity divisor_frecuecia is
	Port (
        entrada: in  STD_LOGIC;
        reset_clk  : in  STD_LOGIC;
		  salida1 : out STD_LOGIC;
        salida2 : out STD_LOGIC
    );
end divisor_frecuecia;

architecture Behavioral of divisor_frecuecia is
	 signal temporal1: STD_LOGIC;
	 signal temporal2: STD_LOGIC;
	 
	 signal contador1: integer range 0 to 12500000 := 0;  --reloj de calculo
	 signal contador2: integer range 0 to 200000 := 0; --reloj de 7 segmento
--124999
begin

	divisor_frecuencia: process (reset_clk, entrada) begin
        if (reset_clk = '1') then
            temporal1 <= '0';
            contador1 <= 0;
				temporal2 <= '0';
            contador2 <= 0;
        elsif rising_edge(entrada) then
            if (contador1 = 1) then
                temporal1 <= NOT(temporal1);
                contador1 <= 0;
            else
                contador1 <= contador1+1;
            end if;
				if (contador2 = 75000) then
                temporal2 <= NOT(temporal2);
                contador2 <= 0;
            else
                contador2 <= contador2+1;
            end if;
        end if;
    end process;
     
    salida1 <= temporal1;
	 salida2 <= temporal2;
end Behavioral;