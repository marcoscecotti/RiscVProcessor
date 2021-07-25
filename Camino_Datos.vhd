----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:23 10/24/2019 
-- Design Name: 
-- Module Name:    Camino_Datos - Behavioral 
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

entity Camino_Datos is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Ctrl_in : in  STD_LOGIC_VECTOR (10 downto 0);
           Data_Load : in  STD_LOGIC_VECTOR (31 downto 0);
           we : out  STD_LOGIC;
           Ctrl_out : out  STD_LOGIC_VECTOR (8 downto 0);
           Dir : out  STD_LOGIC_VECTOR (5 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Camino_Datos;

architecture Behavioral of Camino_Datos is

	COMPONENT ALU
	PORT(
		entradaAlu1: IN std_logic_vector(31 downto 0);
		entradaAlu2 : IN std_logic_vector(31 downto 0);
		señal_Alu : IN std_logic_vector(2 downto 0);
		clk : IN std_logic;          
		salida_Alu : OUT std_logic_vector(31 downto 0);
		bandera_Alu : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Banco_Registros
	PORT(
		clk : IN std_logic;
		we3 : IN std_logic;
		ra1 : IN std_logic_vector(4 downto 0);
		ra2 : IN std_logic_vector(4 downto 0);
		wa3 : IN std_logic_vector(4 downto 0);
		wd3 : IN std_logic_vector(31 downto 0);          
		rd1 : OUT std_logic_vector(31 downto 0);
		rd2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador_4bits
	PORT(
		pc_in : IN std_logic_vector(31 downto 0);          
		pc_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mem_ROM
	PORT(
		clk : IN std_logic;
		entrada_ROM: IN std_logic_vector(31 downto 0);          
		dout_ROM: OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mi_PCount
	PORT(
		pc_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		pc_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	

	COMPONENT mux_Jump
	PORT(
		entrada_mux_jump_IMM : IN std_logic_vector(31 downto 0);
		entrada_mux_jump_Shift : IN std_logic_vector(31 downto 0);
		señal_jump : IN std_logic;          
		salida_mux_Jump : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux_PCounter
	PORT(
		entrada_mux_PCounter_Sumador4bits : IN std_logic_vector(31 downto 0);
		entrada_mux_PCounter_SumadorBranch : IN std_logic_vector(31 downto 0);
		señal_branch : IN std_logic;
		salida_mux_PCounter : out std_logic_vector(31 downto 0)       
		);
	END COMPONENT;
	
	COMPONENT mux_op2
	PORT(
		entrada_mux_op2_1: IN std_logic_vector(31 downto 0);
		entrada_mux_op2_2 : IN std_logic_vector(31 downto 0);
		señal_op2 : IN std_logic;          
		salida_mux_op2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux_rd_br
	PORT(
		entrada_mux_rd_br_alu : IN std_logic_vector(31 downto 0);
		entrada_mux_rd_br_sumador4bits : IN std_logic_vector(31 downto 0);
		entrada_mux_rd_br_ram : IN std_logic_vector(31 downto 0);
		señal_wd : IN std_logic_vector(1 downto 0);          
		salida_mux_rd_br : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sigext_20_32
	PORT(
		entrada_sigext_20_32 : IN std_logic_vector(31 downto 0);
		salida_sigext_20_32 : out std_logic_vector(31 downto 0)       
		);
	END COMPONENT;
	
	COMPONENT sigext_12_32
	PORT(
		entrada_sigext_12_32 : IN std_logic_vector(11 downto 0);          
		salida_sigext_12_32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sumadorBranch
	PORT(
		entrada_sumadorBranch_PCounter : IN std_logic_vector(31 downto 0);
		entrada_sumadorBranch_Mux : IN std_logic_vector(31 downto 0);          
		salida_sumadorBranch : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT and_saltos
	PORT(
		entrada_and_saltos_Bandera : IN std_logic;
		entrada_and_saltos_señal_Branch : IN std_logic;          
		salida_and_saltos : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT shift
	PORT(
		entradaShift : IN std_logic_vector(31 downto 0);          
		salidaShift : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux_IMM
	PORT(
		x : IN std_logic_vector(31 downto 0);
		y : IN std_logic_vector(31 downto 0);
		z : IN std_logic_vector(31 downto 0);
		señal_IMM : IN std_logic_vector(1 downto 0);          
		salida_mux_IMM : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;


	--Aqui sus señales y sus alias
	
	signal instr : std_logic_vector(31 downto 0);
	alias opcode : std_logic_vector(6 downto 0) is instr(6 downto 0);
	alias rs1 : std_logic_vector(4 downto 0) is instr(19 downto 15);
	alias rs2 : std_logic_vector(4 downto 0) is instr(24 downto 20);
	alias rd : std_logic_vector(4 downto 0) is instr(11 downto 7);
	alias fn7 : std_logic_vector(6 downto 0) is instr(31 downto 25);
	alias fn3 : std_logic_vector(2 downto 0) is instr(14 downto 12);	
	alias inm : std_logic_vector(11 downto 0) is instr(31 downto 20);
	alias sh : std_logic_vector(4 downto 0) is instr(24 downto 20);
	
	
	signal aux_bandera : std_logic;
	signal Salida1BR : STD_LOGIC_VECTOR (31 downto 0);
	signal Salida2BR : STD_LOGIC_VECTOR (31 downto 0);
	signal Salida_ALU : STD_LOGIC_VECTOR (31 downto 0);
	signal Salida_mux_rd_br : STD_LOGIC_VECTOR (31 downto 0);
	signal SalidaPCounter :  STD_LOGIC_VECTOR (31 downto 0);
	signal SalidaSumador : STD_LOGIC_VECTOR (31 downto 0);
	signal SalidaIMM : STD_LOGIC_VECTOR (31 downto 0);
	signal Salida_Shift : STD_LOGIC_VECTOR (31 downto 0);
	signal SalidaSumadorBranch : STD_LOGIC_VECTOR (31 downto 0);
	signal Salida_muxop2 :  STD_LOGIC_VECTOR (31 downto 0);
	signal Salida_sigext_20_32 : STD_LOGIC_VECTOR (31 downto 0);
	signal SalidaAnd : STD_LOGIC;
	signal Salida_mux_PCounter : STD_LOGIC_VECTOR (31 downto 0);
	signal SalidaJump : STD_LOGIC_VECTOR(31 downto 0);
	signal SalidaMuxImm : STD_LOGIC_VECTOR(11 downto 0);
	
begin
		
	Inst_ALU: ALU PORT MAP(
		entradaAlu1=> Salida1BR,
		entradaAlu2=> Salida_muxop2,
		salida_Alu => Salida_ALU,
		señal_Alu => Ctrl_in(9 downto 7),
		clk => Clock,
		bandera_Alu => aux_bandera
	);

	Dout <= Salida_ALU;
	we <= '1'; -- Prueba solamente
	
	Inst_Banco_Registros: Banco_Registros PORT MAP(
		clk => Clock,
		we3 => Ctrl_in(10),
		ra1 => rs1,
		ra2 => rs2,
		wa3 => rd,
		wd3 => Salida_mux_rd_br,
		rd1 => Salida1BR,
		rd2 => Salida2BR
	);
	
	Dir<=Salida2BR(7 downto 2);
	
	Inst_Sumador_4bits: Sumador_4bits PORT MAP(
		pc_in => SalidaPCounter,
		pc_out => SalidaSumador
	);
	
	Inst_mem_ROM: mem_ROM PORT MAP(
		clk => Clock,
		entrada_ROM => SalidaPCounter,
		dout_ROM => instr
	);

--Concatenacion señales del datapath hacia unidad de control
	Ctrl_out<=fn7(5)&fn3&opcode(6 downto 2);

	Inst_mi_PCount: mi_PCount PORT MAP(
		pc_in => Salida_mux_PCounter,
		pc_out => SalidaPCounter,
		reset => Reset,
		clk => Clock
	);
	
	Inst_mux_Jump: mux_Jump PORT MAP(
		entrada_mux_jump_IMM => SalidaIMM,
		entrada_mux_jump_Shift => Salida_Shift,
		señal_jump => Ctrl_in(0),
		salida_mux_jump => SalidaJump
	);
	
	Inst_mux_PCounter: mux_PCounter PORT MAP(
		entrada_mux_PCounter_Sumador4bits => SalidaSumador,
		entrada_mux_PCounter_SumadorBranch => SalidaSumadorBranch,
		señal_branch => SalidaAnd,
		salida_mux_PCounter => Salida_mux_PCounter
	);
	
	Inst_mux_op2: mux_op2 PORT MAP(
		entrada_mux_op2_1=> Salida2BR,
		entrada_mux_op2_2 => SalidaIMM,
		señal_op2 => Ctrl_in(6),
		salida_mux_op2 => Salida_muxop2
	);
	
	Inst_mux_rd_br: mux_rd_br PORT MAP(
		entrada_mux_rd_br_alu => Salida_ALU,
		entrada_mux_rd_br_sumador4bits => SalidaSumador,
		entrada_mux_rd_br_ram => Data_Load,
		salida_mux_rd_br => Salida_mux_rd_br,
		señal_wd => Ctrl_in(5 downto 4)
	);
	
	Inst_sigext_20_32: sigext_20_32 PORT MAP(
		entrada_sigext_20_32 => instr,
		salida_sigext_20_32 => Salida_sigext_20_32
	);

	Inst_sigext: sigext_12_32 PORT MAP(
		entrada_sigext_12_32 => salidaMuxImm,
		salida_sigext_12_32 => SalidaIMM
	);
	
	Inst_sumadorBranch: sumadorBranch PORT MAP(
		entrada_sumadorBranch_PCounter => SalidaPCounter,
		entrada_sumadorBranch_mux => SalidaJump,
		salida_sumadorBranch => SalidaSumadorBranch
	);
	
	Inst_and_saltos: and_saltos PORT MAP(
		entrada_and_saltos_Bandera => aux_bandera,
		entrada_and_saltos_señal_Branch => Ctrl_in(1),
		salida_and_saltos => SalidaAnd
	);

	Inst_shift: shift PORT MAP(
		entradaShift => Salida_sigext_20_32,
		salidaShift => Salida_Shift
	);

	Inst_mux_IMM: mux_IMM PORT MAP(
		x => instr,
		y => instr,
		z => instr,
		señal_IMM => Ctrl_in(3 downto 2),
		salida_mux_IMM => salidaMuxImm
	);

end Behavioral;

