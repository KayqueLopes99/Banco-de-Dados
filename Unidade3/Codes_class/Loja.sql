create database loja;
use loja;

-- 1)
create table if not exists GENERO_LIVRO(
  idGenero int primary key auto_increment,
  nomeGenero varchar(50) not null
);

create table if not exists LIVRO(
  isbn varchar(13) primary key,
  titulo varchar(100) not null,
  autor  varchar(100) not null,
  anoPublicacao int not null,
  idGenero int not null,
  precoUnitario decimal(12, 2) not null,
  quantidadeEmEstoque int not null,
  foreign key (idGenero) references GENERO_LIVRO(idGenero)
);

create table if not exists CLIENTE(
  idCliente int primary key auto_increment, 
  nome varchar(100) not null,
  sobrenome varchar(100) not null,
  email varchar(150) not null,
  telefone varchar(20)
);


create table if not exists PEDIDO(
  idPedido int primary key auto_increment,
  idcliente int not null,
  datapedido date not null,
  stats varchar(20) not null,
  valortotal  decimal(12, 2) not null,
  foreign key (idcliente) references cliente(idcliente)
);

create table if not exists ITEM_PEDIDO(
idItemPedido int primary key auto_increment, 
idpedido int not null,
isbn varchar(13) not null,
quantidade int not null,
precoUnitarioNaCompra decimal(12, 2) not null,
foreign key (idpedido) references PEDIDO(idpedido),
foreign key (isbn) references LIVRO(isbn)
);


select * from CLIENTE;
select * from PEDIDO;
select * from ITEM_PEDIDO;


-- 2) 
alter table LIVRO
add column editora varchar(50) not null;

-- 3)
alter table GENERO_LIVRO
modify column nomegenero varchar(100) not null;

select * from GENERO_LIVRO;
select * from LIVRO;

-- 4) Exclusão por precaução
drop table if exists ITEM_PEDIDO;

-- 5)
insert into GENERO_LIVRO (nomegenero) values
('Fantasia'),
('Terror'),
('Ficção Científica'),
('Suspense');

insert into LIVRO (isbn, titulo, autor, anoPublicacao, idGenero, precoUnitario, quantidadeEmEstoque, editora) values
('12345566', 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 1, 49.90, 150, 'Rocco'),
('56789054', 'O Adimiravel Mundo Novo', 'Huxley', 1932, 2, 89.90, 80, 'Auster'),
('23456432', 'Cabine de Olhos', 'Satrugo', 2025, 4, 22.50, 120, 'Zuko');

insert into LIVRO (isbn, titulo, autor, anoPublicacao, idGenero, precoUnitario, quantidadeEmEstoque, editora) values
('766', 'tt', 'J.K. Rowling', 1997, 4, 49.90, 150, 'Rocco');

insert into CLIENTE (nome, sobrenome, email, telefone) values
('Isabelly', 'Lima', 'isalima@email.com', '(84) 96999-8888'),
('Kelvis', 'Lima', 'kelviz645@email.com', '(84) 99999-8888');

select * from GENERO_LIVRO;
select * from LIVRO;
select * from CLIENTE;

-- 6)
update CLIENTE
set telefone = '(11) 99999-8888'
where idCliente = 1;


-- 7)
update LIVRO
set quantidadeEmEstoque = quantidadeEmEstoque + 5
where anoPublicacao < 2020 and idGenero = (select idGenero from GENERO_LIVRO where nomeGenero = 'Ficção Científica');

-- 8)
delete from genero_livro
where nomegenero = 'Terror';

select * from GENERO_LIVRO;
select * from livro where idGenero = (select idgenero from GENERO_LIVRO where nomegenero = 'Ficção Científica');
select * from CLIENTE where idCliente = 1;


-- 9)
select titulo, autor, nomeGenero
from LIVRO inner join GENERO_LIVRO on LIVRO.idgenero = GENERO_LIVRO.idgenero
where GENERO_LIVRO.nomegenero = 'Fantasia' and LIVRO.quantidadeEmEstoque > 10;
    
insert into PEDIDO (idcliente, datapedido, stats, valortotal) values
(1, '2025-07-01', 'Pendente', 22.50);

insert into ITEM_PEDIDO (idpedido, isbn, quantidade, precoUnitarioNaCompra) values
(1, '23456432', 1, 22.50);


-- 10)
select * from GENERO_LIVRO;

select concat(nome, ' ', sobrenome) as nomeCompleto, dataPedido, nomeGenero
from CLIENTE 
inner join PEDIDO on CLIENTE.idCliente = PEDIDO.idCliente
inner join ITEM_PEDIDO on PEDIDO.idPedido = ITEM_PEDIDO.idpedido
inner join  LIVRO on ITEM_PEDIDO.isbn = LIVRO.isbn
inner join GENERO_LIVRO on LIVRO.idGenero = GENERO_LIVRO.idGenero
where
    GENERO_LIVRO.nomeGenero = 'Suspense' 
order by
    PEDIDO.datapedido desc;