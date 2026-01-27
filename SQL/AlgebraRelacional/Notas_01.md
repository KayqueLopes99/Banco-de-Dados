## Álgebra Relacional: 
### A Operação de Seleção (σ)
- Sua função é **filtrar as tuplas (linhas) de uma relação (tabela), mantendo apenas aquelas que satisfazem uma determinada condição lógica.**
- Filtra tuplas / linhas
- No sql seria o equivalente ao comando `WHERE`.
#### Sintaxe Geral
```
σ_P(R)
```

Ou em notação matemática:
$$σ_{P}(R)$$

Onde:

  * **`σ`**: É o símbolo que representa a operação de Seleção.
  * **`P`**: É o **predicado**, ou a **condição de seleção**. É uma fórmula lógica que será avaliada como verdadeira ou falsa para cada tupla da relação.
  * **`R`**: É a **relação** (a tabela) da qual as tuplas serão selecionadas.

### Componentes da Condição (Predicado `P`)

O predicado `P` é construído usando os atributos (colunas) da relação e operadores de comparação e lógicos.

  * **Operadores de Comparação:** `=`, `≠`, `<`, `>`, `≤`, `≥`
  * **Operadores Lógicos:** `∧` (E / AND), `∨` (OU / OR), `¬` (NÃO / NOT)

-----

## Exemplo Prático

Vamos usar uma relação de exemplo chamada `Alunos`.

**Relação: `Alunos`**

| ID\_Aluno | Nome | Curso | Media |
| :--- | :--- | :--- | :---: |
| 1 | Ana | Ciência da Computação | 9.5 |
| 2 | Bruno | Engenharia de Software | 7.8 |
| 3 | Carla | Ciência da Computação | 8.2 |
| 4 | Daniel | Sistemas de Informação | 6.9 |
| 5 | Elisa | Engenharia de Software | 8.5 |

-----

### Exemplo 1: Seleção Simples

**Objetivo:** Selecionar todos os alunos do curso de 'Ciência da Computação'.

**Expressão em Álgebra Relacional:**
$$σ_{\text{Curso} = \text{'Ciência da Computação'}}(\text{Alunos})$$

**Explicação:**

1.  A operação $σ$ é aplicada à relação `Alunos`.
2.  Para cada linha, ela verifica a condição `Curso = 'Ciência da Computação'`.
3.  As linhas onde a condição é verdadeira (ID\_Aluno 1 e 3) são incluídas no resultado.

**Resultado:**

| ID\_Aluno | Nome | Curso | Media |
| :--- | :--- | :--- | :---: |
| 1 | Ana | Ciência da Computação | 9.5 |
| 3 | Carla | Ciência da Computação | 8.2 |

-----
### A Operação de projeção (π)
- Sua função é **selecionar colunas específicas de uma relação (tabela), eliminando as colunas que não são necessárias.**
- Seleciona colunas / atributos
- No sql seria o equivalente ao comando `SELECT`.
- Elimina tuplas / linhas duplicadas automaticamente.
#### Sintaxe Geral
```
π_A1, A2, ..., An(R)
```
Ou em notação matemática:
$$π_{A1, A2, ..., An}(R)$$
Onde:

  * **`π`**: É o símbolo que representa a operação de Projeção.
  * **`A1, A2, ..., An`**: São os **atributos** (colunas) que queremos manter na nova relação.
  * **`R`**: É a **relação** (a tabela) da qual as colunas serão projetadas.

- Exemplo:
$$π_{\text{Nome, Curso}}(\text{Alunos})$$
**Resultado:**
| Nome | Curso |
| :--- | :--- |
| Ana | Ciência da Computação |
| Bruno | Engenharia de Software |
| Carla | Ciência da Computação |
| Daniel | Sistemas de Informação |
| Elisa | Engenharia de Software |
-----

### Operação de atribuição (←)
- Sua função é **atribuir o resultado de uma expressão de álgebra relacional a uma nova relação (tabela).**
- Cria uma nova tabela a partir de uma expressão.
#### Sintaxe Geral
```
NewRelation ← Expression
```
Ou em notação matemática:
$$\text{NewRelation} \leftarrow \text{Expression}$$
Onde:

  * **`NewRelation`**: É o nome da nova relação (tabela) que será criada.
  * **`Expression`**: É uma expressão de álgebra relacional que define os dados que serão armazenados na nova relação.
- Exemplo:
$$\text{Alunos\_CS} \leftarrow σ_{\text{Curso}
= \text{'Ciência da Computação'}}(\text{Alunos})$$
**Resultado:**
| ID\_Aluno | Nome | Curso | Media |
| :--- | :--- | :--- | :---: |
| 1 | Ana | Ciência da Computação | 9.5 |
| 3 | Carla | Ciência da Computação | 8.2 |
-----

### Operação de renomeação (ρ)
- Sua função é **renomear uma relação (tabela) ou seus atributos (colunas) para facilitar a referência em expressões subsequentes.**
- Renomeia tabelas ou colunas.
#### Sintaxe Geral
```
ρ_NewName(R) ou ρ_NewName(A1, A2, ..., An)(R)
```
Ou em notação matemática:
$$ρ_{\text{NewName}}(R) \quad \text{ou} \quad ρ_{\text{NewName}}(A1, A2, ..., An)(R)$$
Onde:

  * **`ρ`**: É o símbolo que representa a operação de Renomeação.
  * **`NewName`**: É o novo nome para a relação ou para os atributos.
  * **`A1, A2, ..., An`**: São os novos nomes para os atributos (colunas) da relação.
  * **`R`**: É a relação (tabela) que está sendo renomeada.

- Exemplo:
$$ρ_{\text{Estudantes}}(\text{Alunos})$$
**Resultado:**
| ID\_Aluno | Nome | Curso | Media |
| :--- | :--- | :--- | :---: |
| 1 | Ana | Ciência da Computação | 9.5 |
| 2 | Bruno | Engenharia de Software | 7.8 |
| 3 | Carla | Ciência da Computação | 8.2 |
| 4 | Daniel | Sistemas de Informação | 6.9 |
| 5 | Elisa | Engenharia de Software | 8.5 |
-----

### Operação de união (∪)
- Sua função é **combinar duas relações (tabelas) que possuem o mesmo esquema (mesmos atributos) em uma única relação, contendo todas as tuplas de ambas as relações, eliminando duplicatas.**
- Combina tabelas.
#### Sintaxe Geral
```
R1 ∪ R2
```
Ou em notação matemática:
$$R1 \cup R2$$
Onde:

  * **`∪`**: É o símbolo que representa a operação de União.
  * **`R1`** e **`R2`**: São as duas relações (tabelas) que serão unidas. Ambas devem ter o mesmo esquema (mesmos atributos).
- Exemplo:
$$\text{Alunos\_Engenharia} \leftarrow σ_{\text{Curso} = \text{'Engenharia de Software'}}(\text{Alunos})$$
$$\text{Alunos\_CS} \leftarrow σ_{\text{Curso} = \text{'Ciência da Computação'}}(\text{Alunos})$$
$$\text{Alunos\_Tecnologia} \leftarrow \text{Alunos\_Engenharia} ∪ \text{Alunos\_CS}$$
**Resultado:**  
| ID\_Aluno | Nome | Curso | Media |
| :--- | :--- | :--- | :---: |
| 1 | Ana | Ciência da Computação | 9.5 |
| 2 | Bruno | Engenharia de Software | 7.8 |
| 3 | Carla | Ciência da Computação | 8.2 |
| 5 | Elisa | Engenharia de Software | 8.5 |
----

### Operação de diferença (−)
- Sua função é **obter as tuplas que estão presentes em uma relação (tabela) mas não estão em outra, desde que ambas as relações tenham o mesmo esquema (mesmos atributos).**
- Subtrai tabelas.
#### Sintaxe Geral
```
R1 − R2
```
Ou em notação matemática:
$$R1 - R2$$
Onde:

  * **`−`**: É o símbolo que representa a operação de Diferença.
  * **`R1`** e **`R2`**: São as duas relações (tabelas) envolvidas na operação. Ambas devem ter o mesmo esquema (mesmos atributos).

### Operação de interseção (∩)
- Sua função é **obter as tuplas que são comuns a duas relações (tabelas), ou seja, aquelas que estão presentes em ambas as relações.**
- Intersecta tabelas.
#### Sintaxe Geral
```
R1 ∩ R2
```
Ou em notação matemática:
$$R1 \cap R2$$
Onde:
    * **`∩`**: É o símbolo que representa a operação de Interseção.
    * **`R1`** e **`R2`**: São as duas relações (tabelas) envolvidas na operação. Ambas devem ter o mesmo esquema (mesmos atributos).

- Exemplo:
$$\text{Alunos\_Aprovados} \leftarrow σ_{\text{Media} ≥ 7.0}(\text{Alunos})$$
$$\text{Alunos\_CS} \leftarrow σ_{\text{Curso} = \text{'Ciência da Computação'}}(\text{Alunos})$$
$$\text{Alunos\_CS\_Aprovados} \leftarrow \ \text{Alunos\_Aprovados} ∩ \text{Alunos\_CS}$$
**Resultado:**
| ID\_Aluno | Nome | Curso | Media |
| :--- | :--- | :--- | :---: |
| 1 | Ana | Ciência da Computação | 9.5 |
| 3 | Carla | Ciência da Computação | 8.2 |
-----

### A operação de produto cartesiano (×)
- Sua função é **combinar todas as tuplas (linhas) de uma relação (tabela) com todas as tuplas de outra relação, resultando em uma nova relação que contém todas as combinações possíveis de tuplas das duas relações originais.**

- Combina todas as linhas de duas tabelas.
#### Sintaxe Geral
```
R1 × R2
```
Ou em notação matemática:
$$R1 \times R2$$
Onde:
    * **`×`**: É o símbolo que representa a operação de Produto Cartesiano.
    * **`R1`** e **`R2`**: São as duas relações (tabelas) que serão combinadas.

-----