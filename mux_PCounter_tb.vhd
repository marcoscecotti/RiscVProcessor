--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:12:56 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/mux_PCounter_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_PCounter
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
 
ENTITY mux_PCounter_tb IS
END mux_PCounter_tb;
 
ARCHITECTURE behavior OF mux_PCounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_PCounter
    PORT(
         entrada_mux_PCounter_Sumador4bits : IN  std_logic_vector(31 downto 0);
         entrada_mux_PCounter_SumadorBranch : IN  std_logic_vector(31 downto 0);
         señal_branch : IN  std_logic;
         salida_mux_PCounter : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_mux_PCounter_Sumador4bits : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_mux_PCounter_SumadorBranch : std_logic_vector(31 downto 0) := (others => '0');
   signal señal_branch : std_logic := '0';

 	--Outputs
   signal salida_mux_PCounter : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_PCounter PORT MAP (
          entrada_mux_PCounter_Sumador4bits => entrada_mux_PCounter_Sumador4bits,
          entrada_mux_PCounter_SumadorBranch => entrada_mux_PCounter_SumadorBranch,
          señal_branch => señal_branch,
          salida_mux_PCounter => salida_mux_PCounter
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		entrada_mux_PCounter_Sumador4bits <= "00000000000000000000000000000000";
		entrada_mux_PCounter_SumadorBranch <= "00000000000000000000001110000000";
      señal_branch <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
