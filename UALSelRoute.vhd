library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UALSelRoute is
    Port ( 
            SEL_ROUTE : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Buf_A_out : in STD_LOGIC_VECTOR (3 downto 0);
            Buf_B_out : in STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
            Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
            Buf_A_in : out STD_LOGIC_VECTOR (3 downto 0);
            Buf_B_in : out STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_In : out STD_LOGIC_VECTOR (7 downto 0);
            Mem_2_In : out STD_LOGIC_VECTOR (7 downto 0);
            CE_Buf_A : out STD_LOGIC;
            CE_Buf_B : out STD_LOGIC;
            CE_Mem_1 : out STD_LOGIC;
            CE_Mem_2 : out STD_LOGIC            
    );
end UALSelRoute;

architecture UALSelRoute_Arch of UALSelRoute is
    signal CE_out : STD_LOGIC_VECTOR(3 downto 0) := '0001';
begin
    CE_Buf_A <= CE_out(3);
    CE_Buf_B <= CE_out(2);
    CE_Mem_1 <= CE_out(1);
    CE_Mem_2 <= CE_out(0);


    MySelRouteProc : process (SEL_ROUTE, S, A, B, Buf_A_out, Buf_B_out, Mem_1_out, Mem_2_out)
    begin
        case SEL_ROUTE is
            when "0000" => -- Stockage de l'entrée A_IN dans Buffer_A
                CE_out <= '1000';
                Buf_A_in <= A;
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "0001" => -- Stockage de MEM_CACHE_1 dans Buffer_A (4 bits de poids faibles)
                CE_out <= '1000';
                Buf_A_in <= Mem_1_out(3 downto 0);
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "0010" => -- Stockage de MEM_CACHE_1 dans Buffer_A (4 bits de poids forts)
                CE_out <= '1000';
                Buf_A_in <= Mem_1_out(7 downto 4);
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
                
            when "0011" => -- Stockage de MEM_CACHE_2 dans Buffer_A (4 bits de poids faibles)
                CE_out <= '1000';
                Buf_A_in <= Mem_2_out(3 downto 0);
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "0100" => -- Stockage de MEM_CACHE_2 dans Buffer_A (4 bits de poids forts)
                CE_out <= '1000';
                Buf_A_in <= Mem_2_out(7 downto 4);
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "0101" => -- Stockage de S dans Buffer_A (4 bits de poids faibles)
                CE_out <= '1000';
                Buf_A_in <= S(3 downto 0);
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "0110" => -- Stockage de S dans Buffer_A (4 bits de poids forts)
                CE_out <= '1000';
                Buf_A_in <= S(7 downto 4);
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "0111" => -- Stockage de l'entrée B_IN dans Buffer_B
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= B;
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "1000" => -- Stockage de MEM_CACHE_1 dans Buffer_B (4 bits de poids faibles)
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= Mem_1_out(3 downto 0);
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "1001" => -- Stockage de MEM_CACHE_1 dans Buffer_B (4 bits de poids forts)
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= Mem_1_out(7 downto 4);
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
                
            when "1010" => -- Stockage de MEM_CACHE_2 dans Buffer_B (4 bits de poids faibles)
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= Mem_2_out(3 downto 0);
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "1011" => -- Stockage de MEM_CACHE_2 dans Buffer_B (4 bits de poids forts)
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= Mem_1_out(7 downto 4);
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "1100" => -- Stockage de S dans Buffer_B (4 bits de poids faibles)
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= S(3 downto 0);
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "1101" => -- Stockage de S dans Buffer_B (4 bits de poids forts)
                CE_out <= '0100';
                Buf_A_in <= (others => '0');
                Buf_B_in <= S(7 downto 4);
                Mem_1_In <= (others => '0');
                Mem_2_In <= (others => '0');
            
            when "1110" => -- Stockage de S dans MEM_CACHE_1
                CE_out <= '0010';
                Buf_A_in <= (others => '0');
                Buf_B_in <= (others => '0');
                Mem_1_In <= S;
                Mem_2_In <= (others => '0');
            
            when others => -- Stockage de S dans MEM_CACHE_2
                CE_out <= '0001';
                Buf_A_in <= (others => '0');
                Buf_B_in <= (others => '0');
                Mem_1_In <= (others => '0');
                Mem_2_In <= S;
        end case;
    end process;

end UALSelRoute_Arch;
