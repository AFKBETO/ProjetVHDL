----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2021 18:58:38
-- Design Name: 
-- Module Name: CMDBuffers - CMDBuffers_Arch
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

entity CMDBuffers is
Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       Buf_SEL_FCT_in : in STD_LOGIC_VECTOR (3 downto 0);
       Buf_SEL_OUT_In : in STD_LOGIC_VECTOR (1 downto 0);
       Buf_SEL_FCT_out : out STD_LOGIC_VECTOR (3 downto 0);
       Buf_SEL_OUT_out : out STD_LOGIC_VECTOR (1 downto 0)
     );
end CMDBuffers;

architecture CMDBuffers_Arch of CMDBuffers is
begin
    
    Buf_SEL_FCT_Proc : process (reset, clk)
    begin
        if reset = '1' then
            Buf_SEL_FCT_out <= (others => '0'); 
        elsif (rising_edge(clk)) then
            Buf_SEL_FCT_out <= Buf_SEL_FCT_in;
        end if;
    end process;
    
    Buf_SEL_OUT_Proc : process (reset, clk)
    begin
        if reset = '1' then
            Buf_SEL_OUT_out <= (others => '0'); 
        elsif (rising_edge(clk)) then
            Buf_SEL_OUT_out <= Buf_SEL_OUT_In;
        end if;
    end process;

end CMDBuffers_Arch;
