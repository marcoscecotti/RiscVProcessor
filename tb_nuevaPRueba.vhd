--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:27 10/31/2019
-- Design Name:   
-- Module Name:   C:/Users/Milton/Desktop/RiscV/tb_nuevaPRueba.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RiscV
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_nuevaPRueba IS
END tb_nuevaPRueba;
 
ARCHITECTURE behavior OF tb_nuevaPRueba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RiscV
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Salida7Segmentos : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Salida7Segmentos : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RiscV PORT MAP (
          Clock => Clock,
          Reset => Reset,
          Salida7Segmentos => Salida7Segmentos
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		
      wait;
   end process;

END;
