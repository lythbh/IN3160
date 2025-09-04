library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity quadrature_decoder is
    port(
        mclk, reset : in std_Ulogic;
        SA, SB      : in std_ulogic;
        pos_inc     : out std_ulogic;
        pos_dec     : out std_ulogic
    );
end entity;


architecture str of quadrature_decoder is
    type state_type is (S_0, S_1, S_2, S_3, S_reset, S_init);
    signal current_state, next_state : state_type;
    signal AB : std_ulogic_vector(1 downto 0) := (others => '0');
begin
    
    AB <= (SA & SB);

    SEQUENTIAL: process(mclk, reset) is
    begin
        if reset = '1' then
            current_state <= S_reset;

        elsif rising_edge(mclk) then
            current_state <= next_state;
        end if;
    end process SEQUENTIAL;


    STATE_AND_OUTPUT_ASSIGNMENT: process(all) is
    begin
        next_state <= S_reset;
        pos_inc <= '0';
        pos_dec <= '0';
        case current_state is
            when S_reset =>
                next_state <= S_init;
                
                when S_init =>
                if AB = "00" then
                    next_state <= S_0;
                elsif AB = "01" then
                    next_state <= S_1;
                elsif AB = "11" then
                    next_state <= S_2;
                elsif AB = "10" then
                    next_state <= S_3;
                end if;
            
            when S_0 =>
                if AB = "00" then
                    next_state <= S_0;
                elsif AB = "01" then
                    next_state <= S_1;
                    pos_inc <= '1';
                elsif AB = "11" then
                    next_state <= S_reset;
                elsif AB = "10" then
                    next_state <= S_3;
                    pos_dec <= '1';
                end if;
            
            when S_1 =>
                if AB = "00" then
                    next_state <= S_0;
                    pos_dec <= '1';
                elsif AB = "01" then
                    next_state <= S_1;
                elsif AB = "11" then
                    next_state <= S_2;
                    pos_inc <= '1';
                elsif AB = "10" then
                    next_state <= S_reset;
                end if;
            
            when S_2 =>
                if AB = "00" then
                    next_state <= S_reset;
                elsif AB = "01" then
                    next_state <= S_1;
                    pos_dec <= '1';
                elsif AB = "11" then
                    next_state <= S_2;
                elsif AB = "10" then
                    next_state <= S_3;
                    pos_inc <= '1';
                end if;
            
            when S_3 =>
                if AB = "00" then
                    next_state <= S_0;
                    pos_inc <= '1';
                elsif AB = "01" then
                    next_state <= S_reset;
                elsif AB = "11" then
                    next_state <= S_2;
                    pos_dec <= '1';
                elsif AB = "10" then
                    next_state <= S_3;
                end if;
        end case;
    end process; 
end str;