library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
	component dummy_module
		port (a: in std_logic_vector (7 downto 0); z: out std_logic_vector (7 downto 0));
	end component;
	signal input_sig, output_sig: std_logic_vector (7 downto 0);
begin
	dut_instance: dummy_module
		port map (a => input_sig, z=> output_sig);
	
	process
		file input_file: text open read_mode is "/home/keerthi/Desktop/Cs_254_Jan_2021/FileAndStringTests/input_file.txt";
		file output_file: text open write_mode is "/home/keerthi/Desktop/Cs_254_Jan_2021/FileAndStringTests/output_file.txt";
		variable input_line, output_line: line;
		variable input_var, output_var : std_logic_vector (7 downto 0);
		variable clk: std_logic;
	
	begin
		while not endfile(input_file) loop
			readline (input_file, input_line);
			read (input_line, input_var);
			input_sig <= input_var;
			clk := '1';
			wait for 20 ns;
			output_var := output_sig;
			write (output_line, output_var);
			writeline (output_file, output_line);
			clk := '0';
			wait for 20 ns;
		end loop;
	
	wait;
	end process;

end architecture;
