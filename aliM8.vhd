----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:51 03/04/2017 
-- Design Name: 
-- Module Name:    aliM8 - Behavioral 
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

library ieee;
use ieee.std_logic_1164.all;
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

entity aliM8 is
    Port ( inp : in slt_arr;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0));
end aliM8;
architecture Behavioral of aliM8 is
begin
	with sel select
    outp <= inp(0) when "000",
         inp(1) when "001",
         inp(2) when "010",
         inp(3) when "011",
         inp(4) when "100",
         inp(5) when "101",
         inp(6) when "110",
         inp(7) when "111",
         "0000000000000000"  when others;
end Behavioral;

