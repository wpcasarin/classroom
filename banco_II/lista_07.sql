-- 1. Utilizando a cláusula [NOT] EXISTS, elabore uma consulta que liste o nome dos clientes que possuem mais de um telefone.
SELECT clientes.nome
FROM "clientes"
WHERE EXISTS(
          SELECT fones_clientes.cliente,
                 COUNT(*)
          FROM "fones_clientes"
          GROUP BY fones_clientes.cliente
          HAVING COUNT(*) > 1
             AND fones_clientes.cliente = clientes.codcliente
        );
-- 2. Utilizando a cláusula [NOT] EXISTS, elabore uma consulta que liste o nome dos clientes que compraram itens que possuem preço de venda inferior a R$ 200,00
SELECT clientes.nome
FROM "clientes"
WHERE EXISTS(
          SELECT *
          FROM "vendas" AS v
                 JOIN "venda_itens" AS vi ON v.codigo = vi.codvenda
          WHERE vi.valor < 200
            AND clientes.codcliente = v.codcliente
        );
--3. Utilizando a cláusula [NOT] EXISTS, elabore uma consulta que liste o nome dos produtos que nunca foram vendidos.
SELECT itens.descricao
FROM "itens"
WHERE NOT EXISTS(
    SELECT *
    FROM "venda_itens"
    WHERE venda_itens.codigo = itens.codigo
  );
-- 4. Elabore uma listagem que apresente o nome dos vendedores que possuem vendas em setembro de 2020. Utilize subconsulta na cláusula FROM.
SELECT funcionarios.nome
FROM "funcionarios"
       JOIN (
  SELECT *
  FROM "vendas"
  WHERE DATE_PART('month', vendas.dt_venda) = 08
    AND DATE_PART('year', vendas.dt_venda) = 2020
) AS dt ON funcionarios.codfunc = dt.codfunc;
-- 5. Liste o nome dos clientes inadimplentes (não efetuaram pagamento – ver: tabela contas_receber – atributo: data_pagamento). Utilize subconsulta na cláusula FROM
SELECT clientes.nome
FROM "clientes"
       JOIN (
  SELECT v.codcliente
  FROM "vendas" AS v
         JOIN "contas_receber" AS cr ON cr.codigo_vendas = v.codigo
  WHERE cr.data_pagamento IS NULL
) AS cod ON clientes.codcliente = cod.codcliente;
-- 6. Listar total de funcionários e o total de clientes usando apenas uma consulta e mostrando os resultados numa linha única.
--! não entendi