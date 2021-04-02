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
    dataline : out std_logic);
end entity;

architecture struct of RLE is
  signal previous : std_logic_vector (7 downto 0);
  signal count : unsigned (7 downto 0) := "00000000";
begin

  process (clk)
  begin
    if (rising_edge(clk)) then
      if (count < "00001001") then
        z <= previous;
        previous <= a;
        dataline <= '1';
        if (count = "00001000") then
          dataline <= '0';
        end if;
        count <= count + 1;
      end if;
    end if;
  end process;

end architecture;
