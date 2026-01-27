## 2FN: 2ª Forma Normal
- Baseada no conceito de dependência funcional total e parcial. Uma relação está na 2FN se: 
> O principal objetivo da 2FN é eliminar a dependência funcional parcial. Isso significa que, se você tem uma chave primária composta (formada por duas ou mais colunas), nenhum atributo que não seja parte da chave pode depender de apenas uma parte dessa chave. Ele tem que depender de toda a chave primária.

> Todas as colunas devem conter valores atômicos.

- **Estiver na 1FN e cada atributo não-chave for dependente ``total`` da chave primaria, todos os atributos não-chave, não podem ser parcialmente dependentes da chave primária.**

- Em tabelas com PK composta, se o atributo depender apenas de parte da PK, então esse atributo deve ser alocado em uma nova tabela.
### Dica
---
## Entendendo a 2ª Forma Normal (2FN)

A **2ª Forma Normal (2FN)** é o segundo passo no processo de normalização do seu banco de dados. O principal objetivo da 2FN é **eliminar a dependência funcional parcial**. Isso significa que, se você tem uma chave primária composta (formada por duas ou mais colunas), nenhum atributo que não seja parte da chave pode depender de *apenas uma parte* dessa chave. Ele tem que depender de *toda* a chave primária.

---

### Pré-requisito: Você precisa estar na 1ª Forma Normal (1FN)

Antes de sequer pensar na 2FN, sua tabela já precisa estar na **1ª Forma Normal (1FN).
---

### Processo de normalização para 2FN:
- Deve-se identificar os atributos que não são funcionalmente dependentes de toda a chave primária.
- Deve-se remover da entidade/tabela todos esses atributos identificados e alocar os mesmos em uma nova entidade/tabela.
- A chave primária da nova entidade será o atributo do qual os atributos removidos são funcionalmente dependentes.


