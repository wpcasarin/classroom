SELECT usename AS role_name,
       CASE
         WHEN usesuper AND usecreatedb THEN
           CAST('superuser, create database' AS pg_catalog.TEXT)
         WHEN usesuper THEN
           CAST('superuser' AS pg_catalog.TEXT)
         WHEN usecreatedb THEN
           CAST('create database' AS pg_catalog.TEXT)
         ELSE
           CAST('' AS pg_catalog.TEXT)
         END      role_attributes
FROM pg_catalog.pg_user
ORDER BY role_name DESC;

-- Crie os usuários: Ana, Bernardo, Carlos, Daniela. Ao cria-los, defina uma senha para cada um deles.
CREATE USER ana WITH PASSWORD 'user';
CREATE USER bernardo WITH PASSWORD 'user';
CREATE USER carlos WITH PASSWORD 'user';
CREATE USER daniela WITH PASSWORD 'user';

-- Crie o grupo: vendedores
CREATE GROUP vendedores;

-- Crie o grupo: adm.
CREATE GROUP adm;

-- Inclua os usuários Ana e Carlos no grupo vendedores.
ALTER GROUP vendedores ADD USER ana, carlos;

-- Inclua os usuários Bernardo e Daniela no grupo adm.
ALTER GROUP adm ADD USER bernardo, daniela;

-- Fazer o usuário Daniela ser superusuário.
ALTER USER daniela WITH SUPERUSER;

-- Dê todos os privilégios no banco de dados para o usuário Bernardo.
GRANT ALL PRIVILEGES ON DATABASE banco TO bernardo;

-- Dê todos os privilégios no banco de dados para o grupo adm.
GRANT ALL PRIVILEGES ON DATABASE banco TO adm;

-- Permita que a usuária ana possa atribuir a outros usuários direito de acesso à leitura em
-- relação à tabela vendas.
-- TODO pode atribuir permições???
GRANT SELECT ON TABLE vendas TO ana;

-- Dê acesso às tabelas clientes, vendas, venda_itens, ordens_servico, ordens_itens
-- para o grupo vendedoras. Permita que os usuários desse grupo consultem, incluam,
-- alterem e excluam registros dessas tabelas.
GRANT SELECT, INSERT, UPDATE, DELETE
  ON TABLE clientes,vendas, venda_itens, ordens_servico, ordens_itens
  TO vendedores;

-- Dê acesso às tabelas compras e compras_itens para o usuário Carlos. Permita que ele
-- consulte, insira, altere e exclua dados e, também, que ele possa conceder privilégios
-- de acesso a essas tabelas para outros usuários.
GRANT SELECT, INSERT, UPDATE, DELETE
  ON TABLE compras, compras_itens
  TO carlos;

-- Para todos os usuários, dê permissão de leitura à tabela itens.
GRANT SELECT ON TABLE itens TO PUBLIC;

-- Para o usuário Carlos, dê permissão de acesso somente às colunas codigo, data e valor_total da tabela compras.
REVOKE ALL ON TABLE compras FROM carlos;
GRANT SELECT (codigo, data, valor_total) ON TABLE compras TO carlos;

-- Teste o acesso de consulta do usuário Carlos à tabela ordens_servico e à ordens_itens.
SELECT *
FROM compras;
-- [42501] ERROR: permission denied for table compras.
SELECT codigo
FROM compras;

-- Remova todos os privilégios de acesso do usuário Carlos às tabelas ordens_servico e
-- ordens_itens. Para isso, você de estar logado como superusuário.
REVOKE ALL PRIVILEGES  ON  ordens_itens, ordens_servico FROM carlos;

-- Teste o acesso do usuário Carlos à tabela ordens_servico e à ordens_itens.
SELECT * FROM ordens_servico;
-- O select funcionou, pois o acesso não foi dado atravez da keyword GRANT ao usuário.