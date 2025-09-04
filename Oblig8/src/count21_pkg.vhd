library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Put the 4-bit counter from Oblig2 in package, and made it 21-bit
package count21_pkg is
    function count21 (
        count      : in std_logic_vector(20 downto 0))
    return std_logic_vector;
end package count21_pkg;

package body count21_pkg is
    -- Function definition for count18
    function count21 (
        count      : in std_logic_vector(20 downto 0))
    return std_logic_vector is
        variable next_count : unsigned(20 downto 0) := "000000000000000000000";
    begin
        next_count := unsigned(count) + 1;
        return std_logic_vector(next_count);
    end function count21;
end package body count21_pkg;