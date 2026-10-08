----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2026 03:43:33 PM
-- Design Name: 
-- Module Name: test_file - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_file is
    Port ( clk : in STD_LOGIC;
           digit :out std_logic_vector(6 downto 0);
           selector : out std_logic_vector (3 downto 0)
           );
end test_file;

architecture Behavioral of test_file is
    constant clk_125hz_constant : integer := 125000000;
    constant max_count_9 : integer :=9;
    signal degit_selector : std_logic_vector (3 downto 0);
    signal out_signal : std_logic_vector(6 downto 0);  
      
    signal refresh_rate : integer := 0;
    signal digit_select : std_logic_vector(1 downto 0)  := "00";


    ---  clock 
    signal clk_1hz : std_logic := '0';
    signal clk_1hz_counter : integer := 0;
    signal clk_0_1hz_couner : integer :=0;
    signal clk_00_1hz_couner : integer :=0;
    signal clk_000_1hz_couner : integer :=0;
    --- reset btn
--    signal reset_btn : std_logic := '0';
    signal reset_signal : std_logic_vector(6 downto 0) := "1000000";
    
    --- d0 signal
    signal d0_signal : std_logic_vector(6 downto 0);
    signal  d0_signal_counter : integer :=0;
    
    --- d1 signal
    signal clk_d1 : std_logic := '1';
    signal d1_signal : std_logic_vector(6 downto 0);
    signal  d1_signal_counter : integer :=0;
    --- d1 signal
    signal clk_d2 : std_logic := '1';
    signal d2_signal : std_logic_vector(6 downto 0);
    signal  d2_signal_counter : integer :=0;
    --- d1 signal
    signal clk_d3 : std_logic := '1';
    signal d3_signal : std_logic_vector(6 downto 0);
    signal  d3_signal_counter : integer :=0;




begin
--- create 1 hz clock
    process(clk)
    begin
        if rising_edge(clk) then
            if clk_1hz_counter = clk_125hz_constant/2 -1 then
                clk_1hz <= not clk_1hz;
                clk_1hz_counter <=0;
            else
                clk_1hz_counter <= clk_1hz_counter +1;
            end if;
        end if;
    end process;
 --- create d0 signal
   process(clk_1hz)
    begin
        if rising_edge(clk_1hz) then
            if d0_signal_counter = max_count_9 then
                d0_signal_counter <=0;
            else
                d0_signal_counter <= d0_signal_counter +1;
            end if;
        end if;
    end process;
    
       process(d0_signal_counter)
    begin
        case d0_signal_counter is
            when 0 => d0_signal <= "0111111";
            when 1 => d0_signal <= "0000110";
            when 2 => d0_signal <= "1011011";
            when 3 => d0_signal <= "1001111";
            when 4 => d0_signal <= "1100110";
            when 5 => d0_signal <= "1101101";
            when 6 => d0_signal <= "1111101";
            when 7 => d0_signal <= "0000111";
            when 8 => d0_signal <= "1111111";
            when 9 => d0_signal <= "1101111";
            when others => d0_signal <= "0000000";
        end case;
    end process;
    
    --- create 0.1 hz for d1
    process(clk_1hz)
    begin
        if rising_edge(clk_1hz) then
            if clk_0_1hz_couner = 4 then
                clk_0_1hz_couner <=0;
                clk_d1 <= not clk_d1;
            else
                clk_0_1hz_couner <= clk_0_1hz_couner +1;
            end if;
        end if;
    end process;
    
    --- create d1 signal
   process(clk_d1)
    begin
        if rising_edge(clk_d1) then
            if d1_signal_counter = max_count_9 then
                d1_signal_counter <=0;
            else
                d1_signal_counter <= d1_signal_counter +1;
            end if;
        end if;
    end process;
    
    process(d1_signal_counter)
    begin
        case d1_signal_counter is
            when 0 => d1_signal <= "0111111";
            when 1 => d1_signal <= "0000110";
            when 2 => d1_signal <= "1011011";
            when 3 => d1_signal <= "1001111";
            when 4 => d1_signal <= "1100110";
            when 5 => d1_signal <= "1101101";
            when 6 => d1_signal <= "1111101";
            when 7 => d1_signal <= "0000111";
            when 8 => d1_signal <= "1111111";
            when 9 => d1_signal <= "1101111";
            when others => d1_signal <= "0000000";
        end case;
    end process;
    
    
    --- create 0.01 hz for d2
    process(clk_d1)
    begin
        if rising_edge(clk_d1) then
            if clk_00_1hz_couner = 4 then
                clk_00_1hz_couner <=0;
                clk_d2 <= not clk_d2;
            else
                clk_00_1hz_couner <= clk_00_1hz_couner +1;
            end if;
        end if;
    end process;
    
    --- create d2 signal
   process(clk_d2)
    begin
        if rising_edge(clk_d2) then
            if d2_signal_counter = max_count_9 then
                d2_signal_counter <=0;
            else
                d2_signal_counter <= d2_signal_counter +1;
            end if;
        end if;
    end process;
    
       process(d2_signal_counter)
    begin
        case d2_signal_counter is
            when 0 => d2_signal <= "0111111";
            when 1 => d2_signal <= "0000110";
            when 2 => d2_signal <= "1011011";
            when 3 => d2_signal <= "1001111";
            when 4 => d2_signal <= "1100110";
            when 5 => d2_signal <= "1101101";
            when 6 => d2_signal <= "1111101";
            when 7 => d2_signal <= "0000111";
            when 8 => d2_signal <= "1111111";
            when 9 => d2_signal <= "1101111";
            when others => d2_signal <= "0000000";
        end case;
    end process;
    


  --- create 0.001 hz for d3
    process(clk_d2)
    begin
        if rising_edge(clk_d2) then
            if clk_000_1hz_couner = 4 then
                clk_000_1hz_couner <=0;
                clk_d3 <= not clk_d3;
            else
                clk_000_1hz_couner <= clk_000_1hz_couner +1;
            end if;
        end if;
    end process;
    
    --- create d2 signal
   process(clk_d3)
    begin
        if rising_edge(clk_d3) then
            if d3_signal_counter = 4 then
                d3_signal_counter <=0;
            else
                d3_signal_counter <= d3_signal_counter +1;
            end if;
        end if;
    end process;
    
       process(d3_signal_counter)
    begin
        case d3_signal_counter is
            when 0 => d3_signal <= "0111111";
            when 1 => d3_signal <= "0000110";
            when 2 => d3_signal <= "1011011";
            when 3 => d3_signal <= "1001111";
            when 4 => d3_signal <= "1100110";
            when 5 => d3_signal <= "1101101";
            when 6 => d3_signal <= "1111101";
            when 7 => d3_signal <= "0000111";
            when 8 => d3_signal <= "1111111";
            when 9 => d3_signal <= "1101111";
            when others => d3_signal <= "0000000";
        end case;
    end process;

    
    
    
    
       process(clk)
begin
    if rising_edge(clk) then

        if refresh_rate = 100 then
            refresh_rate <= 0;
            
            if digit_select = "00" then
                digit <= d0_signal;
                selector <= "1110";
                digit_select <= "01";
            elsif digit_select = "01" then
                digit <= d1_signal;
                selector <= "1101";
                digit_select <= "10";
            elsif digit_select = "10" then
                digit <= d2_signal;
                selector <= "1011";
                digit_select <= "11";
            elsif digit_select = "11" then
                digit <= d3_signal;
                selector <= "0111";
                digit_select <= "00";
            end if;
        else
            refresh_rate <= refresh_rate + 1;
        end if;

    end if;
end process;
         
end Behavioral;






