## DCL (Data Control Language) 
- DCL é utilizada para controlar acessos e permissões dentro do banco de dados, garantindo a segurança.

> CREATE USER
- Criar um Usuário: Define uma nova conta de usuário para o MySQL.

```sql
CREATE USER 'novo_usuario'@'localhost' IDENTIFIED BY 'senha_forte_123';
```
- `'localhost'` indica que o usuário só pode se conectar a partir do próprio servidor.


> GRANT SELECT
- Conceder Permissões a um Usuário: Atribui privilégios específicos a um usuário.

```sql
GRANT SELECT, INSERT ON minha_loja.produtos TO 'novo_usuario'@'localhost';
```
- Permite que `'novo_usuario'` apenas selecione e insira dados na tabela `produtos` do banco de dados `minha_loja`.

> REVOKE
- Revogar Permissões de um Usuário: Remove privilégios concedidos anteriormente.

```sql
REVOKE INSERT ON minha_loja.produtos FROM 'novo_usuario'@'localhost';
```
- Remove a permissão de inserção de dados da tabela `produtos` para `'novo_usuario'`.

> DROP USER
- Remover um Usuário: Exclui uma conta de usuário do MySQL.
```sql
DROP USER 'novo_usuario'@'localhost';
```