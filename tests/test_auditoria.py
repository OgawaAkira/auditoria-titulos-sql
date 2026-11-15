from auditar import rodar_auditoria

def test_movimentacao_orfa():
    assert rodar_auditoria()['A1_movimentacao_orfa']['id_movimentacao'].tolist() == [8]

def test_pagamento_acima_do_titulo():
    assert rodar_auditoria()['A2_total_acima_do_titulo']['id_titulo'].tolist() == [5]
