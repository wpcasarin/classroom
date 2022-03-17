--* I – Inclusão de dados
-- 1 – Inclua na tabela “funcionarios” um atributo chamado “salario”. Ele deve ser do tipo numérico com duas casas decimais.
ALTER TABLE funcionarios
  ADD salario NUMERIC(6, 2);

-- 2 – Para o atributo criado na questão anterior, inclua os seguintes salários de acordo com os códigos dos funcionários.
UPDATE
  funcionarios
SET salario = 1200.00
WHERE funcionarios.codfunc IN (200, 201, 203, 204);

UPDATE
  funcionarios
SET salario = 1840.00
WHERE funcionarios.codfunc IN (202, 206);

UPDATE
  funcionarios
SET salario = 2030.50
WHERE funcionarios.codfunc IN (205);

-- 3 – Inclua na tabela “funcionarios” um atributo chamado “codchefe”. Ele deve ser do tipo inteiro.
ALTER TABLE funcionarios
  ADD COLUMN codchefe INT DEFAULT 206 NOT NULL
    CONSTRAINT codchefe REFERENCES funcionarios (codfunc);

-- 4 – Para o atributo criado na questão anterior, inclua os valores como apresentados abaixo.
UPDATE
  funcionarios
SET codchefe = 205
WHERE codfunc IN (202, 206, 205);

--* II - Utilize “SELF JOIN” para desenvolver o solicitado nas questões.
-- 1 – Liste o nome de cada funcionário seguido do nome de seu respectivo chefe.
SELECT funcs.nome AS "Funcionario",
       chefe.nome AS "Chefe"
FROM funcionarios AS funcs,
     funcionarios AS chefe
WHERE funcs.codchefe = chefe.codfunc;

-- 2 – Faça uma relação de funcionários (tabela “funcionario”) que possuem o mesmo salário, listando o nome deles.
SELECT func1.nome AS func1,
       func2.nome AS func2,
       func1.salario
FROM funcionarios AS func1,
     funcionarios AS func2
WHERE func1.codfunc != func2.codfunc
  AND func1.salario = func2.salario
  AND func1.nome NOT IN (
  SELECT func2.nome
  FROM funcionarios AS func1,
       funcionarios AS func2
  WHERE func1.codfunc != func2.codfunc
    AND func1.salario = func2.salario
    AND func1.nome < func2.nome);

-- 3 – Faça uma relação de funcionários (tabela “funcionario”) que possuem o mesmo tipo, listando o nome deles.
SELECT func1.nome AS func1,
       func2.nome AS func2,
       func1.tipo
FROM funcionarios AS func1
       JOIN funcionarios AS func2 ON (func1.codfunc != func2.codfunc)
  AND func1.tipo = func2.tipo
  AND func1.nome < func2.nome
  AND func1.nome NOT IN (
    SELECT func2.nome
    FROM funcionarios AS func1,
         funcionarios AS func2
    WHERE func1.codfunc != func2.codfunc
      AND func1.tipo = func2.tipo
      AND func1.nome < func2.nome);

