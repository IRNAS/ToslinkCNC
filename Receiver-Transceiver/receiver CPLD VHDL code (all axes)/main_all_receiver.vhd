library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_receiver_all is
    port ( 
	        iCLK : in std_logic;
		     limit_out : out std_logic_vector (2 downto 0);
           parallel_out : out std_logic_vector (6 downto 0);
           fiber_in : in std_logic;
			  led_error : out std_logic;
			  led_enable : out std_logic
			);
end main_receiver_all;

architecture logic of main_receiver_all is

	component optic_receiver
		port(
				iCLK : in std_logic;
				optic_in : in std_logic;
				limit_out : out std_logic_vector(2 downto 0);
				s : out std_logic_vector(6 downto 0);
				led_error : out std_logic;
				irq : out std_logic
			 );
	end component;
	
	signal s:std_logic_vector(6 downto 0) := "1000000";
	
	signal in_dir_x:std_logic := '0';
	signal in_dir_y:std_logic := '0';
	signal in_dir_z:std_logic := '0';
	
	signal out_step_x:std_logic := '0';
	signal out_step_y:std_logic := '0';
	signal out_step_z:std_logic := '0';
	
	signal out_dir_x:std_logic := '0';
	signal out_dir_y:std_logic := '0';
	signal out_dir_z:std_logic := '0';
	
	signal out_enable:std_logic := '1';
	
	signal generating_stp:std_logic := '0';
	
	signal counter:std_logic_vector (9 downto 0) := (others => '0');
	
	signal irq:std_logic := '0';

begin

	optic_receiver_inst:optic_receiver
		 port map ( 
						  iCLK => iCLK,
						  optic_in => fiber_in,
						  limit_out => limit_out,
						  s => s,
						  led_error => led_error,
						  irq => irq
					  );
	
	out_enable <= s(6);
	
	led_enable <= not out_enable;
	
	parallel_out <= (
							0 => out_step_x,
							1 => out_dir_x,
							2 => out_step_y,
							3 => out_dir_y,
							4 => out_step_z,
							5 => out_dir_z,
							6 => out_enable
						 );
	
	step_generator:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (irq = '1') then
				if ((generating_stp = '0') and ((s(0) = '1') or (s(2) = '1') or (s(4) = '1'))) then
				
					in_dir_x <= s(1);
					in_dir_y <= s(3);
					in_dir_z <= s(5);
					
					generating_stp <= '1';
					
					out_step_x <= s(0);
					out_step_y <= s(2);
					out_step_z <= s(4);
					
					counter <= (others => '0');
					
				elsif ((generating_stp and s(0) and s(2) and s(4)) = '0') then
				
					out_dir_x <= s(1);
					out_dir_y <= s(3);
					out_dir_z <= s(5);
					
					counter <= counter + 1;
					
				end if;
			else
					counter <= counter + 1;
			end if;
			
			if ((counter = 600) and (generating_stp = '1')) then -- after 12us
				
				out_step_x <= '0';
				out_step_y <= '0';
				out_step_z <= '0';
				
			elsif ((counter = 700) and (generating_stp = '1')) then -- after 14us
			
				out_dir_x <= in_dir_x;
				out_dir_y <= in_dir_y;
				out_dir_z <= in_dir_z;
				
				generating_stp <= '0';
				
			end if;
		
		end if;
	end process;
	
end logic;