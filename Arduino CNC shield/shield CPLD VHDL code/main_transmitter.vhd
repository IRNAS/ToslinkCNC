library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_transmitter is
    Port ( 
	        iCLK : in  STD_LOGIC;
           parallel_in : in  STD_LOGIC_VECTOR (6 downto 0);
			  limit_in1 : in STD_LOGIC;
           fiber_out1 : out  STD_LOGIC;
			  fiber_out2 : out  STD_LOGIC;
			  fiber_out3 : out  STD_LOGIC
  			);
end main_transmitter;

architecture Behavioral of main_transmitter is
	
	COMPONENT optic_transmitter
		PORT(
				iCLK : IN std_logic;
				s    : IN  STD_LOGIC_VECTOR(9 downto 0);
				optic_out : OUT std_logic
			 );
	END COMPONENT;
	
	signal limit_in : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
	
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
	
	signal fiber_out : STD_LOGIC := '0';
	
	signal delay_cnt : std_logic_vector(8 downto 0) := (others => '0');
	
	signal out_x : std_logic := '0';
	signal out_y : std_logic := '0';
	signal out_z : std_logic := '0';

begin

	limit_in(0) <= limit_in1;
	limit_in(1) <= limit_in1;
	limit_in(2) <= limit_in1;

	fiber_out1 <= fiber_out;
	fiber_out2 <= fiber_out;
	fiber_out3 <= fiber_out;
		
	in_step_x <= parallel_in(0);
	in_dir_x <= parallel_in(1);
	in_step_y <= parallel_in(2);
	in_dir_y <= parallel_in(3);
	in_step_z <= parallel_in(4);
	in_dir_z <= parallel_in(5);
	in_enable <= parallel_in(6);

	optic_transmitter_inst:optic_transmitter
		 Port map (
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
			out_x <= limit_in(0);
			out_y <= limit_in(1);
			out_z <= limit_in(2);
			
			transmitt_reg <= ( -- send packet
					   0=>out_x,
					   1=>out_y,
					   2=>out_z,
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

end Behavioral;