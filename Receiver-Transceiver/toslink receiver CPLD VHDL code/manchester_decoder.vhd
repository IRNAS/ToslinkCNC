library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity manchester_decoder is
	port(
			iCLK : in std_logic;
			no_link : out std_logic;
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
	signal sampling_cnt : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
	signal step_cnt : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	signal prev_step : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
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
	
	step_sampler:process (iCLK)
	begin 
		if (iCLK'event and iCLK = '1') then
      
			irq_out <= '0';
			
			if (samp2 /= samp and samp = '1') then
			
				no_link <= '0';
			
				if (sampling_cnt > 19) then -- if long step
					step_cnt <= (others => '0');
					prev_step <= (others => '0');
					output <= "10"; -- DEL received
					irq_out <= '1';
				elsif (sampling_cnt > 11) then -- if medium step
					step_cnt <= (others => '0');
					prev_step <= "10";
				else -- if short step
				   if (prev_step = 2) then
						output <= "00"; -- '0' received
						prev_step <= (others => '0');
						step_cnt <= (others => '0');
						irq_out <= '1';
					elsif (prev_step = 1) then
						if (step_cnt = 2) then
							output <= "01"; -- '1' received
							prev_step <= (others => '0');
							step_cnt <= (others => '0');
							irq_out <= '1';
						else
							step_cnt <= step_cnt + 1;
							prev_step <= "01";
						end if;
					else
						step_cnt <= "01";
						prev_step <= "01";
					end if;
				end if;
				
				sampling_cnt <= (others => '0');
				
			else
				if (sampling_cnt = 31) then
					sampling_cnt <= (others => '0');
					step_cnt <= (others => '0');
					prev_step <= (others => '0');
					output <= (others => '0');
					no_link <= '1';
				else
					sampling_cnt <= sampling_cnt + 1;
				end if;
			end if;
		
			samp2 <= samp;
			
		end if;
	end process;
end Behavioral;