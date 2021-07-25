--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:15 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/mux_op2_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_op2
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
 
ENTITY mux_op2_tb IS
END mux_op2_tb;
 
ARCHITECTURE behavior OF mux_op2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_op2
    PORT(
         entrada_mux_op2_1 : IN  std_logic_vector(31 downto 0);
         entrada_mux_op2_2 : IN  std_logic_vector(31 downto 0);
         señal_op2 : IN  std_logic;
         salida_mux_op2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_mux_op2_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_mux_op2_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal señal_op2 : std_logic := '0';

 	--Outputs
   signal salida_mux_op2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_op2 PORT MAP (
          entrada_mux_op2_1 => entrada_mux_op2_1,
          entrada_mux_op2_2 => entrada_mux_op2_2,
          señal_op2 => señal_op2,
          salida_mux_op2 => salida_mux_op2
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      entrada_mux_op2_1 <= "00000000000000000000000000000000";
		entrada_mux_op2_2 <= "00000000000000000000001110000000";
		señal_op2 <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
