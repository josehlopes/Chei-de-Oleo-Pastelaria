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

#AQUI VOCÊ SOMA O VALOR TOTAL DE VENDAS DE CADA TIPO DE PASTEL E RETORNA APENAS QUANTOS PASTEIS FORAM VENDIDOS E O VALOR SOMADO DE TODOS ELES
SELECT SUM(quantidadeVendas) as pasteisVendidos, (SELECT COALESCE(SUM(valorTotal), 0) FROM V_valor_total_pastel ) AS totalGeralVendas
FROM V_valor_total_pastel;

$$
DELIMITER ;

SELECT * FROM V_valor_total_pastel;
SELECT * FROM V_valor_total_pastel;
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
CREATE OR REPLACE VIEW  V_produtos_mais_pedidos AS
SELECT p.nomeProduto AS produto, COUNT(i.quantidade) AS vendas
FROM itens_pedido i
JOIN produtos p ON p.idProduto = i.idProduto
GROUP BY p.nomeProduto
ORDER BY vendas DESC;

SELECT * FROM V_produtos_mais_pedidos;
SELECT * FROM itens_pedido;
CREATE OR REPLACE VIEW  V_produtos_mais_pedidos AS
SELECT p.nomeProduto AS produto, COUNT(i.quantidade) AS vendas
FROM itens_pedido i
JOIN produtos p ON p.idProduto = i.idProduto
GROUP BY p.nomeProduto
ORDER BY vendas DESC;

SELECT * FROM V_produtos_mais_pedidos;
SELECT * FROM itens_pedido;
-- /////////////////////////////////////////////////////////////////////View 11 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW  V_categoria_mais_pedida AS
SELECT c.nome AS categoria, COUNT(i.quantidade) AS vendas
FROM itens_pedido i
JOIN produtos p ON p.idProduto = i.idProduto
JOIN categorias c ON c.idCategoria = p.idCategoria
GROUP BY categoria
ORDER BY vendas DESC;

SELECT * FROM V_categoria_mais_pedida;
-- /////////////////////////////////////////////////////////////////////View 12 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_produtos_preferidos_de_cada_cliente AS
SELECT cliente, preferido
FROM (
    SELECT
        c.nomeCliente AS cliente,
        p.nomeProduto AS preferido,
        i.quantidade,
        RANK() OVER (PARTITION BY c.idCliente ORDER BY i.quantidade DESC) AS ranking
    FROM
        itens_pedido i
    JOIN pedidos pdd ON i.idPedido = pdd.idPedido
    JOIN clientes c ON c.idCliente = pdd.idCliente
    JOIN produtos p ON p.idProduto = i.idProduto
) ranked
WHERE ranking = 1
GROUP BY cliente
ORDER BY cliente;

SELECT * FROM V_produtos_preferidos_de_cada_cliente;

SELECT * FROM itens_pedido;
-- /////////////////////////////////////////////////////////////////////View 13 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_pedidos_do_cliente AS
SELECT c.nomeCliente AS cliente, p.idPedido AS pedido
FROM clientes c
JOIN pedidos p ON c.idCliente = p.idCliente
ORDER BY cliente;

SELECT * FROM V_pedidos_do_cliente;
-- /////////////////////////////////////////////////////////////////////View 14 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_itens_do_pedido AS
SELECT p.nomeProduto AS item, pdd.idPedido AS pedido, i.quantidade as quantidade
FROM itens_pedido i
JOIN produtos p ON p.idProduto = i.idProduto
JOIN pedidos pdd ON pdd.idPedido = i.idPedido
ORDER BY pedido;

SELECT * FROM V_itens_do_pedido;
-- /////////////////////////////////////////////////////////////////////View 14 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_log_de_alteracao AS
SELECT l.idProduto AS id, p.nomeProduto AS produto, l.preco_antigo AS precoAntigo, l.preco_novo AS precoNovo, l.dataLog as dataDeAlteracao
FROM log_preco L
JOIN produtos p ON p.idProduto = l.idProduto;

SELECT * FROM V_log_de_alteracao;
-- /////////////////////////////////////////////////////////////////////View 15 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_top_formas_de_pagamento AS
SELECT f.tipoPagamento AS forma, COUNT(pdd.idPagamento) as numeroDePagamentos
FROM formas_pagamentos f
JOIN pedidos pdd ON f.idPagamento = pdd.idPagamento
GROUP BY forma
ORDER BY numeroDePagamentos DESC;

SELECT * FROM V_top_formas_de_pagamento;
-- /////////////////////////////////////////////////////////////////////View 16 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW V_10_pedidos_mais_recentes AS
SELECT pdd.idPedido AS ID, pdd.dataPedido AS dataP
FROM pedidos pdd
ORDER BY dataP
LIMIT 10;

SELECT * FROM V_10_pedidos_mais_recentes;
CREATE OR REPLACE VIEW  V_categoria_mais_pedida AS
SELECT c.nome AS categoria, COUNT(i.quantidade) AS vendas
FROM itens_pedido i
JOIN produtos p ON p.idProduto = i.idProduto
JOIN categorias c ON c.idCategoria = p.idCategoria
GROUP BY categoria
ORDER BY vendas DESC;

SELECT * FROM V_categoria_mais_pedida;
-- /////////////////////////////////////////////////////////////////////View 12 ////////////////////////////////////////////// --
CREATE OR REPLACE VIEW  V_produtos_preferidos_de_cada_cliente AS
SELECT c.nomeCliente AS cliente, p.nomeProduto AS produto, COUNT(i.quantidade) 
FROM itens_pedido i
JOIN pedidos pdd ON i.idPedido = pdd.idPedido
JOIN clientes c ON c.idCliente = pdd.idCliente
JOIN produtos p ON p.idProduto = i.idProduto


