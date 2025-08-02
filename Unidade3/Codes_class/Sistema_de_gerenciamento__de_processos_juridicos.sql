CREATE DATABASE sistemaDeAdvogacia;
USE sistemaDeAdvogacia;

CREATE TABLE IF NOT EXISTS CLIENTES (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ADVOGADOS (
    id_advogado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    oab VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS  PROCESSOS (
    id_processo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_advogado INT,
    numero_processo VARCHAR(50),
    vara VARCHAR(50),
    stats VARCHAR(20),
    data_abertura DATE,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    FOREIGN KEY (id_advogado) REFERENCES ADVOGADOS(id_advogado)
);

CREATE TABLE IF NOT EXISTS AUDIENCIAS (
    id_audiencia INT PRIMARY KEY AUTO_INCREMENT,
    id_processo INT,
    dat DATE,
    tipo VARCHAR(50),
    resultado VARCHAR(100),
    FOREIGN KEY (id_processo) REFERENCES PROCESSOS(id_processo)
);

CREATE TABLE IF NOT EXISTS ANDAMENTOS (
    id_andamento INT PRIMARY KEY AUTO_INCREMENT,
    id_processo INT,
    dat DATE,
    descricao VARCHAR(255),
    FOREIGN KEY (id_processo) REFERENCES PROCESSOS(id_processo)
);


INSERT INTO CLIENTES (nome, cpf, telefone, email) VALUES
('Kayque', '082.585.770-85', '84996278350', 'kayque@email.com'),
('Isabelly', '002.551.830-54', '84996778350', 'isabelly@email.com'),
('Marcelo', '613.807.530-74', '84996578350', 'marcelo@email.com'),
('Daniel', '975.953.060-00', '84996233350', 'daniel@email.com'),
('Samuel Iago', '077.302.130-28', '84944278350', 'samueliago@email.com');


INSERT INTO ADVOGADOS (nome, oab, telefone, email) VALUES
('Samuel Saturno', 'OAB12345', '84923815275', 'saturno@email.com'),
('Leticia', 'OAB23456', '84923146329', 'leticia@email.com'),
('Vinicius', 'OAB34567', '84931653226', 'vinicius@email.com'),
('Leonardo', 'OAB45678', '84923398874', 'leonardo@email.com'),
('Allan', 'OAB56789', '84920224150', 'allan@email.com');


INSERT INTO PROCESSOS (id_cliente, id_advogado, numero_processo, vara, stats, data_abertura) VALUES
(1, 1, 'PROC001', 'Vara Trabalhista', 'Ativo', CURRENT_DATE),
(2, 2, 'PROC002', 'Vara Trabalhista', 'Ativo', CURRENT_DATE),
(3, 3, 'PROC003', 'Vara de Proteção', 'Ativo', CURRENT_DATE),
(4, 4, 'PROC004', 'Vara Trabalhista', 'Ativo', CURRENT_DATE),
(5, 5, 'PROC005', 'Vara Previdenciária', 'Ativo', CURRENT_DATE);

INSERT INTO AUDIENCIAS (id_processo, dat, tipo, resultado) VALUES
(1, '2025-07-15', 'Audiência Inicial', 'Realizada'),
(2, '2025-07-16', 'Audiência de Trabalhista', 'Adiada'),
(3, '2025-07-17', 'Audiência de Conciliação', 'Sem acordo'),
(4, '2025-07-18', 'Audiência de Trabalhista', 'Sentença proferida'),
(5, '2025-07-19', 'Audiência de Mediação', 'Acordo firmado');

INSERT INTO ANDAMENTOS (id_processo, dat, descricao) VALUES
(1, '2025-07-16', 'Audiência marcada'),
(2, '2025-07-17', 'Novo prazo para defesa'),
(3, '2025-07-18', 'Petição protocolada'),
(4, '2025-07-19', 'Vista ao Ministério Público'),
(5, '2025-07-20', 'Encaminhado para sentença');

-- 1.1)
DELIMITER $$
CREATE TRIGGER gatilho_de_automatizacao
AFTER INSERT ON PROCESSOS
FOR EACH ROW
BEGIN
INSERT INTO ANDAMENTOS (id_processo, dat, descricao) VALUES 
(NEW.id_processo, CURRENT_DATE, 'Processo iniciado');
END$$
DELIMITER ;

-- 1.2)
DELIMITER $$
CREATE TRIGGER impedir_cpf_duplicado
BEFORE INSERT ON CLIENTES
FOR EACH ROW
BEGIN
DECLARE cpf_existente_no_banco INT;
SELECT COUNT(*) INTO cpf_existente_no_banco FROM CLIENTES 
WHERE cpf = NEW.cpf;
IF cpf_existente_no_banco > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'CPF já cadastrado.';
END IF;
END$$
DELIMITER ;

-- Teste
SELECT * FROM ANDAMENTOS WHERE descricao = 'Processo iniciado';

-- 1.3)
DELIMITER $$
CREATE TRIGGER gatilho_de_registrar_remocao_processo
AFTER DELETE ON PROCESSOS
FOR EACH ROW
BEGIN
INSERT INTO ANDAMENTOS (id_processo, dat, descricao) VALUES
(OLD.id_processo, CURRENT_DATE, 'Processo removido do sistema');
END$$
DELIMITER ;

-- 1.4)
DELIMITER $$
CREATE TRIGGER impedir_exclusao_advogado_com_processos
BEFORE DELETE ON ADVOGADOS
FOR EACH ROW
BEGIN
DECLARE vinculos INT;

SELECT COUNT(*) INTO vinculos FROM PROCESSOS
WHERE id_advogado = OLD.id_advogado;

IF vinculos > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Erro ao excluir o advogado, pois há processo vinculados.';
END IF;
END$$
DELIMITER ;

-- teste
DELETE FROM ADVOGADOS WHERE id_advogado = 3;

-- 1.5)
DELIMITER $$
CREATE TRIGGER gatilho_de_registro_mudanca
AFTER UPDATE ON PROCESSOS
FOR EACH ROW
BEGIN
IF OLD.stats != NEW.stats THEN
 INSERT INTO ANDAMENTOS (id_processo, dat, descricao)
VALUES (NEW.id_processo, CURRENT_DATE, CONCAT('Status alterado de ', OLD.stats, ' para ', NEW.stats));
END IF;
END$$
DELIMITER ;

-- 1.6)
DELIMITER $$
CREATE TRIGGER impedir_alteracao_numero_processo
BEFORE UPDATE ON PROCESSOS
FOR EACH ROW
BEGIN
IF OLD.numero_processo != NEW.numero_processo THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Alteração no campo negada!';
END IF;
END$$
DELIMITER ;

-- 2.1)
DELIMITER $$
CREATE FUNCTION contar_processos_cliente(id_cliente_parametro INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE quantidade INT;
SELECT COUNT(*) INTO quantidade FROM PROCESSOS 
WHERE id_cliente = id_cliente_parametro AND stats != 'Encerrado';
RETURN quantidade;
END $$
DELIMITER ;

-- Teste
SELECT contar_processos_cliente(1);

-- 2.2)
DELIMITER $$
CREATE FUNCTION resumo_processo(id_cliente_parametro INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
DECLARE resultado VARCHAR(200);
SELECT CONCAT('Processo nº ', processo.numero_processo, ' – Cliente: ', cliente.nome, ' – Advogado: ', advogado.nome, ' – Status: ', processo.stats)
INTO resultado FROM PROCESSOS processo
INNER JOIN CLIENTES cliente ON processo.id_cliente = cliente.id_cliente
INNER JOIN ADVOGADOS advogado ON processo.id_advogado = advogado.id_advogado
WHERE processo.id_processo = id_cliente_parametro;
RETURN resultado;
END $$
DELIMITER ;

-- Teste
SELECT resumo_processo(1);
-- 3.1)
CREATE VIEW vw_processos_detalhados AS
SELECT processo.numero_processo, cliente.nome AS nome_do_cliente, advogado.nome AS nome_do_advogado, processo.stats AS status_do_processo, processo.data_abertura
FROM PROCESSOS processo
INNER JOIN CLIENTES cliente ON processo.id_cliente = cliente.id_cliente
INNER JOIN ADVOGADOS advogado ON processo.id_advogado = advogado.id_advogado;

SELECT * FROM vw_processos_detalhados;

-- 3.2)
CREATE VIEW vw_audiencias_futuras AS
SELECT 
processos.numero_processo, clientes.nome, audiencias.tipo, audiencias.dat
FROM audiencias
INNER JOIN processos ON audiencias.id_processo = processos.id_processo
INNER JOIN clientes ON processos.id_cliente = clientes.id_cliente
WHERE audiencias.dat > CURRENT_DATE;

SELECT * FROM vw_audiencias_futuras;
