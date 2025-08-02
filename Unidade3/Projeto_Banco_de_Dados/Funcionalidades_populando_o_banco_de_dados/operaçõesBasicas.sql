-- 4.1 Operações Básicas (SQL)
-- Inserções de Dados: Exemplos de comandos INSERT INTO.
INSERT INTO cliente (nomecliente, email)
VALUES
('José Kayque', 'jose.kayque@gmail.com'),
('Samuel Saturno', 'samuel.saturno@hotmail.com'),
('Maria Isabelly', 'maria.isabelly@gmail.com'),
('Maria Aparecida', 'maria.aparecida@hotmail.com'),
('Samuel Iago', 'samuel.iago@gmail.com'),
('Daniel Costa', 'daniel.costa@hotmail.com');


INSERT INTO telefonescliente (iddocliente, telefone)
VALUES
(1, '84981010001'),
(2, '84981010002'),
(3, '84981010003'),
(4, '84981010004'),
(5, '84981010005'),
(6, '84981010006');


INSERT INTO aluguel (dataaluguel, valoraluguel, stats, datadevolucaoprevista, iddocliente)
VALUES
('2025-07-01', 0.0, 'Ativo', '2025-07-08', 1),
('2025-07-02', 0.0, 'Ativo', '2025-07-09', 2),
('2025-07-03', 0.0, 'Atrasado', '2025-07-10', 3),
('2025-07-04', 0.0, 'Ativo', '2025-07-11', 4),
('2025-07-05', 0.0, 'Devolvido', '2025-07-12', 5),
('2025-07-06', 0.0, 'Ativo', '2025-07-13', 6);

INSERT INTO compra (valortotal, datacompra, observacoes, iddocliente)
VALUES
(0.0, '2025-07-01', 'Compra de jogos e acessórios', 1),
(0.0, '2025-07-02', 'Jogos para console', 2),
(0.0, '2025-07-03', 'Pacote de jogos multiplayer', 3),
(0.0, '2025-07-04', 'Compra de jogo único', 4),
(0.0, '2025-07-05', 'Kit completo para locação', 5),
(0.0, '2025-07-06', 'Oferta em jogos populares', 6);


--  a tabela carrinho não representa múltiplos carrinhos para um mesmo cliente,
--  mas sim o registro individual de cada operação realizada por ele.
INSERT INTO carrinho (subtotal, tipooperacao, iddacompra, iddoaluguel)
VALUES
-- Compras
(260.00, 'Compra', 1, NULL),  
(89.90, 'Compra', 2, NULL),     
(140.00, 'Compra', 3, NULL),   
(60.75, 'Compra', 4, NULL),     
(320.00, 'Compra', 5, NULL),    
(49.90, 'Compra', 6, NULL),    

-- Aluguéis
(120.00, 'Aluguel', NULL, 1),   
(130.00, 'Aluguel', NULL, 2),   
(140.00, 'Aluguel', NULL, 3),   
(130.00, 'Aluguel', NULL, 4),   
(160.00, 'Aluguel', NULL, 5),   
(130.00, 'Aluguel', NULL, 6);   


INSERT INTO publicador (nomepublicador)
VALUES
('Nintendo'),
('Sony Interactive Entertainment'),
('Microsoft Xbox Game Studios'),
('Electronic Arts (EA)'),
('Activision Blizzard'),
('Rockstar Games'),
('Ubisoft'),
('Bandai Namco Entertainment');

INSERT INTO jogos (nomejogo, anopublicacao, precounidade, estoque, descricao, iddopublicador)
VALUES
('The Legend of Zelda: Breath of the Wild', 2017, 120.00, 10, 'Aventuras em mundo aberto na série Zelda.', 1),
('God of War', 2018, 130.00, 8, 'Jornada de Kratos e seu filho Atreus.', 2),
('Halo Infinite', 2021, 140.00, 5, 'FPS com o Master Chief.', 3),
('FIFA 23', 2022, 130.00, 15, 'Simulador de futebol realista.', 4),
('Call of Duty: Modern Warfare II', 2022, 160.00, 7, 'Jogo de tiro em primeira pessoa.', 5),
('GTA V', 2013, 140.00, 12, 'Jogo de ação e mundo aberto em Los Santos.', 6),
('Assassin’s Creed Valhalla', 2020, 130.00, 6, 'Aventura viking em mundo aberto.', 7),
('Tekken 7', 2015, 110.00, 9, 'Jogo de luta 3D.', 8);

INSERT INTO genero (nomegenero)
VALUES
('Ação'),
('Aventura'),
('FPS'),
('Esporte'),
('Mundo Aberto'),
('Luta'),
('Multiplayer'),
('Plataforma');


INSERT INTO generojogos (iddogenero, iddojogo)
VALUES
(2, 1),  (5, 1),  (1, 2),  (2, 2),  
(3, 3),  (7, 3),  (4, 4), (7, 4),  
(1, 5),  (3, 5),  (1, 6),  (5, 6), 
(1, 7), (5, 7), (6, 8); 

INSERT INTO ItensCarrinho (iddocarrinho, iddojogo, quantidade)
VALUES
-- Itens para Compras
(1, 1, 1),   
(1, 6, 1),   
(2, 2, 1),   
(3, 3, 1),  
(4, 4, 1),   
(5, 5, 2),   
(6, 8, 1),   

-- Itens para Aluguéis
(7, 1, 1),   
(8, 2, 1),   
(9, 3, 1),   
(10, 4, 1),  
(11, 5, 1),  
(12, 7, 1);  

-- Remoções de Dados: Exemplos de comandos DELETE FROM.
-- Para remover o cliente 6, observa-se quais tabelas mantêm relacionamento com ele por meio de chaves estrangeiras.
-- A priori, devemos remover os registros em telefonescliente, pois o cliente tem telefones associados.
-- Em seguida verificamos as tabelas compra e aluguel, note aqui que para deletar os dados correspondentes ao cliente
-- desses dois, deve-se realizar a remoção na tabela itenscarrinho e depois na tabelas carrinho, pois ela referencia tanto compras quanto aluguéis do cliente. 
-- Após isso, pode-se excluir os registros nas tabelas compra e aluguel. Assim, podemos remover o cliente da tabela cliente.

DELETE FROM telefonescliente WHERE iddocliente = 6;

DELETE ItensCarrinho FROM ItensCarrinho
INNER JOIN carrinho ON ItensCarrinho.iddocarrinho = carrinho.idcarrinho
INNER JOIN compra ON carrinho.iddacompra = compra.idcompra
WHERE compra.iddocliente = 6;

DELETE ItensCarrinho FROM ItensCarrinho
INNER JOIN carrinho ON ItensCarrinho.iddocarrinho = carrinho.idcarrinho
INNER JOIN aluguel ON carrinho.iddoaluguel = aluguel.idaluguel
WHERE aluguel.iddocliente = 6;

DELETE carrinho FROM carrinho
INNER JOIN compra ON carrinho.iddacompra = compra.idcompra
WHERE compra.iddocliente = 6;

DELETE carrinho FROM carrinho
INNER JOIN aluguel ON carrinho.iddoaluguel = aluguel.idaluguel
WHERE aluguel.iddocliente = 6;

DELETE FROM compra WHERE iddocliente = 6;
DELETE FROM aluguel WHERE iddocliente = 6;
DELETE FROM cliente WHERE idcliente = 6;


-- Listagem de Dados: Exemplos de comandos SELECT (simples e com WHERE, JOIN, GROUP BY, etc.).
SELECT nomecliente, email, idcliente FROM cliente ORDER BY nomecliente ASC;
SELECT nomecliente, email, idcliente FROM cliente ORDER BY nomecliente DESC;
SELECT * FROM jogos;
SELECT * FROM carrinho WHERE tipooperacao = 'Compra';
SELECT * FROM carrinho WHERE tipooperacao = 'Aluguel';

-- Listar todos os clientes (Nenhuma mudança)
SELECT nomecliente, email, telefone FROM cliente
INNER JOIN telefonescliente ON cliente.idcliente = telefonescliente.iddocliente;

-- Listar clientes e suas compras
SELECT nomecliente, email, idcompra, valortotal, observacoes FROM cliente
INNER JOIN compra ON cliente.idcliente = compra.iddocliente;

-- Listar clientes e suas alugueis
SELECT nomecliente, email, idaluguel, valoraluguel, stats, dataaluguel, datadevolucaoprevista FROM cliente
INNER JOIN aluguel ON cliente.idcliente = aluguel.iddocliente;

-- Listar os jogos e seus publicadores (Nenhuma mudança)
SELECT idjogo, nomejogo, anopublicacao, descricao, nomepublicador FROM jogos
INNER JOIN publicador ON jogos.iddopublicador = publicador.idpublicador;

-- Listar os itens de um carrinho específico (NOVA CONSULTA ÚTIL)
SELECT
c.idcarrinho,
j.nomejogo,
ic.quantidade
FROM carrinho c
INNER JOIN ItensCarrinho ic ON c.idcarrinho = ic.iddocarrinho
INNER JOIN jogos j ON ic.iddojogo = j.idjogo
WHERE c.idcarrinho = 1;


-- Alterações de Dados: Exemplos de comandos UPDATE.
-- Atualiza nome de um cliente
UPDATE cliente  SET nomecliente = 'Kayque Lopes' WHERE idcliente = 1;  
-- Atualizar o email de um cliente (Nenhuma mudança)
UPDATE cliente SET email = 'novo.email@email.com' WHERE idcliente = 1;
-- Atualizar o preço de um jogo (Nenhuma mudança)
UPDATE jogos SET precounidade = 79.90 WHERE idjogo = 1;
-- Atualizar status do aluguel.
UPDATE aluguel SET stats = 'Devolvido', valoraluguel = 20.00 WHERE idaluguel = 3;

-- Está operação realiza a atualização dos valores totais nas tabelas compra e aluguel para registrar no banco de dados. 
-- De inicio os atributo valortotal e valoraluguel = 0.0 e em seguida atualizado com o valor correspondente (preco * qtd). 
SET SQL_SAFE_UPDATES = 0; -- DESATIVA
SET SQL_SAFE_UPDATES = 1; -- ATIVA

UPDATE compra
SET valortotal = (SELECT COALESCE(SUM(jogos.precounidade * ItensCarrinho.quantidade), 0) FROM ItensCarrinho
    INNER JOIN jogos ON jogos.idjogo = ItensCarrinho.iddojogo
    INNER JOIN carrinho ON carrinho.idcarrinho = ItensCarrinho.iddocarrinho
    WHERE carrinho.iddacompra = compra.idcompra
);

UPDATE aluguel
SET valoraluguel = (
    SELECT COALESCE(SUM(jogos.precounidade * ItensCarrinho.quantidade), 0)
    FROM ItensCarrinho
    JOIN jogos ON jogos.idjogo = ItensCarrinho.iddojogo
    JOIN carrinho ON carrinho.idcarrinho = ItensCarrinho.iddocarrinho
    WHERE carrinho.iddoaluguel = aluguel.idaluguel
);