----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:40 10/24/2019 
-- Design Name: 
-- Module Name:    RiscV - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RiscV is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Salida7Segmentos : out  STD_LOGIC_VECTOR (7 downto 0));
end RiscV;

architecture Behavioral of RiscV is

	COMPONENT divisor_frecuecia
	PORT(
		entrada : IN  std_logic;
      reset_clk : IN  std_logic;
      salida1 : OUT  std_logic;
		salida2 : OUT  std_logic
	);
	END COMPONENT;

	COMPONENT Camino_Datos
	PORT(
		Clock : IN std_logic;
		Reset : IN std_logic;
		Ctrl_in : IN std_logic_vector(10 downto 0);
		Data_Load : IN std_logic_vector(31 downto 0);          
		we : OUT std_logic;
		Ctrl_out : OUT std_logic_vector(8 downto 0);
		Dir : OUT std_logic_vector(5 downto 0);
		Dout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Unidad_Control
	PORT(
		f7 : IN std_logic;
		f3 : IN std_logic_vector(2 downto 0);
		op_code : IN std_logic_vector(4 downto 0);          
		we_br : OUT std_logic;
		alu_op : OUT std_logic_vector(2 downto 0);
		señal_op2 : OUT std_logic;
		señal_wd : OUT std_logic_vector(1 downto 0);
		señal_imm : OUT std_logic_vector(1 downto 0);
		señal_branch : OUT std_logic;
		señal_jump : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT mem_RAM
	PORT(
		wa3_RAM : IN std_logic_vector(5 downto 0);
		we3_RAM : IN std_logic;
		wd3_RAM : IN std_logic_vector(31 downto 0);          
		dout_RAM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

--Señales auxiliares
signal sTemps: std_logic_vector(12 downto 0);
signal SalidaRam : std_logic_vector(31 downto 0);
signal Salida_ALU : std_logic_vector(31 downto 0);
signal aux_Ctrl_in : std_logic_vector(10 downto 0);
signal aux_Ctrl_out : std_logic_vector(8 downto 0);
signal aux_Dir : std_logic_vector(5 downto 0);

signal aux_we_br : std_logic;
signal aux_alu_op : std_logic_vector(2 downto 0);
signal aux_sel_op2 : std_logic;
signal aux_sel_wd : std_logic_vector(1 downto 0);
signal aux_sel_imm : std_logic_vector(1 downto 0);
signal aux_branch : std_logic;
signal aux_jump : std_logic;
signal aux_we : std_logic;
signal salida_clk_7seg : std_logic;
signal salida_clk : std_logic;
begin

Inst_divisor_frecuecia: divisor_frecuecia PORT MAP(
		entrada => Clock,
      reset_clk  => Reset,
      salida1 => salida_clk,
		salida2 => salida_clk_7seg
	);


--Concatenacion de todas las señales de salida de la unidad de control
aux_Ctrl_in <= aux_we_br & aux_alu_op & aux_sel_op2 & aux_sel_wd & aux_sel_imm & aux_branch & aux_jump;

--Instancias
	Inst_Camino_Datos: Camino_Datos PORT MAP(
		Clock => Clock,
		Reset => Reset,
		Ctrl_in => aux_Ctrl_in,
		Data_Load => SalidaRam,
		we => aux_we,
		Ctrl_out => aux_Ctrl_out,
		Dir => aux_Dir,
		Dout => Salida_ALU
	);
	
	Inst_Unidad_Control: Unidad_Control PORT MAP(
		f7 => aux_Ctrl_out(8),
		f3 => aux_Ctrl_out(7 downto 5),
		op_code => aux_Ctrl_out(4 downto 0),
		we_br => aux_we_br,
		alu_op => aux_alu_op,
		señal_op2 => aux_sel_op2,
		señal_wd => aux_sel_wd,
		señal_imm => aux_sel_imm,
		señal_branch => aux_branch,
		señal_jump => aux_jump
	);
		
	Inst_mem_RAM: mem_RAM PORT MAP(
		wa3_RAM => aux_Dir,
		we3_RAM => aux_we,
		wd3_RAM => Salida_ALU,
		dout_RAM => SalidaRam
	);

Salida7Segmentos <= Salida_ALU(7 downto 0);

end Behavioral;

