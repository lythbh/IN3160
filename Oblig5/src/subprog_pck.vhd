library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package subprog_pck is
    constant WIDTH : integer := 16;
    function togglefunc(indata : std_logic_vector(WIDTH-1 downto 0)) return std_logic;
    function xorfunc(indata : std_logic_vector(WIDTH-1 downto 0)) return std_logic;
end package subprog_pck;

package body subprog_pck is
     -- Function for parity method1
    function togglefunc(indata : std_logic_vector(WIDTH-1 downto 0)) return std_logic is
        variable toggle : std_logic := '0';
    begin
        for i in indata'range loop
        if indata(i) = '1' then
            toggle := not toggle;
        end if;
        end loop;
        return toggle;
    end function;

    -- Function for parity method2
    function xorfunc(indata : std_logic_vector(WIDTH-1 downto 0)) return std_logic is
    begin
        return xor(indata);  -- Cascaded XORs
    end function;

end package body subprog_pck;