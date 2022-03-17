-- Receba como parâmetro de entrada o código de um item e notifique se este item possui estoque superior a 150 unidades.

CREATE OR REPLACE FUNCTION func_checa_estoque(id NUMERIC) RETURNS TEXT AS
$$
DECLARE
  msg  TEXT;
  item ITENS%ROWTYPE;
BEGIN
  SELECT * INTO item FROM itens WHERE estoque > 150 AND codigo = id;
  IF found THEN
    msg := CONCAT(item.descricao, ' - Possui mais de 150 unidades.');
    RETURN msg;
  END IF;
  msg := CONCAT(item.descricao, ' - Não mais de 150 unidades.');
  RETURN msg;
END;
$$ LANGUAGE 'plpgsql';

SELECT func_checa_estoque(2);

-- Receba como parâmetro de entrada o código de um fornecedor e informe quando foi a última compra que a empresa fez com esse fornecedor.
CREATE OR REPLACE FUNCTION func_ultima_compra(cod_forn INT) RETURNS DATE AS
$$
DECLARE
  ult_compra DATE;
  records    RECORD;
BEGIN
  FOR records IN SELECT *
                 FROM fornecedores f
                        JOIN compras c ON f.codigo = c.codfornecedor
                 WHERE c.codfornecedor = cod_forn
    LOOP
      IF records.data > ult_compra OR ult_compra IS NULL THEN
        ult_compra := records.data;
      END IF;
    END LOOP;
  IF ult_compra IS NULL THEN
    RAISE EXCEPTION 'Nenhuma compra registrada para o fornecedor.';
  END IF;
  RETURN ult_compra;
END;
$$ LANGUAGE 'plpgsql';

SELECT func_ultima_compra(2);

-- Crie um procedimento que receba como parâmetro de entrada o código de um item e um percentual de reajuste; que aplique esse reajuste ao valor do item de código igual ao do dparâmetro de entrada.
CREATE OR REPLACE FUNCTION func_ajusta_preco(id INT, perc NUMERIC) RETURNS VOID AS
$$
DECLARE
  item ITENS%ROWTYPE;
BEGIN
  SELECT * INTO item FROM itens WHERE codigo = id;
  IF found THEN
    UPDATE itens SET valor = valor * (1 + perc) WHERE codigo = id;
    RAISE NOTICE 'Valor atualizado com sucesso.';
    RETURN;
  END IF;
  RAISE EXCEPTION 'ERRO: Item não encontrado';
END;
$$ LANGUAGE 'plpgsql';

SELECT func_ajusta_preco(1, 0.1);

-- Crie um procedimento armazenado que informe o número de clientes sem telefone.
CREATE OR REPLACE FUNCTION func_clt_sem_telefone() RETURNS VOID AS
$$
DECLARE
  records RECORD;
BEGIN
  FOR records IN SELECT *
                 FROM clientes
                        LEFT JOIN fones_clientes fc ON clientes.codcliente = fc.cliente
    LOOP
      IF records.num_telefone IS NULL THEN
        RAISE NOTICE '%', records.nome;
      END IF;
    END LOOP;
END;
$$ LANGUAGE 'plpgsql';

SELECT func_clt_sem_telefone();

-- Crie um procedimento armazenado que receba como parâmetro de entrada o código de um item e que inclua em uma tabela chamada relacao_item_fornecedor (essa tabela deve ser criada antes da criação do procedimento), o código, a descrição e o valor do item que tiver código igual ao parâmetro de entrada, assim como, o código e a descrição do fornecedor referente a esse código de item.
CREATE TABLE relacao_item_fornecedor
(
  id             SERIAL,
  cod_item       INTEGER NOT NULL,
  cod_fornecedor INTEGER NOT NULL,
  descricao_item TEXT    NOT NULL,
  valor_item     NUMERIC NOT NULL,
  FOREIGN KEY (cod_item) REFERENCES itens (codigo),
  FOREIGN KEY (cod_fornecedor) REFERENCES fornecedores (codigo)
);

CREATE OR REPLACE FUNCTION func_relacao_item_fornecedor(id INT) RETURNS VOID AS
$$
DECLARE
  item RECORD;
BEGIN
  SELECT i.codigo, i.descricao, i.valor, c.codfornecedor
  INTO item
  FROM itens i
         LEFT JOIN compras_itens ci ON i.codigo = ci.coditem
         LEFT JOIN compras c ON c.codigo = ci.codcompra
  WHERE i.codigo = id;
  IF found THEN
    INSERT INTO relacao_item_fornecedor(cod_item, cod_fornecedor, descricao_item, valor_item)
    VALUES (item.codigo, item.codfornecedor, item.descricao, item.valor);
    RAISE NOTICE 'Relacao criada com sucesso.';
    RETURN;
  END IF;
  RAISE EXCEPTION 'ERRO: Item não encontrado';
END;
$$ LANGUAGE 'plpgsql';

SELECT func_relacao_item_fornecedor(232);
