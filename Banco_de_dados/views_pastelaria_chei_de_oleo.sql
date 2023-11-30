-- /////////////////////////////////////////////////////////////////////View 1 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_dados_dos_clientes AS 
SELECT nomeCliente, cpf, logradouro, numero, complemento, telefone1, email 
FROM clientes
JOIN enderecos ON clientes.idCliente = enderecos.idCliente
JOIN contatos ON clientes.idCliente = contatos.idCliente;

SELECT * FROM V_dados_dos_clientes;

-- /////////////////////////////////////////////////////////////////////View 2 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_ingredientes_do_pastel AS 
SELECT p.nomeProduto, i.nome as ingrediente
FROM produtos p
JOIN ingredientes_do_pastel idp ON idp.idProduto = p.idProduto
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
ORDER BY nomeProduto;

SELECT * FROM V_ingredientes_do_pastel;
-- /////////////////////////////////////////////////////////////////////View 3 ////////////////////////////////////////////// --
# 3. Liste todos os pastéis que possuem bacon e queijo em seu recheio. 
CREATE OR REPLACE VIEW V_ver_bacon_e_queijo AS 
SELECT p.nomeProduto as Nome
FROM produtos p
JOIN ingredientes_do_pastel idp ON idp.idProduto = p.idProduto
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
WHERE idp.idIngrediente IN (5,2)
GROUP BY p.nomeProduto;

SELECT * FROM V_ver_bacon_e_queijo;
-- /////////////////////////////////////////////////////////////////////View 4 ////////////////////////////////////////////// --
# 2. Liste os clientes com maior número de pedidos realizados em 1 ano agrupados por mês 

CREATE OR REPLACE VIEW V_clientes_com_mais_pedidos AS

    SELECT c.nomeCliente, COUNT(p.idPedido) AS numeroDePedidos, EXTRACT(MONTH FROM p.dataPedido) AS mesDoPedido, EXTRACT(YEAR FROM p.dataPedido) AS anoDoPedido
    FROM clientes c
	JOIN pedidos p ON c.idCliente = p.idCliente
    WHERE p.dataPedido >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
    GROUP BY mesDoPedido
    ORDER BY anoDoPedido DESC , mesDoPedido DESC , numeroDePedidos DESC;

SELECT * FROM V_clientes_com_mais_pedidos;

-- /////////////////////////////////////////////////////////////////////View 5 ////////////////////////////////////////////// --
# 1. Liste os nomes de todos os pastéis veganos vendidos para pessoas com mais de 18 anos.
CREATE OR REPLACE VIEW V_pasteis_veganos_clientes18 AS
SELECT DISTINCT c.nomeCliente, TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) AS idade, po.nomeProduto, cc.nome as categoria, p.idPedido as numeroDoPedido, i.quantidade as quantidade
FROM clientes c
JOIN pedidos p
JOIN itens_pedido i ON i.idPedido = p.idPedido
JOIN produtos po ON po.idProduto = i.idProduto
JOIN categorias cc ON po.idCategoria = cc.idCategoria
JOIN clientes ON c.idCliente = p.idCliente
WHERE TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) > 18
AND cc.nome = 'Veganos' OR cc.nome = 'Pasteis Veganos'
ORDER BY numeroDoPedido;

SELECT * FROM V_pasteis_veganos_clientes18;
-- /////////////////////////////////////////////////////////////////////View 6 ////////////////////////////////////////////// --
# 4. Mostre o valor de venda total de todos os pastéis cadastrados no sistema. 

DELIMITER $$

CREATE OR REPLACE VIEW V_valor_total_pastel AS
SELECT p.nomeProduto, COUNT(*) AS quantidadeVendas, SUM(p.precoBase * ip.quantidade) AS valorTotal
FROM produtos p
JOIN itens_pedido ip ON p.idProduto = ip.idProduto
WHERE p.idCategoria = 6 OR p.idCategoria = 7
GROUP BY p.nomeProduto;

SELECT SUM(quantidadeVendas) as pasteisVendidos, (SELECT COALESCE(SUM(valorTotal), 0) FROM V_valor_total_pastel ) AS totalGeralVendas
FROM V_valor_total_pastel
GROUP BY totalGeralVendas;

$$
DELIMITER ;

-- /////////////////////////////////////////////////////////////////////View 7 ////////////////////////////////////////////// --
# 5. Liste todos os pedidos onde há pelo menos um pastel e uma bebida. 

CREATE OR REPLACE VIEW V_pedidos_pastel_bebida AS
SELECT p1.idPedido
FROM pedidos p1
JOIN itens_pedido i ON p1.idPedido = i.idPedido
JOIN produtos p ON i.idProduto = p.idProduto
JOIN categorias c ON p.idCategoria = c.idCategoria
WHERE p.idCategoria IN (6, 2)
GROUP BY p1.idPedido
ORDER BY p1.idPedido ASC;

SELECT * FROM V_pedidos_pastel_bebida;
-- /////////////////////////////////////////////////////////////////////View 8 ////////////////////////////////////////////// --
# 6. Liste quais são os pastéis mais vendidos, incluindo a quantidade de vendas em ordem crescente.

CREATE OR REPLACE VIEW V_pasteis_mais_vendidos AS
SELECT po.nomeProduto, COUNT(i.quantidade) as quantidadeVendas
FROM produtos po
JOIN itens_pedido i ON po.idProduto = i.idProduto
WHERE po.idCategoria IN (6, 7)
GROUP BY po.nomeProduto
ORDER BY quantidadeVendas ASC;

SELECT * FROM V_pasteis_mais_vendidos;
-- /////////////////////////////////////////////////////////////////////View 9 ////////////////////////////////////////////// --

CREATE OR REPLACE VIEW V_informacoes_dos_pedidos AS
SELECT c.nomeCliente, c.cpf, e.logradouro, e.numero, e.cep, e.complemento, ct.telefone1, p.idPedido, TIME(p.dataPedido) as HoraDoPedido , s.descricao, f.tipoPagamento
FROM clientes c
JOIN enderecos e ON c.idCliente = e.idCliente
JOIN contatos ct ON c.idCliente = ct.idCliente
JOIN pedidos p ON c.idCliente = p.idCliente
JOIN status_pedidos s ON p.idStatus = s.idStatus
JOIN formas_pagamentos f ON p.idPagamento = f.idPagamento
ORDER BY p.idPedido;

SELECT * FROM V_informacoes_dos_pedidos;
-- /////////////////////////////////////////////////////////////////////View 10 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW  V_ AS

-- /////////////////////////////////////////////////////////////////////View 11 ////////////////////////////////////////////// --



