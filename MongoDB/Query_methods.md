### 1. Estratégias de Resolução de Consultas
Como o Spring decide o que executar.

* **CREATE (Derivação Automática):**
Você apenas escreve a assinatura, sem anotações. O Spring "se vira" para montar o SQL.
```java
// O Spring gera: SELECT * FROM produto WHERE preco > ?
List<Produto> findByPrecoGreaterThan(Double preco);

```


* **USE_DECLARED_QUERY (Manual):**
Você obriga o Spring a usar sua query. Se ele não achar o `@Query`, dá erro.
```java
// O Spring ignora o nome do método e usa apenas o HQL/SQL escrito abaixo
@Query("SELECT p FROM Produto p WHERE p.descricao LIKE %:texto%")
List<Produto> buscarDescricaoPersonalizada(String texto);

```


* **CREATE_IF_NOT_FOUND (Padrão):**
É o que acontece na maioria dos projetos. Você não precisa configurar nada. Se você colocar um `@Query`, ele usa. Se não colocar, ele tenta derivar pelo nome.

---

### 2. Anatomia de um Query Method

Entendendo as partes do nome.

* **Subject (Assunto - Ação):**
É o começo da frase. Exemplos:
* `find...` (Buscar)
* `count...` (Contar quantos existem)
* `exists...` (Verificar se existe, retorna true/false)
* `delete...` (Deletar)
* Modificadores: `findDistinct...` (Sem repetidos), `findTop3...` (Só os 3 primeiros).


* **Predicate (Predicado - Critérios):**
É o resto da frase após o **By**. Exemplos:
* `...ByNome` (Onde nome igual a...)
* `...ByIdadeGreaterThan` (Onde idade maior que...)
* `...ByAtivoTrue` (Onde ativo é verdadeiro)



**Exemplo completo unindo os dois:**

```java
// Subject: findTop10 (Buscar os top 10)
// Separador: By
// Predicate: DataPedidoAfter (Data do pedido for depois de...)
List<Pedido> findTop10ByDataPedidoAfter(LocalDate data);

```

---

### 3. Nomes Reservados e Conflitos de ID

Esse é um erro comum ("pegadinha").

Imagine esta classe onde a chave primária **não** se chama "id", mas existe outro campo com esse nome:

```java
@Entity
class Usuario {
    @Id
    Long codigoUsuario; // Essa é a chave primária real (PK)

    Long id; // Esse é apenas um código externo ou legada, NÃO é a chave primária
}

```

* **O Erro (Conflito):**
```java
// Como findById é reservado do CrudRepository, o Spring vai buscar pelo 'codigoUsuario' (@Id)
// e ignorar o seu campo 'id'.
Optional<Usuario> findById(Long id);

```


* **A Solução (Nome Descritivo):**
```java
// Ao adicionar "Usuario" no meio, você quebra o padrão reservado.
// Agora o Spring sabe que deve buscar pelo atributo 'id' e não pela PK.
Optional<Usuario> findUsuarioById(Long id);

```



---

### 4. Expressões de Propriedade e Ambiguidade

Como resolver confusões em objetos dentro de objetos.

Cenário: Você tem uma classe `Pessoa`.

1. Ela tem um atributo `String enderecoCep`.
2. Ela também tem um objeto `Endereco endereco` que dentro tem um `String cep`.

Se você criar o método abaixo, o Spring pode se confundir e tentar buscar pelo atributo errado (`enderecoCep` em vez de `endereco.cep`):

```java
// O Spring pode achar que você quer o atributo 'enderecoCep' da raiz.
List<Pessoa> findByEnderecoCep(String cep);

```

**A Solução com Underline (`_`):**
Você usa o `_` para dizer: "Spring, pare aqui. `Endereco` é o objeto, e `Cep` é o campo dentro dele".

```java
// O _ força a navegação: Pessoa -> getEndereco() -> getCep()
List<Pessoa> findByEndereco_Cep(String cep);

```