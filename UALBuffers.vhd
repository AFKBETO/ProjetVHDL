library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UALBuffers is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Buf_A_in : in STD_LOGIC_VECTOR (3 downto 0);
           Buf_B_in : in STD_LOGIC_VECTOR (3 downto 0);
           Mem_1_In : in STD_LOGIC_VECTOR (7 downto 0);
           Mem_2_In : in STD_LOGIC_VECTOR (7 downto 0);
           Buf_SR_IN_L_in : in STD_LOGIC;
           Buf_SR_IN_R_in : in STD_LOGIC; 
           CE_Buf_A : in STD_LOGIC;
           CE_Buf_B : in STD_LOGIC;
           CE_Mem_1 : in STD_LOGIC;
           CE_Mem_2 : in STD_LOGIC;
           CE_SR_IN_L : in STD_LOGIC;
           CE_SR_IN_R : in STD_LOGIC;
           Buf_A_out : out STD_LOGIC_VECTOR (3 downto 0);
           Buf_B_out : out STD_LOGIC_VECTOR (3 downto 0);
           Mem_1_out : out STD_LOGIC_VECTOR (7 downto 0);
           Mem_2_out : out STD_LOGIC_VECTOR (7 downto 0);
           Buf_SR_IN_L_out : out STD_LOGIC;
           Buf_SR_IN_R_out : out STD_LOGIC);
end UALBuffers;

architecture UALBuffers_Arch of UALBuffers is
begin
    BufAProc : process (reset, clk, CE_Buf_A)
    begin
        if reset = '1' then
            Buf_A_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Buf_A = '1') then
            Buf_A_out <= Buf_A_in;
        end if;
    end process;
    
    BufBProc : process (reset, clk, CE_Buf_B)
    begin
        if reset = '1' then
            Buf_B_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Buf_B = '1') then
            Buf_B_out <= Buf_B_in;
        end if;
    end process;
    
    Buf_SR_IN_L_Proc : process (reset, clk, CE_SR_IN_L)
    begin
        if reset = '1' then
            Buf_SR_IN_L_out <= '0'; 
        elsif (rising_edge(clk) and CE_SR_IN_L = '1') then
            Buf_SR_IN_L_out <= Buf_SR_IN_L_in;
        end if;
    end process;
    
    Buf_SR_IN_R_Proc : process (reset, clk, CE_SR_IN_R)
    begin
        if reset = '1' then
            Buf_SR_IN_R_out <= '0'; 
        elsif (rising_edge(clk) and CE_SR_IN_R = '1') then
            Buf_SR_IN_R_out <= Buf_SR_IN_R_in;
        end if;
    end process;
    
    Mem_1_Proc : process (reset, clk, CE_Mem_1)
    begin
        if reset = '1' then
            Mem_1_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Mem_1 = '1') then
            Mem_1_out <= Mem_1_in;
        end if;
    end process;
    
    Mem_2_Proc : process (reset, clk, CE_Mem_2)
    begin
        if reset = '1' then
            Mem_2_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Mem_2 = '1') then
            Mem_2_out <= Mem_2_in;
        end if;
    end process;

end UALBuffers_Arch;
