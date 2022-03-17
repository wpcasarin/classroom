-- 1) Acrescente 10 dias à data da ordem de serviço de código igual à 1.
UPDATE
  ordens_servico
SET data = data + INTERVAL '10 day'
WHERE numero = 1;

-- 2) Liste o código da venda, a data da venda, o nome do cliente e o nome do funcionário que fez a venda.
SELECT f.nome,
       v.codigo,
       v.dt_venda,
       c.nome
FROM vendas AS v
       JOIN funcionarios AS f ON v.codfunc = f.codfunc
       JOIN clientes AS c ON c.codcliente = v.codcliente;

-- 3) Liste o nome de cada cliente e os itens comprados por eles.
SELECT c.nome,
       i.descricao
FROM clientes AS c
       JOIN vendas AS v ON c.codcliente = v.codcliente
       JOIN venda_itens AS vi ON v.codigo = vi.codvenda
       JOIN itens AS i ON vi.codigo = i.codigo
ORDER BY c.nome;

-- 4) Liste os códigos de venda e os itens associados a esses códigos. Também deve ser listado os itens que não estejam associados a um código de venda.
SELECT v.codigo,
       i.descricao
FROM itens AS i
       LEFT JOIN venda_itens AS vi ON vi.codigo = i.codigo
       LEFT JOIN vendas AS v ON v.codigo = vi.codvenda;

-- 5) Escreva uma consulta que mostre o nome do fornecedor e os itens fornecidos por ele em uma única coluna e separados por um hífen. Dê o nome de "Fornecedores e seus itens" a essa coluna.
SELECT f.descricao,
       i.descricao
FROM fornecedores AS f
       JOIN compras AS c ON c.codfornecedor = f.codigo
       JOIN compras_itens AS ci ON ci.codcompra = c.codigo
       JOIN itens AS i ON i.codigo = ci.coditem
ORDER BY f.descricao;
--! não consegui finalizar

-- 6) Elabore uma listagem que mostre a previsão de aumento salarial dos funcionários em 8%. Informe o nome do funcionário, seu salário atual e o salário com o reajuste aplicado.
SELECT nome,
       salario,
       ROUND(salario * 1.08, 2) AS reajustado
FROM funcionarios;

-- 7) Elabore uma consulta que retorne o nome dos clientes aniversariantes do mês de agosto. Ao lado do nome do cliente, deve aparecer a data do aniversário e a idade dele (a idade deve ser expressa em somente “anos”).
SELECT nome,
       dt_nasc,
       EXTRACT(YEAR FROM AGE(dt_nasc)) AS idade
FROM clientes
WHERE EXTRACT(MONTH FROM dt_nasc) = 08;

