library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

-- each data frame of n-bit takes: (n x 4 period + 4 period + 2 period) * 4 ; speed@50Mhz 230Khz
-- packet structure = '0' + data[n] + 1/2 '1'

entity optic_transmitter is
	 Generic (n : natural := 3);
    Port ( iCLK : in  STD_LOGIC;
		     s : in  STD_LOGIC_VECTOR (n-1 downto 0);
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

	--output flip-flop
	signal optic_flop:STD_LOGIC := '0';
	signal s_reg:STD_LOGIC_VECTOR(n+1 downto 0) := (others => '0'); -- shift register
	signal optic_cnt:STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- bit counter
	signal optic_sub_cnt:STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- for dividing iCLK by /2
	signal parity_bit:std_logic := '0'; -- data odd parity bit
	signal transmitting_data_or_parity:std_logic := '1';
	signal start_of_frame:std_logic := '1';

begin

	optic_out <= optic_flop; -- output (fiber optic)

	optic_stage:process (iCLK)
	begin 
		if (iCLK'event and iCLK = '1') then
		
			optic_sub_cnt <= optic_sub_cnt+1; -- increment clk divide counter
			
			if (optic_sub_cnt = 0) then -- if first rising edge
			
				if (start_of_frame = '1') then -- begin of packet transmission
					if (transmitting_data_or_parity = '1') then -- if data transmission
						parity_bit <= not parity_bit;
						s_reg <= (n+1 => '0')&s(n-1 downto 0)&(0 => '1'); -- load new packet, 0xxxxxxxx1 where the last 1 is halved
					else -- if parity transmission
						parity_bit <= odd_parity(s); -- calculate parity
						-- load parity, 0 P P* 1 000000
						s_reg <= (others => '0');
					   s_reg(n+1) <= '0';
						s_reg(n) <= parity_bit;
						s_reg(n-1) <= not parity_bit;
						s_reg(n-2) <= '1';
					end if;
					start_of_frame <= '0';
				elsif (optic_cnt(1 downto 0) = "00") then
					s_reg <= s_reg(n downto 0)&'0'; -- shift data in register
				end if;

				if (optic_cnt(0) = optic_cnt(1)) then -- 00 and 11
					optic_flop <= not optic_cnt(0);
				else											  -- 01 and 10
					optic_flop <= optic_cnt(0) xor s_reg(n+1);
				end if;
				
				if ((s_reg(n downto 0) = 0) and (s_reg(n+1) = '1') and (optic_cnt(1 downto 0) = "10")) then -- (n+1)*4+2 = packet length
					optic_cnt <= (others => '0'); -- reset optic_cnt
					transmitting_data_or_parity <= not transmitting_data_or_parity; -- proceede with receiving parity packet
					start_of_frame <= '1';
				else
					optic_cnt <= optic_cnt + 1; -- increment optic_cnt
				end if;
				
			end if; -- optic_sub_cnt divide iCLK
			
		end if; -- iCLK event
	end process;

end Behavioral;