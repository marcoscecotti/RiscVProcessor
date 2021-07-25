--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:19:26 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/mem_RAM_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_RAM
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
 
ENTITY mem_RAM_tb IS
END mem_RAM_tb;
 
ARCHITECTURE behavior OF mem_RAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem_RAM
    PORT(
         wa3_RAM : IN  std_logic_vector(5 downto 0);
         we3_RAM : IN  std_logic;
         wd3_RAM : IN  std_logic_vector(31 downto 0);
         dout_RAM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wa3_RAM : std_logic_vector(5 downto 0) := (others => '0');
   signal we3_RAM : std_logic := '0';
   signal wd3_RAM : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal dout_RAM : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem_RAM PORT MAP (
          wa3_RAM => wa3_RAM,
          we3_RAM => we3_RAM,
          wd3_RAM => wd3_RAM,
          dout_RAM => dout_RAM
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		we3_RAM <= '0';
      wa3_RAM <= ("000001");--1
		
	   wait for 10 ns;	
		we3_RAM <= '1';
      wa3_RAM <=  ("000010");--2
      wd3_RAM <= ("00000000000000000000000000000001");
		 wait for 10 ns;	
		we3_RAM <= '0';
      wa3_RAM <= ("000010");--2
		
      wait;
   end process;

END;
