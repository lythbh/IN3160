library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pdm is
  generic( WIDTH: natural := 16 ); 
  port(
    clk, reset, mea_req               : in std_logic;
    setpoint, min_off, min_on, max_on : in std_logic_vector(WIDTH-1 downto 0);
    mea_ack, pdm_pulse                : out std_logic 
  );
end entity pdm;

architecture rtl of pdm is
  type state_type is (Idle, Pulse_Active, Pulse_Inactive);
  signal current_state, next_state : state_type; -- State variables
  signal r_acc, next_acc           : unsigned(WIDTH downto 0)   := (others => '0'); -- acc=accumulator, +1bit  
  alias PDM_out                    : std_logic is r_acc(r_acc'left); -- leftmost bit = “carry”
  signal timer, counter            : unsigned(WIDTH-1 downto 0) := (others => '0');
  signal sp_comp_flag              : std_logic;

begin
  -- Ensure pdm_pulse follows PDM_out directly
  SEQUENTIAL: process(clk, reset)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        r_acc         <= (others => '0');
        next_acc      <= (others => '0');
        timer         <= (others => '0');
        counter       <= (others => '0');
        sp_comp_flag  <= '0';
        current_state <= Idle;

      else
        current_state <= next_state;
        r_acc         <= next_acc;
        next_acc      <= ("0" & unsigned(setpoint)) + ("0" & r_acc(WIDTH-1 downto 0));
        
        if current_state = Pulse_Active then
          
        -- State transitions
        case current_state is

          -- Idle State
          when Idle =>
            mea_ack <= '1';
            -- Comparing accumilator with setpoint to determine criteria for pulse output
            if unsigned(r_acc) >= unsigned(setpoint) then
              sp_comp_flag <= '1';
            end if;
            
            -- Next state logic
            if mea_req = '0' then
              mea_ack     <= '0';
              -- Checking results after measuring and comparing
              if sp_comp_flag then
                next_state <= Pulse_Active;
                timer <= unsigned(max_on);
              else
                next_state <= Pulse_Inactive;
                timer <= unsigned(min_off);
              end if;
            else 
              next_state <= Idle;
            end if;
              
          -- Pulse Active State
          when Pulse_Active =>
            mea_ack <= '0';
            -- Pulse activation
            if (PDM_out) and (sp_comp_flag) then
              pdm_pulse <= '1';
            end if;

            -- Next state logic
            if mea_req then 
              if (timer = X"0000") or (counter = X"0000") then
                -- Idle when mea_req is High and pdm_pulse has reached satisfactory duration
               next_state <= Idle;
              else
                -- Transition to Idle when timer or counter has reached 0
                next_state <= Pulse_Active;
              end if;
            else
              if (timer = X"0000") or (counter = X"0000") then
                next_state <= Pulse_Inactive;
                timer <= unsigned(min_off);
              else
                next_state <= Pulse_Active;
                -- Letting pdm_pulse remain active until satisfactory duration
              end if;
            end if;
          
            -- Decrementing timer
            if timer /= X"0000" then
              timer <= timer - 1;
            end if;

            -- Decrementing counter if `PDM_out` is low
            if (PDM_out = '1') and (counter /= X"0000") then
              counter <= counter - 1;
            end if;
            
          -- Pulse Inactive State
          when Pulse_Inactive =>
            mea_ack <= '0';
            pdm_pulse <= '0';

            -- Next state logic
            if mea_req then
              next_state <= Idle;
            elsif (timer = X"0000") and (counter >= unsigned(min_on)) then
              next_state <= Pulse_Active;
              timer <= unsigned(max_on);
            else
              -- Pulse staying inactive until satisfactory duration
              next_state <= Pulse_Inactive;
            end if;

            -- Decrementing timer
            if timer /= X"0000" then
              timer <= timer - 1;
            end if;

            -- Incrementing counter if `PDM_out` is high
            if (PDM_out = '1') and (counter <= X"FFFF") then
              counter <= counter + 1;
            end if;
        end case;

        -- Update the state at each clock cycle
      end if;
    end if;
  end process;
end rtl;
