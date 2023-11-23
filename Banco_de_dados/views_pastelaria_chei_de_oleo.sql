-- Início da Transação
START TRANSACTION;

-- Criando a View V_dados_dos_clientes
CREATE OR REPLACE VIEW V_dados_dos_clientes AS 
SELECT nomeCliente, cpf, logradouro, numero, complemento, telefone1, email 
FROM clientes
JOIN enderecos ON clientes.idCliente = enderecos.idCliente
JOIN contatos ON clientes.idCliente = contatos.idCliente;

-- Selecionando dados da View V_dados_dos_clientes
SELECT * FROM V_dados_dos_clientes;

-- Criando a View V_ingredientes_do_pastel
CREATE OR REPLACE VIEW V_ingredientes_do_pastel AS 
SELECT p.descricao, p.tamanho, i.nome as ingrediente
FROM pasteis p
JOIN ingredientes_do_pastel idp ON idp.idPastel = p.idPastel
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
ORDER BY descricao;

-- Selecionando dados da View V_ingredientes_do_pastel
SELECT * FROM V_ingredientes_do_pastel;

-- Criando a View V_ver_bacon_e_queijo
CREATE OR REPLACE VIEW V_ver_bacon_e_queijo AS 
SELECT p.descricao, p.tamanho
FROM pasteis p
JOIN ingredientes_do_pastel idp ON idp.idPastel = p.idPastel
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
WHERE idp.idIngrediente IN (5,2)
GROUP BY p.descricao, p.tamanho;

-- Selecionando dados da View V_ver_bacon_e_queijo
SELECT * FROM V_ver_bacon_e_queijo;

-- Criando a View V_clientes_com_mais_pedidos
CREATE OR REPLACE VIEW V_clientes_com_mais_pedidos AS
SELECT c.nomeCliente, COUNT(p.idPedido) as numeroDePedidos, MONTH(p.dataPedido) as mesDoPedido
FROM clientes c
JOIN pedidos p ON c.idCliente = p.idCliente
GROUP BY c.nomeCliente, mesDoPedido
ORDER BY numeroDePedidos DESC;

-- Selecionando dados da View V_clientes_com_mais_pedidos
SELECT * FROM V_clientes_com_mais_pedidos;

-- Criando a View V_pasteis_veganos_clientes18
CREATE OR REPLACE VIEW V_pasteis_veganos_clientes18 AS
SELECT c.nomeCliente, TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) AS idade, pa.descricao, cc.nome, p.idPedido as numeroDoPedido
FROM clientes c
JOIN pedidos p
JOIN itens_pedido i ON i.idPedido = p.idPedido
JOIN pasteis pa ON pa.idPastel = i.idPastel
JOIN categorias cc ON pa.idCategoria = cc.idCategoria
JOIN clientes ON c.idCliente = p.idCliente
WHERE TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) > 18
AND cc.nome = 'Veganos'
ORDER BY numeroDoPedido;

-- Selecionando dados da View V_pasteis_veganos_clientes18
SELECT * FROM V_pasteis_veganos_clientes18;

-- Criando a View V_valor_total_pastel
CREATE OR REPLACE VIEW V_valor_total_pastel AS
SELECT 'Pastel' AS descricao, p.descricao AS detalhe, p.preco AS preco
FROM pasteis p
UNION ALL
SELECT 'Total', '', SUM(p.preco)
FROM pasteis p;

-- Selecionando dados da View V_valor_total_pastel
SELECT * FROM V_valor_total_pastel;

-- Criando a View V_pedidos_pastel_bebida
CREATE OR REPLACE VIEW V_pedidos_pastel_bebida AS
SELECT p1.idPedido
FROM pedidos p1
JOIN itens_pedido i ON p1.idPedido = i.idPedido
JOIN produtos p ON i.idProduto = p.idProduto AND p.idCategoria = 4
JOIN categorias c ON c.idCategoria = 2
GROUP BY p1.idPedido
ORDER BY p1.idPedido ASC;

-- Selecionando dados da View V_pedidos_pastel_bebida
SELECT * FROM V_pedidos_pastel_bebida;


-- Criando a View V_pasteis_mais_vendidos
CREATE OR REPLACE VIEW V_pasteis_mais_vendidos AS
SELECT pa.descricao, i.quantidade as quantidadeVendas
FROM pasteis pa
JOIN itens_pedido i ON pa.idPastel = i.idPastel
GROUP BY pa.descricao
ORDER BY quantidadeVendas DESC;

-- Selecionando dados da View V_pasteis_mais_vendidos
SELECT * FROM V_pasteis_mais_vendidos;

-- Commit para encerrar a transação
COMMIT;
