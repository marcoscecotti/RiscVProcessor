--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:08:48 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/divisor_frecuencia_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divisor_frecuecia
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
 
ENTITY divisor_frecuencia_tb IS
END divisor_frecuencia_tb;
 
ARCHITECTURE behavior OF divisor_frecuencia_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisor_frecuecia
    PORT(
         entrada : IN  std_logic;
         reset_clk : IN  std_logic;
         salida1 : OUT  std_logic;
         salida2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal reset_clk : std_logic := '0';

 	--Outputs
   signal salida1 : std_logic;
   signal salida2 : std_logic;

   -- Clock period definitions
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divisor_frecuecia PORT MAP (
          entrada => entrada,
          reset_clk => reset_clk,
          salida1 => salida1,
          salida2 => salida2
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     entrada <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
