--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:19:10 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/Unidad_Control_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_Control
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
 
ENTITY Unidad_Control_tb IS
END Unidad_Control_tb;
 
ARCHITECTURE behavior OF Unidad_Control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_Control
    PORT(
         f7 : IN  std_logic;
         f3 : IN  std_logic_vector(2 downto 0);
         op_code : IN  std_logic_vector(4 downto 0);
         we_br : OUT  std_logic;
         alu_op : OUT  std_logic_vector(2 downto 0);
         señal_op2 : OUT  std_logic;
         señal_wd : OUT  std_logic_vector(1 downto 0);
         señal_imm : OUT  std_logic_vector(1 downto 0);
         señal_branch : OUT  std_logic;
         señal_jump : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal f7 : std_logic := '0';
   signal f3 : std_logic_vector(2 downto 0) := (others => '0');
   signal op_code : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal we_br : std_logic;
   signal alu_op : std_logic_vector(2 downto 0);
   signal señal_op2 : std_logic;
   signal señal_wd : std_logic_vector(1 downto 0);
   signal señal_imm : std_logic_vector(1 downto 0);
   signal señal_branch : std_logic;
   signal señal_jump : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_Control PORT MAP (
          f7 => f7,
          f3 => f3,
          op_code => op_code,
          we_br => we_br,
          alu_op => alu_op,
          señal_op2 => señal_op2,
          señal_wd => señal_wd,
          señal_imm => señal_imm,
          señal_branch => señal_branch,
          señal_jump => señal_jump
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      f7 <= '0';
		f3 <= "000";
		op_code <= "00110";

      -- insert stimulus here 

      wait;
   end process;

END;
