library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity pulse_width_modulator is
    port(
        mclk, reset : in std_ulogic;
        duty_cycle  : in std_ulogic_vector(7 downto 0);
        dir         : out std_ulogic;
        en          : out std_ulogic);
end entity;

architecture rtl of pulse_width_modulator is
    signal counter     : u_unsigned(13 downto 0);
    signal next_c      : u_unsigned(13 downto 0);
    signal abs_dc      : u_unsigned(7 downto 0);
    alias  dc_comp     : u_unsigned(6 downto 0) is counter(13 downto 7);
    -- OPTIONAL: SYNCHRONIZE DUTY_CYCLE WITH LOGIC FROM VHDL.MD
    signal dc_ff1      : std_ulogic_vector(7 downto 0);
    signal dc_ff2      : std_ulogic_vector(7 downto 0);
    signal dc_ff3      : std_ulogic_vector(7 downto 0);
    signal dc_ff4      : std_ulogic_vector(7 downto 0);
    signal dutycycle   : std_ulogic_vector(7 downto 0);

    type state_type is (forward_idle, reverse_idle, forward, reverse);
    signal current_state, next_state : state_type;

    begin
        
    SEQUENTIAL: process (mclk, reset) is
        variable xnor_logic : std_ulogic;
        variable and_logic  : std_ulogic;
        variable ff2_buffer : u_unsigned(7 downto 0);
        variable ff3_buffer : u_unsigned(7 downto 0);
    begin
        if reset = '1' then
            counter       <= (others => '0');
            current_state <= reverse_idle;

        elsif rising_edge(mclk) then
            current_state <= next_state;
            counter       <= next_c;

            dc_ff1     <= duty_cycle;
            dc_ff2     <= dc_ff1;
            dc_ff3     <= dc_ff2;
            ff2_buffer := dc_ff2;
            ff3_buffer := dc_ff3;

            xnor_logic := ff2_buffer xnor ff3_buffer;
            and_logic  := 1 and xnor_logic;

            dutycycle  <= ff3_buffer when and_logic = '1' else (others => '0');

        end if;
    end process SEQUENTIAL;
    
    
    NEXT_ASSIGNMENTS: process(all) is
    begin
        next_c     <= counter + 1;  -- Increment counter every cycle
    
        case current_state is
            when reverse_idle =>
                if dutycycle(7) = '1' then
                    next_state <= reverse;
                else
                    next_state <= forward_idle;
                end if;
    
            when forward_idle =>
                if dutycycle(7) = '0'  then
                    next_state <= forward;
                else
                    next_state <= reverse_idle;
                end if;
    
            when forward =>
                if dutycycle(7) = '0'then
                    next_state <= forward;
                else
                    next_state <= forward_idle;
                end if;
    
            when reverse =>
                if dutycycle(7) = '1' then
                    next_state <= reverse;
                else
                    next_state <= reverse_idle;
                end if;
        end case;
    end process NEXT_ASSIGNMENTS;


    OUTPUT_ASSIGNMENT: process(all) is
    begin
        abs_dc <= u_unsigned(abs(u_signed(dutycycle)));
        en <= '0';
        dir <= '0';
        if current_state = reverse_idle then
            en  <= '0';
            dir <= '0';
        elsif current_state = forward_idle then
            en  <= '0';
            dir <= '1';
        elsif current_state = forward then
            dir <= '1';
            if (dc_comp < abs_dc) then
                en <= '1';
            end if;
        elsif current_state = reverse then
            dir <= '0';
            if (dc_comp < abs_dc) then
                en <= '1';
            end if;
        end if;

    end process OUTPUT_ASSIGNMENT;
end rtl;