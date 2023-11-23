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
