library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopLevelSim is

end TopLevelSim;

architecture TopLevelSim_Arch of TopLevelSim is

    component MCU_PRJ_2021_TopLevel 
    Port (
        CLK100MHZ : in STD_LOGIC;
        sw : in STD_LOGIC_VECTOR(3 downto 0);
        btn : in STD_LOGIC_VECTOR(3 downto 0);
        led : out STD_LOGIC_VECTOR(3 downto 0);
        led0_r : out STD_LOGIC; led0_g : out STD_LOGIC; led0_b : out STD_LOGIC;                
        led1_r : out STD_LOGIC; led1_g : out STD_LOGIC; led1_b : out STD_LOGIC;
        led2_r : out STD_LOGIC; led2_g : out STD_LOGIC; led2_b : out STD_LOGIC;                
        led3_r : out STD_LOGIC; led3_g : out STD_LOGIC; led3_b : out STD_LOGIC
    );
    end component;

    signal CLK100MHZ : STD_LOGIC;
    signal sw : STD_LOGIC_VECTOR(3 downto 0);
    signal btn : STD_LOGIC_VECTOR(3 downto 0);
    signal led : STD_LOGIC_VECTOR(3 downto 0);
    signal led0_r, led0_g, led0_b : STD_LOGIC;                
    signal led1_r, led1_g, led1_b : STD_LOGIC;
    signal led2_r, led2_g, led2_b : STD_LOGIC;                
    signal led3_r, led3_g, led3_b : STD_LOGIC;
    
    signal My_S : std_logic_vector (7 downto 0);
    signal SR_OUT_L, SR_OUT_R, Calc_Done : STD_LOGIC;                
    
begin

    MyCUT : MCU_PRJ_2021_TopLevel 
    Port Map (
        CLK100MHZ => CLK100MHZ,
        sw => sw,
        btn => btn,
        led => led,
        led0_r => led0_r,
        led0_g => led0_g,
        led0_b => led0_b,
        led1_r => led1_r,
        led1_g => led1_g,
        led1_b => led1_b,
        led2_r => led2_r,
        led2_g => led2_g,
        led2_b => led2_b,
        led3_r => led3_r,
        led3_g => led3_g,
        led3_b => led3_b 
    );
    
    SR_OUT_L <= led2_b;
    SR_OUT_R <= led3_b;
    Calc_Done <= led0_g;
    My_S <= led & led3_r & led2_r & led1_r & led0_r;
    
    MyClkProc : process
    begin
        CLK100MHZ <= '0';
        WAIT FOR 5 ns;
        CLK100MHZ <= '1';
        WAIT FOR 5 ns;
    end process;
    
    MyInputProc : process 
    begin
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 7 ns;
        sw <= "1010";
        btn <= "0000";
        WAIT FOR 20 ns;
        
        sw <= "1010";
        btn <= "0010";
        WAIT FOR 100 ns;
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 20 ns;
        
        sw <= "0010";
        btn <= "0100";
        WAIT FOR 100 ns;
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 20 ns;
        
        sw <= "0011";
        btn <= "1000";
        WAIT FOR 150 ns;
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 20 ns;
                
    end process;


end TopLevelSim_Arch;
