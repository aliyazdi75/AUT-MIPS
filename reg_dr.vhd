----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:07 04/29/2017 
-- Design Name: 
-- Module Name:    reg_dr_ac_tr - Behavioral 
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

entity reg_dr is
    Port ( inp : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
		   product_msb : in STD_LOGIC_VECTOR (15 downto 0);
			  finish_mul : in  STD_LOGIC;
           clk : in  STD_LOGIC;
		   load : in  STD_LOGIC;
		   load_mul : in  STD_LOGIC;
		   inc : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end reg_dr;

architecture Behavioral of reg_dr is
	signal one : STD_LOGIC_VECTOR (15 downto 0);
	signal input : STD_LOGIC_VECTOR (15 downto 0);
begin

	one <= "0000000000000001";
	SEQ: process(clr,finish_mul,inc,clk,load)
	  begin
		if finish_mul='1' then
			input<=product_msb;
		else 
			input<=inp;
		end if;
		if(clr = '1')then
			outp <= "0000000000000000";
		elsif rising_edge(clk) then
			if load = '1' then
				outp <= input;
			elsif load_mul = '1' then
				outp <= input;
			elsif inc = '1' then
				outp <= std_logic_vector(unsigned(input) + unsigned(one));
			end if;
		end if;
   end process;


end Behavioral;


