library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shift_add_3 is
    generic (
        N : integer := 10  -- Número de bits de entrada binaria
    );
    port (
        BIN_DATA : in  std_logic_vector(N-1 downto 0);
        BCD_OUT  : out std_logic_vector(N + (N-4)/3 downto 0)
    );
end entity shift_add_3;

architecture Behavioral of shift_add_3 is
begin
    process(BIN_DATA)
        variable v_bcd : unsigned(N + (N-4)/3 downto 0);
    begin
        v_bcd := (others => '0');
        v_bcd(N-1 downto 0) := unsigned(BIN_DATA);

        for i in 0 to N-4 loop
            for j in 0 to i/3 loop
                if v_bcd(N - i + 4*j downto N - i + 4*j - 3) > 4 then
                    v_bcd(N - i + 4*j downto N - i + 4*j - 3) := v_bcd(N - i + 4*j downto N - i + 4*j - 3) + 3;
                end if;
            end loop;
        end loop;

        BCD_OUT <= std_logic_vector(v_bcd);
    end process;
end architecture Behavioral;
