----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:10 04/29/2017 
-- Design Name: 
-- Module Name:    outr - Behavioral 
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

entity outr is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (15 downto 0));
end outr;

architecture Behavioral of outr is

begin

	SEQ: process(clk,load)
	  begin
		if rising_edge(clk) and load = '1' then
			outp <= inp;
		end if;
   end process;

end Behavioral;

