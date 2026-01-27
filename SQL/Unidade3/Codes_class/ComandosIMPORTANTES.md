
###  1. Salvando o Código SQL

O código SQL que você escreve (como `CREATE TABLE`, `INSERT`, etc.) pode ser salvo como um arquivo `.sql` para uso posterior.

#### Passos:

1. No menu superior, clique em **File > Save Script As...**
2. Escolha um nome, como `meu_script.sql`
3. Selecione uma pasta do seu computador para salvar.
4. Clique em **Salvar**.

> 💡 Isso salva **o texto do script**, **não o banco de dados** em si.

---

### 2. Executando o Código SQL

Para que as tabelas sejam **criadas de fato** no banco de dados, é necessário **executar o script**.

#### Ícone de execução:

* Clique no botão **⚡ (ícone de raio)** no topo do editor de código.
* Esse botão executa **todo o código selecionado** ou **todo o script** se nada estiver selecionado.

#### Observações:

* Você pode executar **uma tabela por vez**, selecionando apenas o trecho do código desejado.
* Se tentar criar uma tabela que depende de outra (com `foreign key`), **a tabela referenciada precisa ser criada antes**.

---

### ✅ 3. Visualizando o Banco de Dados e Tabelas

Após criar suas tabelas com sucesso, você pode **visualizá-las** pelo painel lateral esquerdo.

#### Passos:

1. Vá até o painel **"Navigator > SCHEMAS"**
2. Encontre seu banco, por exemplo `exercicio`
3. Se ele **não aparecer**, clique com o botão direito e selecione **Refresh All**
4. Clique no nome do banco, depois em:

   * **Tables** para ver as tabelas criadas
   * **Views**, **Stored Procedures** etc., se existirem

---

### ✅ 4. Exportando o Banco de Dados (backup)

Isso serve para **salvar o banco inteiro** com estrutura e dados.

#### Passos:

1. No menu, vá em **Server > Data Export**
2. Selecione o banco desejado (ex: `exercicio`)
3. Marque:

   * ✅ **Dump Structure and Data**
4. Escolha a pasta de destino
5. Clique em **Start Export**

> 💾 Isso gera arquivos `.sql` com todas as tabelas e dados.

---

### ✅ 5. Importando um Banco de Dados (restaurar backup)

Para recuperar um banco salvo anteriormente:

#### Passos:

1. Vá em **Server > Data Import**
2. Escolha:

   * **Import from Dump Project Folder** se salvou como pasta
   * ou **Import from Self-Contained File** se salvou um `.sql` só
3. Escolha o arquivo ou pasta do backup
4. Clique em **Start Import**

---

* Use `SHOW DATABASES;` para listar bancos existentes.
* Use `USE nome_do_banco;` para trabalhar dentro de um banco.
* Se alguma tabela não for criada, verifique a ordem (ex: `disciplinas` depende de `professores` e `departamentos`).

