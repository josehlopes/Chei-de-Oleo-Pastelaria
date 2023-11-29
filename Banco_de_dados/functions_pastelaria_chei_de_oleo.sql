# 8. Crie pelo menos 3 funções

CREATE FUNCTION IF NOT EXISTS F_clientes18()
RETURNS TABLE
AS
SELECT nomeCliente, TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) AS idade
FROM clientes 
WHERE TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) > 18;

SELECT * FROM F_clientes18;
/**************************************************************** Função 1 ****************************************************************/
/* Nesta função, criei um mecanismo para contar o número total de pedidos em um determinado mês e ano. */

DELIMITER $$
CREATE OR REPLACE FUNCTION F_total_pedidos_mes_ano(p_mes INT, p_ano INT)
RETURNS INT DETERMINISTIC
BEGIN
  /* Declarei uma variável para armazenar o total de pedidos. */
  DECLARE total_pedidos INT;

  /* Realizei uma consulta para contar os pedidos com base no mês e ano fornecidos. */
  SELECT COUNT(*) INTO total_pedidos FROM pedidos 
  WHERE MONTH(dataPedido) = p_mes AND YEAR(dataPedido) = p_ano;

  /* Retorno o total de pedidos. */
  RETURN total_pedidos;
END$$
DELIMITER ;

/* teste da função. */
SELECT F_total_pedidos_mes_ano(1, 2023);
SELECT F_total_pedidos_mes_ano(2, 2023);

/**************************************************************** Função 2 ****************************************************************/
/* Nesta função, desenvolvi um método para contar o total de pedidos de um cliente específico. */

DELIMITER $$
CREATE OR REPLACE FUNCTION F_total_pedidos_cliente(p_nomeCliente VARCHAR(100))
RETURNS INT DETERMINISTIC
BEGIN
  /* Declarei uma variável para armazenar o total de pedidos. */
  DECLARE total_pedidos INT;

  /* Realizei uma consulta para contar os pedidos associados ao cliente fornecido. */
  SELECT COUNT(*) INTO total_pedidos FROM pedidos 
  WHERE idCliente = (SELECT idCliente FROM clientes WHERE nomeCliente = p_nomeCliente);

  /* Retorno o total de pedidos. */
  RETURN total_pedidos;
END$$
DELIMITER ;

/* teste da função. */
SELECT F_total_pedidos_cliente('Bernardo Trovão');
SELECT F_total_pedidos_cliente('Fábio Sombra');

/**************************************************************** Função 3 ****************************************************************/
/* Nesta função, criei um mecanismo para obter o status de um pedido com base no ID do pedido. */

DELIMITER $$
CREATE OR REPLACE FUNCTION F_status_pedido(p_idPedido INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  /* Declarei uma variável para armazenar o status do pedido. */
  DECLARE status_pedido VARCHAR(100);

  /* Realizei uma consulta para obter o status do pedido. */
  SELECT descricao INTO status_pedido FROM status_pedidos 
  WHERE idStatus = (SELECT idStatus FROM pedidos WHERE idPedido = p_idPedido);

  /* Retorno o status do pedido. */
  RETURN status_pedido;
END$$
DELIMITER ;

/* teste da função.*/
SELECT F_status_pedido(1);
SELECT F_status_pedido(2);
SELECT F_status_pedido(3);
SELECT F_status_pedido(4);

/**************************************************************** Função 4 ****************************************************************/
/* Nesta função, criei um método para calcular o valor total de um pedido com base nos itens associados e seus preços. */

DELIMITER $$
CREATE OR REPLACE FUNCTION F_valor_total_pedido(p_idPedido INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
  /* Declarei uma variável para armazenar o valor total do pedido. */
  DECLARE valor_total DECIMAL(10,2);

  /* Realizei uma consulta para calcular o valor total do pedido. */
  SELECT SUM(precoBase * quantidade) INTO valor_total FROM itens_pedido 
  JOIN produtos ON itens_pedido.idProduto = produtos.idProduto
  WHERE idPedido = p_idPedido;

  /* Retorno o valor total do pedido. */
  RETURN valor_total;
END$$
DELIMITER ;

/*teste da função.*/
SELECT F_valor_total_pedido(2);

/**************************************************************** Função 5 ****************************************************************/
/* Nesta função, desenvolvi um método para contar o número total de pedidos com um determinado status. */

DELIMITER $$
CREATE OR REPLACE FUNCTION F_total_pedidos_status(p_idStatus INT)
RETURNS INT DETERMINISTIC
BEGIN
  /* Declarei uma variável para armazenar o total de pedidos com o status fornecido. */
  DECLARE total_pedidos INT;

  /* Realizei uma consulta para contar os pedidos com o status fornecido. */
  SELECT COUNT(*) INTO total_pedidos FROM pedidos 
  WHERE idStatus = p_idStatus;

  /* Retorno o total de pedidos com o status fornecido. */
  RETURN total_pedidos;
END$$
DELIMITER ;

/*teste da função. */
SELECT F_total_pedidos_status(1); -- Aguardando
SELECT F_total_pedidos_status(2); -- Concluído
SELECT F_total_pedidos_status(3); -- Em Andamento
SELECT F_total_pedidos_status(4); -- Saiu para Entrega
