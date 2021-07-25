--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:37 10/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Marcos/Downloads/RiscV/RiscV/mux_rd_br_tb.vhd
-- Project Name:  RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_rd_br
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
 
ENTITY mux_rd_br_tb IS
END mux_rd_br_tb;
 
ARCHITECTURE behavior OF mux_rd_br_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_rd_br
    PORT(
         entrada_mux_rd_br_alu : IN  std_logic_vector(31 downto 0);
         entrada_mux_rd_br_sumador4bits : IN  std_logic_vector(31 downto 0);
         entrada_mux_rd_br_ram : IN  std_logic_vector(31 downto 0);
         señal_wd : IN  std_logic_vector(1 downto 0);
         salida_mux_rd_br : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_mux_rd_br_alu : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_mux_rd_br_sumador4bits : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_mux_rd_br_ram : std_logic_vector(31 downto 0) := (others => '0');
   signal señal_wd : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida_mux_rd_br : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_rd_br PORT MAP (
          entrada_mux_rd_br_alu => entrada_mux_rd_br_alu,
          entrada_mux_rd_br_sumador4bits => entrada_mux_rd_br_sumador4bits,
          entrada_mux_rd_br_ram => entrada_mux_rd_br_ram,
          señal_wd => señal_wd,
          salida_mux_rd_br => salida_mux_rd_br
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     entrada_mux_rd_br_alu <= "00000000000000000000000000000000";
	  entrada_mux_rd_br_sumador4bits <= "00000000000000000000001110000000";
	  entrada_mux_rd_br_ram <= "00000001110000000000001110000000";
	  señal_wd <= "00";

      -- insert stimulus here 

      wait;
   end process;

END;
