----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:31 04/29/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
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
end alu;

architecture Behavioral of alu is
	component aliM8 is
		Port ( inp : in slt_arr;
				  sel : in  STD_LOGIC_VECTOR (2 downto 0);
				  outp : out  STD_LOGIC_VECTOR (15 downto 0));
	end component aliM8;
	component ali16BFA
		Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component multiply
    Port ( multiplicand : in STD_LOGIC_VECTOR (15 downto 0);
           multiplier : in STD_LOGIC_VECTOR (15 downto 0);
			  g : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
			  finish : out STD_LOGIC;
              product_msb : inout STD_LOGIC_VECTOR (15 downto 0);
              product_lsb : inout STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component comprator16Bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           l : in  STD_LOGIC;
           e : in  STD_LOGIC;
           g : in  STD_LOGIC;
           lt : out  STD_LOGIC;
           eq : out  STD_LOGIC;
           gta : out  STD_LOGIC);
	end component;
	signal product_lsb,pmsb,alu_signal,alu_out_plus0 :  STD_LOGIC_VECTOR (15 downto 0);
	signal slt : slt_arr;
	signal coutf, couts, finish : STD_LOGIC;
begin
	
	slt(2) <= a and b;
	slt(3) <= a or b;
	slt(4) <= a xor b;
	mul: multiply port map(a,b,g,reset,clk,finish,pmsb,product_lsb);
	product_msb <= pmsb;
	se: process(finish)
		begin
			if finish = '1' then
				slt(5) <= product_lsb;
			end if;
	end process;
	finish_mul <=  s(2) and (not s(1)) and s(0) and finish;
	adder: ali16BFA port map(a,b,'0',coutf,slt(0));
	plus0: ali16BFA port map(a,"0000000000000000",'0',coutf,alu_out_plus0);
	sub: ali16BFA port map(a,not(b),'1',couts,slt(1)); 
	mux: aliM8 port map(slt,s,alu_signal);
	cmp: comprator16Bits port map(a,b,'0','1','0',lt,eq,gt);
	slt(6) <= a;
	Shift:process(clk,load_sll,load_sra,load_srl,alu_plus0)
	variable tmp_sll,tmp_srl,tmp_sra :  STD_LOGIC_VECTOR (15 downto 0);
	 begin
		if rising_edge(clk) then 
			if load_sll = '1' then
				tmp_sll := tmp_sll(14 downto 0) & '0';
				alu_out <= tmp_sll;
			elsif load_sra = '1' then
				tmp_sra := tmp_sra(15) & tmp_sra(15 downto 1);
				alu_out <= tmp_sra;
			elsif load_srl = '1' then
				tmp_srl := '0' & tmp_srl(15 downto 1);
				alu_out <= tmp_srl;
			elsif alu_plus0 = '1' then
				alu_out <= alu_out_plus0;
			else
				tmp_sll := b;
				tmp_srl := b;
				tmp_sra := b;
				alu_out <= alu_signal;
			end if;
		end if;
	end process;
	cout <= ((not s(2)) and (not s(1)) and (not s(0)) and coutf) or ((not s(2)) and (not s(1)) and s(0) and couts); 

end Behavioral;

