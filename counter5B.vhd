----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:17 04/15/2017 
-- Design Name: 
-- Module Name:    count - Behavioral 
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

entity counter5B is
    Port ( inp : in  STD_LOGIC_VECTOR (4 downto 0);
           init : in  STD_LOGIC;
           count : in  STD_LOGIC;
           z : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end counter5B;

architecture Behavioral of counter5B is
signal num,one: std_logic_vector (4 downto 0);
begin
one <= "00001";
SEQ:process (clk,init)
variable temp : std_logic_vector (4 downto 0);
begin
		if rising_edge(clk) then 
			if init='1' then 
				temp := inp;
			elsif count ='1' then
				temp := std_logic_vector(unsigned(temp) - unsigned(one));
			end if;
		end if;
		num <= temp;
		
end process;
z <= '1' when num = "00000" else '0';
end Behavioral;

