library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_receiver is
    Port ( 
	        iCLK : in  STD_LOGIC;
			  axis_sel : in std_logic_vector(2 downto 0);
			  limit : in std_logic;
			  error : in std_logic;
           parallel_out : out  STD_LOGIC_VECTOR (2 downto 0);
           fiber_in : in  STD_LOGIC;
			  fiber_out1 : out  STD_LOGIC;
			  fiber_out2 : out  STD_LOGIC;
			  led_error : out std_logic;
			  led_rx : out std_logic;
			  led_tx1 : out std_logic;
			  led_tx2 : out std_logic
			);
end main_receiver;

architecture Behavioral of main_receiver is

	COMPONENT optic_receiver
		PORT(
				iCLK : IN std_logic; 
				axis_sel : in std_logic_vector(2 downto 0);
				optic_in : IN std_logic;
				limit : in std_logic;
				error : in std_logic;
				optic_out : out std_logic;
				s : OUT STD_LOGIC_VECTOR(2 downto 0);
				led_error : out std_logic;
				led_rx : out std_logic;
				led_tx : out std_logic;
				irq : out std_logic;
				no_link_out: out std_logic
			 );
	END COMPONENT;
	
	signal fiber_out : std_logic := '0';
	
	signal led_tx : std_logic := '0';
	
	signal s:std_logic_vector(2 downto 0) := "100";
	
	signal in_dir:std_logic := '0';
	
	signal out_step:std_logic := '0';
	signal out_dir:std_logic := '0';
	
	signal out_enable:std_logic := '1';
	
	signal generating_stp:std_logic := '0';
	
	signal counter:std_logic_vector (9 downto 0) := (others => '0');
	
	signal irq:std_logic := '0';
	
	signal led_error_intern:std_logic := '0';
	
	signal no_link:std_logic := '0';
	
	-- low pass filter
	--signal q1 : STD_LOGIC := '0';
	--signal q2 : STD_LOGIC := '0';
	signal limit_clean:std_logic := '0';

begin

	optic_receiver_inst:optic_receiver
		 Port map ( 
						  iCLK => iCLK,
						  axis_sel => axis_sel,
						  optic_in => fiber_in,
						  limit => limit_clean,
						  error => error,
						  optic_out => fiber_out,
						  s => s,
						  led_error => led_error_intern,
						  led_rx => led_rx,
						  led_tx => led_tx,
						  irq => irq,
						  no_link_out => no_link
					  );
	
	fiber_out1 <= fiber_in;
	fiber_out2 <= fiber_in;
	
	led_tx1 <= (led_tx and (not no_link));
	led_tx2 <= (led_tx and (not no_link));
	
	led_error <= led_error_intern;
	
	parallel_out <= (
							0 => out_step,
							1 => out_dir,
							2 => (out_enable or no_link)
						 );
	
	limit_clean <= limit;
	
	step_generator:process (iCLK)
	begin
		if (iCLK'event and iCLK = '1') then
			
			if (irq = '1') then
				out_enable <= s(2);
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
end Behavioral;