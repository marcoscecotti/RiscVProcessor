--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:33 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/ALU_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         entradaAlu1 : IN  std_logic_vector(31 downto 0);
         entradaAlu2 : IN  std_logic_vector(31 downto 0);
         señal_Alu : IN  std_logic_vector(2 downto 0);
         clk : IN  std_logic;
         bandera_Alu : OUT  std_logic;
         salida_Alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entradaAlu1 : std_logic_vector(31 downto 0) := (others => '0');
   signal entradaAlu2 : std_logic_vector(31 downto 0) := (others => '0');
   signal señal_Alu : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal bandera_Alu : std_logic;
   signal salida_Alu : std_logic_vector(31 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          entradaAlu1 => entradaAlu1,
          entradaAlu2 => entradaAlu2,
          señal_Alu => señal_Alu,
          clk => clk,
          bandera_Alu => bandera_Alu,
          salida_Alu => salida_Alu
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     entradaAlu1 <= "00000000000000000000000000000001";
	  entradaAlu2 <= "00000000000000000000001110000000";
	  señal_Alu <= "001";

      -- insert stimulus here 

      wait;
   end process;

END;
