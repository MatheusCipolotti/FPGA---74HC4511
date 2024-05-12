--
-- 74HC4511
--
-- Autor: Matheus Dantas Cipolotti
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity FPGA_74HC4511 is port
(
	LE	:	in		std_logic;
	BI	:	in 	std_logic;
	LT	:	in 	std_logic;
	D	:	in  	std_logic_vector(3 downto 0);
	O	:	out  	std_logic_vector(6 downto 0)
	);

end FPGA_74HC4511;

architecture hardware of FPGA_74HC4511 is
begin
process(LE,BI,LT,D)
begin
	
	if (LE = '0' and BI = '1' and LT ='1') then 		-- Verifica se o Latch Enable esta ativo
		
		case D is
	
			when "0000" => O <= "0111111";				-- 0
			when "0001" => O <= "0000110";				-- 1
			when "0010" => O <= "1011011";				-- 2
			when "0011" => O <= "1001111";				-- 3
			when "0100" => O <= "1100110";				-- 4
			when "0101" =>	O <= "1101101";				--	5
			when "0110" => O <= "1111100";				-- 6
			when "0111" => O <= "0000111";				-- 7
			when "1000" => O <= "1111111";				-- 8
			when "1001" => O <= "1100111";				-- 9
			when others => O <= "0000000";				-- BLANK
	
		end case;
	   
	elsif (LT = '0') then 									-- Verifica se o Lamp Test esta ativo
      O <= "1111111"; 										-- Acende todos os segmentos se Lamp Test estiver ativo	
	
	elsif (BI = '0' and LT = '1') then 					-- Verifica se o Blanking Input esta ativo
      O <= "0000000"; 										-- Desliga todos os segmentos se Blanking Input estiver ativo
	
	else
      O <= "0000000"; 										-- Desliga todos os segmentos por padrao 
		
	end if;
end process;
end hardware;