## Diagrama / Leitura - **Entidade-Relacionamento** (ER):

```
Entidade A - (1,N) --- <RELACIONA> ---- (1,N) --- Entidade B
```

- "Uma instância de **Entidade A** pode se relacionar com várias instâncias de **Entidade B**."
- "Uma instância de **Entidade B** pode se relacionar com várias instâncias de **Entidade A**."

### Exemplo:

Vamos imaginar um exemplo com **Aluno** e **Estágio**:

- **Aluno (1, N) --- <Realiza> --- (1, N) --- Estágio**
  
Isso pode ser lido assim:
- Cada **Aluno** pode ter **vários Estágios** (relacionamento de 1 para N).
- Cada **Estágio** pode ser realizado por **vários Alunos** (relacionamento de 1 para N).

Ou seja, um aluno pode realizar vários estágios, e um estágio pode envolver múltiplos alunos, dependendo do contexto do estágio.

- **(1,N)** próximo a **Aluno** indica que **um aluno pode realizar vários estágios**.
- **(1,N)** próximo a **Estágio** indica que **um estágio pode ter vários alunos**.



### Exemplo:
```
Aluno - (0, n) --- <Realiza> --- (1,n) --- Empréstimo
```
> Isso quer dizer: 

**Cada empréstimo N deve estar relacionado a exatamente 1 aluno**

**cada aluno pode ter feito 0 nenhum, um ou vários N empréstimos**.


> "Cada instância da **Entidade A** participa de forma obrigatória e única do relacionamento, enquanto cada instância da **Entidade B** pode participar zero ou várias vezes."

