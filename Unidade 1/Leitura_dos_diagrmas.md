## Diagrama / Leitura - **Entidade-Relacionamento** (ER):

```
Entidade A - (1,N) --- <RELACIONA> ---- (1,N) --- Entidade B
```


### 1. **Entidade A** e **Entidade B**:
- **Entidade A** e **Entidade B** são duas entidades no seu modelo de dados. Essas entidades podem ser tabelas no banco de dados, por exemplo, e representam elementos ou objetos do sistema.

### 2. **(1, N)** - Cardinalidade:
- **(1, N)** indica a **cardinalidade** do relacionamento. Essa cardinalidade descreve quantas instâncias de uma entidade podem ser associadas a quantas instâncias da outra entidade. Vamos analisar isso em duas partes:
  - **(1, N)** ao lado da **Entidade A** significa que **para cada instância da Entidade A**, pode haver **múltiplas instâncias** de **Entidade B** associadas a ela. Ou seja, uma instância de A pode estar relacionada a várias instâncias de B, mas cada instância de A está relacionada a, no máximo, uma instância de B.
  - **(1, N)** ao lado da **Entidade B** significa que **para cada instância da Entidade B**, pode haver **múltiplas instâncias** da **Entidade A** associadas a ela. Ou seja, uma instância de B pode ter várias instâncias de A relacionadas, mas cada instância de B está relacionada a, no máximo, uma instância de A.

### 3. **Relacionamento**:
- O relacionamento indicado como **<RELACIONA>** é a associação ou a ligação entre as duas entidades. Ele pode ter um nome, como **"Realiza"**, **"Pertence"**, **"Possui"**, etc., dependendo do contexto do sistema. Esse relacionamento é o que define como as duas entidades estão conectadas entre si.

### 4. **Leitura Completa**:
A leitura do diagrama seria a seguinte:

- **Entidade A** e **Entidade B** estão **relacionadas** por um relacionamento de **1 para N**. Isso significa que, para cada instância de **Entidade A**, pode existir **várias instâncias de Entidade B** associadas a ela. E, para cada instância de **Entidade B**, pode existir **várias instâncias de Entidade A** associadas a ela. Isso pode ser descrito com frases como:

  - "Uma instância de **Entidade A** pode se relacionar com várias instâncias de **Entidade B**."
  - "Uma instância de **Entidade B** pode se relacionar com várias instâncias de **Entidade A**."

### Exemplo Prático:

Vamos imaginar um exemplo com **Aluno** e **Estágio**:

- **Aluno (1, N) --- <Realiza> --- (1, N) --- Estágio**
  
Isso pode ser lido assim:
- Cada **Aluno** pode ter **vários Estágios** (relacionamento de 1 para N).
- Cada **Estágio** pode ser realizado por **vários Alunos** (relacionamento de 1 para N).

Ou seja, um aluno pode realizar vários estágios, e um estágio pode envolver múltiplos alunos, dependendo do contexto do estágio.

### Visualizando no Diagrama:
Aqui está uma representação do relacionamento para entender melhor o conceito de cardinalidade:

```
       +------------------+     <Realiza>    +------------------+
       |      Aluno       |----------------->|      Estágio     |
       |------------------|                   |------------------|
       | ID_Aluno (PK)    |                   | ID_Estagio (PK)  |
       | Nome             |                   | Data_Inicio      |
       +------------------+                   | Data_Termino     |
                                             +------------------+
```

- **(1,N)** próximo a **Aluno** indica que **um aluno pode realizar vários estágios**.
- **(1,N)** próximo a **Estágio** indica que **um estágio pode ter vários alunos**.

### Conclusão:
O diagrama **1:N** indica que há um relacionamento **muitos para muitos** entre as duas entidades, mediado pela chave primária da primeira entidade (no caso, **Aluno**) e pela chave estrangeira da segunda entidade (no caso, **Estágio**). A cardinalidade **(1,N)** em ambos os lados sugere que cada instância de uma entidade pode estar associada a várias instâncias da outra.