--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:12:35 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/mux_Jump_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_Jump
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
 
ENTITY mux_Jump_tb IS
END mux_Jump_tb;
 
ARCHITECTURE behavior OF mux_Jump_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_Jump
    PORT(
         entrada_mux_jump_IMM : IN  std_logic_vector(31 downto 0);
         entrada_mux_jump_Shift : IN  std_logic_vector(31 downto 0);
         señal_jump : IN  std_logic;
         salida_mux_jump : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_mux_jump_IMM : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_mux_jump_Shift : std_logic_vector(31 downto 0) := (others => '0');
   signal señal_jump : std_logic := '0';

 	--Outputs
   signal salida_mux_jump : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_Jump PORT MAP (
          entrada_mux_jump_IMM => entrada_mux_jump_IMM,
          entrada_mux_jump_Shift => entrada_mux_jump_Shift,
          señal_jump => señal_jump,
          salida_mux_jump => salida_mux_jump
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		entrada_mux_jump_IMM <= "00000000000000000000000000000000";
		entrada_mux_jump_Shift <= "00000000000000000000000111000000";
      señal_jump <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
