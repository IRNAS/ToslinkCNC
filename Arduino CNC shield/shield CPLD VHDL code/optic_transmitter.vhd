library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity optic_transmitter is
    Port ( 
	        iCLK : in  STD_LOGIC;
		     s : in  STD_LOGIC_VECTOR (9 downto 0);
		     optic_out : out  STD_LOGIC
		   );
end optic_transmitter;

architecture Behavioral of optic_transmitter is

	function odd_parity (X : std_logic_vector) return std_logic is
		variable TMP : std_logic := '0';
	begin
	  for J in X'range loop
		 TMP := TMP xor X(J);
	  end loop; -- works for any size X
	  return TMP;
	end odd_parity;

	function log2 (x : positive) return natural is
		variable i : natural;
	begin
		i := 0;  
		while (2**i < x) and i < 31 loop
			i := i + 1;
		end loop;
		return i;
	end log2;

	signal shift_reg : STD_LOGIC_VECTOR(11 downto 0) := "000000100000";
	signal tx_output : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	signal optic_cnt : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');

begin
					  
	shift_register:process(iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (optic_cnt = "11001111") then -- packet generating
					shift_reg <= s(9 downto 0)&odd_parity(s(9 downto 0))&(not odd_parity(s(9 downto 0)));
					tx_output <= "10"; -- generate del on output
					optic_cnt <= (others => '0');
			elsif (optic_cnt(3 downto 0) = "1111") then -- end of bit
					shift_reg <= shift_reg(10 downto 0)&'0'; -- shift for one bit and add '0'
					tx_output <= (1 => '0')&shift_reg(11); -- output one bit
					optic_cnt <= optic_cnt + 1;
			else
					optic_cnt <= optic_cnt + 1;
			end if;
			
			case tx_output is	
				when "00" =>
					case optic_cnt(3 downto 2) is
						when "00" =>
							optic_out <= '1';
						when "01" =>
							optic_out <= '1';	
						when "10" =>
							optic_out <= '0';	
						when others =>
							optic_out <= '0';
					end case;
				
				when "01" =>
					case optic_cnt(3 downto 2) is
						when "00" =>
							optic_out <= '0';
						when "01" =>
							optic_out <= '1';	
						when "10" =>
							optic_out <= '0';	
						when others =>
							optic_out <= '1';
					end case;
				
				when others =>
					case optic_cnt(3 downto 2) is
						when "00" =>
							optic_out <= '1';
						when "01" =>
							optic_out <= '1';	
						when "10" =>
							optic_out <= '1';	
						when others =>
							optic_out <= '1';
					end case;
			end case;
						
		end if;
	end process;
	
end Behavioral;