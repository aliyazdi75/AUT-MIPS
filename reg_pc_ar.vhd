----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:01 04/29/2017 
-- Design Name: 
-- Module Name:    ar - Behavioral 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_pc_ar is
    Port ( inp : in  STD_LOGIC_VECTOR(11 DOWNTO 0);
           clk : in  STD_LOGIC;
			  load : in  STD_LOGIC;
           load_jump: in  STD_LOGIC; 
			  inc : in  STD_LOGIC;
           branch_pc:in  STD_LOGIC; 
           clr : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR(11 DOWNTO 0));
end reg_pc_ar;

architecture Behavioral of reg_pc_ar is
	signal one, four, signed_ext : STD_LOGIC_VECTOR (11 downto 0);
begin

	one <= "000000000001";
	four <= "000000000100";
    signed_ext <= inp(5) & inp(5) &  inp(5) & inp(5) & inp(5)
				  & inp(5) & inp(5) & inp(4) & inp(3) & inp(2)
				  & inp(1) & inp(0);	
	SEQ: process(clr,inc,clk,load)
	  begin
		if(clr = '1')then
			outp <= "000000000000";
		elsif rising_edge(clk) then
			if load = '1' then
				outp <= inp;
			elsif load_jump = '1' then
				outp <= inp(11 downto 1) & '0'; 
			elsif inc = '1' then
				outp <= std_logic_vector(unsigned(inp) + unsigned(one));
			elsif branch_pc = '1' then
				outp <= std_logic_vector(unsigned(inp) + unsigned(four) + unsigned(signed_ext(10 downto 0) & '0'));
			end if;
		end if;
   end process;


end Behavioral;


