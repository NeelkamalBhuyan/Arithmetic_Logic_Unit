library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity left_shift1 is
port (X: in std_logic_vector(7 downto 0);
S: in std_logic;
Y: out std_logic_vector(7 downto 0));
end entity left_shift1;
architecture Easy of left_shift1 is
begin
Y(7) <= X(6) when S='1' else X(7);
Y(6) <= X(5) when S='1' else X(6);
Y(5) <= X(4) when S='1' else X(5);
Y(4) <= X(3) when S='1' else X(4);
Y(3) <= X(2) when S='1' else X(3);
Y(2) <= X(1) when S='1' else X(2);
Y(1) <= X(0) when S='1' else X(1);
Y(0) <= '0' when S='1' else X(0);
end Easy;



library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity left_shift2 is
port (X: in std_logic_vector(7 downto 0);
S: in std_logic;
Y: out std_logic_vector(7 downto 0));
end entity left_shift2;
architecture Easy of left_shift2 is
begin
Y(7) <= X(5) when S='1' else X(7);
Y(6) <= X(4) when S='1' else X(6);
Y(5) <= X(3) when S='1' else X(5);
Y(4) <= X(2) when S='1' else X(4);
Y(3) <= X(1) when S='1' else X(3);
Y(2) <= X(0) when S='1' else X(2);
Y(1) <= '0' when S='1' else X(1);
Y(0) <= '0' when S='1' else X(0);
end Easy;



library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity left_shift4 is
port (X: in std_logic_vector(7 downto 0);
S: in std_logic;
Y: out std_logic_vector(7 downto 0));
end entity left_shift4;
architecture Easy of left_shift4 is
begin
Y(7) <= X(3) when S='1' else X(7);
Y(6) <= X(2) when S='1' else X(6);
Y(5) <= X(1) when S='1' else X(5);
Y(4) <= X(0) when S='1' else X(4);
Y(3) <= '0' when S='1' else X(3);
Y(2) <= '0' when S='1' else X(2);
Y(1) <= '0' when S='1' else X(1);
Y(0) <= '0' when S='1' else X(0);
end Easy;



library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity left_shift is
port (Xm: in std_logic_vector(7 downto 0); shift :in std_logic_vector(7 downto 0); Ym: out std_logic_vector(7 downto 0));
end entity left_shift;
architecture Main of left_shift is
	component left_shift1 is
		port (X: in std_logic_vector(7 downto 0);
		S: in std_logic;
		Y: out std_logic_vector(7 downto 0));
	end component left_shift1;
	component left_shift2 is
		port (X: in std_logic_vector(7 downto 0);
		S: in std_logic;
		Y: out std_logic_vector(7 downto 0));
	end component left_shift2;
	component left_shift4 is
		port (X: in std_logic_vector(7 downto 0);
		S: in std_logic;
		Y: out std_logic_vector(7 downto 0));
	end component left_shift4;
	signal t1,t2,t4: std_logic_vector(7 downto 0);
begin

--cascading 1 2 and 4 shifters with input as prevoius output and S as shift(k), k=0,1,2

s1: left_shift1
		port map (X => Xm, S => shift(0), Y => t1);
s2: left_shift2
		port map (X => t1, S => shift(1), Y => t2);
s3: left_shift4
		port map (X => t2, S => shift(2), Y => t4);	

Ym <= "00000000" when shift(7) = '1' or shift(6) = '1' or shift(5) = '1' or shift(4) = '1' or shift(3) = '1' else t4;
end Main;