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
DELIMITER $$

CREATE OR REPLACE TRIGGER TR_categoria_pastel
AFTER INSERT ON produtos
FOR EACH ROW
BEGIN
    DECLARE verificar_categoria INT;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET verificar_categoria = NULL;

    SELECT idCategoria INTO verificar_categoria
    FROM ingredientes
    WHERE idProduto = NEW.idProduto;

    IF verificar_categoria IS NOT NULL THEN
        IF verificar_categoria = 1 THEN
			UPDATE produtos
            SET NEW.idCategoria = 7;
        ELSE
			UPDATE produtos
            SET NEW.idCategoria = 6;
        END IF;
    END IF;
    
END $$
DELIMITER ;

CALL P_cadastrar_pastel(
    'Pastel de Teste',
    4.00,
    7,
    1,
    4
);


SELECT * FROM produtos;


