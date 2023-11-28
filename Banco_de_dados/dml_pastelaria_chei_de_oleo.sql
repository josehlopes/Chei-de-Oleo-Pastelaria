INSERT INTO clientes (nomeCliente, nomePreferido, cpf, dataNascimento)
VALUES 
    ('Alice Ventania', 'Alice', '12345678909', '1992-04-05'),
    ('Bernardo Trovão', 'Bernardo', '98765432101', '1987-10-15'),
    ('Clara Estrela', 'Clara', '23456789012', '1995-12-20'),
    ('Davi Sereno', 'Davi', '87654321098', '1980-07-08'),
    ('Eva Brisa', 'Eva', '34567890123', '2007-02-28'),
    ('Fábio Sombra', 'Fábio', '78901234567', '1983-11-11'),
    ('Giovana Lua', 'Giovana', '45678901234', '1991-09-03'),
    ('Henrique Aurora', 'Henrique', '01234567890', '1986-06-22'),
    ('Isabela Chuva', 'Isabela', '56789012345', '2007-03-12'),
    ('João Trovador', 'João', '21098765432', '1989-08-17');
    
-- Visualização dos Clientes
SELECT * FROM clientes;

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
    
-- Visualização dos Endereços
SELECT * FROM enderecos;

INSERT INTO contatos (telefone1, telefone2, email, idCliente)
VALUES
    ('(11) 1234-5678', '(11) 9876-5432', 'cliente1_pastel_lover@email.com', 1),
    ('(21) 4567-8901', '(21) 9876-5432', 'amante_de_pastel_cliente2@email.com', 2),
    ('(31) 9876-5432', '(31) 1234-5678', 'cliente3_pastelmania@email.com', 3),
    ('(51) 9876-5432', '(51) 1234-5678', 'delicias_de_pastel_cliente4@email.com', 4),
    ('(71) 9876-5432', '(71) 1234-5678', 'cliente5_sabordopastel@email.com', 5),
    ('(41) 9876-5432', NULL,'cliente6_pastelaroma@email.com', 6),
    ('(81) 9876-5432', NULL,'cliente7_pastelcremoso@email.com', 7),
    ('(85) 9876-5432', NULL,'cliente8_saboresdivinos@email.com', 8),
    ('(48) 9876-5432', NULL,'cliente9_pastelartesanal@email.com', 9),
    ('(61) 9876-5432', NULL,'cliente10_amantedomassapequena@email.com', 10);
    
-- Visualização dos Contatos
SELECT * FROM contatos;

-- Inserção de categorias

INSERT INTO categorias (nome) 
VALUES
('Veganos'),
('Bebidas'),
('Ingredientes'),
('Lanches'),
('Comum'),
('Pasteis');
-- Inserção de Produtos

INSERT INTO produtos (nomeProduto, precoBase, idCategoria) 
VALUES
('Coxinha', 4.50, 4),
('Empada', 3.75, 4),
('Kibe', 5.25, 4),
('Croissant', 6.50, 4);

-- Inserção de bebidas

INSERT INTO produtos (nomeProduto, precoBase, idCategoria) 
VALUES
('Refrigerante', 4.00, 2),
('Suco Natural', 5.50, 2);

SELECT * FROM categorias;

SELECT * FROM produtos;

-- Inserção de ingredientes

INSERT INTO ingredientes (nome)
	VALUES
('Frango'),
('Queijo'),
('Tomate'),
('Cebola'),
('Bacon'),
('Carne');

SELECT * FROM ingredientes;

INSERT INTO tamanhos (descricao)
	VALUES
		('Grande'),
        ('Médio'),
        ('Pequeno'),
        ('300ml'),
        ('500ml'),
        ('1L');

SELECT * FROM tamanhos;

INSERT INTO status_pedidos (descricao) 
VALUES 
    ('AP'), -- Aguardando Pagamento
    ('C'),  -- Concluído
    ('EA'), -- Em Andamento
    ('SPE');-- Saiu para Entrega
    
SELECT * FROM status_pedidos;

-- Inserção de Formas de Pagamento
INSERT INTO formas_pagamentos (tipoPagamento) 
VALUES 
    ('D'),  -- Dinheiro
    ('CC'), -- Cartão de Crédito
    ('CD'), -- Cartão de Débito
    ('PIX');-- PIX
    
SELECT * FROM formas_pagamentos;

INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs)
VALUES
    (1, 20.50, '2023-01-10 15:30:00', 1, 2, 'Pedido Janeiro'),
    (2, 15.75, '2023-02-05 18:45:00', 2, 3, 'Pedido Fevereiro'),
    (3, 30.00, '2023-03-12 12:15:00', 3, 1, 'Pedido Março'),
    (4, 25.99, '2023-04-20 20:00:00', 4, 4, 'Pedido Abril'),
    (5, 18.50, '2023-05-08 14:30:00', 1, 2, 'Pedido Maio'),
    (6, 22.75, '2023-06-17 17:45:00', 2, 3, 'Pedido Junho'),
    (7, 35.00, '2023-07-25 11:15:00', 3, 1, 'Pedido Julho'),
    (8, 29.99, '2023-08-03 19:30:00', 4, 4, 'Pedido Agosto'),
    (9, 21.50, '2023-09-19 13:00:00', 1, 2, 'Pedido Setembro'),
    (10, 27.75, '2023-10-28 16:45:00', 2, 3, 'Pedido Outubro'),
    (1, 19.99, '2023-11-05 14:30:00', 1, 2, 'Pedido Novembro'),
    (2, 14.50, '2023-12-12 17:15:00', 2, 3, 'Pedido Dezembro'),
    (3, 28.75, '2023-05-22 11:45:00', 3, 1, 'Pedido Maio (Repetido)'),
    (4, 24.00, '2023-08-28 19:00:00', 4, 4, 'Pedido Agosto (Repetido)'),
    (5, 17.50, '2023-09-15 13:30:00', 1, 2, 'Pedido Setembro (Repetido)');
    
SELECT * FROM pedidos;

-- Inserção de 3 pastéis diretamente em produtos

INSERT INTO produtos (nomeProduto, precoBase, idCategoria)
VALUES

    ('Pastel de Queijo', 5.99, 6),
    ('Pastel de Carne', 6.99, 6),
    ('Pastel Vegano', 7.50, 1);
    
SELECT * FROM produtos;

INSERT INTO ingredientes_do_pastel (idProduto, idIngrediente)
VALUES
    ((SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel de Queijo'), 2); -- Queijo

-- Atualização do Pastel de Carne
INSERT INTO ingredientes_do_pastel (idProduto, idIngrediente)
VALUES
    ((SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel de Carne'), 5); -- Carne

-- Atualização do Pastel Vegano
INSERT INTO ingredientes_do_pastel (idProduto, idIngrediente)
VALUES
    ((SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel Vegano'), 3), -- Tomate
    ((SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel Vegano'), 4); -- Cebola

SELECT * FROM ingredientes_do_pastel;

INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs)
VALUES (1, 11.98, '2023-11-25 12:30:00', 1, 2, 'Pedido de Pastel de Queijo para Alice');

INSERT INTO itens_pedido (idPedido, idProduto, quantidade, idTamanho)
VALUES ((SELECT idPedido FROM pedidos WHERE obs = 'Pedido de Pastel de Queijo para Alice'), (SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel de Queijo'), 2, 3);

INSERT INTO pedidos (idCliente, valor, dataPedido, idStatus, idPagamento, obs)
VALUES (1, 7.50, '2023-12-10 15:45:00', 1, 2, 'Pedido de Pastel Vegano para Alice');

INSERT INTO itens_pedido (idPedido, idProduto, quantidade, idTamanho)
VALUES ((SELECT idPedido FROM pedidos WHERE obs = 'Pedido de Pastel Vegano para Alice'), (SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel Vegano'), 1, 2);

INSERT INTO itens_pedido (idPedido, idProduto, quantidade, idTamanho)
VALUES
    (17, (SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel Vegano'), 3, 1),
    (17, (SELECT idProduto FROM produtos WHERE nomeProduto = 'Pastel Vegano'), 2, 2);

SELECT * FROM itens_pedido WHERE idPedido = 16;



