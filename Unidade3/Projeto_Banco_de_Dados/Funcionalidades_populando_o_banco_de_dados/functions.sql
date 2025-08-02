-- Descrição de ambas:
-- Ambas as funções retornam o valor total gasto com aluguéis ou compras por um cliente. 
-- Ela recebe o idcliente como parâmetro e soma todos os valores presentes na coluna da tabela compra // aluguel
-- referentes ao cliente informado. Caso o cliente não tenha alugado // comprado nada, o retorno será 0.

-- Utilização:
-- Acompanhar os gastos de cada cliente em aluguéis // compras.

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

-- Uso:
SELECT 
CASE WHEN totalCompras(1) = 0 THEN 'Nenhuma compra encontrada para o cliente.'
ELSE CONCAT('Total de compras: R$ ', TotalCompras(1))
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

-- Uso:
SELECT 
CASE WHEN totalAlugueis(1) = 0 THEN 'Nenhum aluguel encontrada para o cliente.'
ELSE CONCAT('Total de alugueis: R$ ', totalAlugueis(1))
END AS Resultado;
