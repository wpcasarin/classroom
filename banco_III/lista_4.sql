-- Registrar em uma tabela de log (deve ser criada), o nome do usuário que efetuar
-- operações de inserção, de alteração ou de exclusão de dados na tabela itens. Na tabela
-- de log deve ser também registrada, juntamente com o nome do usuário, a operação
-- realizada e a data de realização da operação.

CREATE TABLE logs
(
  id            SERIAL PRIMARY KEY,
  usuario       TEXT NOT NULL,
  operacao      TEXT NOT NULL,
  data_operacao DATE NOT NULL
);

CREATE OR REPLACE FUNCTION create_log() RETURNS TRIGGER AS
$$
BEGIN
  INSERT INTO logs (usuario, operacao, data_operacao)
  VALUES (USER, tg_op, NOW());
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER create_log
  AFTER INSERT OR UPDATE OR DELETE
  ON itens
  FOR EACH STATEMENT
EXECUTE PROCEDURE create_log();

-- Ao deletar uma venda, apague também os itens relacionados a essa venda.
CREATE OR REPLACE FUNCTION delete_venda_item() RETURNS TRIGGER AS
$$
BEGIN
  DELETE FROM contas_receber WHERE contas_receber.codigo_vendas = old.codigo;
  DELETE FROM venda_itens WHERE venda_itens.codvenda = old.codigo;
  RETURN old;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER delete_venda_item
  BEFORE DELETE
  ON vendas
  FOR EACH ROW
EXECUTE PROCEDURE delete_venda_item();

-- A partir da venda de um item, atualize a quantidade em estoque deste item.
CREATE OR REPLACE FUNCTION update_estoque() RETURNS TRIGGER AS
$$
BEGIN
  UPDATE itens SET estoque = (itens.estoque - new.quantidade) WHERE itens.codigo = new.codigo;
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER update_estoque
  AFTER INSERT
  ON venda_itens
  FOR EACH ROW
EXECUTE PROCEDURE update_estoque();

-- A partir da quantidade comprada de um determinado item, sua quantidade em estoque seja atualizada
-- TODO mesmo problema da questão anterior

-- Baseado nos itens de uma venda (tabela vendas_itens), calcule o “valor total” dessa venda (tabela vendas).
CREATE OR REPLACE FUNCTION update_valor_total() RETURNS TRIGGER AS
$$
BEGIN
  UPDATE vendas
  SET valor_total_venda = (SELECT SUM(valor) FROM venda_itens WHERE codvenda = old.codvenda)
  WHERE vendas.codigo = old.codvenda;
  RETURN new;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER update_valor_total
  BEFORE INSERT OR UPDATE
  ON venda_itens
  FOR EACH ROW
EXECUTE PROCEDURE update_valor_total();
