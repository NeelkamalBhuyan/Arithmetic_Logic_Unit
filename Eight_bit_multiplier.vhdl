library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity bit_and is
	port (A: in std_logic_vector(7 downto 0); c: in std_logic; B: out std_logic_vector(7 downto 0));
end entity bit_and;
architecture struct of bit_and is
begin
B(0) <= A(0) and c;
B(1) <= A(1) and c;
B(2) <= A(2) and c;
B(3) <= A(3) and c;
B(4) <= A(4) and c;
B(5) <= A(5) and c;
B(6) <= A(6) and c;
B(7) <= A(7) and c;
end struct;


library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Eight_bit_multiplier  is
  port (Xm,Ym: in std_logic_vector(7 downto 0); M: out std_logic_vector(7 downto 0));
end entity Eight_bit_multiplier;
architecture Struct of Eight_bit_multiplier is
  component left_shift is
		port (Xm: in std_logic_vector(7 downto 0); shift :in std_logic_vector(7 downto 0); Ym: out std_logic_vector(7 downto 0));
	end component left_shift;
	component Eight_bit_adder  is
		port (A, B: in std_logic_vector(7 downto 0); output: out std_logic_vector(7 downto 0));
	end component Eight_bit_adder;
	component bit_and is
		port (A: in std_logic_vector(7 downto 0); c: in std_logic; B: out std_logic_vector(7 downto 0));
	end component bit_and;
	signal m1,m2,m3,m4,m5,m6,m7,m8,sm2,sm3,sm4,sm5,sm6,sm7,sm8,sa,sb,sc,sd,se,sf: std_logic_vector(7 downto 0);
begin
  a1: bit_and
  port map(A => Xm, c => Ym(0), B => m1);
  a2: bit_and
  port map(A => Xm, c => Ym(1), B => m2);
  a3: bit_and
  port map(A => Xm, c => Ym(2), B => m3);
  a4: bit_and
  port map(A => Xm, c => Ym(3), B => m4);
  a5: bit_and
  port map(A => Xm, c => Ym(4), B => m5);
  a6: bit_and
  port map(A => Xm, c => Ym(5), B => m6);
  a7: bit_and
  port map(A => Xm, c => Ym(6), B => m7);
  a8: bit_and
  port map(A => Xm, c => Ym(7), B => m8);
  s1: left_shift
  port map(Xm => m2, shift => "00000001", Ym => sm2);
  s2: left_shift
  port map(Xm => m3, shift => "00000010", Ym => sm3);
  s3: left_shift
  port map(Xm => m4, shift => "00000011", Ym => sm4);
  s4: left_shift
  port map(Xm => m5, shift => "00000100", Ym => sm5);
  s5: left_shift
  port map(Xm => m6, shift => "00000101", Ym => sm6);
  s6: left_shift
  port map(Xm => m7, shift => "00000110", Ym => sm7);
  s7: left_shift
  port map(Xm => m8, shift => "00000111", Ym => sm8);
  ea1: Eight_bit_adder
  port map(A => m1, B => sm2, output => sa);
  ea2: Eight_bit_adder
  port map(A => sa, B => sm3, output => sb);
  ea3: Eight_bit_adder
  port map(A => sb, B => sm4, output => sc);
  ea4: Eight_bit_adder
  port map(A => sc, B => sm5, output=> sd);
  ea5: Eight_bit_adder
  port map(A => sd, B => sm6, output => se);
  ea6: Eight_bit_adder
  port map(A => se, B => sm7, output => sf);
  ea7: Eight_bit_adder
  port map(A => sf, B => sm8, output => M);
end Struct;