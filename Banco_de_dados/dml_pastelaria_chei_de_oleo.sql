-- Inserção de Clientes   

INSERT INTO clientes (nomeCliente, nomePreferido, cpf, dataNascimento)
VALUES 
    ('Alice Ventania', 'Alice', '12345678909', '1992-04-05'),
    ('Bernardo Trovão', 'Bernardo', '98765432101', '1987-10-15'),
    ('Clara Estrela', 'Clara', '23456789012', '1995-12-20'),
    ('Davi Sereno', 'Davi', '87654321098', '1980-07-08'),
    ('Eva Brisa', 'Eva', '34567890123', '1998-02-28'),
    ('Fábio Sombra', 'Fábio', '78901234567', '1983-11-11'),
    ('Giovana Lua', 'Giovana', '45678901234', '1991-09-03'),
    ('Henrique Aurora', 'Henrique', '01234567890', '1986-06-22'),
    ('Isabela Chuva', 'Isabela', '56789012345', '1994-03-12'),
    ('João Trovador', 'João', '21098765432', '1989-08-17');
    
    SELECT * FROM clientes;
    
-- Inserção de Endereços    

INSERT INTO enderecos (logradouro, numero, cep, complemento, estado, cidade, bairro, idCliente)
VALUES
    ('Rua A', '123', '12345-678', 'Apt 101', 'SP', 'São Paulo', 'Centro', 1),
    ('Avenida B', '456', '98765-432', 'Casa', 'RJ', 'Rio de Janeiro', 'Copacabana', 2),
    ('Rua C', '789', '54321-876', 'Bloco D', 'MG', 'Belo Horizonte', 'Savassi', 3),
    ('Avenida D', '321', '87654-321', 'Loja 5', 'RS', 'Porto Alegre', 'Moinhos de Vento', 4),
    ('Rua E', '654', '23456-789', 'Sala 3', 'BA', 'Salvador', 'Barra', 5),
    ('Avenida F', '987', '87654-321', 'Apartamento 202', 'PR', 'Curitiba', 'Batel', 6),
    ('Rua G', '210', '34567-890', 'Andar 15', 'PE', 'Recife', 'Boa Viagem', 7),
    ('Avenida H', '543', '98765-432', 'Casa 2', 'CE', 'Fortaleza', 'Aldeota', 8),
    ('Rua I', '876', '12345-678', 'Bloco A', 'SC', 'Florianópolis', 'Centro', 9),
    ('Avenida J', '109', '23456-789', 'Loja 1', 'DF', 'Brasília', 'Asa Sul', 10);
    
-- Inserção de Contatos

INSERT INTO contatos (telefone1, telefone2, email, idCliente)
VALUES
    ('(11) 1234-5678', '(11) 9876-5432', 'cliente1_pastel_lover@email.com', 1),
    ('(21) 4567-8901', '(21) 9876-5432', 'amante_de_pastel_cliente2@email.com', 2),
    ('(31) 9876-5432', '(31) 1234-5678', 'cliente3_pastelmania@email.com', 3),
    ('(51) 9876-5432', '(51) 1234-5678', 'delicias_de_pastel_cliente4@email.com', 4),
    ('(71) 9876-5432', '(71) 1234-5678', 'cliente5_sabordopastel@email.com', 5);

INSERT INTO contatos (telefone1, email, idCliente)
VALUES
    ('(41) 9876-5432', 'cliente6_pastelaroma@email.com', 6),
    ('(81) 9876-5432', 'cliente7_pastelcremoso@email.com', 7),
    ('(85) 9876-5432', 'cliente8_saboresdivinos@email.com', 8),
    ('(48) 9876-5432', 'cliente9_pastelartesanal@email.com', 9),
    ('(61) 9876-5432', 'cliente10_amantedomassapequena@email.com', 10);
    
    SELECT * FROM contatos;


