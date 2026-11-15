SELECT id_titulo, valor_movimentado, COUNT(*) AS qtd,
       COUNT(DISTINCT id_conta) AS contas, COUNT(DISTINCT id_meio_pagamento) AS meios
FROM movimentacao_bancaria
GROUP BY id_titulo, valor_movimentado HAVING COUNT(*) > 1;
