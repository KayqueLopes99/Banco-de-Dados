show databases; -- Mostra o banco de dados;
create database exercicio;
use exercicio;


-- Tabela: departamentos.
create table if not exists departamentos (
id_departamento int primary key,
nome_departamento varchar(255) not null unique
);

-- Tabela: professores
create table if not exists professores (
id_professor int primary key,
nome_professor varchar(255) not null,
email varchar(255) unique,
id_departamento int,
foreign key (id_departamento) references departamentos(id_departamento)
);

-- Tabela: disciplinas
create table disciplinas (
 id_disciplina int primary key,
 nome_disciplina varchar(255) not null unique,
 carga_horaria int not null,
 id_departamento int,
 id_professor_responsavel int,
 foreign key (id_departamento) references departamentos(id_departamento),
 foreign key (id_professor_responsavel) references professores(id_professor)
);

-- Tabela: alunos
create table alunos (
 id_aluno int primary key,
 nome_aluno varchar(255) not null,
 matricula varchar(255) not null unique,
 email varchar(255) unique,
 data_nascimento date
);


-- Tabela: alunos_disciplinas (Tabela de junção para relacionamento N:M entre alunos e disciplinas)

create table alunos_disciplinas (
id_aluno int,
id_disciplina int,
data_matricula date not null,
primary key (id_aluno, id_disciplina),
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_disciplina) references disciplinas(id_disciplina)
);

-- Tabela de notas
create table notas (
-- Parte de chave primária composta
id_aluno int, 
id_disciplina int,

-- -- Permitindo valores NULL, pois não há restrição NOT NULL no diagrama

nota_unidade1 decimal(4,2) null,
nota_unidade2 decimal(4,2) null,
nota_unidade3 decimal(4,2) null,
nota_recuperacao decimal(4,2) null,
primary key (id_aluno, id_disciplina),
foreign key (id_aluno, id_disciplina) references alunos_disciplinas(id_aluno, id_disciplina)
 
 -- Ou, alternativamente, se não houver a tabela alunos_disciplinas como intermediária direta para notas:
 -- FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
 -- FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
 -- A primeira opção é mais fiel ao diagrama onde notas aponta para o relacionamento, não diretamente para as entidades.

);

-- PREENCHENDO
insert into departamentos (id_departamento, nome_departamento) VALUES
(1, 'Departamento de Computacao'),
(2, 'Departamento de Engenharia'),
(3, 'Departamento de Humanidades'),
(4, 'Departamento de Ciências');

-- Inserindo dados na tabela PROFESSORES
-- id_departamento deve existir na tabela DEPARTAMENTOS
INSERT INTO professores (id_professor, nome_professor, email, id_departamento)
VALUES
(101, 'Prof. Ana Silva', 'ana.silva@email.com', 1),
(102, 'Prof. Bruno Costa', 'bruno.costa@email.com', 1),
(103, 'Prof. Carla Dias', 'carla.dias@email.com', 2),
(104, 'Prof. Daniel Mendes', 'daniel.mendes@email.com', 3),
(105, 'Prof. Eva Lima', 'eva.lima@email.com', 4),
(106, 'Prof. Fabio Nunes', 'fabio.nunes@email.com', 1);


-- Inserindo dados na tabela DISCIPLINAS
-- id_departamento e id_professor_responsavel devem existir nas respectivas tabelas
INSERT INTO disciplinas (id_disciplina, nome_disciplina, carga_horaria,
id_departamento, id_professor_responsavel) VALUES
(201, 'Banco de Dados I', 60, 1, 101),
(202, 'Programacao Orientada a Objetos', 60, 1, 102),
(203, 'Circuitos Elétricos', 80, 2, 103),
(204, 'Sociologia Geral', 45, 3, 104),
(205, 'Calculo I', 75, 4, 105),
(206, 'Redes de Computadores', 60, 1, 101);

-- Inserindo dados na tabela ALUNOS
INSERT INTO alunos (id_aluno, nome_aluno, matricula, email, data_nascimento)
VALUES
(301, 'Bruno Silva', '2023001', 'bruno.silva@email.com', '2000-01-15'),
(302, 'Manoel Garrido', '2023002', 'manoel.garrido@email.com', '1999-05-20'),
(303, 'Rodrigo Aggeu', '2023003', 'rodrigo.aggeu@email.com', '2001-11-10'),
(304, 'Vanderson Fábio', '2023004', 'vanderson.fabio@email.com', '2002-03-25'),
(305, 'Matiaz Medeiros', '2023005', 'matiaz.medeiros@email.com', '2002-08-25');

-- Inserindo dados na tabela alunos_disciplinas
-- id_aluno e id_disciplina devem existir nas respectivas tabelas
INSERT INTO alunos_disciplinas (id_aluno, id_disciplina, data_matricula) VALUES
(301, 201, '2024-03-01'), -- Bruno Silva matriculado em Banco de Dados I
(301, 202, '2024-03-01'), -- Bruno Silva matriculado em POO
(302, 201, '2024-03-01'), -- Manoel Garrido matriculado em Banco de Dados I
(302, 205, '2024-03-01'), -- Manoel Garrido matriculado em Calculo I
(303, 203, '2024-03-01'), -- Rodrigo Aggeu matriculado em Circuitos Eletricos
(303, 204, '2024-03-01'), -- Rodrigo Aggeu matriculado em Sociologia Geral
(304, 206, '2024-03-01'); -- Vanderson Fábio matriculado em Redes de Computadores
-- Inserindo dados na tabela NOTAS
-- id_aluno e id_disciplina devem ter uma entrada correspondente em alunos_disciplinas

INSERT INTO NOTAS (id_aluno, id_disciplina, nota_unidade1, nota_unidade2,
nota_unidade3, nota_recuperacao) VALUES
(301, 201, 8.50, 7.00, 9.00, NULL),
(301, 202, 7.00, 6.50, NULL, 5.00), -- Bruno Silva em POO, com nota de recuperação
(302, 201, 6.00, 5.50, 7.00, NULL),
(302, 205, 9.00, 8.50, 9.50, NULL),
(303, 203, 7.50, 7.00, 8.00, NULL),
(304, 206, 7.00, 6.00, NULL, NULL); -- Vanderson Fábio em Redes, sem nota final ainda

select * from alunos -- visualizar