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
  signal r_acc, next_acc           : unsigned(WIDTH downto 0); -- := (others => '0'); -- acc=accumulator, +1bit  
  alias PDM_out                    : std_logic is r_acc(r_acc'left); -- leftmost bit = “carry”
  signal timer, counter            : unsigned(WIDTH-1 downto 0); -- := (others => '0');
  signal next_t, next_c            : unsigned(WIDTH-1 downto 0);
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
        next_t        <= (others => '0');
        next_c        <= (others => '0');
        sp_comp_flag  <= '0';
        current_state <= Idle;

      else
        current_state <= next_state;
        r_acc         <= next_acc;
        next_acc      <= ("0" & unsigned(setpoint)) + ("0" & r_acc(WIDTH-1 downto 0));
        
        -- Updating sp_comp_flag if Idle
        if ((current_state = Idle) and (unsigned(r_acc) >= unsigned(setpoint))) then
          sp_comp_flag  <= '1';
        end if;
        
        -- Counting in Pulse_active state
        if current_state = Pulse_Active then
          -- Decrementing timer
          next_t <= timer - 1;
          if timer /= X"0000" then
            timer <= next_t;
          end if;
        
          -- Decrementing counter if `PDM_out` is low
          next_c <= counter - 1;
          if (PDM_out = '1') and (counter /= X"0000") then
            counter <= next_c;
          end if;
        
        --- Counting in Pulse_inactive state
        elsif current_state = Pulse_Inactive then
          -- Decrementing timer
          next_t <= timer - 1;
          if timer /= X"0000" then
            timer <= next_t;
          end if;

          -- Incrementing counter if `PDM_out` is high
          next_c <= counter + 1;
          if (PDM_out = '1') and (counter <= X"FFFF") then
            counter <= next_c;
          end if;
        end if;
        
        -- Updating timer values sequentially on state changes
        if mea_req = '0' then
          if current_state = Idle then
            if ((next_state = Pulse_Active) and (sp_comp_flag = '1')) then
              timer <= unsigned(max_on);
            elsif next_state = Pulse_Inactive then
              timer <= unsigned(min_off);
            end if;
          elsif ((current_state = Pulse_Active) and (next_state = Pulse_Inactive)) then
            if ((timer = X"0000") or (counter = X"0000")) then
              timer <= unsigned(min_off);
            end if;
          end if;

        elsif (timer = X"0000" and counter >= unsigned(min_on)) then
          if current_state = Pulse_Inactive then
            timer <= unsigned(max_on);
          end if;
        end if;
      end if;
    end if;
  end process SEQUENTIAL;

  
  STATE_ASSIGNMENT: process(all) is
  begin
    -- Measure requirement
    if mea_req = '1' then
      case current_state is
        -- Idle state
        when Idle =>
          next_state <= Idle;
        
        -- Pulse Avtive state
        when Pulse_Active =>
          next_state <= Idle when (timer = X"0000") or (counter = X"0000") else Pulse_Active;
        
        -- Pulse Inactive state
        when Pulse_Inactive =>
          next_state <= Idle;
      end case;
    
    -- No measure requirement
    else
      case current_state is
        -- Idle state
        when Idle =>
          next_state <= Pulse_Active when (sp_comp_flag = '1' and mea_req='0') else Pulse_Inactive;

        -- Pulse Active state
        when Pulse_Active =>
          next_state <= Pulse_Inactive when ((timer = X"0000") or (counter = X"0000")) else Pulse_Active;

        -- Pulse Inactive state
        when Pulse_Inactive =>
          next_state <= Pulse_Inactive;
      end case;
    end if;

    -- Next state from Pulse Inactive regarding timer and counter
    if (timer = X"0000" and counter >= unsigned(min_on)) then
      if current_state = Pulse_Inactive then
        next_state <= Pulse_Active;
      end if;
    end if;
  end process STATE_ASSIGNMENT;


  OUTPUT_SIGNAL_ASSIGNMENT: process(all) is
  begin
    case current_state is
      when Idle =>
        mea_ack <= '1' when (mea_req = '1') else '0';
      
      when Pulse_Active =>
        mea_ack <= '0';
        pdm_pulse <= '1' when (PDM_out = '1' and sp_comp_flag = '1') else '0';

      when Pulse_Inactive =>
        mea_ack <= '0';
        pdm_pulse <= '0';
    end case;
  end process OUTPUT_SIGNAL_ASSIGNMENT;
end rtl;