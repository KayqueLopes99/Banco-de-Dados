## DQL (Data Query Language)
- **DQL é usada exclusivamente para consultar e recuperar dados de tabelas.** Embora frequentemente agrupada com DML, sua função de apenas leitura a distingue.

> SELECT 
- **Selecionar Todos os Dados de uma Tabela**:  Recupera todas as colunas de todas as linhas.
```sql
SELECT *
FROM produtos;
```

- **Selecionar Colunas Específicas**: Recupera apenas as colunas desejadas.
```sql
SELECT nome, preco
FROM produtos;
```

- **Selecionar Dados com Condição (Filtragem)**: Recupera dados que satisfazem uma condição específica.
```sql
SELECT nome, estoque
FROM produtos
WHERE preco > 50.00; -- Produtos com preço maior que 50
```

- **Selecionar e Ordenar Dados**: Organiza os resultados da consulta.
```sql
SELECT nome, preco
FROM produtos
ORDER BY preco DESC; -- Ordena por preço em ordem decrescente
```

- **Contar Registros**: Retorna o número de linhas que correspondem a uma condição.
```sql
SELECT COUNT(*) AS total_produtos
FROM produtos; -- Conta o total de produtos
```

- **Agrupar Dados**: Agrega dados com base em uma ou mais colunas.
```sql
SELECT preco, COUNT(id) AS quantidade_por_preco
FROM produtos
GROUP BY preco; -- Conta produtos por cada preço
```