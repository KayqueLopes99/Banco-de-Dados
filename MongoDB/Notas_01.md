## MongoDB (O Sistema de Gerenciamento de Banco de Dados)
- O MongoDB é um banco de dados NoSQL (Not Only SQL) orientado a documentos. Diferente dos bancos relacionais, ele não guarda dados em tabelas com colunas fixas.
- **NoSQL**: Desempenho, escalabilidade e flexibilidade.
- *Formato json*.
- Uma unica consulta retorna o documento completo.

- **Orientado a Documentos**: Os dados são armazenados em BSON (Binary JSON). Na prática, você visualiza objetos JSON. Isso facilita a integração com o backend (como Java ou Node.js), pois o "documento" no banco mapeia quase diretamente para o "objeto" no código, reduzindo a necessidade de ORMs complexos.

- **Schema-less (Esquema Flexível)**: Você não precisa definir a estrutura dos dados antes de inserir. Um documento pode ter um campo "telefone" e o próximo documento na mesma coleção não ter. Isso é ideal para desenvolvimento ágil e dados que mudam com frequência.

> Hierarquia de Dados:
> **Database**: O banco de dados em si.
> **Collection**: Equivalente a uma Tabela no SQL.
> **Document**: Equivalente a uma Linha (row) ou registro no SQL.


- Documentos: Dados em Json, guardado como binário.
- Consultas com Váriavel db global.

- **Escalabilidade Horizontal (Sharding)**: Projetado para sistemas distribuídos. Ele consegue dividir os dados em vários servidores facilmente para lidar com grandes volumes de tráfego (Big Data).

### 2. **MongoDB Compass (A Interface Gráfica / GUI)**
- O Compass é a ferramenta oficial de interface visual para interagir com o MongoDB. Pense nele como o equivalente ao "MySQL Workbench" ou "DBeaver", mas para Mongo.

- **Visualização de Dados**: Permite navegar pelas collections e ver os documentos de forma interativa, sem precisar digitar comandos no terminal (Mongo Shell).

- **Construção de Queries (Visual Query Builder)**: Você pode montar consultas (filtros) clicando em campos, o que ajuda muito a entender a sintaxe de busca do Mongo (como $match, $project) antes de passar para o código.

- **Análise de Performance**: Possui uma aba de "Explain Plan" visual, que mostra se sua consulta está lenta e se está utilizando os índices corretamente (essencial para otimização).

- **Validação de Schema**: Embora o Mongo seja schema-less, o Compass permite analisar a tipagem dos dados existentes para encontrar inconsistências (ex: um campo que é string em 90% dos documentos e int em 10%).

-  **Modelo Orientado a Agregados**: Em vez de realizar inúmeros Joins para unir tabelas e formar uma informação completa, os dados relacionados são armazenados juntos em um único documento. Assim, ao buscar pelo ID, você recupera a estrutura inteira de uma só vez.

### Resumo da Relação
- MongoDB é o motor (o server que armazena e processa os dados).
- Compass é o painel de controle (o client que você usa para ver o que está acontecendo lá dentro).

> Clusters
- É um conjunto de servidores interconectados que operam como um sistema único, distribuindo dados e processamento para garantir alta disponibilidade e escalabilidade automática.