## DML (Data Manipulation Language)
- DML é utilizada para inserir, atualizar e excluir dados nas tabelas. Ela lida com o conteúdo das estruturas de dados.

### 0.1 Inserção de Dados
> `INSERT INTO`
- Inserir Dados em uma Tabela: Adiciona novas linhas à tabela
- Existem duas maneiras principais de usar o `INSERT INTO`:

> Inserir uma Única Linha

* **Sintaxe:**
    ```sql
    INSERT INTO nome_da_tabela (coluna1, coluna2, coluna3)
    VALUES (valor1, valor2, valor3);
    ```

      * `INSERT INTO nome_da_tabela`: Indica a tabela alvo da inserção.
      * `(coluna1, coluna2, ...)`: Lista as colunas que você irá preencher. A ordem das colunas aqui deve corresponder à ordem dos valores.
      * `VALUES (valor1, valor2, ...)`: Contém os dados a serem inseridos. Cada valor corresponde a uma coluna na lista anterior.

* **Exemplo:**
    ```sql
    INSERT INTO produtos (nome, preco, estoque)
    VALUES ('Camiseta', 29.99, 150);
    ```

> Inserir Múltiplas Linhas
- É possível inserir múltiplas linhas em uma única declaração:
* **Sintaxe:**
    ```sql
    INSERT INTO nome_da_tabela (coluna1, coluna2, coluna3)
    VALUES
        (valor_linha1_col1, valor_linha1_col2, valor_linha1_col3),
        (valor_linha2_col1, valor_linha2_col2, valor_linha2_col3),
        (valor_linha3_col1, valor_linha3_col2, valor_linha3_col3);
    ```

- Pode fornecer uma lista de tuplas (conjuntos de valores entre parênteses), onde cada tupla representa uma nova linha a ser inserida. - As tuplas são separadas por vírgulas.

* **Exemplo :**
    ```sql
    INSERT INTO produtos (nome, preco, estoque)
    VALUES
        ('Calça Jeans', 89.90, 80),
        ('Tênis', 150.00, 50);
    ```
### 0.2 Atualização de Dados
> UPDATE 
- Atualizar Dados Existentes: Modifica os valores de linhas já existentes na tabela.
```sql
UPDATE produtos
SET preco = 35.00 -- Define o novo preço
WHERE nome = 'Camiseta'; -- Para produtos com nome 'Camiseta'
UPDATE produtos
SET estoque = estoque - 10 -- Reduz o estoque em 10 unidades
WHERE id = 2; -- Para o produto com ID 2

```

### 0.3 Exclusão de Dados
> DELETE
- Excluir Dados de uma Tabela: Remove linhas da tabela.
```sql
DELETE FROM produtos
WHERE estoque = 0; -- Remove todos os produtos com estoque igual a zero
DELETE FROM produtos
WHERE id = 3; -- Remove o produto com ID 3

```