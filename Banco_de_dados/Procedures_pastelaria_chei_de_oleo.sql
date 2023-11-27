-- /////////////////////////////////PROCEDURE 1 ////////////////////////////////////////// --
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


-- ///////////////////////////////////////////////////////////////////////////////PROCEDURE 2 ////////////////////////////////////////// --
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

SELECT * FROM V_dados_dos_clientes;
#----------------------------------------
DELIMITER $$
-- //////////////////////////////////////////////////////////////////////PROCEDURE 2 ////////////////////////////////////////// --
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

SELECT * FROM produtos;
#----------------------------------------
#FALTA INSERIR OS INGREDIENTES DO PASTEL NESSA PROCEDURE OU FAZER UM TRIGGER QUE O FAÇA

DELIMITER $$
-- ///////////////////////////////////////////////////////////////////////PROCEDURE 3 ////////////////////////////////////////// --
CREATE OR REPLACE PROCEDURE P_cadastrar_pastel (
    IN p_descricao VARCHAR(100),
    IN p_tamanho CHAR(1),
    IN p_preco DECIMAL(10, 2),
    IN p_idProduto INT,
    IN p_idCategoria INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
		START TRANSACTION;

		INSERT INTO pasteis (descricao, tamanho, preco, idProduto, idCategoria)
        VALUES (p_descricao, p_tamanho, p_preco, p_idProduto, p_idCategoria);
        
		COMMIT;
END$$

DELIMITER ;


CALL P_cadastrar_pastel(
    'Pastel de Tomate 5',
    'M',
    10.50,
    4,
    4  
);

SELECT * FROM pasteis;
-- ///////////////////////////////////////////////////////////////////////PROCEDURE 4 ////////////////////////////////////////// --
    -- Atualiza o preço de um produto
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_atualiza_preco_produto(IN p_nomeProduto VARCHAR(100), IN p_novoPreco DECIMAL(10, 2))
BEGIN
  UPDATE produtos
  SET precoBase = p_novoPreco
  WHERE nomeProduto = p_nomeProduto;
END$$
DELIMITER ;

-- Desativa o Modo de Atualização Segura
SET SQL_SAFE_UPDATES = 0;

-- Chama o procedimento para atualizar o preço do produto 'Coxinha' para 10.00
CALL P_atualiza_preco_produto('Coxinha', 10.00);

-- Reativa o Modo de Atualização Segura
SET SQL_SAFE_UPDATES = 1;

-- Testa se o procedimento funcionou corretamente
SELECT * FROM produtos WHERE nomeProduto = 'Coxinha';


-- ///////////////////////////////////////////////////////////////////////PROCEDURE 5 ////////////////////////////////////////// --

-- Insere um novo pedido para um cliente
DELIMITER $$
CREATE PROCEDURE P_insere_pedido_cliente(IN p_nomeCliente VARCHAR(100), IN p_idStatus INT, IN p_idPagamento INT, IN p_obs VARCHAR(100))
BEGIN
  DECLARE codigo_cliente INT;

  SELECT idCliente INTO codigo_cliente FROM clientes WHERE nomeCliente = p_nomeCliente;

  INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs)
  VALUES (codigo_cliente, p_idStatus, p_idPagamento, p_obs);
END$$
DELIMITER ;

SELECT * FROM pedidos;
-- Chama o procedimento
CALL P_insere_pedido_cliente('Bernardo Trovão', 2, 1, 'TESTE');
CALL P_insere_pedido_cliente('Bernardo Trovão', 2, 1, 'TESTE2');

-- Verifica se o procedimento funcionou corretamente
SELECT * FROM pedidos WHERE idCliente = (SELECT idCliente FROM clientes WHERE nomeCliente = 'Bernardo Trovão');


-- ///////////////////////////////////////////////////////////////////////PROCEDURE 5 ////////////////////////////////////////// --

-- Insere um novo ingrediente e atualiza o preço de todos os produtos da mesma categoria --
-- temho que testar -- 
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_insere_ingrediente_atualiza_preco(IN p_nomeIngrediente VARCHAR(100), IN p_preco DECIMAL(10, 2), IN p_idCategoria INT)
BEGIN
  INSERT INTO ingredientes (nome, preco, idCategoria)
  VALUES (p_nomeIngrediente, p_preco, p_idCategoria);

  UPDATE produtos
  SET precoBase = precoBase + p_preco
  WHERE idCategoria = p_idCategoria;
END$$
DELIMITER ;
-- Adiciona o procedimento
CALL P_insere_ingrediente_atualiza_preco('Tomate', 2.5, 3);
SELECT * FROM ingredientes;