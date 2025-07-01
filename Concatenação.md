## Comando de concatenção no sql
- || Concatenação de Strings: No MySQL, você pode usar o operador `||` para concatenar strings. Por exemplo:
```sql
SELECT 'Olá' || ' Mundo' AS saudacao;
```
- || Concatenação de Colunas: Você também pode concatenar colunas de uma tabela. Por exemplo:
```sql
SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo FROM usuarios;
```
- || Concatenação com Função CONCAT: A função `CONCAT` é uma maneira comum de concatenar strings no MySQL. Por exemplo:
```sql
SELECT CONCAT('Olá', ' ', 'Mundo') AS saudacao;
```