CREATE TABLE pessoa (id_pessoa INT PRIMARY KEY, tipo_pessoa CHAR(1), nome_pessoa VARCHAR(100), cpf_cnpj VARCHAR(18));
CREATE TABLE conta_bancaria (id_conta INT PRIMARY KEY, nome_banco VARCHAR(50), agencia VARCHAR(10), numero_conta VARCHAR(10));
CREATE TABLE meio_pagamento (id_meio_pagamento INT PRIMARY KEY, nome_meio_pagamento VARCHAR(20));
CREATE TABLE titulo (id_titulo INT PRIMARY KEY, id_pessoa INT, tipo_titulo CHAR(1), descricao VARCHAR(100), data_vencimento DATE, valor_titulo NUMERIC(10,2));
CREATE TABLE movimentacao_bancaria (id_movimentacao INT PRIMARY KEY, id_conta INT, id_titulo INT, id_meio_pagamento INT, data_movimentacao DATE, valor_movimentado NUMERIC(10,2));

INSERT INTO pessoa VALUES (1,'F','Fulano de Tal da Silva','000.000.000-00'),(2,'J','Soluções Tecnológicas Empresariais Ltda.','11.111.111/1111-11'),(3,'J','Distribuidor de Mercadorias Ltda.','22.222.222/2222-22'),(4,'J','Fornecedor de Sistemas Ltda.','33.333.333/3333-33'),(5,'J','Escritório de Contabilidade Ltda.','44.444.444/4444-44'),(6,'F','Funcionário Exemplar de Souza','555.555.555-55');
INSERT INTO conta_bancaria VALUES (1,'Super Banco regional S/A','1234','3333-3'),(2,'Cooperativa Bancária do Município S/A','5678','4444-4');
INSERT INTO meio_pagamento VALUES (1,'Pix'),(2,'Boleto Bancário');
INSERT INTO titulo VALUES (1,2,'R','Prestação de serviços de consultoria','2026-01-10',20000),(2,3,'P','Compra de equipamentos','2026-01-12',10000),(3,4,'P','Assinatura de software Jan/2026','2026-01-15',500),(4,1,'R','Venda de ativos usados (móveis)','2026-01-18',800),(5,5,'P','Serviço de contabilidade Jan/2026','2026-01-20',3600),(7,6,'R','Pagamento de salário a funcionário','2026-02-05',3500);
INSERT INTO movimentacao_bancaria VALUES (1,1,1,2,'2026-01-10',20000),(2,1,2,2,'2026-01-12',5000),(3,2,3,2,'2026-01-15',500),(4,1,2,2,'2026-01-15',3000),(5,2,2,2,'2026-01-20',2000),(6,2,4,1,'2026-01-18',200),(7,2,5,2,'2026-01-20',3600),(8,1,6,1,'2026-01-20',200),(9,1,4,1,'2026-01-19',200),(10,1,5,1,'2026-01-22',3600),(11,1,4,1,'2026-01-25',200);
