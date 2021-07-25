--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:00 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/sigext_12_32_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sigext_12_32
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
 
ENTITY sigext_12_32_tb IS
END sigext_12_32_tb;
 
ARCHITECTURE behavior OF sigext_12_32_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sigext_12_32
    PORT(
         entrada_sigext_12_32 : IN  std_logic_vector(11 downto 0);
         salida_sigext_12_32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_sigext_12_32 : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal salida_sigext_12_32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sigext_12_32 PORT MAP (
          entrada_sigext_12_32 => entrada_sigext_12_32,
          salida_sigext_12_32 => salida_sigext_12_32
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      entrada_sigext_12_32 <= "000000000000";

      -- insert stimulus here 

      wait;
   end process;

END;
