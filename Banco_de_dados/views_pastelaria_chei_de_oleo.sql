START TRANSACTION;

-- Criando as views 
CREATE OR REPLACE VIEW V_dados_dos_clientes AS 
SELECT nomeCliente, cpf, logradouro, numero, complemento, telefone1, email 
FROM clientes
JOIN enderecos ON clientes.idCliente = enderecos.idCliente
JOIN contatos ON clientes.idCliente = contatos.idCliente;

SELECT * FROM V_dados_dos_clientes;
#------------------------------------------------------------
CREATE OR REPLACE VIEW V_ingredientes_do_pastel AS 
SELECT p.descricao, p.tamanho, i.nome as ingrediente
FROM pasteis p
JOIN ingredientes_do_pastel idp ON idp.idPastel = p.idPastel
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
ORDER BY descricao;

SELECT * FROM V_ingredientes_do_pastel;

#-----------------QUESTÃO 3 DO REQUISITO -----------------------------
CREATE OR REPLACE VIEW V_ver_bacon_e_queijo AS 
SELECT p.descricao, p.tamanho
FROM pasteis p
JOIN ingredientes_do_pastel idp ON idp.idPastel = p.idPastel
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
WHERE idp.idIngrediente IN (5,2)
GROUP BY p.descricao, p.tamanho;

SELECT * FROM V_ver_bacon_e_queijo;
#----------------------QUESTÃO 2 --------------------------------------
CREATE OR REPLACE VIEW V_clientes_com_mais_pedidos AS
SELECT c.nomeCliente, COUNT(p.idPedido) as numeroDePedidos, MONTH(p.dataPedido) as mesDoPedido
FROM clientes c
JOIN pedidos p ON c.idCliente = p.idCliente
GROUP BY c.nomeCliente, mesDoPedido
ORDER BY numeroDePedidos DESC;

SELECT * FROM V_clientes_com_mais_pedidos;
#-------------------------QUESTÃO 1 -----------------------------------
CREATE OR REPLACE VIEW V_pasteis_veganos_clientes18 AS
SELECT c.nomeCliente, TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) AS idade, pa.descricao, cc.nome, p.idPedido as numeroDoPedido
FROM clientes c
JOIN pedidos p
JOIN itens_pedido i ON i.idPedido = p.idPedido
JOIN pasteis pa ON pa.idPastel = i.idPastel
JOIN categorias cc ON pa.idCategoria = cc.idCategoria
WHERE TIMESTAMPDIFF(YEAR, c.dataNascimento, CURDATE()) > 18
AND cc.nome = 'Veganos';

SELECT * FROM V_pasteis_veganos_clientes18;
#-------------------------QUESTÃO 4 -----------------------------------

CREATE OR REPLACE VIEW V_valor_total_pastel AS
SELECT 'Pastel' AS descricao, p.descricao AS detalhe, p.preco AS preco
FROM pasteis p
UNION ALL /*UNION ALL combina o resultado de duas consultas SELECT em um único conjunto de resultados*/
SELECT 'Total', '', SUM(p.preco)
FROM pasteis p;


SELECT * FROM V_valor_total_pastel;

#-------------------------QUESTÃO 5 -----------------------------------

#temos que inserir ainda bebidas e pedidos com bebidas : 

CREATE OR REPLACE VIEW V_pedidos_pastel_bebida AS
SELECT p1.idPedido
FROM pedidos p1
WHERE EXISTS (
    SELECT 1 FROM itens_pedido i1
    JOIN produtos prod1 ON i1.idProduto = prod1.idProduto
    WHERE i1.idPedido = p1.idPedido AND prod1.idCategoria = 4
) AND EXISTS (
    SELECT 1 FROM itens_pedido i2
    JOIN produtos prod2 ON i2.idProduto = prod2.idProduto
    WHERE i2.idPedido = p1.idPedido AND prod2.idCategoria = 2 
);
SELECT * FROM V_pedidos_pastel_bebida;

#-------------------------QUESTÃO 6 -----------------------------------

#temos que inserir + pedidos, pq aqui ta mostrando so 1 ainda. 

CREATE OR REPLACE VIEW V_pasteis_mais_vendidos AS
SELECT pa.descricao, COUNT(*) AS quantidade_vendas
FROM pasteis pa
JOIN itens_pedido i ON pa.idPastel = i.idPastel
GROUP BY pa.descricao
ORDER BY quantidade_vendas ASC; #asc ordem crecente 

SELECT * FROM V_pasteis_mais_vendidos;




COMMIT;
