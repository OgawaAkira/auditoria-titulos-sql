# auditoria-titulos-sql

![ci](https://github.com/OgawaAkira/auditoria-titulos-sql/actions/workflows/ci.yml/badge.svg)

Laboratório de auditoria de dados em PostgreSQL, baseado em um estudo de caso de contas a pagar e a receber. Reproduz um banco legado sem integridade referencial e usa consultas SQL e Python para detectar inconsistências.

## Como rodar

    docker compose up -d
    python3 -m venv .venv && source .venv/bin/activate
    pip install -r requirements.txt
    python auditar.py
    pytest -q

## Achados

| Consulta | Achado | Risco |
| --- | --- | --- |
| A1 | A movimentação 8 aponta para o título 6, que não existe | Integridade referencial violada: FK ausente ou título apagado |
| A2 e A3 | O título 5 recebeu 7.200,00 contra 3.600,00 devidos, em duas contas e dois meios | Pagamento em duplicidade: perda financeira ou fraude |
| A4 | O título 7, Pagamento de salário, está como recebimento (R) | Fluxo de caixa invertido e relatórios distorcidos |
| A5 | Todos os documentos têm dígitos repetidos | Dados fictícios; em produção, validar o dígito verificador |

A3 também acusa o título 4, mas são pagamentos parciais legítimos (600 de 800). Alerta não é achado até ser confirmado por outra consulta.

## Modelo alternativo

Veja a próxima seção, a ser preenchida com o modelo v2.
