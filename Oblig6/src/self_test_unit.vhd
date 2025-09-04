library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity self_test_unit is
    port(
        mclk   : in std_logic;
        reset  : in std_logic;
        d0, d1 : out std_logic_vector(3 downto 0)
    );
end entity self_test_unit;


architecture rtl of self_test_unit is
    -- x to y // a downto b for indexing purposes
    type memory is array(0 to 15) of std_logic_vector(7 downto 0);
    signal ROM: memory := (
        "00010010", "00110100", "01000000", "00000000",
        "01010110", "01110011", "00000000", "10000110",
        "10010000", "00000000", "10101011", "00110000",
        "00000000", "11000110", "01100101", "00000000"
    );

--  The counter should trigger second_tick every second.
--  Our clock at 100MHz leaves us with a 1 = 100000000/2**x
--  = 27-bit counter  
    signal counter     : unsigned(26 downto 0);
    signal next_count  : unsigned(26 downto 0);
    signal ROM_index   : integer := 0;
begin
    process (mclk, reset)
    begin
        next_count <= counter + 1;
        
        if reset = '1' then
            counter     <= (others => '0');
            d0          <= (others => '0');
            d1          <= (others => '0');
            ROM_index   <= 0;

        elsif rising_edge(mclk) then
            counter <= next_count;
            
            if counter = 100000000 then -- Second tick
                d1 <= ROM(ROM_index)(7 downto 4);
                d0 <= ROM(ROM_index)(3 downto 0);
                counter <= (others => '0');
                ROM_index <= (ROM_index + 1) mod 16; -- Wrap around at 16
            end if;
            
        end if;
    end process;
end architecture rtl;


