library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Mux4_1  is
  port (mux_in : in std_logic_vector(3 downto 0);
          mux_sel: in std_logic_vector(1 downto 0);
          mux_out : out std_logic);
end entity Mux4_1;
architecture Struct of Mux4_1 is
  signal t: std_logic_vector(1 downto 0); signal a,b: std_logic_vector(3 downto 0); signal c: std_logic_vector(1 downto 0);
begin
  -- component instances
  inv1: INVERTER port map (A => mux_sel(1), Y=>t(1));
  inv2: INVERTER port map (A => mux_sel(0), Y=>t(0));
  a1: welAnd2 port map (A => t(1), B => t(0), Y => a(0));
  a2: welAnd2 port map (A => t(1), B => mux_sel(0), Y => a(1));
  a3: welAnd2 port map (A => mux_sel(1), B => t(0), Y => a(2));
  a4: welAnd2 port map (A => mux_sel(1), B => mux_sel(0), Y => a(3));
  a5: welAnd2 port map (A => mux_in(0), B => a(0), Y => b(0));
  a6: welAnd2 port map (A => mux_in(1), B => a(1), Y => b(1));
  a7: welAnd2 port map (A => mux_in(2), B => a(2), Y => b(2));
  a8: welAnd2 port map (A => mux_in(3), B => a(3), Y => b(3));
  o1: welOr2  port map (A => b(0), B => b(1), Y => c(0));
  o2: welOr2  port map (A => b(2), B => b(3), Y => c(1));
  o3: welOr2  port map (A => c(0), B => c(1), Y => mux_out);
  -- propagate carry.
  --a1: welAnd2 port map (A => tS, B => Cin, Y => V);
  --o1: welOr2  port map (A => V, B => tC, Y => Cout);

  -- final sum.
  --x1: welXor2 port map (A => tS, B => Cin, Y => S);
end Struct;




library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity ALU  is
  port (X, Y: in std_logic_vector(7 downto 0); S: in std_logic_vector(1 downto 0); output: out std_logic_vector(7 downto 0));
end entity ALU;
architecture Struct of ALU is
	component Eight_bit_adder  is
		port (A, B: in std_logic_vector(7 downto 0); output: out std_logic_vector(7 downto 0));
	end component Eight_bit_adder;
	component Eight_bit_multiplier  is
		port (Xm,Ym: in std_logic_vector(7 downto 0); M: out std_logic_vector(7 downto 0));
	end component Eight_bit_multiplier;
	component left_shift is
		port (Xm: in std_logic_vector(7 downto 0); shift :in std_logic_vector(7 downto 0); Ym: out std_logic_vector(7 downto 0));
	end component left_shift;
	component right_shift is
		port (Xm: in std_logic_vector(7 downto 0); shift :in std_logic_vector(7 downto 0); Ym: out std_logic_vector(7 downto 0));
	end component right_shift;
	component Mux4_1  is
		port (mux_in : in std_logic_vector(3 downto 0);
          mux_sel: in std_logic_vector(1 downto 0);
          mux_out : out std_logic);
	end component Mux4_1;
	signal o1,o2,o3,o4: std_logic_vector(7 downto 0);
begin
  s0: Eight_bit_adder
  port map(A => X, B => Y, output => o1);
  s3: Eight_bit_multiplier
  port map(Xm => X, Ym => Y, M=> o4);
  s1: left_shift
  port map(Xm => X, shift => Y, Ym => o2);
  s2: right_shift
  port map(Xm => X, shift => Y, Ym => o3);
  
  --output <= o1 when S(0)='0' and S(1)='0' else o2 when S(0)='0' and S(1)='1' else o3 when S(0)='1' and S(1)='0' else o4;
  mux0: Mux4_1
  port map(mux_in(0) => o1(0), mux_in(1) => o2(0), mux_in(2) => o3(0),  mux_in(3) => o4(0), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(0));
  mux1: Mux4_1
  port map(mux_in(0) => o1(1), mux_in(1) => o2(1), mux_in(2) => o3(1),  mux_in(3) => o4(1), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(1));
  mux2: Mux4_1
  port map(mux_in(0) => o1(2), mux_in(1) => o2(2), mux_in(2) => o3(2),  mux_in(3) => o4(2), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(2));
  mux3: Mux4_1
  port map(mux_in(0) => o1(3), mux_in(1) => o2(3), mux_in(2) => o3(3),  mux_in(3) => o4(3), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(3));
  mux4: Mux4_1
  port map(mux_in(0) => o1(4), mux_in(1) => o2(4), mux_in(2) => o3(4),  mux_in(3) => o4(4), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(4));
  mux5: Mux4_1
  port map(mux_in(0) => o1(5), mux_in(1) => o2(5), mux_in(2) => o3(5),  mux_in(3) => o4(5), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(5));
  mux6: Mux4_1
  port map(mux_in(0) => o1(6), mux_in(1) => o2(6), mux_in(2) => o3(6),  mux_in(3) => o4(6), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(6));
  mux7: Mux4_1
  port map(mux_in(0) => o1(7), mux_in(1) => o2(7), mux_in(2) => o3(7),  mux_in(3) => o4(7), mux_sel(0) => S(0), mux_sel(1) => S(1), mux_out => output(7));
  
 end Struct;
