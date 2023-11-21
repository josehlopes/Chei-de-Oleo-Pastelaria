/*DELIMITER $$

START TRANSACTION;

	DECLARE exit HANDLER FOR SQLEXCEPTION SELECT 'Erro ao inserir!' as MESSAGE
		BEGIN
			ROLLBACK;
		END;*/
    
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

-- Inserção de categorias

INSERT INTO categorias (nome) 
VALUES
('Veganos'),
('Bebidas'),
('Ingredientes'),
('Lanches'),
('Comum');


-- Inserção de Produtos

-- Inserção de lanches

INSERT INTO produtos (nomeProduto, preco, idCategoria) 
VALUES
('Coxinha', 4.50, 4),
('Empada', 3.75, 4),
('Kibe', 5.25, 4),
('Pastel', 4.99, 4),
('Croissant', 6.50, 4);

-- Inserção de bebidas

INSERT INTO produtos (nomeProduto, preco, idCategoria) 
VALUES
('Refrigerante', 4.00, 2),
('Suco Natural', 5.50, 2);

SELECT * FROM categorias;


SELECT * FROM produtos;

-- Inserção de ingredientes

INSERT INTO ingredientes (nome, idCategoria)
 VALUES
('Frango', 3),
('Queijo', 3),
('Tomate', 3),
('Cebola', 3),
('Bacon', 3),
('Carne', 3);

SELECT * FROM ingredientes;

-- Inserção de Pasteis

INSERT INTO pasteis (descricao, tamanho, preco, idCategoria)
VALUES 

('Pastel de tomate', 'P', 3.00, 1),
('Pastel de frango', 'G', 8.00, 5),
('Pastel de cebola', 'P', 3.00, 1),
('Pastel de queijo', 'M', 6.00, 5),
('Pastel de cebola com tomate', 'M', 6.00, 1),
('Pastel de bacon', 'P', 4.00, 5),
('Pastel de bacon com queijo', 'G', 8.00, 5),
('Pastel de frango com queijo', 'M', 6.00, 5),
('Pastel de carne com queijo', 'P', 4.00, 5);

SELECT * FROM pasteis;

-- Lista de ingredientes
INSERT INTO ingredientes_do_pastel (idPastel, idIngrediente)
VALUES
(5, 4),
(5, 3),
(3, 4),
(4, 2),
(1, 3),
(6, 5),
(7, 5),
(7, 2),
(8, 5),
(8, 1),
(9, 2),
(9, 6);

SELECT * FROM ingredientes_do_pastel;


-- Inserção de Status de Pedidos

INSERT INTO status_pedidos (descricao) 
VALUES 
    ('AP'), -- Aguardando Pagamento
    ('C'),  -- Concluído
    ('EA'), -- Em Andamento
    ('SPE');-- Saiu para Entrega

-- Inserção de Formas de Pagamento
INSERT INTO formas_pagamentos (tipoPagamento) 
VALUES 
    ('D'),  -- Dinheiro
    ('CC'), -- Cartão de Crédito
    ('CD'), -- Cartão de Débito
    ('PIX');-- PIX

-- Inserção de Pedidos
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs) 
VALUES 
    (1, 1, 1, 'Pedido da Alice, Aguardando Pagamento'),
    (2, 3, 2, 'Pedido do Bernardo, Em Andamento'),
    (3, 2, 4, 'Pedido da Clara, Concluído'),
    (4, 1, 3, 'Pedido do Davi, Aguardando Pagamento'),
    (5, 4, 4, 'Pedido da Eva, Saiu para Entrega');

-- Inserção de Itens nos Pedidos
INSERT INTO itens_pedido (idPedido, idProduto, quantidade) 
VALUES 
    (1, 1, 2), -- 2 Coxinhas para o Pedido da Alice
    (1, 4, 3), -- 3 Pasteis para o Pedido da Alice
    (2, 3, 1), -- 1 Kibe para o Pedido do Bernardo
    (3, 5, 2), -- 2 Croissants para o Pedido da Clara
    (4, 2, 3), -- 3 Empadas para o Pedido do Davi
    (5, 4, 4); -- 4 Pasteis para o Pedido da Eva
    
-- Pedido com pastel específico
INSERT INTO itens_pedido (idPedido, idProduto, idPastel, quantidade) 
VALUES 
    (1, 4, 3, 3),
    (5, 4, 1, 4); 

-- Inserção de Pedidos em Meses Diferentes com Horas
-- Pedido para Janeiro

INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (1, 1, 1, 'Pedido da Alice, Aguardando Pagamento', '2023-01-10 10:30:00'),
    (2, 3, 2, 'Pedido do Bernardo, Em Andamento', '2023-01-15 12:45:00');

-- Pedido para Fevereiro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (3, 2, 4, 'Pedido da Clara, Concluído', '2023-02-05 14:20:00'),
    (4, 1, 3, 'Pedido do Davi, Aguardando Pagamento', '2023-02-20 16:55:00');

-- Pedido para Março
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (5, 4, 4, 'Pedido da Eva, Saiu para Entrega', '2023-03-08 18:30:00');
    
-- Pedido para Abril
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (6, 3, 1, 'Pedido do Fábio, Em Andamento', '2023-04-12 10:30:00'),
    (7, 2, 2, 'Pedido da Giovana, Concluído', '2023-04-18 12:45:00');

-- Pedido para Maio
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (8, 1, 4, 'Pedido do Henrique, Aguardando Pagamento', '2023-05-02 14:20:00'),
    (9, 4, 3, 'Pedido da Isabela, Saiu para Entrega', '2023-05-15 16:55:00');

-- Pedido para Junho
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (10, 3, 1, 'Pedido do João, Em Andamento', '2023-06-08 18:30:00');

-- Pedido para Julho
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (1, 2, 2, 'Segundo Pedido da Alice, Concluído', '2023-07-20 10:30:00');

-- Pedido para Agosto
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (2, 4, 4, 'Segundo Pedido do Bernardo, Aguardando Pagamento', '2023-08-05 12:45:00');

-- Pedido para Setembro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (3, 1, 3, 'Segundo Pedido da Clara, Saiu para Entrega', '2023-09-18 14:20:00');

-- Pedido para Outubro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (4, 3, 1, 'Segundo Pedido do Davi, Em Andamento', '2023-10-02 16:55:00');

-- Pedido para Novembro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (5, 2, 2, 'Segundo Pedido da Eva, Concluído', '2023-11-15 18:30:00');

-- Pedido para Dezembro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (6, 4, 4, 'Segundo Pedido do Fábio, Aguardando Pagamento', '2023-12-08 10:30:00');
    
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (1, 3, 3, 'Terceiro Pedido da Alice, Em Andamento', '2023-01-25 15:30:00'),
    (1, 2, 4, 'Quarto Pedido da Alice, Saiu para Entrega', '2023-01-28 11:45:00'),
    (1, 1, 2, 'Quinto Pedido da Alice, Concluído', '2023-01-30 17:20:00');
    
-- Inserção de Pedidos de Pasteis Veganos

-- Pedido para Janeiro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (1, 1, 1, 'Pedido da Alice, Aguardando Pagamento', '2023-01-10 10:30:00'),
    (2, 3, 2, 'Pedido do Bernardo, Em Andamento', '2023-01-15 12:45:00'),
    (3, 2, 4, 'Pedido da Clara, Concluído', '2023-01-20 14:20:00');

-- Itens do Pedido de Pasteis Veganos para Janeiro
INSERT INTO itens_pedido (idPedido, idProduto, quantidade) 
VALUES 
    (1, 4, 3), -- 3 Pasteis Veganos para o Pedido da Alice
    (2, 4, 2), -- 2 Pasteis Veganos para o Pedido do Bernardo
    (3, 4, 4); -- 4 Pasteis Veganos para o Pedido da Clara

-- Pedido para Fevereiro
INSERT INTO pedidos (idCliente, idStatus, idPagamento, obs, dataPedido) 
VALUES 
    (4, 1, 3, 'Pedido do Davi, Aguardando Pagamento', '2023-02-05 16:55:00'),
    (5, 4, 4, 'Pedido da Eva, Saiu para Entrega', '2023-02-10 18:30:00');

-- Itens do Pedido de Pasteis Veganos para Fevereiro
INSERT INTO itens_pedido (idPedido, idProduto, quantidade) 
VALUES 
    (4, 4, 3), -- 3 Pasteis Veganos para o Pedido do Davi
    (5, 4, 2); -- 2 Pasteis Veganos para o Pedido da Eva;

    
-- Visualização dos Pedidos
SELECT * FROM pedidos;

-- Visualização dos Itens nos Pedidos
SELECT * FROM itens_pedido;


/*COMMIT;
$$
DELIMITER ;*/