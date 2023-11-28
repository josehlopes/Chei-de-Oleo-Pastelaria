DELIMITER $$

CREATE OR REPLACE TRIGGER TR_insere_ingredientes
AFTER INSERT ON produtos
FOR EACH ROW
BEGIN    
    DECLARE idPastelNovo INT;
    SELECT idPastel INTO idPastelNovo FROM pasteis WHERE descricao = NEW.descricao AND tamanho = NEW.tamanho AND preco = NEW.preco;
	#TESTE DA TRIGGER
    INSERT INTO ingredientes_do_pastel (idPastel, idIngrediente)
    VALUES (idPastelNovo, 3); -- Substitua 1 pelo ID do ingrediente desejado
	#VALUES: REPETIR ID DO INGREDIENTE PARA idPastelNovo
END$$

DELIMITER ;


SELECT 
    *
FROM
    V_ingredientes_do_pastel;
#---------------------------------------------------------------------
DELIMITER $$

#Registrar os Inserts feitos na tabela clientes
CREATE OR REPLACE TRIGGER TR_cliente_inserido
AFTER INSERT ON clientes
FOR EACH ROW
    INSERT INTO log (usuario, dataLog, operacao)
    VALUES (USER(), NOW(), 'INSERT');
$$
DELIMITER ;

#TESTE DA TRIGGER
INSERT INTO clientes (nomeCliente, nomePreferido, cpf, dataNascimento)
VALUES ('Kauã Tempestade', 'Kauã', '12312312312', '1990-05-25');

SELECT 
    *
FROM
    log
#---------------------------------------------------------------------
DELIMITER $$

CREATE OR REPLACE TRIGGER TR_preco_alterado
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.precoBase <> NEW.precoBase THEN
        -- Lógica a ser executada se a coluna preco for alterada
        INSERT INTO log_preco (idProduto, preco_antigo, preco_novo, dataLog)
        VALUES (OLD.idProduto, OLD.precoBase, NEW.precoBase, NOW());
    END IF;
END$$

DELIMITER ;   

#TESTE DA TRIGGER
UPDATE produtos
SET precoBase = precoBase * 1.1
WHERE idProduto = 1;

SELECT * FROM log_preco;
#---------------------------------------------------------------------
DELIMITER $$

CREATE OR REPLACE TRIGGER TR_atualizacao_status_pedido
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    DECLARE total_itens INT;
    
        SELECT COUNT(quantidade) INTO total_itens FROM itens_pedido WHERE idPedido = NEW.idPedido;
        
        IF total_itens >= 3 THEN
        UPDATE pedidos SET idStatus = (SELECT idStatus FROM status_pedidos WHERE descricao = 'C') WHERE idPedido = NEW.idPedido;
        
    ELSE
        UPDATE pedidos SET idStatus = (SELECT idStatus FROM status_pedidos WHERE descricao = 'EA') WHERE idPedido = NEW.idPedido;
    END IF;
END$$

DELIMITER ;

#TESTE DA TRIGGER
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (5, 1, 1, 'Novo Teste', '2023-01-10 10:30:00');

INSERT INTO itens_pedido (idPedido, idProduto, quantidade) 
VALUES 
    (35, 1, 2),
    (35, 4, 3),  
    (35, 3, 1);  

SELECT * FROM pedidos;
SELECT * FROM itens_pedido;
SELECT * FROM V_informacoes_dos_pedidos;

#---------------------------------------------------------------------
DELIMITER $$

CREATE OR REPLACE TRIGGER TR_atualizacao_tamanho_pastel
BEFORE UPDATE ON pasteis
FOR EACH ROW
BEGIN
    IF OLD.tamanho <> NEW.tamanho THEN
        SET NEW.preco = NEW.preco * 2;
    END IF;
END$$

DELIMITER ;

#TESTE DA TRIGGER
SELECT * FROM pasteis;

UPDATE pasteis
SET tamanho = 'G'
WHERE idPastel = 3;

SELECT * FROM pasteis;