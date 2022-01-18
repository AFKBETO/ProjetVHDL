library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity INSTRMemory is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           INSTR_in : in STD_LOGIC_VECTOR (9 downto 0);
           INSTR_out : out STD_LOGIC_VECTOR (9 downto 0);
           INSTR_addr : in STD_LOGIC_VECTOR (6 downto 0);
           INSTR_CE : in STD_LOGIC;
           R1W0 : in STD_LOGIC);
end INSTRMemory;

architecture INSTRMemory_Arch of INSTRMemory is

    Type data_memory IS ARRAY (0 to 127) of std_logic_vector (9 downto 0);
    SIGNAL INSTR_memory : data_memory;
    
begin

    INSTR_out <= INSTR_memory(to_integer(unsigned(INSTR_addr))) when falling_edge(clk) and INSTR_CE = '1';
    -- INSTR_memory : 4 bits de SEL_FCT, 4 bits de SEL_ROUTE, 2 bits de SEL_OUT
    -- SEL_FCT : Sélectionner l'opération - UALCore
    -- SEL_ROUTE : Sélectionner quelle donnée à stocker dans quelle mémoire - UALSelRoute
    -- SEL_OUT : Sélectionner la sortie - UALSelOut

    -- Default Value - A mult. B       | opération         | mémorisation  | sortie|
    INSTR_memory(0) <= "0000000000"; --| nop               | A -> Buf A    | 0     |
    INSTR_memory(1) <= "1111011100"; --| A * B             | B -> Buf B    | 0     |
    INSTR_memory(2) <= "0000111000"; --| no op             | S -> Mem 1    | 0     |
    INSTR_memory(3) <= "0000000001"; --| no op             | A -> Buf A    | Mem 1 |
    INSTR_memory(4) <= "0000000100";
    INSTR_memory(5) <= "0000000101";
    INSTR_memory(6) <= "0000000110";
    INSTR_memory(7) <= "0000000111";
    INSTR_memory(8) <= "0000001000";
    INSTR_memory(9) <= "0000001001";
    INSTR_memory(10) <= "0000001010";
    INSTR_memory(11) <= "0000001011";
    INSTR_memory(12) <= "0000001100";
    INSTR_memory(13) <= "0000001101";
    INSTR_memory(14) <= "0000001110";
    INSTR_memory(15) <= "0000001111";
    INSTR_memory(16) <= "0000010000";
    INSTR_memory(17) <= "0000010001";
    INSTR_memory(18) <= "0000010010";
    INSTR_memory(19) <= "0000010011";
    INSTR_memory(20) <= "0000010100";
    INSTR_memory(21) <= "0000010101";
    INSTR_memory(22) <= "0000010110";
    INSTR_memory(23) <= "0000010111";
    INSTR_memory(24) <= "0000011000";
    INSTR_memory(25) <= "0000011001";
    INSTR_memory(26) <= "0000011010";
    INSTR_memory(27) <= "0000011011";
    INSTR_memory(27) <= "0000011100";
    INSTR_memory(29) <= "0000011101";
    INSTR_memory(30) <= "0000011110";
    INSTR_memory(31) <= "0000011111";
    
    -- Default Value - (A add. B) xnor A| opération         | mémorisation  | sortie|
    INSTR_memory(32) <= "0000000000"; --| nop               | A -> Buf A    | 0     |
    INSTR_memory(33) <= "1101011100"; --| A add B           | B -> Buf B    | 0     |
    INSTR_memory(34) <= "0111110000"; --| A xor S           | S -> Buf B    | 0     |
    INSTR_memory(35) <= "0100110000"; --| not B (xnor)      | S -> Buf B    | 0     |
    INSTR_memory(36) <= "0000111000"; --| no op             | S -> Mem 1    | 0     |
    INSTR_memory(37) <= "0000000001"; --| no op             | A -> Buf A    | Mem 1 |
    INSTR_memory(38) <= "0000100110";
    INSTR_memory(39) <= "0000100111";
    INSTR_memory(40) <= "0000101000";
    INSTR_memory(41) <= "0000101001";
    INSTR_memory(42) <= "0000101010";
    INSTR_memory(43) <= "0000101011";
    INSTR_memory(44) <= "0000101100";
    INSTR_memory(45) <= "0000101101";
    INSTR_memory(46) <= "0000101110";
    INSTR_memory(47) <= "0000101111";
    INSTR_memory(48) <= "0000110000";
    INSTR_memory(49) <= "0000110001";
    INSTR_memory(50) <= "0000110010";
    INSTR_memory(51) <= "0000110011";
    INSTR_memory(52) <= "0000110100";
    INSTR_memory(53) <= "0000110101";
    INSTR_memory(54) <= "0000110110";
    INSTR_memory(55) <= "0000110111";
    INSTR_memory(56) <= "0000111000";
    INSTR_memory(57) <= "0000111001";
    INSTR_memory(58) <= "0000111010";
    INSTR_memory(59) <= "0000111011";
    INSTR_memory(60) <= "0000111100";
    INSTR_memory(61) <= "0000111101";
    INSTR_memory(62) <= "0000111110";
    INSTR_memory(63) <= "0000111111";
        
    -- Default Value - (A0.B1 + A1.B0)  | opération         | mémorisation  | sortie|
    INSTR_memory(64) <= "0000000000"; --| nop               | A -> Buf A    | 0     | 
    INSTR_memory(65) <= "1000011100"; --| décaler droite A  | B -> Buf B    | 0     |
    INSTR_memory(66) <= "0101010100"; --| A1 and B0         | S -> Buf A    | 0     |
    INSTR_memory(67) <= "1010111000"; --| décaler droite B  | S -> Mem 1    | 0     |
    INSTR_memory(68) <= "0000110000"; --| no op             | S -> Buf B    | 0     |
    INSTR_memory(69) <= "0101000000"; --| A0 and B1         | A -> Buf A    | 0     |
    INSTR_memory(70) <= "0000110000"; --| no op             | S -> Buf B    | 0     |
    INSTR_memory(71) <= "0110000100"; --| Buf A or Buf B    | Mem1 -> Buf A | 0     |
    INSTR_memory(72) <= "0000111000"; --| no op             | S -> Mem 1    | 0     |
    INSTR_memory(73) <= "0000000001"; --| no op             | A -> Buf A    | Mem1  |
    INSTR_memory(74) <= "0001001010";
    INSTR_memory(75) <= "0001001011";
    INSTR_memory(76) <= "0001001100";
    INSTR_memory(77) <= "0001001101";
    INSTR_memory(78) <= "0001001110";
    INSTR_memory(79) <= "0001001111";
    INSTR_memory(80) <= "0001010000";
    INSTR_memory(81) <= "0001010001";
    INSTR_memory(82) <= "0001010010";
    INSTR_memory(83) <= "0001010011";
    INSTR_memory(84) <= "0001010100";
    INSTR_memory(85) <= "0001010101";
    INSTR_memory(86) <= "0001010110";
    INSTR_memory(87) <= "0001010111";
    INSTR_memory(88) <= "0001011000";
    INSTR_memory(89) <= "0001011001";
    INSTR_memory(90) <= "0001011010";
    INSTR_memory(91) <= "0001011011";
    INSTR_memory(92) <= "0001011100";
    INSTR_memory(93) <= "0001011101";
    INSTR_memory(94) <= "0001011110";
    INSTR_memory(95) <= "0001011111";
        
    INSTR_memory(96) <= "0001100000";
    INSTR_memory(97) <= "0001100001";
    INSTR_memory(98) <= "0001100010";
    INSTR_memory(99) <= "0001100011";
    INSTR_memory(100) <= "0001100100";
    INSTR_memory(101) <= "0001100101";
    INSTR_memory(102) <= "0001100110";
    INSTR_memory(103) <= "0001100111";
    INSTR_memory(104) <= "0001101000";
    INSTR_memory(105) <= "0001101001";
    INSTR_memory(106) <= "0001101010";
    INSTR_memory(107) <= "0001101011";
    INSTR_memory(108) <= "0001101100";
    INSTR_memory(109) <= "0001101101";
    INSTR_memory(110) <= "0001101110";
    INSTR_memory(111) <= "0001101111";
    INSTR_memory(112) <= "0001110000";
    INSTR_memory(113) <= "0001110001";
    INSTR_memory(114) <= "0001110010";
    INSTR_memory(115) <= "0001110011";
    INSTR_memory(116) <= "0001110100";
    INSTR_memory(117) <= "0001110101";
    INSTR_memory(118) <= "0001110110";
    INSTR_memory(119) <= "0001110111";
    INSTR_memory(120) <= "0001111000";
    INSTR_memory(121) <= "0001111001";
    INSTR_memory(122) <= "0001111010";
    INSTR_memory(123) <= "0001111011";
    INSTR_memory(124) <= "0001111100";
    INSTR_memory(125) <= "0001111101";
    INSTR_memory(126) <= "0001111110";
    INSTR_memory(127) <= "0001111111";

end INSTRMemory_Arch;
