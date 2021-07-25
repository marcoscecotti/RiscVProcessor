--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:13 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/Camino_Datos_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Camino_Datos
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
 
ENTITY Camino_Datos_tb IS
END Camino_Datos_tb;
 
ARCHITECTURE behavior OF Camino_Datos_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Camino_Datos
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Ctrl_in : IN  std_logic_vector(10 downto 0);
         Data_Load : IN  std_logic_vector(31 downto 0);
         we : OUT  std_logic;
         Ctrl_out : OUT  std_logic_vector(8 downto 0);
         Dir : OUT  std_logic_vector(5 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Ctrl_in : std_logic_vector(10 downto 0) := (others => '0');
   signal Data_Load : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal we : std_logic;
   signal Ctrl_out : std_logic_vector(8 downto 0);
   signal Dir : std_logic_vector(5 downto 0);
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Camino_Datos PORT MAP (
          Clock => Clock,
          Reset => Reset,
          Ctrl_in => Ctrl_in,
          Data_Load => Data_Load,
          we => we,
          Ctrl_out => Ctrl_out,
          Dir => Dir,
          Dout => Dout
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		Ctrl_in <= "00001001100";
		Data_Load <= "00000000000000000000001110000000";
		

      -- insert stimulus here 

      wait;
   end process;

END;
