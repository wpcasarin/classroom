-- Crie uma visão com as seguintes informações: código do item, descrição do item, valor
-- do item, código do fornecedor do item, descricao do fornecedor.
CREATE VIEW itens_fornc_view(item_id, item_desc, item_valor, forn_id, forn_desc)
AS
SELECT itens.codigo, itens.descricao, itens.valor, f.codigo, f.descricao
FROM itens
       LEFT JOIN compras_itens ci ON itens.codigo = ci.coditem
       LEFT JOIN compras c ON ci.codcompra = c.codigo
       LEFT JOIN fornecedores f ON c.codfornecedor = f.codigo;

-- Liste o conteúdo da visão criada na questão anterior.
SELECT *
FROM itens_fornc_view;

-- Tente atualize o valor de um item da visão criada na questão 1. Descreva o que ocorreu.
UPDATE itens_fornc_view
SET item_desc = 'nova descrição'
WHERE itens_fornc_view.item_id = 1;
--! O SGDB não permitiu a alteraçao da view pois ela possui junções.

-- Atualize o valor de um item da tabela item. Visualize o alteração.
UPDATE itens
SET valor = 344
WHERE itens.codigo = 1;
SELECT *
FROM itens;

-- Liste o conteúdo da visão criada na questão 1. Descreva o que ocorreu com os dados da
-- visão após a realização da questão 4,
SELECT *
FROM itens_fornc_view;
-- As alterações feitas na tabela itens afetaram a visão.

-- Crie uma visão materializada com as seguintes informações: número da ordem de serviço,
-- data da ordem de serviço, status, nome do cliente, nome do funcionário.
CREATE MATERIALIZED VIEW ordens_m_view
AS
SELECT os.numero, os.data, os.status, c.nome AS nome_cliente, f.nome AS nome_funcionario
FROM ordens_servico AS os
       LEFT JOIN funcionarios f ON os.codfunc = f.codfunc
       LEFT JOIN clientes c ON os.codcliente = c.codcliente
WITH DATA;

-- Liste o conteúdo da visão materializada criada na questão 6.
SELECT *
FROM ordens_m_view;

-- Atualize o status da ordem de serviço de código 1, da tabela ordens_servico, para ‘a’.
UPDATE ordens_servico
SET status = 'a'
WHERE numero = 1;

-- Liste o conteúdo da tabela ordens_servico e verifique se o status da ordem de serviço de
-- código 1 foi alterado para ‘a’.
SELECT * FROM ordens_servico;

-- Liste o conteúdo da visão materializada. Descreva o que você observa em relação ao status
-- da ordem de serviço de código 1.
SELECT *
FROM ordens_m_view;
-- O valor da ordem de número 1 não foi alterado mesmo após a alteração na tabela original.

-- Atualize a visão materializada
REFRESH MATERIALIZED VIEW ordens_m_view;

-- Liste o conteúdo da visão materializada. Descreva o que aconteceu após sua atualização.
SELECT *
FROM ordens_m_view;
-- Após o refresh na view o seu conteúdo foi atualizado com os valores presentes nas tabelas de origem.






