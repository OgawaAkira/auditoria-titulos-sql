from pathlib import Path
import pandas as pd
from sqlalchemy import create_engine, text

engine = create_engine('postgresql+psycopg://auditor:auditor@localhost:5432/titulos')

def rodar_auditoria(pasta='sql/audit'):
    achados = {}
    for arq in sorted(Path(pasta).glob('*.sql')):
        achados[arq.stem] = pd.read_sql(text(arq.read_text(encoding='utf-8')), engine)
    return achados

if __name__ == '__main__':
    for nome, df in rodar_auditoria().items():
        print(f'## {nome}: {len(df)} achado(s)')
        if not df.empty:
            print(df.to_markdown(index=False))
