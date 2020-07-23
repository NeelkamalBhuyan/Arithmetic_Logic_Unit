library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Eight_bit_adder  is
  port (A, B: in std_logic_vector(7 downto 0); output: out std_logic_vector(7 downto 0));
end entity Eight_bit_adder;
architecture Struct of Eight_bit_adder is
  signal t: std_logic_vector(7 downto 0);
  component Full_Adder  is
		port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component Full_Adder;
	
begin

  fa1: Full_Adder 
       port map (A => A(0), B => B(0), Cin=> '0', S => output(0), Cout => t(0));
  fa2: Full_Adder 
       port map (A => A(1), B => B(1), Cin=> t(0), S => output(1), Cout => t(1));
  fa3: Full_Adder 
       port map (A => A(2), B => B(2), Cin=> t(1), S => output(2), Cout => t(2));
  fa4: Full_Adder 
       port map (A => A(3), B => B(3), Cin=> t(2), S => output(3), Cout => t(3));
  fa5: Full_Adder 
       port map (A => A(4), B => B(4), Cin=> t(3), S => output(4), Cout => t(4));
  fa6: Full_Adder 
       port map (A => A(5), B => B(5), Cin=> t(4), S => output(5), Cout => t(5));
  fa7: Full_Adder 
       port map (A => A(6), B => B(6), Cin=> t(5), S => output(6), Cout => t(6));
  fa8: Full_Adder 
       port map (A => A(7), B => B(7), Cin=> t(6), S => output(7), Cout => t(7));		 
		 
  -- propagate carry.
  --a1: welAnd2 port map (A => tS, B => Cin, Y => V);
  --o1: welOr2  port map (A => V, B => tC, Y => Cout);

  -- final sum.
  --x1: welXor2 port map (A => tS, B => Cin, Y => S);
end Struct;
