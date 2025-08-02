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

-- teste

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

-- teste

-- 1. Verifique o estoque e o preço do jogo 'Tekken 7'
SELECT nomejogo, estoque, precounidade FROM jogos WHERE idjogo = 8;
-- Resultado esperado: estoque = 9, precounidade = 110.00

INSERT INTO ItensCarrinho (iddocarrinho, iddojogo, quantidade)
VALUES
(2, 8, 2);
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