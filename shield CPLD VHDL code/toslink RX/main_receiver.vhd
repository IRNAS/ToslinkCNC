library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_receiver is
	Generic (n : natural := 8);
    Port ( iCLK : in  STD_LOGIC;
           parallel_out : out  STD_LOGIC_VECTOR (n-1 downto 0);
           fiber_in : in  STD_LOGIC;
			  parallel_in : in  STD_LOGIC_VECTOR (2 downto 0);
           fiber_out : out  STD_LOGIC
			);
end main_receiver;

architecture Behavioral of main_receiver is

	COMPONENT optic_receiver
		Generic( n: natural := n);
		PORT(
			iCLK : IN std_logic;          	
			OPTIC_IN : IN std_logic;
			s : OUT STD_LOGIC_VECTOR(n-1 downto 0);
			s_prev : OUT STD_LOGIC_VECTOR(n-1 downto 0);
			step_sync : OUT STD_LOGIC
			);
	END COMPONENT;
	
	COMPONENT optic_transmitter
		Generic (n : natural := 3);
		Port ( iCLK : in  STD_LOGIC;
				 s : in  STD_LOGIC_VECTOR (n-1 downto 0);
		       optic_out : out  STD_LOGIC
			  );
	END COMPONENT;

	signal s:std_logic_vector(n-1 downto 0) := (others => '0');
	signal s_prev:std_logic_vector(n-1 downto 0) := (others => '0');
	signal step_sync:std_logic := '0';

begin

	--parallel_out<=s(n-1 downto 0);

	parallel_out<=(
					0=>(s(0) xor s_prev(0)) and step_sync,--step x
					1=>s(1), -- dir x
					2=>(s(2) xor s_prev(2)) and step_sync,--step y
					3=>s(3), -- dir y
					4=>(s(4) xor s_prev(4)) and step_sync,--step z
					5=>s(5), -- dir z
					6=>s(6), -- enable
					7=>s(7) -- reserved
				);

	optic_receiver_inst:optic_receiver
		 Generic map (n => n)
		 Port map ( iCLK=> iCLK,
					  optic_in => fiber_in,
					  s => s,
					  s_prev => s_prev,
					  step_sync => step_sync
					  );
					  
	optic_transmitter_inst:optic_transmitter
		 Generic map (n => 3)
		 Port map ( iCLK=> iCLK,
					  s => parallel_in,
					  optic_out => fiber_out
					  );
end Behavioral;