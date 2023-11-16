CREATE DATABASE IF NOT EXISTS Chei_de_oleo_pastelaria;

USE Chei_de_oleo_pastelaria;

CREATE TABLE IF NOT EXISTS clientes (

    idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100) NOT NULL,
    nomePreferido VARCHAR(100),
    cpf VARCHAR(11),
    dataNascimento DATE
    
);

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

CREATE TABLE IF NOT EXISTS contatos (
    idContato INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    telefone1 VARCHAR(100) NOT NULL,
    telefone2 VARCHAR(100),
    email VARCHAR(30),
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
);

CREATE TABLE IF NOT EXISTS produtos (
    idProduto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipoProduto VARCHAR(100),
    preco DECIMAL(10, 2) NOT NULL
    
);

CREATE TABLE IF NOT EXISTS pasteis (
    idPastel INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100),
    tamanho CHAR(1) NOT NULL DEFAULT 'P',
    preco DECIMAL(10, 2) NOT NULL,
    idProduto INT NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

CREATE TABLE IF NOT EXISTS ingredientes (
	idIngrediente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    idProduto INT NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

CREATE TABLE IF NOT EXISTS ingredientes_do_pastel (
	idIdp INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idPastel INT NOT NULL,
    idIngrediente INT NOT NULL,
    FOREIGN KEY (idPastel) REFERENCES pasteis (idPastel),
    FOREIGN KEY (idIngrediente) REFERENCES ingredientes (idIngrediente)
);

CREATE TABLE IF NOT EXISTS categorias (
	idCategoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(10) NOT NULL DEFAULT 'Comum',
    idProduto INT NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

CREATE TABLE IF NOT EXISTS status_pedidos (
	idStatus INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS pedidos (
    idPedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idCliente INT NOT NULL,
    dataPedido DATETIME NOT NULL DEFAULT (CURRENT_DATE),
    formaPagamento CHAR(1),
    idStatus INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente),
    FOREIGN KEY (idStatus) REFERENCES status_pedidos (idStatus)
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    idDetalhe INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido),
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);
