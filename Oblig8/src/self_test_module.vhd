library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use std.textio.all;

entity self_test_module is
    generic(
        data_width: natural  := 8; -- Size of data
        addr_width: natural  := 20; -- ROM entries (20 values)
        filename  : string   := "textfile.txt";
        threesec  : natural  := 300_000_000);
    port(
        mclk, reset  : in std_ulogic;
        duty_cycle   : out std_ulogic_vector(7 downto 0));
end entity;

architecture synth of self_test_module is
    -- Reading from file and storing inside ROM
    type memory_array is array(addr_width-1 downto 0) of std_ulogic_vector(data_width-1 downto 0);
    -- Signals for displaying logic of ROM elements
    signal counter    : u_unsigned(29 downto 0);
    signal next_count : u_unsigned(29 downto 0);
    signal ROM_index  : natural;
    signal next_index : natural;

    -- Function for retrieving data
    impure function initialize_ROM(file_name: string) return memory_array is
        file init_file: text open read_mode is file_name;
        variable current_line: line;
        variable result: memory_array;
    begin
        for i in result'range loop
            readline(init_file, current_line);
            read(current_line, result(i));
        end loop;
        return result;
    end;
    
    -- initializing ROM to make it synthesizable 
    constant ROM_DATA: memory_array := initialize_ROM(filename);

begin
    
    process(reset, mclk)
    begin
    -- Prosess som inkrementerer ROM_index som er den som indekserer elementer
    -- i ROM_DATA. Bruke counter til å telle slik at hvert element vises 
    -- i litt tid (3 sek kun når alt funker (29-bit counter))
        if rising_edge(mclk) then
            if reset then
                counter    <= (others => '0');
                ROM_index  <= 0;
            else
                if counter = threesec - 1 then
                    ROM_index <= next_index;
                end if;
                counter <= next_count;
            end if;
        end if;
    end process;
    
    process (all)
    begin
        duty_cycle <= ROM_DATA(ROM_index);
        if counter = threesec - 1 then
            next_count <= (others => '0');
        else
            next_count <= counter + 1;
        end if;
        next_index <= ROM_index + 1;
    end process;
end synth;