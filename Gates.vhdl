library ieee;
use ieee.std_logic_1164.all;
package Gates is
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  component welAND2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component welAND2;

  component NAND2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND2;

  component welOR2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component welOR2;

  component NOR2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NOR2;

  component welXOR2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component welXOR2;

  component XNOR2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XNOR2;

  component HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
  end component HALF_ADDER;

  component Full_Adder  is
  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end component Full_Adder;

end package Gates;


library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
   port (A: in std_logic; Y: out std_logic);
end entity INVERTER;

architecture Equations of INVERTER is
begin
   Y <= not A;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity welAND2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity welAND2;

architecture Equations of welAND2 is
begin
   Y <= A and B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NAND2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NAND2;

architecture Equations of NAND2 is
begin
   Y <= not (A and B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity welOR2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity welOR2;

architecture Equations of welOR2 is
begin
   Y <= A or B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NOR2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NOR2;

architecture Equations of NOR2 is
begin
   Y <= not (A or B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity welXOR2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity welXOR2;

architecture Equations of welXOR2 is
begin
   Y <= A xor B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity XNOR2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XNOR2;

architecture Equations of XNOR2 is
begin
   Y <= not (A xor B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
end entity HALF_ADDER;

architecture Equations of HALF_ADDER is
begin
   S <= (A xor B);
   C <= (A and B);
end Equations;
  
