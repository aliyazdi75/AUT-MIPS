----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:52 04/29/2017 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

package pkg is
type slt_arr is array (0 to 7) of std_logic_vector(15 downto 0);
end package;

package body pkg is
end package body;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.pkg.all;

entity datapath is
    Port ( clk : in  STD_LOGIC;
           external_reset : in  STD_LOGIC);	
end datapath;

architecture Behavioral of datapath is
component reg_pc_ar  
    Port ( inp : in  STD_LOGIC_VECTOR(11 DOWNTO 0);
           clk : in  STD_LOGIC;
		   load : in  STD_LOGIC;
           load_jump:in  STD_LOGIC; 
		   inc : in  STD_LOGIC;
           branch_pc:in  STD_LOGIC; 
           clr : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR(11 DOWNTO 0));
end component;
component reg_dr_ac_tr  
    Port ( inp : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           clk : in  STD_LOGIC;
		   load : in  STD_LOGIC;
		   inc : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end component; 
component reg_dr 
    Port ( inp : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
		   product_msb : in STD_LOGIC_VECTOR (15 downto 0);
			  finish_mul : in  STD_LOGIC;
           clk : in  STD_LOGIC;
		   load : in  STD_LOGIC;
		   load_mul : in  STD_LOGIC;
		   inc : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end component; 
component ir  
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           load_sign : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outp : inout  STD_LOGIC_VECTOR (15 downto 0));
end component;
component outr  
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component aliM8
		Port ( inp : in slt_arr;
				  sel : in  STD_LOGIC_VECTOR (2 downto 0);
				  outp : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component alu  
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
		     g : in  STD_LOGIC;
		     reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
		   load_sll : in  STD_LOGIC;
		   load_srl : in  STD_LOGIC;
		   load_sra : in  STD_LOGIC;
           alu_plus0 : in  STD_LOGIC;
           alu_out : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC;
			  finish_mul : out STD_LOGIC;
           lt : out  STD_LOGIC;
           eq : out  STD_LOGIC;
           gt : out  STD_LOGIC;
           product_msb : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component  pc_controller 
    Port (out_ir:in  STD_LOGIC_VECTOR (15 downto 0); 
           external_reset:in  STD_LOGIC; 
           clk:in  STD_LOGIC; 
		   finitsh_mul : in STD_LOGIC;
           lt : in  STD_LOGIC;
           eq : in  STD_LOGIC;
           gt : in  STD_LOGIC;
           memread:out  STD_LOGIC; 
           memwrite:out  STD_LOGIC; 
           load_pc:out  STD_LOGIC; 
           load_jump:out  STD_LOGIC; 
           load_ar:out  STD_LOGIC; 
           load_dr:out  STD_LOGIC; 
           load_ac:out  STD_LOGIC; 
           load_tr:out  STD_LOGIC; 
           load_outr:out  STD_LOGIC; 
           load_ir:out  STD_LOGIC; 
           load_sign : out  STD_LOGIC;
		   load_sll : out  STD_LOGIC;
		   load_srl : out  STD_LOGIC;
		   load_sra : out  STD_LOGIC;
           inc_pc:out  STD_LOGIC; 
           branch_pc:out  STD_LOGIC; 
           inc_ar:out  STD_LOGIC; 
		   load_mul : out  STD_LOGIC;
           inc_dr:out  STD_LOGIC; 
           inc_ac:out  STD_LOGIC; 
           inc_tr:out  STD_LOGIC; 
           clr_pc:out  STD_LOGIC; 
           clr_ar:out  STD_LOGIC; 
           clr_dr:out  STD_LOGIC; 
           clr_ac:out  STD_LOGIC; 
           clr_tr:out  STD_LOGIC;
           alu_plus0:out  STD_LOGIC;
           g:out  STD_LOGIC;
           sAlu:out  STD_LOGIC_VECTOR (2 downto 0);
           s:out  STD_LOGIC_VECTOR (2 downto 0)); 
end component;
component memory 
	generic (blocksize : integer := 1024);

	port (clk, readmem, writemem : in std_logic;
		addressbus: in std_logic_vector (11 downto 0);
		databus : inout std_logic_vector (15 downto 0);
		memdataready : out std_logic);
end component;

signal load_pc,load_jump,load_ar,load_dr,load_mul,load_ac,load_tr,load_outr,load_ir,load_sign,load_sll,load_srl,load_sra,
		   inc_pc,branch_pc,inc_ar,inc_dr,inc_ac,inc_tr,
		   clr_pc,clr_ar,clr_dr,clr_ac,clr_tr,
		   memread,memwrite,memdataready,finish_mul,lt,eq,gt,
		   g,alu_plus0,cout,
			init,count,z: STD_LOGIC;
signal s,sAlu : STD_LOGIC_VECTOR (2 downto 0);
signal out_pc,out_ar : STD_LOGIC_VECTOR (11 downto 0);
signal product_msb,bus_out,alu_out,out_dr,out_ac,out_tr,out_outr,out_ir,out_mem : STD_LOGIC_VECTOR (15 downto 0);
signal slt : slt_arr;
begin

	
	mypc: reg_pc_ar port map (bus_out(11 downto 0),clk,load_jump,load_pc,inc_pc,branch_pc,clr_pc,out_pc);
	myar: reg_pc_ar port map (bus_out(11 downto 0),clk,load_jump,load_ar,inc_ar,branch_pc,clr_ar,out_ar);
	mydr: reg_dr port map (bus_out,product_msb,finish_mul,clk,load_dr,load_mul,inc_dr,clr_dr,out_dr);
	myac: reg_dr_ac_tr port map (alu_out,clk,load_ac,inc_ac,clr_ac,out_ac);
	mytr: reg_dr_ac_tr port map (bus_out,clk,load_tr,inc_tr,clr_tr,out_tr);
	myir: ir port map (bus_out,load_ir,load_sign,clk,out_ir);
	myoutr: outr port map (bus_out,load_outr,clk,out_outr);
	myalu: alu port map (out_dr,out_ac,sAlu,g,external_reset,clk,load_sll,load_srl,load_sra,alu_plus0,alu_out,cout,finish_mul,lt,eq,gt,product_msb);
	mux: aliM8 port map(slt,s,bus_out);
	mycnt: pc_controller port map(out_ir, external_reset, clk, finish_mul, lt, eq, gt, memread, memwrite,
           load_pc, load_jump, load_ar, load_dr, load_ac, load_tr, load_outr, load_ir, load_sign, load_sll, load_srl, load_sra,
           inc_pc, branch_pc, inc_ar, load_mul, inc_dr, inc_ac, inc_tr, clr_pc, clr_ar,
           clr_dr, clr_ac, clr_tr, alu_plus0, g, sAlu, s);
   mymem: memory port map(clk, memread, memwrite, out_ar, out_mem, memdataready);
	slt(1) <= "0000" & out_ar;
	slt(2) <= "0000" & out_pc;
	slt(3) <= out_dr;
	slt(4) <= out_ac;
	slt(5) <= out_ir;
	slt(6) <= out_tr;
	slt(7)	<= out_mem;
	
end Behavioral;

