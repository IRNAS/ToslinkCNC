library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity main_transmitter is
	 Generic (n : natural := 8);
    Port ( iCLK : in  STD_LOGIC;
           parallel_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
           fiber_out : out  STD_LOGIC;
			  parallel_out : out  STD_LOGIC_VECTOR (2 downto 0);
           fiber_in : in  STD_LOGIC
  			);
end main_transmitter;

architecture Behavioral of main_transmitter is

COMPONENT optic_transmitter
	Generic( n: natural := n);
	PORT(
		iCLK : IN std_logic;
      s    : IN  STD_LOGIC_VECTOR(n-1 downto 0);
		OPTIC_OUT : OUT std_logic
		);
END COMPONENT;

COMPONENT step_sampler
	PORT(
		iCLK : IN std_logic;
      step    : IN  STD_LOGIC;
		dir    : IN  STD_LOGIC;
		step_cnt   : OUT  STD_LOGIC;
		dir_value : OUT std_logic
		);
END COMPONENT;

COMPONENT optic_receiver
	 generic (n : natural := 3);
    Port ( 
			  iCLK : in  STD_LOGIC;
           optic_in : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (n-1 downto 0)
			);
end COMPONENT;

signal step_cnt_x:std_logic := '0';
signal dir_value_x:std_logic := '0';
signal step_cnt_y:std_logic := '0';
signal dir_value_y:std_logic := '0';
signal step_cnt_z:std_logic := '0';
signal dir_value_z:std_logic := '0';

signal s:std_logic_vector(n-1 downto 0) := (others => '0');

begin

--s<=parallel_in(11 downto 0);

s<=(
		0=>step_cnt_x,
		1=>dir_value_x,
		2=>step_cnt_y,
		3=>dir_value_y,
		4=>step_cnt_z,
		5=>dir_value_z,
		6=>parallel_in(6), -- enable
		7=>parallel_in(7) -- reserved
	);
		


X_inst:step_sampler
    Port map ( iCLK=> iCLK,
              step => parallel_in(0),
				  dir => parallel_in(1),
				  step_cnt=>step_cnt_x,
				  dir_value => dir_value_x
				  );
Y_inst:step_sampler
    Port map ( iCLK=> iCLK,
              step => parallel_in(2),
				  dir => parallel_in(3),
				  step_cnt=>step_cnt_y,
				  dir_value => dir_value_y
				  );
Z_inst:step_sampler
    Port map ( iCLK=> iCLK,
              step => parallel_in(4),
				  dir => parallel_in(5),
				  step_cnt=>step_cnt_z,
				  dir_value => dir_value_z
				  );							

optic_transmitter_inst:optic_transmitter
	 Generic map (n => n)
    Port map ( iCLK=> iCLK,
	           s => s,
              optic_out => fiber_out
				  );

optic_receiver_inst:optic_receiver
	 Generic map (n => 3)
    Port map ( iCLK=> iCLK,
					optic_in => fiber_in,
	           s => parallel_out
				  );

end Behavioral;