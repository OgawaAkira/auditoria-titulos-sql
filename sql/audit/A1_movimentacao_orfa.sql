SELECT m.* FROM movimentacao_bancaria m
LEFT JOIN titulo t ON t.id_titulo = m.id_titulo
WHERE t.id_titulo IS NULL;
