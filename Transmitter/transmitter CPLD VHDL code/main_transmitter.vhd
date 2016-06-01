library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_transmitter is
    port ( 
	        iCLK : in  std_logic;
           parallel_in : in  std_logic_vector (6 downto 0);
			  trigger_in : std_logic_vector (2 downto 0);
           fiber_out1 : out  std_logic;
			  fiber_out2 : out  std_logic;
			  led_enable : out  std_logic
  			);
end main_transmitter;

architecture logic of main_transmitter is
	
	component optic_transmitter
		port(
				iCLK : in std_logic;
				s    : in  std_logic_vector(9 downto 0);
				optic_out : out std_logic
			 );
	end component;
	
	-- transmitter
	signal in_step_x:std_logic := '0';
	signal in_dir_x:std_logic := '0';
	signal in_step_y:std_logic := '0';
	signal in_dir_y:std_logic := '0';
	signal in_step_z:std_logic := '0';
	signal in_dir_z:std_logic := '0';
	signal in_enable:std_logic := '1';
	
	signal prev_step_x:std_logic := '0';
	signal prev_step_y:std_logic := '0';
	signal prev_step_z:std_logic := '0';
	
	signal out_step_x:std_logic := '0';
	signal out_dir_x:std_logic := '0';
	signal out_step_y:std_logic := '0';
	signal out_dir_y:std_logic := '0';
	signal out_step_z:std_logic := '0';
	signal out_dir_z:std_logic := '0';
	signal out_enable:std_logic := '1';

	signal transmitt_reg:std_logic_vector(9 downto 0) := "0000001000";
	
	signal fiber_out : std_logic := '0';
	
	signal delay_cnt : std_logic_vector(8 downto 0) := (others => '0');
	
	signal trigger_out1 : std_logic := '0';
	signal trigger_out2 : std_logic := '0';
	signal trigger_out3 : std_logic := '0';

begin

	fiber_out1 <= fiber_out;
	fiber_out2 <= trigger_in(0);
	
	led_enable <= not out_enable;
		
	in_step_x <= parallel_in(0);
	in_dir_x <= parallel_in(1);
	in_step_y <= parallel_in(2);
	in_dir_y <= parallel_in(3);
	in_step_z <= parallel_in(4);
	in_dir_z <= parallel_in(5);
	in_enable <= parallel_in(6);

	optic_transmitter_inst:optic_transmitter
		 port map (
						  iCLK => iCLK,
						  s => transmitt_reg,
						  optic_out => fiber_out
					  );
					  
	step_sampler:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
		
			if (prev_step_x = '1' and in_step_x = '0') then -- falling edge of STP X
				out_step_x <= '1';
				delay_cnt <= (others => '0');
			end if;
			
			if (prev_step_y = '1' and in_step_y = '0') then -- falling edge of STP Y
				out_step_y <= '1';
				delay_cnt <= (others => '0');
			end if;
			
			if (prev_step_z = '1' and in_step_z = '0') then -- falling edge of STP Z
				out_step_z <= '1';
				delay_cnt <= (others => '0');
			end if;
			
			if ((out_step_x = '1') or (out_step_y = '1') or (out_step_z = '1')) then
				
				if (delay_cnt = 100) then -- after 2us
					
					out_dir_x <= in_dir_x; -- sample DIR signals
					out_dir_y <= in_dir_y;
					out_dir_z <= in_dir_z;

					delay_cnt <= delay_cnt + 1;
				
				elsif (delay_cnt = 500) then
				
					out_step_x <= '0';
					out_step_y <= '0';
					out_step_z <= '0';
					
					delay_cnt <= (others => '0');
				else
					delay_cnt <= delay_cnt + 1;
				end if;
			else
				out_dir_x <= in_dir_x; -- sample DIR signals
				out_dir_y <= in_dir_y;
				out_dir_z <= in_dir_z;
			end if;
			
			out_enable <= in_enable;
			trigger_out1 <= trigger_in(0);
			trigger_out2 <= trigger_in(1);
			trigger_out3 <= trigger_in(2);
			
			transmitt_reg <= ( -- send frame
					   0=>trigger_out1,
					   1=>trigger_out2,
					   2=>trigger_out3,
					   3=>out_enable,
						4=>out_dir_x,
						5=>out_dir_y,
						6=>out_dir_z,
						7=>out_step_x,
						8=>out_step_y,
						9=>out_step_z
					);
					
			prev_step_x <= in_step_x;
			prev_step_y <= in_step_y;
			prev_step_z <= in_step_z;	
		end if;
	end process;

end logic;