library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity optic_receiver is
	 generic (n : natural := 8);
    Port ( 
			  iCLK : in  STD_LOGIC;
           optic_in : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (n-1 downto 0);
			  s_prev : out  STD_LOGIC_VECTOR (n-1 downto 0);
			  step_sync : out  STD_LOGIC
			);
end optic_receiver;

architecture Behavioral of optic_receiver is

	function odd_parity (X : std_logic_vector) return std_logic is
		variable TMP : std_logic := '0';
	begin
	  for J in X'range loop
		 TMP := TMP xor X(J);
	  end loop; -- works for any size X
	  return TMP;
	end odd_parity;

	signal q1 : STD_LOGIC := '0';
	signal q2 : STD_LOGIC := '0';
	signal samp : STD_LOGIC := '0';

	signal samp2 : STD_LOGIC := '0';
	signal cnt : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
	signal s_reg : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
	signal N1 : STD_LOGIC := '0';
	signal s_recv : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
	signal receiving_data_or_parity:std_logic := '1';
	signal parity_calculated : std_logic := '0';
	signal parity_reg : std_logic_vector(1 downto 0) := (others => '0');
	signal parity_bit_cnt : std_logic_vector(1 downto 0) := (others => '0');
	signal bit_count: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

	step_sync <= '1' when (bit_count>=4 and bit_count<8) else '0';
	s <= s_recv;

	input_low_pass:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			q1<=q2;
			q2<=optic_in;
			if(q1=q2)then
				samp<=q1;
			end if;
		end if;
	end process;

	fiber_decoder:process (iCLK)
	begin 
		if (iCLK'event and iCLK = '1') then
			if (samp2 /= samp and samp = '1') then -- if positive edge of received signal
			
				if (cnt > 11) then -- 12 = 3/4 of a 16 period (ideally 7 or 15)
					if (N1 = '1') then -- packet delimiter received, end of packet
						if (receiving_data_or_parity = '1') then -- if received data packet
							parity_calculated <= odd_parity(s_reg); -- calculate parity of received data
						else -- if received parity packet
							if ((parity_reg(0) = parity_calculated) and (parity_reg(1) = not parity_reg(0))) then
								-- check if calculated and received parity match
								s_prev <= s_recv;
								s_recv <= s_reg; -- send received data to parallel port
							end if;
							s_reg <= (others => '0'); -- reset receive buffer
							parity_reg <= (others => '0'); -- reset parity receive buffer
							parity_bit_cnt <= (others => '0'); -- reset parity bit counter
							--parity_calculated <= not parity_calculated; -- not necessary, simplifies debuging !!
							bit_count <= (others=>'0');
						end if;
						receiving_data_or_parity <= not receiving_data_or_parity;
					else -- if step with long period received
						if (receiving_data_or_parity = '1') then -- if receiving data packet
							s_reg <= s_reg(n-2 downto 0)&'0'; -- shift and add '0'
							bit_count <= bit_count+1;
						else -- if receiving parity packet
							if (parity_bit_cnt = 3) then -- received parity packet to long, switch to receiving data packet
								-- this ensures that always the correct packet is received
								receiving_data_or_parity <= '1'; -- continue with receiving data packet
								parity_bit_cnt <= (others => '0'); -- reset parity bit counter
							end if;
							parity_reg <= parity_reg(0)&'0'; -- shift and add '0'
							parity_bit_cnt <= parity_bit_cnt+1;
						end if;
					end if;
					N1 <= '0';
					
				else -- if step with short period received
					if (N1 = '1')then -- if second step with short period received
						if (receiving_data_or_parity = '1') then -- if receiving data packet
							s_reg <= s_reg(n-2 downto 0)&'1'; -- shift and add '1'
							bit_count <= bit_count+1;
						else -- if receiving parity packet
							if (parity_bit_cnt = 3) then -- received parity packet to long
							   -- this ensures that always the correct packet is received
								receiving_data_or_parity <= '1'; -- continue with receiving data packet
								parity_bit_cnt <= (others => '0'); -- reset parity bit counter
							end if;
							parity_reg <= parity_reg(0)&'1'; -- shift and add '1'
							parity_bit_cnt <= parity_bit_cnt+1;
						end if;
					end if;
					N1 <= not N1;
				end if;
				
				cnt <= (others => '0');
			else
				cnt <= cnt+1;
			end if;
			samp2 <= samp;
		end if;	
	end process;
end Behavioral;