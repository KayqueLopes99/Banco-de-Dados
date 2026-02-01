### MongoDB CRUD Operations (Operações Básicas)

| Comando (Tipo) | Sintaxe / Método | Exemplo de Uso | Explicação |
| --- | --- | --- | --- |
| **Create** (Inserir Único) | `db.colecao.insertOne()` | `db.users.insertOne({ nome: "Ana", idade: 25 })` | Adiciona **um único** documento novo à coleção. Se a coleção não existir, ela será criada automaticamente. |
| **Create** (Inserir Vários) | `db.colecao.insertMany()` | `db.users.insertMany([{ nome: "Leo" }, { nome: "Bia" }])` | Adiciona **múltiplos** documentos de uma vez, passando uma lista (array) de objetos. |
| **Read** (Ler / Consultar) | `db.colecao.find()` | `db.users.find({ idade: { $gt: 18 } })` | Recupera documentos da coleção. Aceita filtros (critérios) para selecionar quais documentos retornar. Se vazio, retorna tudo. |
| **Update** (Atualizar Único) | `db.colecao.updateOne()` | `db.users.updateOne({ nome: "Ana" }, { $set: { ativa: true } })` | Modifica apenas o **primeiro** documento encontrado que corresponda ao filtro especificado. |
| **Update** (Atualizar Vários) | `db.colecao.updateMany()` | `db.users.updateMany({ idade: { $lt: 18 } }, { $set: { status: "menor" } })` | Modifica **todos** os documentos que correspondam ao critério do filtro. Ideal para alterações em massa. |
| **Update** (Substituir) | `db.colecao.replaceOne()` | `db.users.replaceOne({ nome: "Leo" }, { nome: "Leonardo", xp: 10 })` | Substitui o documento inteiro por um novo, mantendo apenas o `_id` original intacto. |
| **Delete** (Remover Único) | `db.colecao.deleteOne()` | `db.users.deleteOne({ status: "inativo" })` | Remove apenas o **primeiro** documento que corresponder ao filtro. Útil para limpezas pontuais. |
| **Delete** (Remover Vários) | `db.colecao.deleteMany()` | `db.users.deleteMany({ ano: 2020 })` | Remove **todos** os documentos que correspondam ao filtro. Cuidado: sem filtro, apaga tudo da coleção. |


### Ligar o banco
## Execução no Windows (Prompt de Comando)

Para rodar o banco de dados manualmente via terminal, siga estes passos:

### 1. Navegar até a pasta do MongoDB
Abra o CMD e entre no diretório onde o executável está instalado:
```cmd
cd "C:\Program Files\MongoDB\Server\8.2\bin"

```

### 2. Iniciar o servidor (mongod)
Execute o comando abaixo para subir o serviço do banco de dados:

```cmd
mongod

```
> **Nota:** Mantenha esta janela do terminal aberta. Se fechá-la, o banco de dados será desligado.

### 3. Acessar o Shell (mongosh)
Abra um **novo terminal** e execute o comando para interagir com o banco:

```cmd
"C:\Program Files\MongoDB\Server\8.2\bin\mongosh.exe"

```
- Ligue o mongoComprass para acompanhamento.
---