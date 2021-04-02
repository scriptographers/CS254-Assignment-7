library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all; -- for the signed, unsigned types and arithmetic ops

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
	component RLE
		port (
			clk      : in std_logic;
			a        : in std_logic_vector (7 downto 0);
			z        : out std_logic_vector (7 downto 0);
			z2       : out std_logic_vector (7 downto 0);
			dataline : out std_logic;
			ints     : out integer);
	end component;

	signal input_sig, output_sig, z2 : std_logic_vector (7 downto 0);
	signal dl : std_logic := '0';
	signal clock : std_logic;
	signal int : integer;
begin
	dut_instance : RLE
	port map(clk => clock, a => input_sig, z => output_sig, dataline => dl, ints => int, z2 => z2);

	process
		file input_file : text open read_mode is "/home/devansh/PROJECTS/quartus/Assignment7/input.txt";
		file output_file : text open write_mode is "/home/devansh/PROJECTS/quartus/Assignment7/output.txt";
		variable input_line, output_line : line;
		variable input_var, output_var : std_logic_vector (7 downto 0);
		variable clk : std_logic;

	begin
		while true loop
			if (not endfile(input_file)) then
				readline (input_file, input_line);
				read (input_line, input_var);
				input_sig <= input_var;
			end if;
			clk := '1';
			clock <= '1';
			wait for 20 ns;
			output_var := output_sig;
			if (dl = '1') then
				write (output_line, output_var);
				writeline (output_file, output_line);
			end if;
			clk := '0';
			clock <= '0';
			wait for 20 ns;
		end loop;

		wait;
	end process;

end architecture;
