CREATE DATABASE sistema_de_biblioteca;
USE sistema_de_biblioteca;

CREATE TABLE IF NOT EXISTS EDITORA(
id_editora INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
cidade VARCHAR(100),
estado VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS CATEGORIA(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS LIVRO(
id_livro INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(100),
isbn VARCHAR(10),
ano_publicacao INT, 
id_editora INT, 
id_categoria INT, 
edicao INT,
FOREIGN KEY (id_editora) REFERENCES EDITORA(id_editora),
FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);


CREATE TABLE IF NOT EXISTS AUTOR(
id_autor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
biografia VARCHAR(500)
);


CREATE TABLE IF NOT EXISTS AUTOR_LIVRO(
id_autor_livro INT PRIMARY KEY AUTO_INCREMENT,
id_livro INT,
id_autor INT,


FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro),
FOREIGN KEY (id_autor) REFERENCES AUTOR(id_autor)
);

CREATE TABLE IF NOT EXISTS USUARIO(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS EXEMPLAR(
id_exemplar INT PRIMARY KEY AUTO_INCREMENT,
id_livro INT,
codigo_de_barras VARCHAR(10),
quantidade_estoque INT,
disponivel BOOLEAN,
FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro)
);

CREATE TABLE IF NOT EXISTS EMPRESTIMO(
id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT,
id_exemplar INT,
data_emprestimo DATE, 
data_devolucao_prevista DATE, 
data_devolucao_real DATE,
finalizado BOOLEAN,
stats VARCHAR(20),

FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
FOREIGN KEY (id_exemplar) REFERENCES EXEMPLAR(id_exemplar)

);



-- PREENCHENDO AS TABELAS
INSERT INTO EDITORA (nome, cidade, estado)
VALUES 
('Rocco', 'Rio de Janeiro', 'RJ'),
('HarperCollins', 'Rio de Janeiro', 'RJ'),
('Panini', 'Barueri', 'SP'),
('Bertrand Brasil', 'Rio de Janeiro', 'RJ'),
('Agir', 'Rio de Janeiro', 'RJ');

INSERT INTO CATEGORIA (nome)
VALUES 
('Fantasia'),
('Mangá'),
('Ficção'),
('Infantil');

INSERT INTO AUTOR (nome, biografia)
VALUES 
('J.K. Rowling', 'Joanne Rowling é uma escritora britânica, autora da série de fantasia Harry Potter.'),
('J.R.R. Tolkien', 'John Ronald Reuel Tolkien foi um escritor e ele é o autor de O Hobbit e O Senhor dos Anéis.'),
('Eiichiro Oda', 'Eiichiro Oda é um mangaká japonês, mais conhecido por ser o criador da série de mangá One Piece.'),
('Matt Haig', 'Matt Haig é um romancista e ele é autor de ficção e não-ficção para crianças e adultos.'),
('Antoine de Saint-Exupéry', 'Antoine foi um escritor, ilustrador e piloto francês, conhecido pela sua obra O Pequeno Príncipe.');

INSERT INTO LIVRO (titulo, isbn, ano_publicacao, id_editora, id_categoria, edicao)
VALUES 
('Harry Potter e a Pedra Filosofal', '123456788', 2017, 1, 1, 1),
('O Hobbit', '123444488', 2019, 2, 1, 1),
('One Piece - Vol. 1', '978854260', 2012, 3, 2, 1),
('A Biblioteca da Meia-Noite', '558380335', 2021, 4, 3, 1),
('O Pequeno Príncipe', '978851165', 2018, 5, 4, 1);

INSERT INTO AUTOR_LIVRO (id_livro, id_autor)
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5); 

INSERT INTO USUARIO (nome, email)
VALUES 
('Jose Kayque', 'jose.kayque@email.com'),
('Daniel Costa', 'daniel.costa@email.com'),
('Samuel Saturno', 'samuel.saturno@email.com'),
('Antonio Vinicios', 'antonio.vinicios@email.com');

INSERT INTO EXEMPLAR (id_livro, codigo_de_barras, quantidade_estoque, disponivel)
VALUES 
(1, 'HPF001BR', 3, TRUE),   
(2, 'HOB001BR', 2, TRUE), 
(3, 'OP001BR', 5, TRUE),    
(4, 'BMN001BR', 4, TRUE),  
(5, 'PP001BR', 1, TRUE);  

INSERT INTO EMPRESTIMO (id_usuario, id_exemplar, data_emprestimo, data_devolucao_prevista, data_devolucao_real, finalizado, stats)
VALUES 
(1, 2, '2025-05-10', '2025-07-24', '2025-07-23', TRUE, 'Devolvido'),
(2, 5, '2025-05-12', '2025-07-26', '2025-08-27', TRUE, 'Devolvido com atraso'),
(3, 1, '2025-05-20', '2025-07-03', NULL, FALSE, 'Emprestado'), 
(4, 4, '2025-05-22', '2025-07-05', NULL, FALSE, 'Emprestado');





-- 1) 
SELECT nome, cidade FROM EDITORA

-- 2)
SELECT titulo FROM LIVRO
WHERE id_editora = 1;

-- 3)
INSERT INTO USUARIO (nome, email)
VALUES ('Carlos Lima', 'carlos.lima@email.com');

-- 4)
UPDATE EDITORA
SET cidade = 'São Paulo'
WHERE id_editora = 2;

-- 5)
SELECT * FROM LIVRO WHERE id_categoria = 2;

-- 6)
SELECT LIVRO.titulo, EDITORA.nome AS nome_editora
FROM LIVRO
INNER JOIN EDITORA ON LIVRO.id_editora = EDITORA.id_editora;


-- 7) 
SELECT LIVRO.titulo, USUARIO.nome AS nome_usuario, EMPRESTIMO.data_emprestimo
FROM EMPRESTIMO
INNER JOIN EXEMPLAR ON EMPRESTIMO.id_exemplar = EXEMPLAR.id_exemplar
INNER JOIN LIVRO ON EXEMPLAR.id_livro = LIVRO.id_livro
INNER JOIN USUARIO ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
WHERE EMPRESTIMO.finalizado = FALSE;

-- 8)
SELECT EXEMPLAR.codigo_de_barras, LIVRO.titulo
FROM EMPRESTIMO
INNER JOIN EXEMPLAR ON EMPRESTIMO.id_exemplar = EXEMPLAR.id_exemplar
INNER JOIN LIVRO ON EXEMPLAR.id_livro = LIVRO.id_livro
WHERE EMPRESTIMO.data_devolucao_real IS NULL;


-- 9)
ALTER TABLE USUARIO
ADD telefone VARCHAR(15);

-- 10)
ALTER TABLE LIVRO
MODIFY isbn VARCHAR(13);

-- 11)
SELECT * FROM AUTOR
WHERE nome LIKE 'M%';

-- 12)
SELECT AUTOR.nome AS nome_autor, LIVRO.titulo AS titulo_livro
FROM AUTOR
INNER JOIN AUTOR_LIVRO ON AUTOR.id_autor = AUTOR_LIVRO.id_autor
INNER JOIN LIVRO ON LIVRO.id_livro = AUTOR_LIVRO.id_livro;


-- 13)
DROP TABLE IF EXISTS EMPRESTIMO;

-- 14)
SELECT * FROM EMPRESTIMO
WHERE data_emprestimo BETWEEN '2025-06-01' AND '2025-06-10';

-- 15)
SELECT * FROM USUARIO
ORDER BY nome ASC;

-- 16)
SELECT LIVRO.titulo, EXEMPLAR.codigo_de_barras
FROM LIVRO
LEFT JOIN EXEMPLAR ON LIVRO.id_livro = EXEMPLAR.id_livro;

-- 17)
SELECT AUTOR.nome AS nome_autor, LIVRO.titulo AS titulo_livro
FROM AUTOR
LEFT JOIN AUTOR_LIVRO ON AUTOR.id_autor = AUTOR_LIVRO.id_autor
LEFT JOIN LIVRO ON AUTOR_LIVRO.id_livro = LIVRO.id_livro;

-- 18)
SELECT USUARIO.nome, EMPRESTIMO.data_emprestimo, EMPRESTIMO.data_devolucao_prevista
FROM USUARIO
LEFT JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario;

-- 19)
SELECT EXEMPLAR.codigo_de_barras, EMPRESTIMO.id_emprestimo
FROM EXEMPLAR
LEFT JOIN EMPRESTIMO ON EXEMPLAR.id_exemplar = EMPRESTIMO.id_exemplar;


-- 20)
SELECT 
    EMPRESTIMO.id_emprestimo,
    USUARIO.nome AS nome_usuario,
    EMPRESTIMO.data_emprestimo,
    EMPRESTIMO.data_devolucao_prevista,
    EMPRESTIMO.data_devolucao_real,
    EMPRESTIMO.stats
FROM USUARIO
RIGHT JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario;


