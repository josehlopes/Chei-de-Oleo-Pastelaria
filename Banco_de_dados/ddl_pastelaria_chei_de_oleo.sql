-- Início da transação e definição do delimitador
DELIMITER $$

-- Criação do banco de dados se não existir e seleção do mesmo
CREATE DATABASE IF NOT EXISTS Chei_de_oleo_pastelaria;
USE Chei_de_oleo_pastelaria;

-- Criação da tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100) NOT NULL,
    nomePreferido VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    dataNascimento DATE
);

-- Criação da tabela de endereços
CREATE TABLE IF NOT EXISTS enderecos (
    idEndereco INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero CHAR(10) NOT NULL,
    cep VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
    estado VARCHAR(100),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
);

-- Criação da tabela de contatos
CREATE TABLE IF NOT EXISTS contatos (
    idContato INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    telefone1 VARCHAR(100) NOT NULL,
    telefone2 VARCHAR(100),
    email VARCHAR(40) UNIQUE,
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
);

-- Criação da tabela de categorias
CREATE TABLE IF NOT EXISTS categorias (
    idCategoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL UNIQUE
);

-- Criação da tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
    idProduto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeProduto VARCHAR(100),
    preco DECIMAL(10, 2) NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES categorias (idCategoria)
);

-- Criação da tabela de ingredientes
CREATE TABLE IF NOT EXISTS ingredientes (
    idIngrediente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES categorias (idCategoria)
);

-- Criação da tabela de pasteis
CREATE TABLE IF NOT EXISTS pasteis (
    idPastel INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100),
    tamanho ENUM('P','M','G') NOT NULL DEFAULT 'P',
    preco DECIMAL(10, 2) NOT NULL,
    idProduto INT DEFAULT 4,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES categorias (idCategoria),
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

-- Criação da tabela de ingredientes do pastel
CREATE TABLE IF NOT EXISTS ingredientes_do_pastel (
    idIdp INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idPastel INT NOT NULL,
    idIngrediente INT NOT NULL,
    FOREIGN KEY (idPastel) REFERENCES pasteis (idPastel),
    FOREIGN KEY (idIngrediente) REFERENCES ingredientes (idIngrediente)
);

-- Criação da tabela de status de pedidos
CREATE TABLE IF NOT EXISTS status_pedidos (
    idStatus INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao ENUM('AP','C','EA','SPE') -- AP = AGUARDANDO PAGAMENTO, C = CONCLUÍDO, EA = EM ANDAMENTO, SPE = SAIU PARA ENTREGA
);

-- Criação da tabela de formas de pagamento
CREATE TABLE IF NOT EXISTS formas_pagamentos (
    idPagamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipoPagamento ENUM('D','CC','CD','PIX') NOT NULL DEFAULT 'D'
);

-- Criação da tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    idPedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idCliente INT NOT NULL,
    dataPedido DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    idStatus INT NOT NULL,
    idPagamento INT NOT NULL,
    obs VARCHAR(100),
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente),
    FOREIGN KEY (idStatus) REFERENCES status_pedidos (idStatus),
    FOREIGN KEY (idPagamento) REFERENCES formas_pagamentos (idPagamento)
);

-- Criação da tabela de itens do pedido
CREATE TABLE IF NOT EXISTS itens_pedido (
    idDetalhe INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido),
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

-- Adição da coluna idIngrediente na tabela itens_pedido
ALTER TABLE itens_pedido
ADD COLUMN idIngrediente INT,
ADD FOREIGN KEY (idIngrediente) REFERENCES ingredientes (idIngrediente);

-- Adição da coluna idPastel na tabela itens_pedido
ALTER TABLE itens_pedido
ADD COLUMN idPastel INT,
ADD FOREIGN KEY (idPastel) REFERENCES pasteis (idPastel);

-- Fim da transação e reset do delimitador
COMMIT;
$$

DELIMITER ;
