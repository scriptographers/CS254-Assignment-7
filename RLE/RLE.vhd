-- TOP MODULE : RLE
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- for the signed, unsigned types and arithmetic ops

entity RLE is
  port (
    clk      : in std_logic;
    a        : in std_logic_vector (7 downto 0);
    z        : out std_logic_vector (7 downto 0);
    z2       : out std_logic_vector (7 downto 0);
    dataline : out std_logic;
    ints     : out integer);
end entity;

architecture struct of RLE is
  type offsets_type is array (20 downto 0) of std_logic_vector (7 downto 0);
  signal previous : std_logic_vector (7 downto 0);
  signal previous1 : std_logic_vector (7 downto 0);
  signal count : unsigned (7 downto 0) := "00000000";
  signal input_counter : integer := 1;
  signal buf : offsets_type;
  -- signal buf : std_logic_vector (800 downto 0);
begin

  process (clk)
  begin
    if (rising_edge(clk)) then
      if (count < "00001001") then
        input_counter <= input_counter + 1;
        buf(input_counter) <= a;
        ints <= input_counter;
        z <= buf(input_counter - 1);
        z2 <= buf(input_counter - 1);
        dataline <= '1';
        if (count = "00001000") then
          dataline <= '0';
        end if;
        count <= count + 1;
      end if;
    end if;
  end process;

end architecture;
