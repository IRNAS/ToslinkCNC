library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_transmitter_return is
    port ( 
	        iCLK : in std_logic;
           limit_out : out std_logic_vector (2 downto 0);
           fiber_in : in std_logic;
			  led_error : out std_logic;
			  led_enable : out std_logic;
			  limit_x_out : out std_logic
			);
end main_transmitter_return;

architecture logic of main_transmitter_return is

	component optic_receiver
		port(
				iCLK : in std_logic;
				optic_in : in std_logic;
				s : out std_logic_vector(2 downto 0);
				led_error : out std_logic;
				out_enable : out std_logic
			 );
	end component;
	
	signal s:std_logic_vector(2 downto 0) := "000";
	
	signal out_enable:std_logic := '1';

begin

	optic_receiver_inst:optic_receiver
		 port map ( 
						  iCLK => iCLK,
						  optic_in => fiber_in,
						  s => s,
						  led_error => led_error,
						  out_enable => out_enable
					 );
	
	limit_out <= s;
	
	limit_x_out <= s(0);
	
	led_enable <= not out_enable;
						 
end logic;