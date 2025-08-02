## DDL (Data Definition Language)
- É o esqueleto onde os dados são armazenados.
- *DDL é usada para definir, modificar e excluir a estrutura do banco de dados, incluindo esquemas, tabelas, índices e outras estruturas.*

---
### 0.1 (Criação de Estruturas)
> CREATE
- Criar um Banco de Dados: Inicia um novo espaço para armazenar dados.
* **Sintaxe:**
```sql
CREATE DATABASE nome_do_banco_de_dados;
```
* **Exemplo:**
```sql
CREATE DATABASE VendasDB;
```

> USE 
- Usar um Banco de Dados: Seleciona o banco de dados ativo para as próximas operações. 
* **Sintaxe:**
```sql
USE nome_do_banco_de_dados_que_sera_usada;
```
* **Exemplo:**
```sql
USE VendasDB;
```

> CREATE TABLE
- Criar uma Tabela: Define as colunas e tipos de dados que uma tabela irá conter.
-  Ele constrói uma nova tabela, especificando suas colunas e os tipos de dados de cada coluna.

* **Sintaxe:**
    ```sql
    CREATE TABLE nome_da_tabela (
        nome_da_coluna1 tipo_de_dado REGRAS_DA_COLUNA,
        nome_da_coluna2 tipo_de_dado REGRAS_DA_COLUNA,
        ...
        CONSTRAINT nome_da_restricao TIPO_DE_RESTRICAO (coluna(s))
    );
    ```

> CONSTRAINT é opcional e pode ser usado para definir restrições adicionais, como chaves estrangeiras.
> DEFAULT é usado para definir um valor padrão para uma coluna, caso nenhum valor seja fornecido durante a inserção de dados.
> AUTO_INCREMENT é usado para colunas que devem ter valores únicos gerados automaticamente, como IDs.

- **`REGRAS_DA_COLUNA`** podem incluir `NOT NULL` (não pode ser nulo), `UNIQUE` (valor único), `PRIMARY KEY` (chave primária), `FOREIGN KEY` (chave estrangeira), entre outras.

  * **Exemplo:**
  

```sql
    CREATE TABLE Clientes (
        ID INT PRIMARY KEY,
        Nome VARCHAR(100) NOT NULL,
        Email VARCHAR(100) UNIQUE,
        DataCadastro DATE DEFAULT GETDATE()
    );

    CREATE TABLE produtos (
      id INT PRIMARY KEY AUTO_INCREMENT, -- Chave primária que incrementa automaticamente
      nome VARCHAR(100) NOT NULL, -- Nome do produto, não pode ser nulo
      preco DECIMAL(10, 2), -- Preço com 2 casas decimais
      estoque INT DEFAULT 0 -- Quantidade em estoque, padrão 0
);
```



### 0.2 (Modificação de Estruturas)
> ALTER (Alterar)
- Modificar uma Tabela (Adicionar uma Coluna): Inclui uma nova coluna na tabela existente.
- Você pode adicionar, remover ou modificar colunas em uma tabela, ou alterar outros atributos.

> **`ALTER TABLE ... ADD COLUMN`**

Adiciona uma nova coluna a uma tabela existente.

  * **Sintaxe:**
    ```sql
    ALTER TABLE nome_da_tabela
    ADD nome_da_coluna tipo_de_dado;
    -- Ou
    ADD COLUMN nome_da_coluna tipo_de_dado;
    ```
  * **Exemplo:**
    Vamos adicionar uma coluna `Telefone` à nossa tabela `Clientes`.
    ```sql
    ALTER TABLE Clientes
    ADD Telefone VARCHAR(20);

    ALTER TABLE produtos
    ADD COLUMN descricao TEXT; -- Adiciona uma coluna 'descricao' do tipo TEXT

    ```



> **`ALTER TABLE ... MODIFY COLUMN / ALTER COLUMN`**
- Modificar uma Tabela (Modificar Tipo de Coluna): Altera o tipo de dado ou outras propriedades de uma coluna existente.

* **Sintaxe (Ex: SQL Server/PostgreSQL):**
    ```sql
    ALTER TABLE nome_da_tabela
    ALTER COLUMN nome_da_coluna novo_tipo_de_dado;
    ```
* **Exemplo:**
    Vamos aumentar o tamanho do campo `Nome` na tabela `Clientes`.
    ```sql
    ALTER TABLE Clientes
    ALTER COLUMN Nome VARCHAR(150);

    ALTER TABLE produtos
    MODIFY COLUMN preco DECIMAL(12, 2); -- Altera o 'preco' para ter 12 dígitos no total, 2 após a vírgula

    ```

- Modificar uma Tabela (Renomear uma Coluna): Muda o nome de uma coluna existente.
* **Exemplo:**
```sql
ALTER TABLE produtos
CHANGE COLUMN nome nome_produto VARCHAR(100); -- Renomeia 'nome' para 'nome_produto'
```


### 0.3 Exclusão de Estruturas
- O comando `DROP` é usado para remover completamente um objeto do banco de dados. **Use com extremo cuidado**, pois a remoção é permanente e todos os dados contidos no objeto (como uma tabela) são perdidos.

> **`ALTER TABLE ... DROP COLUMN`**
- Remover uma Coluna: Exclui uma coluna específica de uma tabela.

  * **Sintaxe:**
    ```sql
    ALTER TABLE nome_da_tabela
    DROP COLUMN nome_da_coluna;
    ```
  * **Exemplo:**
    Vamos remover a coluna `Telefone` que acabamos de adicionar.
    ```sql
    ALTER TABLE Clientes
    DROP COLUMN Telefone;


    ALTER TABLE produtos
    DROP COLUMN descricao; -- Remove a coluna 'descricao'
    ```

> **`DROP TABLE`**
- Remover uma Tabela: Deleta a tabela inteira e todos os seus dados.
* **Sintaxe:**
    ```sql
    DROP TABLE nome_do_banco_de_dados;
    ```
* **Exemplo:**
    ```sql
    DROP TABLE produtos;
    ```



> **`DROP DATABASE`**
- Remover um Banco de Dados: Exclui o banco de dados completo e todas as suas tabelas e dados.

  * **Sintaxe:**
    ```sql
    DROP DATABASE nome_do_banco_de_dados;
    ```
  * **Exemplo:**
    ```sql
    DROP DATABASE VendasDB;
    ```


### 0.4 `TRUNCATE` (Truncar/Limpar)

- Remove todas as linhas (registros) de uma tabela, mas a estrutura da tabela (colunas, restrições, etc.) permanece intacta.


* **Sintaxe:**

    ```sql
    TRUNCATE TABLE nome_da_tabela;
    ```

* **Exemplo:**
    Vamos supor que nossa tabela `Clientes` está cheia de dados de teste e queremos limpá-la para começar a inserir dados reais, mas sem apagar a tabela em si.

    ```sql
    TRUNCATE TABLE Clientes;
    ```