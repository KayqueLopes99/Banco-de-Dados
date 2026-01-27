-- Índices para melhorar JOINs e WHERE
CREATE INDEX idx_aluguel_cliente ON aluguel(iddocliente);
CREATE INDEX idx_compra_cliente ON compra(iddocliente);
CREATE INDEX idx_carrinho_compra ON carrinho(iddacompra);
CREATE INDEX idx_carrinho_aluguel ON carrinho(iddoaluguel);
CREATE INDEX idx_telefone_cliente ON telefonescliente(iddocliente);
CREATE INDEX idx_jogos_publicador ON jogos(iddopublicador);
CREATE INDEX idx_itenscarrinho_carrinho ON ItensCarrinho(iddocarrinho);
CREATE INDEX idx_itenscarrinho_jogo ON ItensCarrinho(iddojogo);
CREATE INDEX idx_generojogos_jogo ON generojogos(iddojogo);
CREATE INDEX idx_generojogos_genero ON generojogos(iddogenero);
