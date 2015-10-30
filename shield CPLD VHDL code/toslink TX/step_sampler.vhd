library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity step_sampler is
    Port ( iCLK : in  STD_LOGIC;
           step : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           step_cnt : out  STD_LOGIC;
           dir_value : out  STD_LOGIC);
end step_sampler;

architecture Behavioral of step_sampler is

signal q:std_logic := '0';
signal step_cnt_reg:std_logic := '0';

begin

step_cnt<=step_cnt_reg;

step_sampler:process (iCLK)
begin
	if (iCLK'event and iCLK= '1') then
		if(q/=step and step='1')then
			dir_value<=dir;
			step_cnt_reg<=not step_cnt_reg;
		end if;
		q<=step;
	end if;
end process;

end Behavioral;