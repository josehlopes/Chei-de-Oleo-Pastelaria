CREATE DATABASE IF NOT EXISTS Chei_de_oleo_pastelaria;

USE Chei_de_oleo_pastelaria;

CREATE TABLE IF NOT EXISTS clientes (

	idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100) NOT NULL
    
    );
    
CREATE TABLE IF NOT EXISTS enderecos (

	idEndereco INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	logradouro VARCHAR(100) NOT NULL,
    numero CHAR(10) NOT NULL,
    cep VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
    idCliente INT NOT NULL,
	FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
    
    );
    
CREATE TABLE IF NOT EXISTS contatos (

	idContato INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    telefone1 VARCHAR(100) NOT NULL,
    telefone2 VARCHAR(100),
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
    
    );