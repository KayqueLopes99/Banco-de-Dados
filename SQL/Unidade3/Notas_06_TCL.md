## TCL (Transaction Control Language) 
- TCL é usada para gerenciar transações, garantindo a atomicidade, consistência, isolamento e durabilidade (ACID) das operações no banco de dados.

> START TRANSACTION
-  Iniciar uma Transação: Marca o início de uma nova transação.
```sql
START TRANSACTION;
-- Ou: BEGIN;
-- Ou: BEGIN WORK;
```
> COMMIT
- Confirmar uma Transação: Torna permanentes todas as mudanças feitas desde o START TRANSACTION.
```sql
START TRANSACTION;
-- Operação 1: Reduz o estoque de um produto
UPDATE produtos SET estoque = estoque - 1 WHERE id = 1;
-- Operação 2: Registra a venda
INSERT INTO vendas (produto_id, quantidade) VALUES (1, 1);
COMMIT; -- Confirma ambas as operações juntas
```

> ROLLBACK
- Reverter uma Transação: Desfaz todas as mudanças feitas desde o START TRANSACTION, retornando o banco de dados ao estado anterior.
```sql
START TRANSACTION;
-- Tenta reduzir o estoque por um valor muito alto (ex: 100)
UPDATE produtos SET estoque = estoque - 100 WHERE id = 1;
-- Se ocorrer um erro ou a lógica indicar que a operação é inválida
ROLLBACK; -- Desfaz a atualização de estoque
```

> SAVEPOINT
- Definir Savepoints (Pontos de Retorno): Cria pontos dentro de uma transação para os quais você pode reverter, sem desfazer toda a transação.
```sql
START TRANSACTION;
INSERT INTO produtos (nome, preco, estoque) VALUES ('Fone de Ouvido', 79.99, 200);
SAVEPOINT depois_fone; -- Cria um ponto de retorno aqui
-- Tenta uma atualização que pode não ser desejada
UPDATE produtos SET preco = 85.00 WHERE nome = 'Fone de Ouvido';
-- Se decidir que a atualização não é boa, mas a inserção sim
ROLLBACK TO SAVEPOINT depois_fone; -- Reverte apenas para o ponto 'depois_fone'
COMMIT; -- Confirma a inserção do 'Fone de Ouvido' (mas não a alteração de preço)
```
