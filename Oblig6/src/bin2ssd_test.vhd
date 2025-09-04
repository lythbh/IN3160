library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.seg7_pkg.all;

-- Converting according to bin2ssd table
entity bin2ssd_test is
    port
    (
      di        : in std_logic_vector(3 downto 0);
      abcdefg   : out std_logic_vector(6 downto 0)
    );
  end entity bin2ssd_test;

architecture RTL of bin2ssd_test is
begin
    abcdefg <= bin2ssd(di);
end RTL;