
### Tipos de Dados Comuns em SQL

| Categoria | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| **Numéricos Exatos** | `INT` ou `INTEGER` | Armazena números inteiros. O tamanho pode variar (`TINYINT`, `SMALLINT`, `BIGINT`). |
| | `DECIMAL(p, s)` | Armazena números com precisão e escala fixas. Ideal para valores monetários. `p` é o total de dígitos e `s` é o número de dígitos após a vírgula. |
| | `NUMERIC(p, s)` | Similar ao `DECIMAL`. Usado para dados numéricos exatos. |
| | `BIT` ou `BOOLEAN` | Armazena um valor de bit (0, 1) ou um booleano (`TRUE`, `FALSE`). Nem todos os SGBDs possuem o tipo `BOOLEAN` nativo, usando `BIT` em seu lugar. |
| **Numéricos Aproximados**| `FLOAT(n)` | Armazena números de ponto flutuante (aproximados). Usado para números reais e cálculos científicos. `n` define a precisão. |
| | `REAL` | Um tipo de ponto flutuante de precisão simples. |
| | `DOUBLE PRECISION`| Um tipo de ponto flutuante de precisão dupla, com mais capacidade que o `FLOAT` e o `REAL`. |
| **Texto (Strings)** | `CHAR(n)` | String de **tamanho fixo**. Se o texto inserido for menor que `n`, o restante é preenchido com espaços. Use para dados com tamanho previsível (ex: Siglas de estados 'UF' como `CHAR(2)`). |
| | `VARCHAR(n)` | String de **tamanho variável** com um limite máximo `n`. Ocupa apenas o espaço dos caracteres inseridos. É o tipo mais comum para textos. |
| | `TEXT` | Armazena strings longas de tamanho variável, sem a necessidade de especificar um limite máximo (embora exista um limite do sistema). Para textos muito grandes. |
| **Data e Hora** | `DATE` | Armazena uma data (ano, mês e dia). Formato comum: `YYYY-MM-DD`. |
| | `TIME` | Armazena uma hora (hora, minuto e segundo). Formato comum: `HH:MI:SS`. |
| | `DATETIME` | Armazena a combinação de data e hora. |
| | `TIMESTAMP` | Armazena data e hora. Frequentemente é atualizado automaticamente quando uma linha é modificada. Usado para rastrear alterações e pode incluir informações de fuso horário. |
| | `YEAR` | Armazena um ano em formato de 2 ou 4 dígitos. (Mais comum em MySQL). |
| **Binários** | `BINARY(n)` | Armazena dados binários de **tamanho fixo**. Similar ao `CHAR`, mas para bytes. |
| | `VARBINARY(n)` | Armazena dados binários de **tamanho variável**. Similar ao `VARCHAR`, mas para bytes. |
| | `BLOB` | **Binary Large Object**. Usado para armazenar grandes quantidades de dados binários, como imagens, áudio ou outros tipos de arquivos. |

---

Este quadro pode ser copiado e colado diretamente em qualquer editor que suporte Markdown.