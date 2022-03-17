--? Exercícios – UNION, EXCEPT, INTERSECT
-- 1 – Liste em apenas uma coluna o nome dos clientes e dos funcionários.
SELECT nome
FROM "clientes"
UNION
SELECT nome
FROM "funcionarios";
-- 2 – Liste o nome dos itens que possuem registro tanto em vendas como em ordens de serviço.
SELECT descricao AS nome
FROM "itens"
WHERE itens.codigo IN (
  SELECT codigo
  FROM "itens"
  INTERSECT
  SELECT codigo
  FROM "venda_itens"
  INTERSECT
  SELECT codigo
  FROM "ordens_itens"
);
-- 3 – Liste o nome dos itens que nunca foram vendidos.
SELECT descricao AS nao_vendidos
FROM "itens"
WHERE itens.codigo IN (
  SELECT codigo
  FROM "itens"
  EXCEPT
  SELECT codigo
  FROM "venda_itens"
);
--? Exercícios – CASE
-- 1 – Acrescente na tabela clientes o atributo dt_nasc. Ele deve ser do tipo date.
ALTER TABLE
  "clientes"
  ADD
    COLUMN dt_nasc DATE;
-- 2 – Insira no banco de dados o seguinte registro:
INSERT INTO clientes
VALUES (107,
        'Onofre dos Santos',
        'Rua das Flores',
        'F',
        '1234567890',
        NULL,
        NULL,
        NULL,
        '1980-03-20');
--! 3 – Liste o nome dos clientes informando se possuem ou não telefone.
SELECT nome,
       CASE
         COALESCE(fones_clientes.num_telefone, 'null')
         WHEN 'null' THEN 'não possui'
         ELSE 'possui'
         END possui_telefone
FROM "clientes"
       FULL OUTER JOIN "fones_clientes" ON clientes.codcliente = fones_clientes.cliente;
-- Segunda forma
SELECT nome,
       CASE
         WHEN num_telefone IS NULL THEN 'não possui'
         ELSE 'possui'
         END possui_telefone
FROM "clientes"
       FULL OUTER JOIN "fones_clientes" ON clientes.codcliente = fones_clientes.cliente;
-- 4 – Liste o nome dos clientes indicando se possuem ou não telefone celular. Parta do pressuposto que um telefone celular inicia com o digito 9.
SELECT nome,
       CASE
         WHEN (LEFT(num_telefone, 1) LIKE '9') THEN 'possui celular'
         ELSE 'não possui celular'
         END possui_celular
FROM "clientes"
       FULL OUTER JOIN "fones_clientes" ON clientes.codcliente = fones_clientes.cliente;
-- 5 – Liste o conteúdo da tabela clientes e, após, insira no campo obs (observação), dessa tabela, a designação “Pessoa Jurídica” ou “Pessoa Física” de acordo com o tipo de cada cliente.
SELECT *,
       CASE
         tipo_cliente
         WHEN 'F' THEN 'Pessoa Física'
         ELSE 'Pessoa Jurídica'
         END obs
FROM "clientes";
--! 6– Liste o conteúdo da tabela clientes para verificar a alteração realizada no exercício anterior.
-- não entendi ???????
-- 7 – O domínio do atributo desconto, da tabela itens, está definido como numeric (4,2). Ajusteo domínio para numeric (6,2).
ALTER TABLE
  itens
  ALTER
    COLUMN
    desconto TYPE NUMERIC(6, 2);
-- 8 – Liste o conteúdo da tabela itens e, após, atualize o campo desconto, dessa tabela, como segue: valor de 10% para produtos com valor superior a R$ 1500,00; valor de 5% para produtos com valor entre R$ 500,00 e R$1499,99, valor de 2% para produtos com valor entre R$ 200,00 e R$499,99. Para os demais valores de produto, não conceda desconto. Essas atualizações devem ser feitas com um único comando update.
UPDATE
  itens
SET desconto = (
  CASE
    WHEN itens.custo > 1500 THEN itens.custo * 0.1
    WHEN itens.custo BETWEEN 500 AND 1499.99 THEN itens.custo * 0.05
    WHEN itens.custo BETWEEN 200 AND 499.99 THEN itens.custo * 0.02
    END
  );
-- 9 – Liste o conteúdo da tabela itens para verificar a atualização realizada no exercício anterior.
SELECT *
FROM "itens";
--? Exercícios - COALESCE ou NULLIF.
-- 1 - Liste o nome de todos os itens e de seus respectivos descontos. Caso o item não possua desconto, no lugar deste, aparecer escrito R$ 0,00. Os descontos devem ser listados com a formatação monetária R$....
SELECT descricao,
       CAST(COALESCE(desconto, 0) AS MONEY) AS desconto
FROM "itens";
/* 2 – Utilizando coalesce, concatene e mostre em apenas uma única coluna a descrição do
 item, seu custo, seu valor e seu desconto. A descrição deve ser apresentada em caixa alta
 (letras maiúsculas), os valores com o símbolo monetário e cada elemento dessa coluna desse
 ser separado por um traço. Exemplo:
 APARELHO DE PRESSÃO - R$ 160,00 - R$ 200,00 - R$ 10,00 */
SELECT CONCAT(
           UPPER(descricao),
           ' - ',
           custo :: MONEY,
           ' - ',
           valor :: MONEY,
           ' - ',
           COALESCE(desconto, 0) :: MONEY
         ) AS itens
FROM "itens";
-- 3 – Escreva a consulta solicitada na questão anterior sem o uso de coalesce.
SELECT CONCAT(
           UPPER(descricao),
           ' - ',
           custo :: MONEY,
           ' - ',
           valor :: MONEY,
           ' - ',
           CASE
             WHEN desconto IS NULL THEN 0 :: MONEY
             ELSE desconto :: MONEY
             END
         ) AS itens
FROM "itens";
-- 4 – Utilizando nullif, liste a descrição, o valor e o desconto de cada item. Se um item não possuir desconto apresentar em seu lugar o conteúdo NULL.
--! valor do desconto já é null