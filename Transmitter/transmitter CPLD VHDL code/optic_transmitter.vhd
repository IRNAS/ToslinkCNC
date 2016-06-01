library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity optic_transmitter is
    port ( 
	        iCLK : in  std_logic;
		     s : in  std_logic_vector (9 downto 0);
		     optic_out : out  std_logic
		   );
end optic_transmitter;

architecture logic of optic_transmitter is

	function odd_parity (X : std_logic_vector) return std_logic is
		variable TMP : std_logic := '0';
	begin
	  for J in X'range loop
		 TMP := TMP xor X(J);
	  end loop; -- works for any size X
	  return TMP;
	end odd_parity;

	signal shift_reg : std_logic_vector(11 downto 0) := "000000100010";
	signal tx_output : std_logic_vector(1 downto 0) := (others => '0');
	signal optic_cnt : std_logic_vector(4 downto 0) := (others => '0');
	signal bit_cnt : std_logic_vector(3 downto 0) := (others => '0');
	--signal start_of_frame : std_logic := '0';

begin
					  
	shift_register:process(iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (optic_cnt = 0) then -- start of bit pattern
			
				if (bit_cnt = 12) then -- frame generating
					shift_reg <= s(9 downto 0)&odd_parity(s(9 downto 0))&(not odd_parity(s(9 downto 0)));
					bit_cnt <= (others => '0');
					tx_output <= "10"; -- generate DEL on output
					--start_of_frame <= '1';
				else
					shift_reg <= shift_reg(10 downto 0)&'0'; -- shift for one bit and add '0'
					tx_output <= (1 => '0')&shift_reg(11); -- output one bit
					bit_cnt <= bit_cnt + 1;
					--start_of_frame <= '0';
				end if;
				
				optic_cnt <= optic_cnt + 1;
			elsif (optic_cnt = 23) then
				optic_cnt <= (others => '0');
         else
				optic_cnt <= optic_cnt + 1;
				--start_of_frame <= '0';
			end if;
			
			case tx_output is	
				when "00" => -- '0'
					case optic_cnt(4 downto 2) is
						when "000" =>
							optic_out <= '1';
						when "001" =>
							optic_out <= '1';	
						when "010" =>
							optic_out <= '0';	
						when "011" =>
							optic_out <= '0';	
						when "100" =>
							optic_out <= '1';	
						when others =>
							optic_out <= '0';
					end case;
					
				when "01" => -- '1'
					case optic_cnt(4 downto 2) is
						when "000" =>
							optic_out <= '1';
						when "001" =>
							optic_out <= '0';	
						when "010" =>
							optic_out <= '1';	
						when "011" =>
							optic_out <= '0';	
						when "100" =>
							optic_out <= '1';	
						when others =>
							optic_out <= '0';
					end case;
				
				when others => -- DEL
					case optic_cnt(4 downto 2) is
						when "000" =>
							optic_out <= '1';
						when "001" =>
							optic_out <= '1';	
						when "010" =>
							optic_out <= '1';	
						when "011" =>
							optic_out <= '0';	
						when "100" =>
							optic_out <= '0';	
						when others =>
							optic_out <= '0';
					end case;
			end case;
						
		end if;
	end process;
	
end logic;