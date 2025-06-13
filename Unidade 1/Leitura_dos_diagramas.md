## Processo avaliativo:
- Questões objetivas.
- 1 Questão da atividade anterior
- Modelo conceitual e textual.
- Questões de conceito e definição do slide.
- Racha Cuca - TREINO!

## Diagrama / Leitura - **Entidade-Relacionamento** (ER):
- Para construção do Diagrama
- Leitura: 1.Entidade, 2.relacionamento, 3.Cardinalidade. 
- Escrita snake_case dos nomes dos atributos e etc.
- Evite entidade associativa.
- Em relacionamento pode exixtir pk artificial.

- Não envolver regras de negocio no modelo conceitual. 
- Entidade sem atributo não entra. 
- Padrão id por entidade.

Um Aluno (entidade) matricula-se (relacionamento) em Curso (entidade) com cardinalidade 1:N (um aluno pode se matricular em vários cursos, mas um curso pode ter vários alunos).

> Aluno - (1,n) --- <Matricula-se> --- (1,n) --- Curso

> **1. Entidade** – **2. Relacionamento** – **3. Cardinalidade**

---

### Exemplo:

```
Entidade A --- (1,1) <RELACIONA> (1,N) --- Entidade B
```

### Leitura correta no seu formato:

* Cada **Entidade A** está associada a **exatamente um ou vários** registros de **Entidade B**.
* Cada **Entidade B** está associada a **um único** registro de **Entidade A**.

---

### Outro exemplo:

```
Aluno --- (1,N) <Matricula-se> (1,N) --- Curso
```

### Leitura:

* Cada **Aluno** está associado a **um ou vários** registros de **Curso**.
* Cada **Curso** está associado a **um ou vários** registros de **Aluno**.

---
