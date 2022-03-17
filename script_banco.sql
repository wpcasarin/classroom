CREATE TABLE clientes
(
  codcliente   INTEGER     NOT NULL,
  CHECK (codcliente > 0),
  nome         VARCHAR(50) NOT NULL,
  endereco     VARCHAR(50) NOT NULL,
  tipo_cliente CHAR(1),
  CHECK (
        tipo_cliente = 'F'
      OR tipo_cliente = 'J'
    ),
  rg           CHAR(15),
  cpf          CHAR(15),
  cnpj         CHAR(14),
  obs          TEXT,
  PRIMARY KEY (codcliente)
);
CREATE TABLE fones_clientes
(
  cliente      INTEGER NOT NULL,
  num_telefone CHAR(10),
  PRIMARY KEY (cliente, num_telefone),
  FOREIGN KEY (cliente) REFERENCES clientes (codcliente)
);
CREATE TABLE funcionarios
(
  codfunc  INTEGER,
  nome     VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  cpf      CHAR(11)    NOT NULL UNIQUE,
  tipo     CHAR(1),
  CHECK (
        tipo = '1'
      OR tipo = '2'
      OR tipo = '3'
    ),
  PRIMARY KEY (codfunc)
);
CREATE TABLE ordens_servico
(
  numero      INTEGER,
  data        DATE,
  valor_total NUMERIC(10, 2),
  status      CHAR(1),
  CHECK (
        status = 'a'
      OR status = 'f'
    ),
  codfunc     INTEGER NOT NULL,
  codcliente  INTEGER NOT NULL,
  PRIMARY KEY (numero),
  FOREIGN KEY (codfunc) REFERENCES funcionarios (codfunc),
  FOREIGN KEY (codcliente) REFERENCES clientes (codcliente)
);
CREATE TABLE vendas
(
  codigo            INTEGER,
  valor_total_venda NUMERIC(10, 2),
  dt_venda          DATE    NOT NULL,
  codfunc           INTEGER NOT NULL,
  codcliente        INTEGER NOT NULL,
  numero            INTEGER,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codfunc) REFERENCES funcionarios (codfunc),
  FOREIGN KEY (codcliente) REFERENCES clientes (codcliente),
  FOREIGN KEY (numero) REFERENCES ordens_servico (numero)
);
CREATE TABLE contas_receber
(
  cod             INTEGER PRIMARY KEY,
  data_lancamento DATE           NOT NULL,
  data_vencimento DATE           NOT NULL,
  valor           NUMERIC(10, 2) NOT NULL,
  data_pagamento  DATE,
  valor_pagamento NUMERIC(10, 2),
  codigo_vendas   INTEGER        NOT NULL,
  FOREIGN KEY (codigo_vendas) REFERENCES vendas (codigo)
);
CREATE TABLE itens
(
  codigo    INTEGER,
  valor     NUMERIC(10, 2) NOT NULL,
  custo     NUMERIC(10, 2) NOT NULL,
  descricao TEXT,
  desconto  NUMERIC(4, 2),
  tipo      CHAR(1),
  CHECK (
        tipo = 'p'
      OR tipo = 's'
    ),
  estoque   REAL,
  PRIMARY KEY (codigo)
);
CREATE TABLE venda_itens
(
  sequencial INTEGER,
  codvenda   INTEGER,
  codigo     INTEGER,
  quantidade REAL,
  valor      NUMERIC(10, 2),
  PRIMARY KEY (sequencial, codvenda),
  FOREIGN KEY (codvenda) REFERENCES vendas (codigo),
  FOREIGN KEY (codigo) REFERENCES itens (codigo)
);
CREATE TABLE ordens_itens
(
  sequencial  SERIAL,
  numero      INTEGER NOT NULL,
  codigo      INTEGER NOT NULL,
  desconto    NUMERIC(4, 2),
  quantidade  REAL,
  valor       NUMERIC(10, 2),
  valor_total NUMERIC(10, 2),
  PRIMARY KEY (sequencial),
  FOREIGN KEY (numero) REFERENCES ordens_servico (numero),
  FOREIGN KEY (codigo) REFERENCES itens (codigo)
);
CREATE TABLE fornecedores
(
  codigo    INTEGER NOT NULL,
  descricao VARCHAR(100),
  endereco  VARCHAR(50),
  contato   VARCHAR(50),
  cnpj      VARCHAR(14) UNIQUE,
  PRIMARY KEY (codigo)
);
CREATE TABLE compras
(
  codigo        INTEGER NOT NULL,
  codfornecedor INTEGER NOT NULL,
  data          DATE,
  valor_total   NUMERIC(10, 2),
  numero_nota   INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codfornecedor) REFERENCES fornecedores (codigo)
);
CREATE TABLE compras_itens
(
  sequencial  SERIAL  NOT NULL,
  codcompra   INTEGER NOT NULL,
  coditem     INTEGER NOT NULL,
  desconto    NUMERIC(4, 2),
  quantidade  INTEGER,
  valor       NUMERIC(10, 2),
  valor_total NUMERIC(10, 2),
  PRIMARY KEY (sequencial),
  FOREIGN KEY (codcompra) REFERENCES compras (codigo),
  FOREIGN KEY (coditem) REFERENCES itens (codigo)
);
CREATE TABLE contas_pagar
(
  numero          INTEGER NOT NULL,
  num_boleto      VARCHAR(30),
  tipo            INTEGER NOT NULL,
  CHECK (
        tipo = '1'
      OR tipo = '2'
    ),
  data_vencimento DATE,
  data_pagamento  DATE,
  valor_pago      NUMERIC(10, 2),
  valor           NUMERIC(10, 2),
  data_lancamento DATE,
  desconto        NUMERIC(10, 2),
  compra          INTEGER,
  despesas        INTEGER,
  PRIMARY KEY (numero),
  FOREIGN KEY (compra) REFERENCES compras (codigo)
);
CREATE TABLE despesas
(
  codigo    INTEGER,
  descricao VARCHAR(50),
  PRIMARY KEY (codigo)
);
ALTER TABLE
  contas_pagar
  ADD
    CONSTRAINT despesas_fkey FOREIGN KEY (despesas) REFERENCES despesas (codigo);