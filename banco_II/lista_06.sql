-- 1) Liste o nome de cada cliente e o número de telefones cada um possui.
SELECT c.nome,
       COUNT(*) AS num_telefones
FROM clientes AS c
       JOIN fones_clientes AS fc ON fc.cliente = c.codcliente
GROUP BY c.nome;
-- 2) Liste o nome dos clientes que possuem mais de um telefone. Para obter algum resultado, antes de executar a listagem, inclua mais um telefone para algum cliente.
SELECT c.nome
FROM clientes AS c
       JOIN fones_clientes AS fc ON fc.cliente = c.codcliente
GROUP BY c.nome
HAVING COUNT(*) > 1;
-- 3) Liste o número de vendas realizadas no ano de 2020.
--? ALIAS on HAVING and WHERE
SELECT DATE_PART('year', dt_venda) AS ano_2020,
       COUNT(*)                    AS vendas
FROM vendas
WHERE DATE_PART('year', dt_venda) = 2020
GROUP BY ano_2020;
-- 4) Para o ano de 2020, liste o número de vendas de cada mês.
SELECT TO_CHAR(
           TO_DATE(DATE_PART('month', dt_venda) :: TEXT, 'MM'),
           'Month'
         )      AS mes,
       COUNT(*) AS vendas
FROM vendas
WHERE DATE_PART('year', dt_venda) = 2020
GROUP BY mes;
-- 5) Liste o nome dos fornecedores relacionados a menos de duas compras. Para obter resultados, insira na tabela compras um registro como o seguinte conteúdo: código = 108; codfornecedor =5; data ='2021/04/23'; valor_total=3000 numero_nota=7841.
SELECT f.descricao,
       COUNT(*)
FROM fornecedores AS f
       JOIN compras AS c ON c.codfornecedor = f.codigo
GROUP BY f.descricao
HAVING COUNT(*) > 1;
-- 6) Liste o número de vendas por funcionário no ano de 2020.
--? HAVING not working
SELECT f.nome,
       COUNT(*)
FROM "funcionarios" AS "f"
       JOIN "vendas" AS "v" ON v.codfunc = f.codfunc
WHERE DATE_PART('year', v.dt_venda) = 2020
GROUP BY f.nome;
-- 7) Liste número de clientes relativo a cada tipo de cliente contido na base de dados.
SELECT c.tipo_cliente,
       COUNT(*) AS "quantidade"
FROM "clientes" AS "c"
GROUP BY c.tipo_cliente;
-- 8) Liste o tipo de cliente que possui mais de três clientes cadastrados na base de dados.
SELECT c.tipo_cliente,
       COUNT(*) AS "quantidade"
FROM "clientes" AS "c"
GROUP BY c.tipo_cliente
HAVING COUNT(*) > 3;
-- 9) Liste a média do “valor total de venda” do ano de 2020. A média deve ser listada com apenas duas casas decimais.
SELECT AVG(v.valor_total_venda) :: NUMERIC(7, 2) AS "media"
FROM "vendas" AS "v"
WHERE DATE_PART('year', v.dt_venda) = 2020;