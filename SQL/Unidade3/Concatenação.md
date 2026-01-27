## Comando de concatenção no sql
```sql
SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo FROM usuarios;
```
- || Concatenação com Função CONCAT: A função `CONCAT` é uma maneira comum de concatenar strings no MySQL. Por exemplo:
```sql
SELECT CONCAT('Olá', ' ', 'Mundo') AS saudacao;
```

## AS
- Definição facil de entender: 
- O comando `AS` é usado para dar um alias (apelido) a uma coluna ou tabela em uma consulta SQL. Isso torna os resultados mais legíveis e compreensíveis.
- Exemplo de uso:
```sql
SELECT nome AS nome_usuario, idade AS idade_usuario FROM usuarios;
```
- || Alias para Colunas: O `AS` é frequentemente usado para renomear colunas em uma consulta SQL, tornando os resultados mais claros. Por exemplo:
```sql  
SELECT nome AS nome_usuario FROM usuarios;
```

- Sintaxe:
```sql
SELECT coluna1 AS alias1, coluna2 AS alias2 FROM tabela;
```
**Para renomear colunas na saída da consulta.**
**Para facilitar a leitura de nomes longos.**