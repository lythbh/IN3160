library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity pulse_width_modulator is
    port(
        clk, reset : in std_ulogic;
        duty_cycle : in std_ulogic_vector(7 downto 0);
        dir        : out std_ulogic;
        en         : out std_ulogic);
end entity;

architecture rtl of pulse_width_modulator is

    signal counter     : u_unsigned(14 downto 0); -- 15 bits for 5kHz
    signal next_c      : u_unsigned(14 downto 0);
    signal dir_counter : u_unsigned(1 downto 0);  -- 2 bits for 2 clock cycles
    signal next_dir_c  : u_unsigned(1 downto 0);
    signal dir_flag    : std_ulogic := '0';
    type state_type is (forward_idle, reverse_idle, forward, reverse);
    signal current_state, next_state : state_type;

    -- MÅ STOPPE 1 KLOKKESYKEL FØR DIR CHANGE OG 1 ETTER
    
    begin
    -- Process 1
    SEQUENTIAL: process (clk, dir) is
    begin
        if rising_edge(clk) then
            if reset then
                en            <= '0';
                dir           <= '0';
                counter       <= (others => '0');
                dir_counter   <= (others => '0');
                next_dir_c    <= (others => '0');
                current_state <= reverse_idle;
            else
                current_state <= next_state;
                
                next_c <= counter + 1;
                if current_state = forward then
                    counter <= next_c;
                    if counter = 19999 then
                        counter <= (others => '0');
                        next_state <= forward_idle;
                    end if;
                elsif current_state = reverse then
                    counter <= next_c;
                    if counter = 19999 then
                        counter <= (others => '0');
                        next_state <= reverse_idle;
                    end if;
                end if;

                -- DIR change
                -- mulig flytte all logikk med state-skifting til NEXT_STATE process
                if dir_flag then
                    next_dir_c <= dir_counter + 1;
                    if current_state = forward then
                        next_state <= forward_idle;
                        
                        dir_counter <= next_dir_c;
                        if dir_counter = 2 then
                            next_state <= forward;
                            flag <= '0';
                            dir_counter <= (others => '0');
                        end if;
                    elsif current_state = reverse then
                        next_state <= reverse_idle;
                        
                        dir_counter <= next_dir_c;
                        if dir_counter = 2 then
                            next_state <= reverse;
                            flag <= '0';
                            dir_counter <= (others => '0');
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process SEQUENTIAL;


    DIR_CHANGE: process(dir) is
    begin
        if rising_edge(dir) or falling_edge(dir) then
            dir_flag <= '1';
        end if;
    end process DIR_CHANGE;


    NEXT_STATE: process(all) is
    begin
        case current_state is
            when reverse_idle =>
                next_state <= reverse when (signed(duty_cycle) < 0) else forward_idle;
            when forward_idle =>
                next_state <= forward when (signed(duty_cycle) > 0) else reverse_idle;
            when forward      =>
                next_state <= forward when (signed(duty_cycle) > 0) else forward_idle;
            when reverse      =>
                next_state <= reverse when (signed(duty_cycle) < 0) else reverse_idle;

        end case;
    end process NEXT_STATE;

    OUTPUT_ASSIGNMENT: process(all) is
    begin
        if current_state = reverse_idle then
            en  <= '0';
            dir <= '0';
        elsif current_state = forward_idle then
            en  <= '0';
            dir <= '1';
        elsif current_state = forward then
            en  <= '1';
            dir <= '1';
        elsif current_state = reverse then
            en  <= '1';
            dir <= '0';
        end if;
    end process OUTPUT_ASSIGNMENT;
end rtl;
    
        