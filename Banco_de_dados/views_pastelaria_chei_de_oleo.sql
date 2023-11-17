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


CREATE OR REPLACE VIEW V_ver_bacon_e_queijo AS 
SELECT p.descricao, p.tamanho
FROM pasteis p
JOIN ingredientes_do_pastel idp ON idp.idPastel = p.idPastel
JOIN ingredientes i ON i.idIngrediente = idp.idIngrediente
WHERE idp.idIngrediente IN (5,2)
GROUP BY descricao;

SELECT * FROM V_ver_bacon_e_queijo;
COMMIT;