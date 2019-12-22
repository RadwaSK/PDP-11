LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY ram IS
	PORT(
		clk : IN std_logic;
		wr  : IN std_logic;
		address : IN  std_logic_vector(11 DOWNTO 0);
		datain  : IN  std_logic_vector(15 DOWNTO 0);
		dataout : OUT std_logic_vector(15 DOWNTO 0));
END ENTITY ram;

ARCHITECTURE syncrama OF ram IS

	TYPE ram_type IS ARRAY(0 TO 63) OF std_logic_vector(15 DOWNTO 0);
	SIGNAL ram : ram_type := (
   0     => X"00C3",
   1     => X"0038",
   2     => X"0000",
  16#38# => X"00C3",
  16#39# => X"0000",
  16#3A# => X"0000",
  OTHERS => X"00FF"
);
	
	BEGIN
		PROCESS(clk) IS
			BEGIN
				IF rising_edge(clk) THEN  
					IF wr = '1' THEN
						ram(to_integer(unsigned(address))) <= datain;
					END IF;
				END IF;
		END PROCESS;
		dataout <= ram(to_integer(unsigned(address)));
END syncrama;