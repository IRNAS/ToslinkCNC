library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_receiver is
    port ( 
	        iCLK : in  std_logic;
		     axis_sel : in std_logic_vector(2 downto 0);
		     limit : in std_logic;
		     trigger : out std_logic;
           parallel_out : out  std_logic_vector (2 downto 0);
           fiber_in : in  std_logic;
			  fiber_out1 : out  std_logic;
			  fiber_out2 : out  std_logic;
			  led_error : out std_logic;
			  led_enable : out std_logic;
			  dir_output : out std_logic;
			  limit_output : out std_logic
			);
end main_receiver;

architecture logic of main_receiver is

	component optic_receiver
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
	end component;
	
	signal fiber_out:std_logic := '0';
	
	signal s:std_logic_vector(2 downto 0) := "100";
	
	signal in_dir:std_logic := '0';
	
	signal out_step:std_logic := '0';
	signal out_dir:std_logic := '0';
	
	signal out_enable:std_logic := '1';
	
	signal generating_stp:std_logic := '0';
	
	signal counter:std_logic_vector (9 downto 0) := (others => '0');
	
	signal irq:std_logic := '0';

begin

	optic_receiver_inst:optic_receiver
		 port map ( 
						  iCLK => iCLK,
						  axis_sel => axis_sel,
						  optic_in => fiber_in,
						  limit => limit,
						  optic_out => fiber_out,
						  s => s,
						  led_error => led_error,
						  trigger => trigger,
						  irq => irq
					  );
	
	fiber_out1 <= fiber_out;
	fiber_out2 <= fiber_out;
	
	--dir_output <= out_dir;
	--limit_output <= limit;
	
	out_enable <= s(2);
	
	led_enable <= not out_enable;
	
	parallel_out <= (
							0 => out_step,
							1 => out_dir,
							2 => out_enable
						 );
	
	step_generator:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (irq = '1') then
				if ((generating_stp = '0') and (s(0) = '1')) then
					in_dir <= s(1);
					generating_stp <= '1';
					out_step <= '1';
					counter <= (others => '0');
				elsif ((generating_stp and s(0)) = '0') then
					out_dir <= s(1);
					counter <= counter + 1;
				end if;
			else
					counter <= counter + 1;
			end if;
			
			if ((counter = 600) and (generating_stp = '1')) then
				out_step <= '0';
			elsif ((counter = 700) and (generating_stp = '1')) then			
				out_dir <= in_dir;
				generating_stp <= '0';
			end if;
		
		end if;
	end process;  
end logic;