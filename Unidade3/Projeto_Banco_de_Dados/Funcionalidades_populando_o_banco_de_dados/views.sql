
-- views 1 
CREATE VIEW vw_clientes_telefones AS
SELECT c.idcliente, c.nomecliente, c.email, t.telefone
FROM cliente c
LEFT JOIN telefonescliente t ON c.idcliente = t.iddocliente;
-- views 2
CREATE VIEW vw_jogos_publicadores AS
SELECT j.idjogo, j.nomejogo, j.anopublicacao, j.precounidade, p.nomepublicador
FROM jogos j
JOIN publicador p ON j.iddopublicador = p.idpublicador;
-- views 3 

CREATE VIEW vw_jogos_genero AS
SELECT j.nomejogo, g.nomegenero
FROM jogos j
JOIN generojogos gj ON j.idjogo = gj.iddojogo
JOIN genero g ON g.idgenero = gj.iddogenero;


-- views 4
CREATE VIEW vw_compras_clientes AS
SELECT co.idcompra, co.valortotal, co.datacompra, co.observacoes,
       c.nomecliente, c.email
FROM compra co
JOIN cliente c ON co.iddocliente = c.idcliente;