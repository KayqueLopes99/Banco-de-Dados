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

-- Inserções de Dados: Exemplos de comandos INSERT INTO.
-- TESTES DE INSERÇÃO DE DADOS CORRETOS EM SUAS DEVIDAS TABELAS.
-- No geral, todos os atributos devem ter valores informados, pois o sistema não
-- permite campos nulos.
-- TESTE 01: Inserir dados válidos nas suas tabelas  → os dados devem ser adicionados nas tabelas com um ID gerado automaticamente.
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



INSERT INTO carrinho (subtotal, tipooperacao, iddacompra, iddoaluguel)
VALUES
(260.00, 'Compra', 1, NULL),  
(89.90, 'Compra', 2, NULL),     
(140.00, 'Compra', 3, NULL),   
(60.75, 'Compra', 4, NULL),     
(320.00, 'Compra', 5, NULL),    
(49.90, 'Compra', 6, NULL),    
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

(1, 1, 1),   
(1, 6, 1),   
(2, 2, 1),   
(3, 3, 1),  
(4, 4, 1),   
(5, 5, 2),   
(6, 8, 1),   

(7, 1, 1),   
(8, 2, 1),   
(9, 3, 1),   
(10, 4, 1),  
(11, 5, 1),  
(12, 7, 1);  


-- TESTE 2:Tentar inserir um cliente com e-mail já existente → O sistema deve emitir erro devido à restrição de unicidade.
INSERT INTO cliente (nomecliente, email)
VALUES ('Ana Lucia', 'maria.isabelly@gmail.com');
-- TESTE 3: Inserir um jogo com um publicador inexistente → Deve gerar erro por violação de chave estrangeira.
INSERT INTO jogos (nomejogo, anopublicacao, precounidade, estoque, descricao, iddopublicador)
VALUES ('Jogo Teste Inexistente', 2025, 199.99, 10, 'Descrição do jogo de teste.', 99);




-- Alterações de Dados: Exemplos de comandos UPDATE.
-- TESTE 1: Atualiza nome de um cliente
UPDATE cliente  SET nomecliente = 'Kayque Lopes' WHERE idcliente = 1;  
-- TESTE 1: Atualizar o email de um cliente (Nenhuma mudança)
UPDATE cliente SET email = 'novo.email@email.com' WHERE idcliente = 1;
SELECT * FROM cliente WHERE idcliente = 1;

-- TESTE 2: Atualizar o preço de um jogo (Nenhuma mudança)
UPDATE jogos SET precounidade = 79.90 WHERE idjogo = 1;
SELECT nomejogo, precounidade FROM jogos WHERE idjogo = 1;

-- TESTE 3: Atualizar status do aluguel.
UPDATE aluguel SET stats = 'Devolvido', valoraluguel = 20.00 WHERE idaluguel = 3;
SELECT idaluguel, iddocliente, stats FROM aluguel WHERE idaluguel = 3;


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




-- Remoções de Dados: Exemplos de comandos DELETE FROM.
-- TESTE 1: Remover um cliente sem relacionamentos → O cliente deve ser removido com sucesso.
INSERT INTO cliente (nomecliente, email)
VALUES ('Cliente Para Remover', 'remover@teste.com');
DELETE FROM cliente WHERE email = 'remover@teste.com';

-- TESTE 2: Remover um jogo inexistente → Nenhum registro deve ser afetado.
DELETE FROM jogos WHERE idjogo = 999;

-- TESTE 3: Remover um cliente e todas as operações relacionadas a ele → Deve seguir uma remoção sequencial para não gerar erros.
SET SQL_SAFE_UPDATES = 0; -- DESATIVA
SET SQL_SAFE_UPDATES = 1; -- ATIVA

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






-- -- Listagem de Dados: Exemplos de comandos SELECT (simples e com WHERE, JOIN, GROUP BY, etc.).
-- TESTE 1: Listar todos os clientes → Deve exibir todos os registros da tabela cliente.
SELECT nomecliente, email, telefone FROM cliente
INNER JOIN telefonescliente ON cliente.idcliente = telefonescliente.iddocliente;

-- TESTE 2: Listar clientes e suas compras
SELECT nomecliente, email, idcompra, valortotal, observacoes FROM cliente
INNER JOIN compra ON cliente.idcliente = compra.iddocliente;

-- TESTE 2: Listar clientes e suas alugueis
SELECT nomecliente, email, idaluguel, valoraluguel, stats, dataaluguel, datadevolucaoprevista FROM cliente
INNER JOIN aluguel ON cliente.idcliente = aluguel.iddocliente;

-- TESTE 3: Listar jogos com seus respectivos publicadores → Deve retornar dados corretos usando JOIN.
SELECT idjogo, nomejogo, anopublicacao, descricao, nomepublicador FROM jogos
INNER JOIN publicador ON jogos.iddopublicador = publicador.idpublicador;

-- TESTE 4: Contar quantos jogos existem por gênero → Deve retornar os gêneros com suas respectivas quantidades de jogos.
SELECT genero.nomegenero AS 'Gênero', COUNT(generojogos.iddojogo) AS 'Quantidade de Jogos'
FROM genero
INNER JOIN generojogos ON genero.idgenero = generojogos.iddogenero
GROUP BY genero.nomegenero;
    
-- TESTE 5: Ordenar jogos pelo nome → Deve retornar os jogos em ordem alfabética.
SELECT nomejogo AS 'Nome do Jogo', anopublicacao AS 'Ano', precounidade AS 'Preço'
FROM jogos ORDER BY nomejogo ASC;

-- TESTE 6: Listar os itens de um carrinho específico → Deve os jogos presentes em um carrinho.
SELECT
c.idcarrinho,
j.nomejogo,
ic.quantidade
FROM carrinho c
INNER JOIN ItensCarrinho ic ON c.idcarrinho = ic.iddocarrinho
INNER JOIN jogos j ON ic.iddojogo = j.idjogo
WHERE c.idcarrinho = 1;

-- VIEWS 
-- TESTE 1: Consultar a view de clientes com telefones → Deve exibir todos os clientes e seus telefones.
CREATE VIEW vw_clientes_telefones AS
SELECT c.idcliente, c.nomecliente, c.email, t.telefone
FROM cliente c
INNER JOIN telefonescliente t ON c.idcliente = t.iddocliente;

-- TESTE 2: Consultar a view de jogos com publicadores → Deve mostrar informações consolidadas de jogos e seus respectivos publicadores.
CREATE VIEW vw_jogos_publicadores AS
SELECT j.idjogo, j.nomejogo, j.anopublicacao, j.precounidade, p.nomepublicador
FROM jogos j
INNER JOIN publicador p ON j.iddopublicador = p.idpublicador;

-- TESTE 3: Consultar a view de jogos por gênero → Deve permitir saber rapidamente quais gêneros estão associados a quais jogos.
CREATE VIEW vw_jogos_genero AS
SELECT j.nomejogo, g.nomegenero
FROM jogos j
INNER JOIN generojogos gj ON j.idjogo = gj.iddojogo
INNER JOIN genero g ON g.idgenero = gj.iddogenero;

-- TESTE 4: Consultar a view de compras com dados do cliente → Deve mostrar informações de compras e dos clientes que as realizaram
CREATE VIEW vw_compras_clientes AS
SELECT co.idcompra, co.valortotal, co.datacompra, co.observacoes,
       c.nomecliente, c.email
FROM compra co
INNER JOIN cliente c ON co.iddocliente = c.idcliente;

select * from vw_clientes_telefones;


-- triggers
-- 1) impedir a compra ou aluguel de jogos em que a quantidade é menor
-- fazer com que caso o estoque vire 0 imprimra que precisa repor 

DELIMITER $$

CREATE TRIGGER trg_verifica_estoque
BEFORE INSERT ON ItensCarrinho
FOR EACH ROW
BEGIN
DECLARE v_estoque_atual INT;

-- Pega o estoque atual do jogo que está sendo inserido
SELECT estoque INTO v_estoque_atual
FROM jogos
WHERE idjogo = NEW.iddojogo;

-- Verifica se a quantidade desejada é maior que o estoque disponível
IF v_estoque_atual < NEW.quantidade THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Operação cancelada: Estoque insuficiente para o jogo solicitado.';
END IF;
END$$

DELIMITER ;

-- teste 1:
SELECT nomejogo, estoque FROM jogos WHERE idjogo = 3;
-- Resultado esperado: estoque = hallo que tem 5 no estoque

INSERT INTO ItensCarrinho (iddocarrinho, iddojogo, quantidade)
VALUES
(4, 3, 10);
-- imprimiu corretamente e hallo n perdeu seu estoque

-- 2) Atualiza o estoque do jogo, subtraindo a quantidade inserida no carrinho
DELIMITER $$
CREATE TRIGGER trg_atualiza_estoque
AFTER INSERT ON ItensCarrinho
FOR EACH ROW
BEGIN
UPDATE jogos
SET estoque = estoque - NEW.quantidade
WHERE idjogo = NEW.iddojogo;
END$$
DELIMITER ;

-- teste 2
-- 1. Verifique o estoque e o preço do jogo 'Tekken 7'
SELECT nomejogo, estoque, precounidade FROM jogos WHERE idjogo = 8;
-- Resultado esperado: estoque = 9, precounidade = 110.00

INSERT INTO ItensCarrinho (iddocarrinho, iddojogo, quantidade)
VALUES
(2, 8, 1);
SELECT nomejogo, estoque, precounidade FROM jogos WHERE idjogo = 8;
-- agora o estoque é 8


-- 3) caso remova de itens carrinho o estoque será atualizado
DELIMITER $$
CREATE TRIGGER trg_repor_estoque
AFTER DELETE ON ItensCarrinho
FOR EACH ROW
BEGIN
-- Ao remover do carrinho, adiciona a quantidade de volta ao estoque do jogo
UPDATE jogos
SET estoque = estoque + OLD.quantidade
WHERE idjogo = OLD.iddojogo;
END$$
DELIMITER ;

-- teste
SELECT nomejogo, estoque FROM jogos WHERE idjogo = 8;
-- tekken 7 

DELETE FROM ItensCarrinho
WHERE iditemcarrinho = 12; -- tem 6 no momento vou remover do carrinho 12 com 2 tekken 7, é para o estoque virar 8

SELECT nomejogo, estoque FROM jogos WHERE idjogo = 8;
-- estoque está 8

-- Funções
-- Função que retorna o total gasto em compras por um cliente.
DELIMITER $$
CREATE FUNCTION totalCompras(idcliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE valortotalcompra DECIMAL(10,2);    
SELECT COALESCE(SUM(valortotal), 0) 
INTO valortotalcompra
FROM compra
WHERE iddocliente = idcliente;
    
RETURN valortotalcompra; 
END $$
DELIMITER ;

-- TESTE 1:
SELECT 
CASE WHEN totalCompras(1) = 0 THEN 'Nenhuma compra encontrada para o cliente.'
ELSE CONCAT('Total de compras: R$ ', TotalCompras(1))
END AS Resultado;

-- TESTE 2: 
SELECT 
CASE WHEN totalCompras(111) = 0 THEN 'Nenhuma compra encontrada para o cliente.'
ELSE CONCAT('Total de compras: R$ ', TotalCompras(111))
END AS Resultado;

-- Função que retorna o total gasto em alugueis por um cliente específico
DELIMITER $$
CREATE FUNCTION totalAlugueis(idcliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE valortotalaluguel DECIMAL(10,2); 
    
SELECT COALESCE(SUM(valoraluguel), 0) 
INTO valortotalaluguel
FROM aluguel
WHERE iddocliente = idcliente;
    
RETURN valortotalaluguel;
END $$
DELIMITER ;

-- TESTE 3:
SELECT 
CASE WHEN totalAlugueis(1) = 0 THEN 'Nenhum aluguel encontrada para o cliente.'
ELSE CONCAT('Total de alugueis: R$ ', totalAlugueis(1))
END AS Resultado;

-- TESTE 4:
SELECT 
CASE WHEN totalAlugueis(1111) = 0 THEN 'Nenhum aluguel encontrada para o cliente.'
ELSE CONCAT('Total de alugueis: R$ ', totalAlugueis(1111))
END AS Resultado;


-- INDICES
CREATE INDEX idx_aluguel_cliente ON aluguel(iddocliente);
CREATE INDEX idx_compra_cliente ON compra(iddocliente);
CREATE INDEX idx_carrinho_compra ON carrinho(iddacompra);
CREATE INDEX idx_carrinho_aluguel ON carrinho(iddoaluguel);
CREATE INDEX idx_telefone_cliente ON telefonescliente(iddocliente);
CREATE INDEX idx_jogos_publicador ON jogos(iddopublicador);
CREATE INDEX idx_itenscarrinho_carrinho ON ItensCarrinho(iddocarrinho);
CREATE INDEX idx_itenscarrinho_jogo ON ItensCarrinho(iddojogo);
CREATE INDEX idx_generojogos_jogo ON generojogos(iddojogo);
CREATE INDEX idx_generojogos_genero ON generojogos(iddogenero);