-- Procedimento para o Cadastro de Clientes
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

    START TRANSACTION;

    INSERT INTO clientes (nomeCliente, nomePreferido, cpf, dataNascimento)
    VALUES (p_nomeCliente, p_nomePreferido, p_cpf, p_dataNascimento);
    
    SET codigo_cliente = LAST_INSERT_ID();

    INSERT INTO enderecos (logradouro, numero, cep, complemento, estado, cidade, bairro, idCliente)
    VALUES (p_logradouro, p_numero, p_cep, p_complemento, p_estado, p_cidade, p_bairro, codigo_cliente);

    INSERT INTO contatos (telefone1, telefone2, email, idCliente)
    VALUES (p_telefone1, p_telefone2, p_email, codigo_cliente);

    COMMIT;
    
END$$

DELIMITER ;

CALL P_cadastrar_cliente(
    'Maria Oliveira',
    'Mariazinha',
    '98765432109',
    '1985-08-20',
    'Avenida das Palmeiras',
    '789',
    '54321-876',
    'Casa 456',
    'RJ',
    'Rio de Janeiro',
    'Copacabana',
    '123456789',
    '999999999',
    'maria.oliveira@example.com'
);

SELECT * FROM V_dados_dos_clientes;
#----------------------------------------
DELIMITER $$
CREATE OR REPLACE PROCEDURE P_cadastrar_produto (
    IN p_nomeProduto VARCHAR(100),
    IN p_preco DECIMAL(10, 2),
    IN p_idCategoria INT,
)
	BEGIN
    
		DECLARE codigo_produto INT;
        
		START TRANSACTION;
		
		INSERT INTO produtos (nomeProduto, preco, idCategoria)
        VALUES (p_nomeProduto, p_preco, p_idCategoria)
