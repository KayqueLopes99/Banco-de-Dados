-- =================================================================
--    SCRIPT DE CRIAÇÃO DO BANCO DE DADOS PARA LOCADORA DE JOGOS
-- =================================================================
CREATE DATABASE LocadoraDeJogos;
USE LocadoraDeJogos;

-- CRIAÇÃO DAS TABELAS
-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS cliente (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nomecliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Telefones (ligada ao Cliente)
CREATE TABLE IF NOT EXISTS telefonescliente (
    iddocliente INT NOT NULL,
    idtelefone INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (iddocliente) REFERENCES cliente(idcliente)
);

-- Tabela de Aluguéis
CREATE TABLE IF NOT EXISTS aluguel (
    idaluguel INT AUTO_INCREMENT PRIMARY KEY,
    dataaluguel DATE NOT NULL,
    valoraluguel DECIMAL(10,2) NOT NULL,
    stats VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    datadevolucaoprevista DATE NOT NULL,
    iddocliente INT NOT NULL,
    FOREIGN KEY (iddocliente) REFERENCES cliente(idcliente)
);

-- Tabela de Compras
CREATE TABLE IF NOT EXISTS compra (
    idcompra INT AUTO_INCREMENT PRIMARY KEY,
    valortotal DECIMAL(10,2) NOT NULL,
    datacompra DATE NOT NULL DEFAULT (CURRENT_DATE),
    observacoes TEXT NOT NULL,
    iddocliente INT NOT NULL,
    FOREIGN KEY (iddocliente) REFERENCES cliente(idcliente)
);


-- Tabela de Carrinho
CREATE TABLE IF NOT EXISTS carrinho (
    idcarrinho INT AUTO_INCREMENT PRIMARY KEY,
    subtotal DECIMAL(10,2) NOT NULL,
    tipooperacao ENUM('Compra', 'Aluguel') NOT NULL,
    iddacompra INT, 
    iddoaluguel INT, 
    FOREIGN KEY (iddacompra) REFERENCES compra(idcompra),
    FOREIGN KEY (iddoaluguel) REFERENCES aluguel(idaluguel)
);

-- Tabela de Publicadores
CREATE TABLE IF NOT EXISTS publicador (
    idpublicador INT AUTO_INCREMENT PRIMARY KEY,
    nomepublicador VARCHAR(100) NOT NULL
);

-- Tabela de Jogos
CREATE TABLE IF NOT EXISTS jogos (
    idjogo INT AUTO_INCREMENT PRIMARY KEY,
    nomejogo VARCHAR(100) NOT NULL,
    anopublicacao INT NOT NULL,
    precounidade DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    descricao TEXT NOT NULL,
    iddopublicador INT NOT NULL,
    FOREIGN KEY (iddopublicador) REFERENCES publicador(idpublicador)
    
);

-- Tabela Associativa para ligar Jogos e carrinho 
CREATE TABLE IF NOT EXISTS ItensCarrinho (
    iditemcarrinho INT AUTO_INCREMENT PRIMARY KEY,
    iddocarrinho INT NOT NULL,
    iddojogo INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    FOREIGN KEY (iddocarrinho) REFERENCES carrinho(idcarrinho),
    FOREIGN KEY (iddojogo) REFERENCES jogos(idjogo)
);


-- Tabela de Gêneros
CREATE TABLE IF NOT EXISTS genero (
    idgenero INT AUTO_INCREMENT PRIMARY KEY,
    nomegenero VARCHAR(50) NOT NULL
);

-- Tabela Associativa para ligar Jogos e Gêneros 
CREATE TABLE IF NOT EXISTS generojogos (
   idgenerojogos INT AUTO_INCREMENT PRIMARY KEY,
   iddogenero INT NOT NULL,
   iddojogo INT NOT NULL,
   FOREIGN KEY (iddogenero) REFERENCES genero(idgenero),
   FOREIGN KEY (iddojogo) REFERENCES jogos(idjogo)
);