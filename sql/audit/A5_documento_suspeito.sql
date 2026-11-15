SELECT id_pessoa, nome_pessoa, cpf_cnpj FROM pessoa
WHERE regexp_replace(cpf_cnpj, '[^0-9]', '', 'g') ~ '^(0+|1+|2+|3+|4+|5+|6+|7+|8+|9+)$';
