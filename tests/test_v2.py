import pytest
from sqlalchemy import text
from sqlalchemy.exc import DBAPIError, IntegrityError
from auditar import engine

def test_baixa_de_pessoa_diferente_e_rejeitada():
    with engine.connect() as con:
        trans = con.begin()
        con.execute(text("INSERT INTO v2.titulo VALUES (1,10,'P','x','2026-01-01',100)"))
        con.execute(text("INSERT INTO v2.movimentacao_bancaria VALUES (1,1,1,20,'2026-01-02',100)"))
        with pytest.raises(IntegrityError):
            con.execute(text("INSERT INTO v2.baixa_titulo VALUES (1,1,10,100)"))
        trans.rollback()

def test_soma_das_baixas_deve_fechar_com_a_movimentacao():
    with engine.connect() as con:
        trans = con.begin()
        con.execute(text("INSERT INTO v2.titulo VALUES (2,10,'P','y','2026-01-01',100)"))
        con.execute(text("INSERT INTO v2.movimentacao_bancaria VALUES (2,1,1,10,'2026-01-02',100)"))
        con.execute(text("INSERT INTO v2.baixa_titulo VALUES (2,2,10,60)"))
        with pytest.raises(DBAPIError):
            trans.commit()
