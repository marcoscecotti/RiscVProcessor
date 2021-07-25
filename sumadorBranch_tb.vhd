--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:01 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/sumadorBranch_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumadorBranch
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
 
ENTITY sumadorBranch_tb IS
END sumadorBranch_tb;
 
ARCHITECTURE behavior OF sumadorBranch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumadorBranch
    PORT(
         entrada_sumadorBranch_PCounter : IN  std_logic_vector(31 downto 0);
         entrada_sumadorBranch_mux : IN  std_logic_vector(31 downto 0);
         salida_sumadorBranch : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_sumadorBranch_PCounter : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_sumadorBranch_mux : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida_sumadorBranch : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumadorBranch PORT MAP (
          entrada_sumadorBranch_PCounter => entrada_sumadorBranch_PCounter,
          entrada_sumadorBranch_mux => entrada_sumadorBranch_mux,
          salida_sumadorBranch => salida_sumadorBranch
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      entrada_sumadorBranch_PCounter <= "00000000000000000000000000000000";
		entrada_sumadorBranch_mux <= "00000000000000000000001110000000";

      -- insert stimulus here 

      wait;
   end process;

END;
