Lista 2 - Banco de Dados II
-- Aula - Apresente a data por extenso como nos seguintes exemplos: "Pelotas, 07 de outubro de 2021" e "Quinta-feira, 07 de outubro de 2021".
SELECT 'Pelotas, ' || EXTRACT(DAY FROM CURRENT_DATE) || ' de ' || TO_CHAR(CURRENT_DATE, 'TMmonth') || ' de ' ||
       EXTRACT(YEAR FROM CURRENT_DATE) AS data_de_hoje;

SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Day') || ', ' || EXTRACT(DAY FROM CURRENT_DATE) || ' de ' ||
       TO_CHAR(CURRENT_DATE, 'TMmonth') || ' de ' || EXTRACT(YEAR FROM CURRENT_DATE) AS data_de_hoje;

-- 1 - Elabore uma consulta que retorne o tempo (em anos, meses e dias) que ocorreu a(s) últimas vendas do vendedor "Mariana Costa".
SELECT vendas.dt_venda
FROM vendas
       INNER JOIN funcionarios ON funcionarios.codfunc = vendas.codfunc
WHERE funcionarios.nome ILIKE 'Mariana Costa';

-- 2 - Elabore uma consulta que retorne como ficaria o valor dos itens de c ódigo 2 e 3 (tabela itens) se sofressem um reajuste de 5 %.A consulta deve retornar o valor reajustado e o c ódigo DO item.
SELECT codigo,
       custo * 1.05 AS custo_reajustado
FROM itens
ORDER BY codigo
LIMIT 2;

Segunda alternativa
SELECT codigo,
       custo * 1.05 AS custo_reajustado
FROM itens
WHERE codigo = 1
   OR codigo = 2;

-- 3 - Elabore uma consulta que retorne a data atual.
SELECT CURRENT_DATE AS data_atual;

-- 4 - Escreva uma consulta que retorne a data atual NO formato dia - m ês - ano;
SELECT TO_CHAR(CURRENT_DATE, 'DD/MM/YYYY') AS data_atual;

-- 5 – Elabore uma consulta que retorne os meses (por extenso e na l íngua portuguesa) em que o vendedor "Cristian Tavares" realizou vendas em 2020.
SELECT TO_CHAR(dt_venda, 'TMMonth')
FROM vendas
       INNER JOIN funcionarios ON funcionarios.codfunc = vendas.codfunc
WHERE funcionarios.nome ILIKE 'Cristian Tavares'
  AND vendas.dt_venda < '2021-01-01';

-- 6 - Acrescente 5 dias à data de vencimento dos registros da tabela contas_receber que ainda n ão foi registrado pagamento (data de pagamento);
UPDATE
  contas_receber
SET data_vencimento = data_vencimento + INTERVAL '5' DAY
WHERE data_pagamento IS NULL;

-- 7 - Escreva uma consulta que mostre o nome e o endereço dos funcionários em uma única coluna e separados por um hífen. Dê o nome de "Funcionários" a essa coluna.
SELECT CONCAT(nome, ' - ', endereco) AS funcion ários
FROM funcionarios;

-- 8 - Mostre a primeira letra DO nome de cada cliente e também o nome completo;
SELECT SUBSTRING(nome, 1, 1)
FROM clientes
WHERE nome LIKE 'M%';

-- 9 - Elabore uma consulta que informe o n úmero de caracteres de cada nome de cliente. Informe tamb ém o nome dos clientes;
SELECT LENGTH(nome) AS tamanho,
       nome
FROM clientes;

-- 10 - Elabore uma consulta que informe o número de bits que cada nome de cliente ocupa em mem ória.
SELECT BIT_LENGTH(nome) AS bits_memoria
FROM clientes;

-- 11 - Incluir o seguinte telefone para "Maria Silveira" : 99811212;
UPDATE
  fones_clientes
SET num_telefone = '99811212'
FROM clientes
WHERE fones_clientes.cliente = clientes.codcliente
  AND clientes.nome ILIKE 'Maria Silveira';

-- 12 - Altere os registros da tabela clientes,incluindo as datas de nascimento:
ALTER TABLE clientes
  ADD COLUMN dt_nasc DATE;

UPDATE
  clientes
SET dt_nasc = CASE
                WHEN codcliente = 100 THEN
                  '1990-12-12'::DATE
                WHEN codcliente = 101 THEN
                  '1972-08-09'::DATE
                WHEN codcliente = 102 THEN
                  '1964-08-15'::DATE
                WHEN codcliente = 103 THEN
                  '1967-11-23'::DATE
                WHEN codcliente = 104 THEN
                  '1984-06-17'::DATE
                WHEN codcliente = 105 THEN
                  '1977-03-18'::DATE
  END
WHERE codcliente IN (100, 101, 102, 103, 104, 105);

-- 13 - Liste os nomes dos clientes que fazem anivers ário neste m ês.
SELECT nome
FROM clientes
WHERE (
        SELECT EXTRACT(MONTH FROM dt_nasc)) = (
        SELECT EXTRACT(MONTH FROM CURRENT_DATE));

