------------------------------------------------------------------------------------Company:--Engineer:----Create Date:13:54:47 05/13/2017--Design Name:--Module Name:pc_controller - Behavioral--Project Name:--Target Devices:--Tool versions:--Description:----Dependencies:----Revision:--Revision 0.01 - File Created--Additional Comments:------------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; --Uncomment the following library declaration if using--arithmetic functions with Signed or Unsigned values--use IEEE.NUMERIC_STD.ALL; --Uncomment the following library declaration if instantiating--any Xilinx primitives in this code.--library UNISIM; --use UNISIM.VComponents.all; 

entity pc_controller is
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
end pc_controller; 

architecture Behavioral of pc_controller is
component counter5B 
    Port ( inp : in  STD_LOGIC_VECTOR (4 downto 0);
           init : in  STD_LOGIC;
           count : in  STD_LOGIC;
           z : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end component;
	signal init,count,z : STD_LOGIC;
	signal outir : STD_LOGIC_VECTOR(4 downto 0);
	signal irtmp : STD_LOGIC_VECTOR(3 downto 0);
	type state is (Sreset, 
                     SPCPlus1,SPCPlus2,
					 Sfetch1,Sfetch2,Sfetch3,Sfetch4,Sfetch5,
                     SDecode,
                     SRDec,
                     SSwap1,SSwap2,SSwap3,
                     SAddi1,SAddi2,SAddi3,
                     SAndi1,SAndi2,SAndi3,
                     SOri1,SOri2,SOri3,
                     SSll1,SSll2,SSll3,
                     SSrl1,SSrl2,SSrl3,
                     SSra1,SSra2,SSra3,
                     SLhw1,SLhw2,SLhw3,SLhw4,SLhw5,SLhw6,
                     SShw1,SShw2,SShw3,SShw4,SShw5,
                     SAdd1,SAdd2,
                     SSub1,SSub2,
                     SAnd1,SAnd2,
                     SOr1,SOr2,
                     SXor1,SXor2,
                     SMul1,SMul2,
                     SJr10,SJr11,SJr2,SJr3,
                     SJump1,SJump2,SJump3,SJump4,
                     SAluPlus01,SAluPlus02,
                     Si1,Si2,Si3,Si4,
                     SB1,SB2

                     ); 
	signal current_state:state; 
	signal next_state:state; 
begin
	mycounter5B:counter5B port map (outir,init,count,z,clk);
	process (clk, external_reset)
	begin
		if external_reset = '1'then
			current_state <= Sreset; 
		elsif rising_edge(clk)then
			current_state <= next_state; 
		end if; 
	end process; 
   COMB:process (current_state, out_ir, irtmp, finitsh_mul, z, lt, eq, gt)
   begin
      case current_state is
         when Sreset => 
            memread <= '0';
            memwrite <= '0';
            load_pc <= '0';
            load_ar <= '0';
            load_dr <= '0';
            load_ac <= '0';
            load_tr <= '0';
            load_mul <= '0';
				load_sll <= '0';
				load_srl <= '0';
				load_sra <= '0';
				load_sign <= '0';
				load_jump <= '0';
				init <= '0';
            g <= '0';
            alu_plus0 <= '0';
            load_outr <= '0';
            load_ir <= '0';
            inc_pc <= '0';
            inc_ar <= '0';
				branch_pc <= '0';
            inc_dr <= '0';
            inc_ac <= '0';
            inc_tr <= '0';
            clr_pc <= '1';
            clr_ar <= '1';
            clr_dr <= '1';
            clr_ac <= '1';
            clr_tr <= '1';
            s  <= "000";
            sAlu  <= "111";
            next_state <= Sfetch1;
        when SPCPlus1 =>
            inc_pc <= '1';
            s <= "010";
            next_state <= SPCPlus2;
        when SPCPlus2 =>
            inc_pc <= '0';
            load_ar <= '1';
            load_ir <= '1';
            next_state <= Sfetch3;
        when SB1 =>
            branch_pc <= '1';
            s <= "010";
            next_state <= SB2;
        when SB2 =>
            branch_pc <= '0';
            load_ar <= '1';
            next_state <= Sfetch1;
         when Sfetch1 =>
            clr_pc <= '0';
            clr_ar <= '0';
            clr_dr <= '0';
            clr_ac <= '0';
            clr_tr <= '0';
            load_ar <= '0';
            s <= "111";
            load_ir <= '0';
            memread <= '1';
            next_state <= Sfetch2;
         when Sfetch2 =>
            memread <= '0';
            load_ir <= '1';
            next_state <= SDecode;
         when Sfetch3 =>
            load_ir <= '0';
            load_ar <= '0';
            next_state <= Sfetch4;
         when Sfetch4 =>
            memread <= '1';
            s <= "111";
            next_state <= Sfetch5;
         when Sfetch5 =>
            memread <= '0';
            next_state <= SDecode;
        when SDecode =>
            s <= "101";
            load_ir <= '0';
            if out_ir(15 downto 12) = "0000" then
                if out_ir(11 downto 9) = "001" then
                    next_state <= SSwap1;
                elsif out_ir(11 downto 9) = "000" then
                    next_state <= SRDec;
                end if;
            elsif out_ir(15 downto 12) = "0001" then
                next_state <= Si1;
            elsif out_ir(15 downto 12) = "0010" then
                next_state <= Si1;
            elsif out_ir(15 downto 12) = "0011" then
                next_state <= Si1;
            elsif out_ir(15 downto 12) = "0100" then
					 if out_ir(11 downto 9) = "000" then
						next_state <= SAluPlus01;
					 else
						next_state <= SSll1;
					 end if;
            elsif out_ir(15 downto 12) = "0101" then
					 if out_ir(11 downto 9) = "000" then
						next_state <= SAluPlus01;
					 else
						next_state <= SSrl1;
					 end if;
            elsif out_ir(15 downto 12) = "0110" then
					 if out_ir(11 downto 9) = "000" then
						next_state <= SAluPlus01;
					 else
						next_state <= SSra1;
					 end if;
            elsif out_ir(15 downto 12) = "0111" then
                next_state <= SLhw1;
            elsif out_ir(15 downto 12) = "1000" then
                next_state <= SShw1;
            elsif out_ir(15 downto 12) = "1111" then
                next_state <= SJump1;

            elsif out_ir(15 downto 12) = "1001" then
                if eq = '1' then
                    next_state <= SB1;
                end if;
            elsif out_ir(15 downto 12) = "1010" then
                if eq = '0' then
                    next_state <= SB1;
                end if;
            elsif out_ir(15 downto 12) = "1011" then
                if lt = '1' then
                    next_state <= SB1;
                end if;
            elsif out_ir(15 downto 12) = "1100" then
                if gt = '1' then
                    next_state <= SB1;
                end if;
            elsif out_ir(15 downto 12) = "1101" then
                if (lt or eq) = '1' then
                    next_state <= SB1;
                end if;
            elsif out_ir(15 downto 12) = "1110" then
                if (gt or eq) = '1' then
                    next_state <= SB1;
                end if;
            end if;
        when SRDec =>
            load_dr <= '0';
            if out_ir(2 downto 0) = "000" then
                next_state <= SAdd1;
            elsif out_ir(2 downto 0) = "001" then
                next_state <= SSub1;
            elsif out_ir(2 downto 0) = "010" then
                next_state <= SAnd1;
            elsif out_ir(2 downto 0) = "011" then
                next_state <= SOr1;
            elsif out_ir(2 downto 0) = "100" then
                next_state <= SXor1;
            elsif out_ir(2 downto 0) = "101" then
                next_state <= SMul1;
            elsif out_ir(2 downto 0) = "110" then
                if eq='1' then
                    if out_ir(11 downto 9) = "000" then
                        next_state <= SJr10;
                    else
                        next_state <= SJr11;
                    end if;          
                end if;
            elsif out_ir(2 downto 0) = "111" then
				if out_ir(11 downto 9) = "000" then
				    next_state <= SJr10;
				else
					next_state <= SJr11;
				end if;            
			end if;
        when SSwap1 =>
            s <= "100";
            load_tr <= '1';
            next_state <= SSwap2;
        when SSwap2 =>
            load_tr <= '0';
            load_ac <= '1';
            alu_plus0 <= '1';
            next_state <= SSwap3;
        when SSwap3 =>
            load_ac <= '0';
            load_dr <= '1';
            alu_plus0 <= '0';
            s <= "110";
            next_state <= SRDec;
        when SAdd1 =>
            sAlu <= "000";
            load_ac <= '1';
            next_state <= SAdd2;
        when SAdd2 =>
            load_ac <= '0';
            next_state <= SPCPlus1;
        when SSub1 =>
            sAlu <= "001";
            load_ac <= '1';
            next_state <= SSub2;
        when SSub2 =>
            load_ac <= '0';
            next_state <= SPCPlus1;
        when SAnd1 =>
            sAlu <= "010";
            load_ac <= '1';
            next_state <= SAdd2;
        when SAnd2 =>
            load_ac <= '0';
            next_state <= SPCPlus1;
        when SOr1 =>
            sAlu <= "011";
            load_ac <= '1';
            next_state <= SOr2;
        when SOr2 =>
            load_ac <= '0';
            next_state <= SPCPlus1;
        when SXor1 =>
            sAlu <= "100";
            load_ac <= '1';
            next_state <= SXor2;
        when SXor2 =>
            load_ac <= '0';
            next_state <= SPCPlus1;
        when SMul1 =>
            sAlu <= "101";
				g <= '1';
            if finitsh_mul = '1' then
					 g <= '0';
                load_ac <= '1';
                load_mul <= '1';
                next_state <= SMul2;
            end if;
        when SMul2 =>
            load_mul <= '0';
            load_ac <= '0';
            next_state <= SPCPlus1;

        when SJr10 =>
            s <= "011";
            next_state <= SJr2;
        when SJr11 =>
            s <= "100";
            next_state <= SJr2;
        when SJr2 =>
            load_pc <= '1';
            next_state <= SJr3;
        when SJr3 =>
            load_pc <= '0';
            next_state <= SPCPlus1;

        when SAluPlus01 =>
            sAlu <= "110";
            load_ac <= '1';
            next_state <= SAluPlus02;
        when SAluPlus02 =>
            load_ac <= '0';
				if out_ir(15 downto 12) = "0100" then
					next_state <= SSll1;
				elsif out_ir(15 downto 12) = "0101" then
					next_state <= SSrl1;
            elsif out_ir(15 downto 12) = "0110" then
					next_state <= SSra1;
				end if;
		  when SSll1 => 
				init <= '1';
				count <= '0';
				load_sll <= '0';
				outir <= out_ir(4 downto 0);
				next_state <= SSll2;
        when SSll2 => 
				init <= '0';
				if z = '0' then
					count <= '1';
					load_sll <= '1';
				else
					load_sll <= '0';
					count <= '0';
					next_state <= SPCPlus1;
				end if;
        when SSll3 => 
				next_state <= SPCPlus1;
        when SSrl1 => 
				init <= '1';
				count <= '0';
				load_srl <= '0';
				outir <= out_ir(4 downto 0);
				next_state <= SSrl2;
        when SSrl2 => 
				init <= '0';
				if z = '0' then
					count <= '1';
					load_srl <= '1';
				else
					count <= '0';
					next_state <= SSrl3;
				end if;
        when SSrl3 =>
            load_srl <= '0';
            next_state <= SPCPlus1;
        when SSra1 => 
				init <= '1';
				count <= '0';
				load_sra <= '0';
				outir <= out_ir(4 downto 0);
				next_state <= SSra2;
        when SSra2 => 
				init <= '0';
				if z = '0' then
					count <= '1';
					load_sra <= '1';
				else
					count <= '1';
					next_state <= SSra3;
				end if;
        when SSra3 =>
            load_sra <= '0';
            next_state <= SPCPlus1;
				
        when SJump1 =>
				s <= "101";
            next_state <= SJump2;
        when SJump2 =>
            load_pc <= '1';
            next_state <= SJump3;
        when SJump3 =>
            load_pc <= '0';
				load_jump <= '1';
            next_state <= SJump4;
        when SJump4 =>
				load_jump <= '0';
            next_state <= SPCPlus1;

        when Si1 =>
            if out_ir(11 downto 9) = "000" then
                irtmp <= out_ir(15 downto 12);
                sAlu <= "110";
                load_ac <= '1';
            end if;                
            next_state <= Si2;
        when Si2 => 
            load_ac <= '0';
            load_sign <= '1';
            next_state <= Si3;
        when Si3 => 
            load_sign <= '0';
            s <= "101";
            load_dr <= '1';
            next_state <= Si4;
        when Si4 => 
            load_dr <= '0';
            if irtmp = "0001" then
                next_state <= SAdd1;
            elsif irtmp = "0010" then
                next_state <= SAnd1;
            elsif irtmp = "0011" then
                next_state <= SOr1;
            end if;
            
        when SLhw1 =>
            load_sign <= '1'; 
            s <= "101";
            next_state <= SLhw2;
        when SLhw2 =>
            load_sign <= '0'; 
            load_dr <= '1';
            sAlu <= "000";
            next_state <= SLhw3;
        when SLhw3 =>
            load_dr <= '0';
            next_state <= SLhw4;
        when SLhw4 =>
            load_ac <= '1';
            s <= "100";
            next_state <= SLhw5;
        when SLhw5 =>
            load_ac <= '0';
            load_dr <= '1';
            load_pc <= '1';
            next_state <= SLhw6;
        when SLhw6 =>
            s <= "010";
            load_dr <= '0';
            load_pc <= '0';
            load_ar <= '1';
            next_state <= Sfetch1;

        when others =>
            next_state <= Sreset;

      end case; 
   end process; 

end Behavioral; 

