#Proc1
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_cadastrar_cliente (
    IN p_nomeCliente VARCHAR(100),
    IN p_nomePreferido VARCHAR(100),
    IN p_cpf CHAR(11),
    IN p_dataNascimento DATE,
    IN p_logradouro VARCHAR(100),
    IN p_numero CHAR(10),
    IN p_cep VARCHAR(100),
    IN p_complemento VARCHAR(100),
    IN p_estado VARCHAR(100),
    IN p_cidade VARCHAR(100),
    IN p_bairro VARCHAR(100),
    IN p_telefone1 VARCHAR(100),
    IN p_telefone2 VARCHAR(100),
    IN p_email VARCHAR(40)
)
BEGIN
    DECLARE codigo_cliente INT;
    DECLARE erro_occurred BOOLEAN DEFAULT FALSE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET erro_occurred = TRUE;
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro durante o cadastro do cliente.';
    END;

    START TRANSACTION;

    INSERT INTO clientes (nomeCliente, nomePreferido, cpf, dataNascimento)
    VALUES (p_nomeCliente, p_nomePreferido, p_cpf, p_dataNascimento);
    
    SET codigo_cliente = LAST_INSERT_ID();

    INSERT INTO enderecos (logradouro, numero, cep, complemento, estado, cidade, bairro, idCliente)
    VALUES (p_logradouro, p_numero, p_cep, p_complemento, p_estado, p_cidade, p_bairro, codigo_cliente);

    INSERT INTO contatos (telefone1, telefone2, email, idCliente)
    VALUES (p_telefone1, p_telefone2, p_email, codigo_cliente);

    IF erro_occurred THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
    
END$$
DELIMITER ;

CALL P_cadastrar_cliente(
    'Maria Santana',
    'Mariazinha',
    '21609080216',
    '1985-08-20',
    'Avenida das Palmeiras',
    '789',
    '54321-876',
    'Casa 456',
    'RJ',
    'Rio de Janeiro',
    'Copacabana',
    '(71) 12345-6789',
    '(71) 99999-9999',
    'maria2022.oliveira@example.com'
);

SELECT 
    *
FROM
    V_dados_dos_clientes;
#----------------------------------------
#Proc2
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_cadastrar_produto (
    IN p_nomeProduto VARCHAR(100),
    IN p_preco DECIMAL(10, 2),
    IN p_idCategoria INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO produtos (nomeProduto, precoBase, idCategoria)
    VALUES (p_nomeProduto, p_preco, p_idCategoria);

    COMMIT;
END$$

DELIMITER ;


CALL P_cadastrar_produto(
	'Pizza',
	 50.00,
     4
);

CALL P_cadastrar_produto(
	'Hamburguer',
	 20.00,
     4
);

SELECT * FROM produtos;
#----------------------------------------
#Proc3
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_cadastrar_pastel(
    IN p_nomeProduto VARCHAR(100),
    IN p_preco DECIMAL(10, 2),
    IN p_categoria INT NOT NULL,
    IN p_ing1 INT NOT NULL,
    IN p_ing2 INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO produtos (nomeProduto, precoBase, idCategoria)
    VALUES (p_nomeProduto, p_preco, p_categoria);
    
	SET codigo_produto = LAST_INSERT_ID();
    
	INSERT INTO ingredientes_do_pastel (idProduto, idIngrediente)
    VALUES (codigo_produto, p_ing1);
    
    INSERT INTO ingredientes_do_pastel (idProduto, idIngrediente)
    VALUES (codigo_produto, p_ing2)
    
    COMMIT;
END$$

DELIMITER ;

#----------------------------------------
#Proc4
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_atualiza_preco_produto(
	IN p_nomeProduto VARCHAR(100), 
	IN p_novoPreco DECIMAL(10, 2))
		BEGIN
			UPDATE produtos
			SET precoBase = p_novoPreco
			WHERE nomeProduto = p_nomeProduto;
		END$$
        
DELIMITER ;
CALL P_atualiza_preco_produto('Coxinha', 10.00);
SELECT * FROM produtos;