create database biblioteca;
use biblioteca;

-- Nome: José Kayque Lima Lopes
-- Criação de Tabelas

-- Tabela autores
create table if not exists autores(
  id_autor int primary key,
  nome_autor varchar(255) not null unique,
  nacionalidade varchar(255)
);

-- Tabela livros
create table if not exists livros(
  id_livro int primary key,
  titulo varchar(255) not null unique,
  ano_publicacao int,
  
  id_autor int not null,
  foreign key (id_autor) references autores(id_autor)
);

-- Tabela usuarios
create table if not exists usuarios(
  id_usuario int primary key,
  nome_usuario varchar(255) not null,
  email varchar(255) not null unique
);

-- Tabela `emprestimo`
create table if not exists emprestimo(
  id_emprestimo int auto_increment primary key,
  data_emprestimo date not null,
  data_devolucao_prevista date not null,
  data_devolucao_real date,
  
  id_livro int not null,
  id_usuario int not null,
  foreign key (id_livro) references livros(id_livro),
  foreign key (id_usuario) references usuarios(id_usuario)
);


-- Preenchendo as tabelas
insert into autores (id_autor, nome_autor, nacionalidade) values
(1, 'Machado de Assis', 'Brasileiro'),
(2, 'J.K. Rowling', 'Britânica');

insert into livros (id_livro, titulo, ano_publicacao, id_autor) values
(1, 'Dom Casmurro', 1899, 1),
(2, 'Memórias Póstumas de Brás Cubas', 1881, 1),
(3, 'Harry Potter e a Pedra Filosofal', 1997, 2);

insert into usuarios (id_usuario, nome_usuario, email) values
(1, 'Kayque', 'Kayque.601@email.com'),
(2, 'Daniel', 'Daniel53@email.com'),
(3, 'Samuel', 'Samuel@email.com');

insert into emprestimo (data_emprestimo, data_devolucao_prevista, data_devolucao_real, id_livro, id_usuario) values
('2025-06-01', '2025-07-30', '2025-06-30', 1, 1),
('2025-06-01', '2025-07-30', '2025-06-30', 2, 2),
('2025-06-01', '2025-07-30', '2025-06-30', 3, 3); 

select * from emprestimo;
select * from usuarios;
select * from autores;
select * from livros;