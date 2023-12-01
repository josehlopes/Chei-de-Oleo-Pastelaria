#---------------------------------------------------------------------
#TR1
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

SELECT * FROM log
#---------------------------------------------------------------------
#TR2

DELIMITER $$

CREATE OR REPLACE TRIGGER TR_preco_alterado
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.precoBase <> NEW.precoBase THEN
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
#TR3

DELIMITER $$

CREATE OR REPLACE TRIGGER TR_desconto_mes_aniversario
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
    DECLARE mesNascimento INT;

    SELECT MONTH(dataNascimento) INTO mesNascimento
    FROM clientes
    WHERE idCliente = NEW.idCliente;

    IF mesNascimento = MONTH(CURRENT_DATE) THEN
        SET NEW.valor = NEW.valor - (NEW.valor * 0.03);
    END IF;
END $$

DELIMITER ;


#TESTE DA TRIGGER
INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs)
VALUES(6, 50.00, CURRENT_TIMESTAMP(), 1 , 1 , 'Teste desconto');

INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs)
VALUES(10, 50.00, CURRENT_TIMESTAMP(), 1 , 1 , 'Teste desconto sem aniversario');

SELECT * FROM pedidos;
#---------------------------------------------------------------------
INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs) 
VALUES
    (1, 25.50, '2023-12-20 15:30:00', 1, 2, 'Pedido de Pastel Misto para Alice');
    
INSERT INTO itens_pedido (idPedido, idProduto, quantidade, idTamanho)
VALUES
	(21, 5 , 2, 4),
	(21, 1 , 2, 1);
    
SELECT * FROM pedidos;


DELIMITER $$
CREATE OR REPLACE TRIGGER TR_desconto_pastel_quarta_feira
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
    DECLARE dia_semana INT;

    SET dia_semana = DAYOFWEEK(NEW.dataPedido);

    IF dia_semana = 4 THEN
        SET NEW.valor = NEW.valor - (NEW.valor * 0.25);
    END IF;
END $$

DELIMITER ;


INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs)
VALUES (1, 00.00, '2023-11-29 16:30:00', 1, 2, 'Pedido de Pastel de Queijo para Alice quarta');

SELECT * FROM pedidos;
DROP TRIGGER TR_desconto_pastel_quarta_feira;
#---------------------------------------------------------------------
DELIMITER $$
CREATE OR REPLACE TRIGGER TR_atualizar_valor	
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    DECLARE valortotal DECIMAL;
    
    SELECT SUM(p.precoBase * ip.quantidade) INTO valortotal
    FROM produtos p
    JOIN itens_pedido ip ON p.idProduto = ip.idProduto
    WHERE ip.idPedido = NEW.idPedido
	GROUP BY ip.idPedido;
    
    
    UPDATE pedidos pr
    SET pr.valor = valortotal
    WHERE pr.idPedido = NEW.idPedido;

END $$

DELIMITER ;

INSERT INTO itens_pedido (idPedido, idProduto, quantidade, idTamanho)
VALUES
    (37, 1, 10, 3);   -- 2 Coxinhas Médias
    
SELECT * FROM pedidos
where idPedido = 37;
