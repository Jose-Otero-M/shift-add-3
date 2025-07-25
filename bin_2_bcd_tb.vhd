library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_2_bcd_tb is
--  Port ( );
end bin_2_bcd_tb;

architecture Behavioral of bin_2_bcd_tb is
    component shift_add_3 is
        generic (
            N : integer := 10
        );
        port (
            BIN_DATA : in  std_logic_vector(N-1 downto 0);
            BCD_OUT  : out std_logic_vector(N + (N-4)/3 downto 0)
        );
    end component;
    
    constant N      : integer := 10;
    signal BIN_DATA : std_logic_vector(N-1 downto 0);
    signal BCD      : std_logic_vector(N + (N-4)/3 downto 0);
    
begin
    UUT1 : shift_add_3
        generic map (N => N)
        port map (
            BIN_DATA => BIN_DATA,
            BCD_OUT  => BCD
        );

    stimulus : process
    begin
        -- Value 0
        BIN_DATA <= (others => '0');
        wait for 30 ns;
        
        -- Value 5
        BIN_DATA <= std_logic_vector(to_unsigned(9, N));
        wait for 30 ns;

        -- Value 9
        BIN_DATA <= std_logic_vector(to_unsigned(9, N));
        wait for 30 ns;

        -- Value 10
        BIN_DATA <= std_logic_vector(to_unsigned(10, N));
        wait for 30 ns;

        -- Value 123
        BIN_DATA <= std_logic_vector(to_unsigned(123, N));
        wait for 30 ns;

        -- Value 1023
        BIN_DATA <= std_logic_vector(to_unsigned(1023, N));
        wait for 30 ns;
        wait;
    end process;
    
end Behavioral;
