--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:36 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/shift_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift
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
 
ENTITY shift_tb IS
END shift_tb;
 
ARCHITECTURE behavior OF shift_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift
    PORT(
         entradaShift : IN  std_logic_vector(31 downto 0);
         salidaShift : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entradaShift : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salidaShift : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift PORT MAP (
          entradaShift => entradaShift,
          salidaShift => salidaShift
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     entradaShift <= "00000000000000000000001110000000";

      -- insert stimulus here 

      wait;
   end process;

END;
