-- Função 1
CREATE FUNCTION IF NOT EXISTS F_clientes18()
RETURNS TABLE
AS
SELECT nomeCliente, TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) AS idade
FROM clientes 
WHERE TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) > 18;

-- Selecionando dados da Função 1
SELECT * FROM F_clientes18;

-- Função 2
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

-- Chamando a Função 2
SELECT F_total_vendas_pastel('Pastel de Frango');
