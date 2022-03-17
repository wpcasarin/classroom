-- 1 – Liste a data atual observando o seguinte formato: “Pelotas, 01 de abril de 2021”. Para isto, zé preciso utilizar concatenação de valores (uso de ||ou da função concat)
--? Função CONCAT funciona com cláusulas como argumento???
SELECT 'Pelotas, ' || EXTRACT(DAY FROM CURRENT_DATE) || ' de ' || TO_CHAR(CURRENT_DATE, 'TMmonth') || ' de ' ||
       EXTRACT(YEAR FROM CURRENT_DATE) AS data_de_hoje;
--TODO select to_char(current_date, 'Pelotas, DD "de" TMMonth YYYY.') AS data;
--TODO select to_char(current_date, 'TMDay, DD "de" TMMonth YYYY.') AS data;
-- 2 - Liste o código, a data e o valor total da venda, assim como, o nome do funcionário relacionado à respectiva venda.
SELECT vendas.codigo,
       vendas.dt_venda,
       vendas.valor_total_venda,
       funcionarios.nome
FROM vendas
       INNER JOIN funcionarios ON vendas.codfunc = funcionarios.codfunc;

-- 3 - Liste a descrição de cada item vendido por José da Silveira.
--? Clausa WHERE filtra dados... diferença de performance em diferentes JOINS???
SELECT itens.descricao
FROM itens OUTER JOIN venda_itens
ON venda_itens.codigo = itens.codigo
  OUTER JOIN vendas ON vendas.codigo = venda_itens.codvenda
  OUTER JOIN funcionarios ON funcionarios.codfunc = vendas.codfunc
WHERE
  funcionarios.nome ILIKE 'José da Silveira';

-- 4 - Liste o nome de cada cliente e os itens comprados por ele em maio de 2020.
SELECT clientes.nome,
       itens.descricao
FROM clientes
       INNER JOIN vendas ON vendas.codcliente = clientes.codcliente
       INNER JOIN venda_itens ON venda_itens.codvenda = vendas.codigo
       INNER JOIN itens ON itens.codigo = venda_itens.codigo
WHERE vendas.dt_venda BETWEEN '2020-05-01'
        AND '2020-05-31';

-- 5 – Liste o nome dos funcionários que tiveram valor_total_venda superior à R$ 5.000,00.
SELECT funcionarios.nome
FROM funcionarios
       INNER JOIN vendas ON vendas.codfunc = funcionarios.codfunc
WHERE vendas.valor_total_venda > '5000.00'::NUMERIC;

-- 6 – Liste o nome de todos os clientes. Para os que possuem telefone, liste também o número de seu telefone. (utilize “left join”).
--?? enunciado
SELECT clientes.nome,
       fones_clientes.num_telefone
FROM clientes
       LEFT JOIN fones_clientes ON clientes.codcliente = fones_clientes.cliente;

-- 7 - Liste o nome de todos os clientes e de seus respectivos telefones (utilize “right join”). Observação: os clientes que não possuem telefone devem contar nessa listagem.
--?? enunciado
SELECT clientes.nome,
       fones_clientes.num_telefone
FROM fones_clientes
       RIGHT JOIN clientes ON clientes.codcliente = fones_clientes.cliente;

-- 8 - Liste os clientes (somente nome), data de vencimento e o valor do pagamento de suas compras (utilize “left join”).
--! valor total da venda não corresponde ao valor a receber.
SELECT clientes.nome,
       contas_receber.data_vencimento,
       contas_receber.valor_pagamento
FROM clientes
       LEFT JOIN vendas ON vendas.codcliente = clientes.codcliente
       LEFT JOIN contas_receber ON contas_receber.codigo_vendas = vendas.codigo;

-- 9 – Considere o ano de 2020, para listar: o código de cada compra efetuada pela empresa, o nome do fornecedor dos produtos comprados, a data de vencimento e o valor total da compra.
--!! valores sem relação..
--TODO melhor forma para filtrar o intervalo de data.
SELECT compras.codigo,
       fornecedores.descricao,
       contas_pagar.data_vencimento,
       compras.valor_total
FROM fornecedores
       INNER JOIN compras ON compras.codfornecedor = fornecedores.codigo
       INNER JOIN contas_pagar ON contas_pagar.compra = compras.codigo
WHERE contas_pagar.data_lancamento BETWEEN '2020-01-01'
        AND '2020-12-31';

