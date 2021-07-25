--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:55 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/mux_IMM_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_IMM
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
 
ENTITY mux_IMM_tb IS
END mux_IMM_tb;
 
ARCHITECTURE behavior OF mux_IMM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_IMM
    PORT(
         x : IN  std_logic_vector(31 downto 0);
         y : IN  std_logic_vector(31 downto 0);
         z : IN  std_logic_vector(31 downto 0);
         señal_IMM : IN  std_logic_vector(1 downto 0);
         salida_mux_IMM : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(31 downto 0) := (others => '0');
   signal y : std_logic_vector(31 downto 0) := (others => '0');
   signal z : std_logic_vector(31 downto 0) := (others => '0');
   signal señal_IMM : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida_mux_IMM : std_logic_vector(11 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_IMM PORT MAP (
          x => x,
          y => y,
          z => z,
          señal_IMM => señal_IMM,
          salida_mux_IMM => salida_mux_IMM
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     x <= "00001111000000000000000000000000";
	  y <= "00000000000000000000000000000000";
	  z <= "00000000000000000000000000000000";
	  señal_IMM <= "00";
      -- insert stimulus here 

      wait;
   end process;

END;
