library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity optic_receiver is
    port( 
				iCLK : in std_logic; 
				axis_sel : in std_logic_vector(2 downto 0);
				optic_in : in std_logic;
				limit : in std_logic;
				optic_out : out std_logic;
				s : out std_logic_vector(2 downto 0);
				led_error : out std_logic;
				trigger : out std_logic;
				irq : out std_logic
		  );
end optic_receiver;

architecture logic of optic_receiver is

	component manchester_decoder is
		port(
				 iCLK : in std_logic;
				 no_link : out std_logic;
				 optic_in : in std_logic;
				 irq_out : out std_logic;
				 decoded_out : out std_logic_vector(1 downto 0)
			 );	
   end component;

	function odd_parity (X : std_logic_vector) return std_logic is
		variable TMP : std_logic := '0';
	begin
	  for J in X'range loop
		 TMP := TMP xor X(J);
	  end loop; -- works for any size X
	  return TMP;
	end odd_parity;

	signal rx_input : std_logic_vector(1 downto 0) := (others => '0');
	signal latch_rx : std_logic := '0';
	signal latch_rx_prev : std_logic := '0';
	
	signal shift_reg : std_logic_vector(11 downto 0) := "000000100010";
	signal parity : std_logic := '1';
	signal optic_cnt : std_logic_vector(4 downto 0) := (others => '0');
	
	signal tx_output : std_logic_vector(1 downto 0) := (others => '0');
	
	signal crc_error : std_logic := '0';
	signal no_link : std_logic := '0';
	
begin
	
	led_error <= crc_error;
	
	decoder:manchester_decoder
		 port map ( 
						 iCLK => iCLK,
						 no_link => no_link,
						 optic_in => optic_in,
						 irq_out => latch_rx,
						 decoded_out => rx_input
				    );
					  
	shift_register:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (no_link = '0') then
				if ((latch_rx_prev /= latch_rx) and (latch_rx = '1')) then
					optic_cnt <= (others => '0');
					
					if (rx_input(1) = '1') then -- if delimiter received
						tx_output <= "10"; -- generate del on output
						crc_error <= '1';
						
						if ((shift_reg(1) = parity) and (shift_reg(0) = not parity)) then
						
							crc_error <= '0';
							
							s(2) <= shift_reg(5); -- get enable value			
							s(1) <= shift_reg(6+CONV_INTEGER(axis_sel)); -- get dir
							s(0) <= shift_reg(9+CONV_INTEGER(axis_sel)); -- get step
							shift_reg(2+CONV_INTEGER(axis_sel)) <= limit; -- write limit
							trigger <= shift_reg(2+CONV_INTEGER(axis_sel)); -- read trigger
							
							-- calculate new parity
							shift_reg(1) <= parity xor (shift_reg(2+CONV_INTEGER(axis_sel)) xor limit);
							shift_reg(0) <= not (parity xor (shift_reg(2+CONV_INTEGER(axis_sel)) xor limit));
							
							irq <= '1';
						end if;
						
					else
						tx_output <= (1 => '0')&shift_reg(11); -- output one bit
						shift_reg <= shift_reg(10 downto 0)&rx_input(0); -- shift for one bit and add
						parity <= odd_parity(shift_reg(10 downto 1)); -- calculate parity from data bits, except last two that are parity
					end if;
				else
					optic_cnt <= optic_cnt + 1;
					irq <= '0';
				end if;
				
				latch_rx_prev <= latch_rx;
				
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
					
				when "01" =>
					case optic_cnt(4 downto 2) is
						when "000" => -- '1'
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
				
			else -- if connection lost
				s <= "100";
				trigger <= '0';
				optic_out <= '0';
				latch_rx_prev <= '0';
				shift_reg <= "000000100010";
				parity <= '1';
				optic_cnt <= (others => '0');
				tx_output <= (others => '0');
				crc_error <= '1';
			end if;
		end if;
	end process;
	
end logic;