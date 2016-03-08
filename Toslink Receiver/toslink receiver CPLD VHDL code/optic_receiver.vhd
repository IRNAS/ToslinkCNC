library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity optic_receiver is
    Port ( 
			   iCLK : IN std_logic; 
			   axis_sel : in std_logic_vector(2 downto 0);
				optic_in : IN std_logic;
				limit : in std_logic;
				optic_out : out std_logic;
				s : OUT STD_LOGIC_VECTOR(2 downto 0);
				led_error : out std_logic;
				led_rx : out std_logic;
				led_tx : out std_logic;
				irq : out std_logic;
				no_link_out: out std_logic
			);
end optic_receiver;

architecture Behavioral of optic_receiver is

	component manchester_decoder is
		port(
		      iCLK : in std_logic;
				no_link : in std_logic;
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
	
	function reg_and (X : std_logic_vector) return std_logic is
		variable TMP : std_logic := '0';
	begin
	  for J in X'range loop
		 TMP := TMP and X(J);
	  end loop; -- works for any size X
	  return TMP;
	end reg_and;

	signal rx_input : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	signal latch_rx : std_logic := '0';
	signal latch_rx_prev : std_logic := '0';
	
	signal shift_reg : STD_LOGIC_VECTOR(11 downto 0) := "000000100000";
	signal parity : std_logic := '1';
	signal optic_cnt : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
	
	signal tx_output : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	
	signal crc_error : std_logic := '0';
	
	signal fail_cnt : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
	signal optic_in_prev : std_logic := '0';
	signal no_link : std_logic := '0';
	
begin
	
	no_link_out <= no_link;
	
	led_error <= crc_error;
	led_rx <= latch_rx;
	
	decoder:manchester_decoder
		 Port map ( 
						iCLK => iCLK,
						no_link => no_link,
						optic_in => optic_in,
						irq_out => latch_rx,
						decoded_out => rx_input
					 );
					  
	shift_register:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			-- connection lost detect
			if (optic_in = optic_in_prev) then
				fail_cnt <= fail_cnt + 1;
			else
				fail_cnt <= (others => '0');
				no_link <= '0';
			end if;
			
			optic_in_prev <= optic_in;
			
			if (fail_cnt > 31) then
				no_link <= '1';
			end if;
			-- end connection lost detect
			
			
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
							led_tx <= shift_reg(2+CONV_INTEGER(axis_sel)); -- read limit
							
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
				when "00" =>
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
				
			else
				optic_out <= '0';
				latch_rx_prev <= '0';
				shift_reg <= "000000010000";
				parity <= '1';
				optic_cnt <= (others => '0');
				tx_output <= (others => '0');
				crc_error <= '1';
			end if;
		end if;
	end process;
	
end Behavioral;