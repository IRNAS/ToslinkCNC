library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity manchester_decoder is
	port(
			iCLK : in std_logic;
		   optic_in : in std_logic;
			irq_out : out std_logic;
			decoded_out : out std_logic_vector(1 downto 0)
		 );	
end manchester_decoder;

architecture Behavioral of manchester_decoder is

	-- low pass filter
	signal q1 : STD_LOGIC := '0';
	signal samp : STD_LOGIC := '0';
	signal samp2 : STD_LOGIC := '0';
	
	-- rx_tx shift register
	signal sampling_cnt : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal output : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

begin

	input_low_pass:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			if(q1 = optic_in)then
				samp <= q1;
			end if;
			q1 <= optic_in;
		end if;
	end process;
	
	decoded_out <= output;
	
	shift_register:process (iCLK)
	begin 
		if (iCLK'event and iCLK = '1') then
		
			samp2 <= samp;
		
			if (samp2 /= samp) then -- on each edge of received signal
				sampling_cnt <= (others => '0'); -- reset sampling cnt
			else
				sampling_cnt <= sampling_cnt + 1;
			end if;
			
			if (sampling_cnt = "00") then
				irq_out <= '0';
			elsif (sampling_cnt = "01") then -- sampling
				shift_reg <= shift_reg(2 downto 0)&samp; -- shift
			end if;
			
		   if ((shift_reg = "0101") or (shift_reg = "1100") or (shift_reg = "1111")) then
				irq_out <= '1';
				shift_reg <= (others => '0');
			else
				irq_out <= '0';
			end if;
			
			case shift_reg is
				when "1100" =>
					output <= "00";
				when "0101" =>
					output <= "01";
				when "1111" =>
					output <= "10";
				when others =>
					output <= output;
			end case;
					
		end if;
	end process;

end Behavioral;