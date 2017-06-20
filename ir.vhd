----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:22 04/29/2017 
-- Design Name: 
-- Module Name:    ir - Behavioral 
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

entity ir is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           load_sign : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outp : inout  STD_LOGIC_VECTOR (15 downto 0));
end ir;

architecture Behavioral of ir is

begin

	SEQ: process(clk,load)
	  begin
		if rising_edge(clk) then
      if load = '1' then
			  outp <= inp;
      elsif load_sign = '1' then
        outp <= inp(5) & inp(5) & inp(5) & inp(5) & inp(5) & inp(5) &
                 inp(5) & inp(5) & inp(5) & inp(5) & inp(5) &
                  inp(4) & inp(3) & inp(2) & inp(1) & inp(0);
      end if;
		end if;
   end process;

end Behavioral;

