CREATE SCHEMA v2;
CREATE TABLE v2.titulo (
  id_titulo INT PRIMARY KEY, id_pessoa INT NOT NULL,
  tipo_titulo CHAR(1) NOT NULL CHECK (tipo_titulo IN ('P','R')),
  descricao VARCHAR(100) NOT NULL, data_vencimento DATE NOT NULL,
  valor_titulo NUMERIC(12,2) NOT NULL CHECK (valor_titulo > 0),
  UNIQUE (id_titulo, id_pessoa));
CREATE TABLE v2.movimentacao_bancaria (
  id_movimentacao INT PRIMARY KEY, id_conta INT NOT NULL, id_meio_pagamento INT NOT NULL,
  id_pessoa INT NOT NULL, data_movimentacao DATE NOT NULL,
  valor_movimentado NUMERIC(12,2) NOT NULL CHECK (valor_movimentado > 0),
  UNIQUE (id_movimentacao, id_pessoa));
CREATE TABLE v2.baixa_titulo (
  id_movimentacao INT NOT NULL, id_titulo INT NOT NULL, id_pessoa INT NOT NULL,
  valor_baixado NUMERIC(12,2) NOT NULL CHECK (valor_baixado > 0),
  PRIMARY KEY (id_movimentacao, id_titulo),
  FOREIGN KEY (id_movimentacao, id_pessoa) REFERENCES v2.movimentacao_bancaria (id_movimentacao, id_pessoa),
  FOREIGN KEY (id_titulo, id_pessoa) REFERENCES v2.titulo (id_titulo, id_pessoa));

CREATE FUNCTION v2.valida_soma_baixas() RETURNS trigger AS $$
DECLARE v_id INT; v_mov NUMERIC; v_soma NUMERIC;
BEGIN
  v_id := COALESCE(NEW.id_movimentacao, OLD.id_movimentacao);
  SELECT valor_movimentado INTO v_mov FROM v2.movimentacao_bancaria WHERE id_movimentacao = v_id;
  SELECT COALESCE(SUM(valor_baixado), 0) INTO v_soma FROM v2.baixa_titulo WHERE id_movimentacao = v_id;
  IF v_mov IS NOT NULL AND v_mov <> v_soma THEN
    RAISE EXCEPTION 'Movimentacao %: soma das baixas (%) difere do valor (%)', v_id, v_soma, v_mov;
  END IF;
  RETURN NULL;
END; $$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER trg_soma_baixas AFTER INSERT OR UPDATE OR DELETE ON v2.baixa_titulo
DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION v2.valida_soma_baixas();
