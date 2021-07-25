--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:21 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/and_saltos_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: and_saltos
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
 
ENTITY and_saltos_tb IS
END and_saltos_tb;
 
ARCHITECTURE behavior OF and_saltos_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT and_saltos
    PORT(
         entrada_and_saltos_Bandera : IN  std_logic;
         entrada_and_saltos_señal_Branch : IN  std_logic;
         salida_and_saltos : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_and_saltos_Bandera : std_logic := '0';
   signal entrada_and_saltos_señal_Branch : std_logic := '0';

 	--Outputs
   signal salida_and_saltos : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: and_saltos PORT MAP (
          entrada_and_saltos_Bandera => entrada_and_saltos_Bandera,
          entrada_and_saltos_señal_Branch => entrada_and_saltos_señal_Branch,
          salida_and_saltos => salida_and_saltos
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      entrada_and_saltos_Bandera <= '0';
		entrada_and_saltos_señal_Branch <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;
