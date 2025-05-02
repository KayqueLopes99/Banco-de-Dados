## Modelos de Dados
### Projeto de Banco de Dados
- O projeto de banco de dados (ou database design) é um processo sistemático de definição da estrutura, organização, relações e restrições de um banco de dados.para atender a requisitos específicos de armazenamento, recuperação e manipulação eficiente de dados.

+ *Integridade dos Dados*
- Restrições de Domínio (tipos de dados, formatos).
- Chaves Primárias/Estrangeiras (evitar duplicatas e
inconsistências).
- Regras de Negócio Implementadas (ex.: "um pedido deve
ter um cliente associado").

+ *Desempenho Otimizado*
- Minimizar redundâncias (via normalização) e acelerar
operações através de:
- Índices (para buscas rápidas em tabelas grandes).
- Particionamento (distribuição estratégica de dados).
- Estratégias de Armazenamento (ex.: colunar vs. orientado a linha).

+ *Escalabilidade e Manutenibilidade*
- Projetar esquemas adaptáveis a crescimento de dados e
mudanças nas regras de negócio sem requerer redesign
completo.

+ *Segurança e Controle de Acesso*
- Definir níveis de permissão (ex.: GRANT/REVOKE em
SQL) e mecanismos de criptografia para dados sensíveis.


+ *Modelagem de Banco de Dados*
- A modelagem de dados é um processo sistemático
de abstração e representação formal da estrutura,
organização, relacionamentos e restrições de dados de um
domínio específico.
- criar um esquema coerente que atenda aos requisitos.
- Ponte entre o projeto de banco de dados e a implementação.

+ *Construção de um modelo de dados envolve*:
- **Entidades**
- **Atributos**
- **Relacionamentos**
- **Restrições**

- *Detalhando os componentes*:
+ **Entidades**:
- Representação abstrata de um objeto, conceito ou elemento do mundo real sobre o qual se deseja armazenar informações em um banco de dados. 
- São identificadas por substantivos nas regras de negócio.
- Devem ter identificadores únicos ( futuras chaves primárias).
- Exemplos:
- Em um sistema acadêmico: Aluno, Disciplina, Turma.
- Em uma loja virtual: Cliente, Produto, Pedido.
- Em uma empresa: Cliente, Funcionário, Gerente.

+ **Atributos**:
- propriedades ou características que
descrevem uma entidade. Cada atributo possui
um domínio (tipo de dado e conjunto de valores válidos).
- *Simples vs. Composto*:
• Simples: Não divisível (ex.: CPF).
• Composto: Pode ser subdividido (ex.: Endereço → rua, cidade, CEP).
- *Monovalorado vs. Multivalorado*:
• Monovalorado: Armazena um único valor (ex.: data_nascimento).
• Multivalorado: Permite múltiplos valores (ex.: telefones).
- *Derivado*:
• Calculado a partir de outros atributos
(ex.: idade derivada de data_nascimento).

- **Relacionamentos**:
- Definem associações lógicas entre duas
ou mais entidades, representando interações ou
dependências. São mapeados a partir de verbos nas regras
de negócio.
- *Um pra um (1:1)*
• Uma instância de Entidade A associa-se a no máximo uma instância de Entidade B (ex.: Pessoa CPF).

- *Um pra muitos (1:N)*
• Uma instância de Entidade A associa-se a várias instâncias de Entidade B (ex.: Departamento Funcionário).

- *Muitos pra muitos (N:N)*
• Múltiplas instâncias de ambas as entidades se relacionam
(ex.: Aluno Disciplina).

- *Relacionamentos N:M* exigem tabelas associativas (ex.:
Matricula para Aluno e Disciplina)

- **Cardinalidade**:
- Define a quantidade mínima e máxima de instâncias de uma entidade que podem se associar a outra através de um relacionamento.
- Especificar restrições de integridade.
- Garantir fidelidade às regras de negócio.

- *Um para Um (1:1)*
• Uma instância de A associa-se a exatamente
uma de B (e vice-versa).

- *Um para Muitos (1:N)*
• Uma instância de A associa-se a zero ou mais de B.

- *Muitos para Muitos (N:M)*
• Múltiplas instâncias de A e B podem se relacionar livremente.


- **Restrições**:
- São regras que limitam os valores ou comportamentos dos dados para garantir consistência e integridade. 
- Principais tipos:
- *Restrições de Domínio*
• Define tipos de dados (INT, VARCHAR).
• Validações (CHECK: preço > 0).

- *Chaves*
• Primária (PRIMARY KEY): Identificador único (ex.:
matricula em Aluno).

- *Restrições de Nulidade*
• NOT NULL: Atributo obrigatório.
- *Regras de Negócio*
• Ex.: "Um pedido só pode ser finalizado se o `status =
'pago'"

### Relação entre os Conceitos
- Entidades são "recipientes" de atributos.
- Relacionamentos conectam entidades e podem ter atributos próprios (ex.: data_matricula em AlunoDisciplina).
- Restrições atuam sobre entidades, atributos e relacionamentos para assegurar qualidade dos dados.

+ *Exemplo:*
- Em um sistema hospitalar:
• Entidade Paciente (atributos: id_paciente, nome).
• Relacionamento Consulta (1:N entre Paciente e Médico).
• Restrição: Consulta.data não pode ser anterior à data atual.


+ **Regras de Negócio**:
- Definem as condições e comportamentos esperados do sistema, condição formalmente definida que governa o comportamento dos dados e processos em um domínio específico. 
- Traduz normas organizacionais em estruturas de dados executáveis.
• "Um pedido só pode ser finalizado se o status de pagamento for 'APROVADO'."
- Integridade Operacional
• Define ações válidas entre entidades e atributos.

- Classificação Técnica
• Estrutura da regra (relação ERR, entre Entidade,
Relacionamento, Restrição).
• Condições para execução (se A então B).
• Cálculos ou inferências automáticas (updates).

- Exemplos de Regras de Negócio para uma Escola:
• Um professor só pode lecionar até 5 disciplinas.
• Um aluno só pode se inscrever em até 7 currículos.
• Uma disciplina não pode ter seu código em branco.
• Uma disciplina só pode ser cadastrada com uma ementa
definida.

Entidades: Professor, Disciplina
Relacionamento: Lecionar
Cardinalidade: 1:5 (Um para Cinco), Onde: 5 representa o
limite máximo explícito, impondo uma restrição quantitativa.