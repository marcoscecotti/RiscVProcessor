--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:07:12 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/RiscV_tb.vhd
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
 
ENTITY RiscV_tb IS
END RiscV_tb;
 
ARCHITECTURE behavior OF RiscV_tb IS 
 
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
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RiscV PORT MAP (
          Clock => Clock,
          Reset => Reset,
          Salida7Segmentos => Salida7Segmentos
        );

   -- Clock process definitions
  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     

      -- insert stimulus here 

      wait;
   end process;

END;
