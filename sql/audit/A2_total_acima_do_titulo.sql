SELECT t.id_titulo, t.descricao, t.valor_titulo, SUM(m.valor_movimentado) AS total_movimentado
FROM titulo t JOIN movimentacao_bancaria m ON m.id_titulo = t.id_titulo
GROUP BY t.id_titulo, t.descricao, t.valor_titulo
HAVING SUM(m.valor_movimentado) > t.valor_titulo;
