--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:56 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/Banco_Registros_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Banco_Registros
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
 
ENTITY Banco_Registros_tb IS
END Banco_Registros_tb;
 
ARCHITECTURE behavior OF Banco_Registros_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Banco_Registros
    PORT(
         clk : IN  std_logic;
         we3 : IN  std_logic;
         ra1 : IN  std_logic_vector(4 downto 0);
         ra2 : IN  std_logic_vector(4 downto 0);
         wa3 : IN  std_logic_vector(4 downto 0);
         wd3 : IN  std_logic_vector(31 downto 0);
         rd1 : OUT  std_logic_vector(31 downto 0);
         rd2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal we3 : std_logic := '0';
   signal ra1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ra2 : std_logic_vector(4 downto 0) := (others => '0');
   signal wa3 : std_logic_vector(4 downto 0) := (others => '0');
   signal wd3 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rd1 : std_logic_vector(31 downto 0);
   signal rd2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Banco_Registros PORT MAP (
          clk => clk,
          we3 => we3,
          ra1 => ra1,
          ra2 => ra2,
          wa3 => wa3,
          wd3 => wd3,
          rd1 => rd1,
          rd2 => rd2
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		we <= '1';
		ra1 <= "00001";
		ra2 <= "00101";
		wa3 <= "00011";
		wd3 <= "00000000000000000000001110000000";
		
	
      -- insert stimulus here 

      wait;
   end process;

END;
