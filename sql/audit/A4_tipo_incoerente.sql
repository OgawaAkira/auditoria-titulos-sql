SELECT id_titulo, tipo_titulo, descricao FROM titulo
WHERE descricao ILIKE 'Pagamento%' AND tipo_titulo = 'R';
