#----------------------------função 1 --------------------#

CREATE FUNCTION IF NOT EXISTS F_clientes18()
RETURNS TABLE
AS
SELECT nomeCliente, TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) AS idade
FROM clientes 
WHERE TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) > 18;

SELECT * FROM F_clientes18;

#----------------------------função 2 ---------Nadson -----------#
# função para calcular o valor total de vendas de um determinado pastel#


DELIMITER $$
CREATE FUNCTION F_total_vendas_pastel(descricao_pastel VARCHAR(100)) RETURNS DECIMAL(10,2)
BEGIN
  DECLARE total_vendas DECIMAL(10,2);
  SELECT SUM(p.preco * i.quantidade) INTO total_vendas
  FROM pasteis p
  JOIN itens_pedido i ON p.idPastel = i.idPastel
  WHERE p.descricao = descricao_pastel;
  RETURN total_vendas;
END$$
DELIMITER ;

SELECT F_total_vendas_pastel('Pastel de Frango');


#_________________________________________________________________