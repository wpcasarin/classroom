-- Crie um gatilho para não permitir quantidade negativa no estoque de um item.
CREATE OR REPLACE FUNCTION block_estoque() RETURNS TRIGGER AS
$$
BEGIN
  IF new.estoque < 0 THEN
    RAISE EXCEPTION 'Estoque não pode ser negativo';
  END IF;
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER block_estoque
  BEFORE INSERT OR UPDATE
  ON itens
  FOR EACH ROW
EXECUTE PROCEDURE block_estoque();
-- Crie um gatilho para acrescentar a expressão "Sr(a)." ao nome dos clientes que nasceram há mais de 30 anos.
ALTER TABLE clientes
  ADD data_nasc DATE DEFAULT NULL;

CREATE OR REPLACE FUNCTION add_sr() RETURNS TRIGGER AS
$$
DECLARE
  cage INT;
BEGIN
  cage := (SELECT DATE_PART('year', AGE(CURRENT_DATE, new.data_nasc)))::INT;
  IF cage >= 30 THEN
    UPDATE clientes
    SET nome = CONCAT('Sr(a) ', new.nome)
    WHERE clientes.codcliente = new.codcliente;
  END IF;
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER add_sr
  AFTER INSERT
  ON clientes
  FOR EACH ROW
EXECUTE PROCEDURE add_sr();
-- Crie um gatilho que aborte a operação de inclusão de clientes com CPF nulo.
CREATE OR REPLACE FUNCTION check_cpf() RETURNS TRIGGER AS
$$
BEGIN
  IF new.cpf IS NULL THEN
    RAISE EXCEPTION 'CPF não pode ser nulo.';
  END IF;
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER check_cpf
  BEFORE INSERT
  ON clientes
  FOR EACH ROW
EXECUTE PROCEDURE check_cpf();
-- Criar um gatilho que gere um log quando um funcionário receber reajuste salarial.
-- Deve constar no log: nome do funcionário, salário antigo, salário reajustado, data do reajuste salarial.
CREATE TABLE log_salario
(
  id          SERIAL,
  func_nome   TEXT,
  sal_antigo  NUMERIC(10, 2),
  sal_reajst  NUMERIC(10, 2),
  data_reajst DATE
);

CREATE OR REPLACE FUNCTION log_salario() RETURNS TRIGGER AS
$$
BEGIN
  IF new.salario != old.salario THEN
    INSERT INTO log_salario (func_nome, sal_antigo, sal_reajst, data_reajst)
    VALUES (new.nome, old.salario, new.salario, CURRENT_DATE);
  END IF;
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER log_salario
  AFTER UPDATE
  ON funcionarios
  FOR EACH ROW -- row pois pode haver reajuste em varios salarios
EXECUTE PROCEDURE log_salario();