-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(17 downto 0); -- no. of inputs is the length of input_vector
       	output_vector: out std_logic_vector(7 downto 0)); -- no. of inputs is the length of input_vector
end entity;

architecture DutWrap of DUT is
   component ALU is
     port(X,Y: in std_logic_vector(7 downto 0); --declaration of A,B,S,Cout
         	S: in std_logic_vector(1 downto 0);
				output: out std_logic_vector(7 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: ALU 
			port map (
					-- order of inputs B A, mapping with input_vector
					Y   => input_vector(7 downto 0),
					X   => input_vector(15 downto 8),
                                        -- order of outputs S Cout, mapping with output_vector
					S => input_vector(17 downto 16),
					output => output_vector(7 downto 0));

end DutWrap;

