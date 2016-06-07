library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity optic_receiver is
    port(
				iCLK : in std_logic;
				optic_in : in std_logic;
				limit_out : out std_logic_vector(2 downto 0);
				s : out std_logic_vector(6 downto 0);
				led_error : out std_logic;
				irq : out std_logic
		  );
end optic_receiver;

architecture logic of optic_receiver is

	component manchester_decoder is
		port(
				 iCLK : in std_logic;
				 no_link_out : out std_logic;
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
	
	signal crc_error : std_logic := '0';
	signal no_link : std_logic := '0';
	
begin
	
	led_error <= crc_error;
	
	decoder:manchester_decoder
		 port map ( 
						 iCLK => iCLK,
						 no_link_out => no_link,
						 optic_in => optic_in,
						 irq_out => latch_rx,
						 decoded_out => rx_input
				    );
					  
	shift_register:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (no_link = '0') then
				if ((latch_rx_prev /= latch_rx) and (latch_rx = '1')) then
					
					if (rx_input(1) = '1') then -- if delimiter received
						crc_error <= '1';
						
						if ((shift_reg(1) = parity) and (shift_reg(0) = not parity)) then
						
							crc_error <= '0';
							
							s(6) <= shift_reg(5); -- get enable value
							
							s(1) <= shift_reg(6); -- get dir x
							s(0) <= shift_reg(9); -- get step x
							
							s(3) <= shift_reg(7); -- get dir y
							s(2) <= shift_reg(10); -- get step y
							
							s(5) <= shift_reg(8); -- get dir z
							s(4) <= shift_reg(11); -- get step z
							
							limit_out(0) <= shift_reg(2); -- read limit x
							limit_out(1) <= shift_reg(3); -- read limit y
							limit_out(2) <= shift_reg(4); -- read limit z
							
							irq <= '1';
						end if;
						
					else
						shift_reg <= shift_reg(10 downto 0)&rx_input(0); -- shift for one bit and add
						parity <= odd_parity(shift_reg(10 downto 1)); -- calculate parity from data bits, except last two that are parity
					end if;
				else
					irq <= '0';
				end if;
				
				latch_rx_prev <= latch_rx;
				
			else -- if connection lost
				s <= "1000000";
				limit_out <= "000";
				latch_rx_prev <= '0';
				shift_reg <= "000000100010";
				parity <= '1';
				crc_error <= '1';
			end if;
		end if;
	end process;
	
end logic;