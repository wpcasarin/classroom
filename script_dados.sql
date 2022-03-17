INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (100,
        'José da Silva',
        'Av. Bento Gonçalves',
        'F',
        'xyz');
INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (101, 'Maria Silveira', 'Tiradentes', 'F', 'xxx');
INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (102, 'Roberto Pereira', 'Dom Pedro II', 'F', 'xyz');
INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (103,
        'Valéria Ferreira',
        'Av. Bento Gonçalves',
        'F',
        'yyy');
INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (104, 'Atacado Martins', 'General Osório', 'J', 'xyz');
INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (105,
        'Mercado Silveira',
        'Gomes Carneiro',
        'J',
        'xxx');
INSERT INTO clientes (codcliente, nome, endereco, tipo_cliente, obs)
VALUES (106,
        'Isabela Medeiros',
        'Av. Carlos Monteiro',
        'F',
        'xyz');
INSERT INTO fones_clientes (cliente, num_telefone)
VALUES (100, 32274586);
INSERT INTO fones_clientes (cliente, num_telefone)
VALUES (101, 32253326);
INSERT INTO fones_clientes (cliente, num_telefone)
VALUES (102, 32273370);
INSERT INTO fones_clientes (cliente, num_telefone)
VALUES (103, 32224586);
INSERT INTO fones_clientes (cliente, num_telefone)
VALUES (104, 32256948);
INSERT INTO fones_clientes (cliente, num_telefone)
VALUES (105, 32226548);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (200,
        'José da Silveira',
        'Marechal Deodoro',
        81754656200,
        3);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (201,
        'Mariana Costa',
        'José Bonifácio',
        77486491460,
        2);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (202,
        'Marcia Gonçalves',
        'Av. Ferreira Viana',
        55684414729,
        2);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (203,
        'Sergio Pires',
        'José Bonifácio',
        87162502300,
        1);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (204,
        'Cristian Tavares',
        'Av. 25 de julho',
        33817362641,
        3);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (205,
        'Mateus Santos',
        'Gonçalves Chaves',
        52564250645,
        1);
INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
VALUES (206,
        'Fabiano Nobre',
        'Av. Dom Joaquim',
        30212787365,
        3);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (01, '2020/05/12', 1000, 'f', 200, 101);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (02, '2020/09/15', 2500, 'f', 206, 100);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (03, '2020/10/20', 1200, 'f', 202, 105);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (04, '2020/01/23', 3000, 'f', 201, 104);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (05, '2020/03/02', 2700, 'a', 204, 101);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (06, '2020/05/16', 5000, 'f', 200, 100);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (07, '2020/08/13', 7000, 'f', 204, 103);
INSERT INTO ordens_servico (numero,
                            data,
                            valor_total,
                            status,
                            codfunc,
                            codcliente)
VALUES (08, '2020/10/05', 3200, 'a', 206, 102);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (01, 750, '2020/05/11', 200, 101, 01);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (02, 2000, '2020/09/13', 206, 100, 02);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (03, 1000, '2020/10/18', 202, 105, 03);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (04, 3000, '2020/01/12', 201, 104, 04);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (05, 2000, '2020/03/01', 204, 101, 05);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (06, 5000, '2020/05/14', 205, 100, 06);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (07, 6700, '2020/08/11', 204, 103, 07);
INSERT INTO vendas (codigo,
                    valor_total_venda,
                    dt_venda,
                    codfunc,
                    codcliente,
                    numero)
VALUES (08, 3100, '2020/12/03', 203, 102, 08);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            data_pagamento,
                            valor_pagamento,
                            codigo_vendas)
VALUES (300,
        '2020/05/13',
        '2020/05/30',
        1000,
        '2020/05/29',
        1000,
        01);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            data_pagamento,
                            valor_pagamento,
                            codigo_vendas)
VALUES (301,
        '2020/09/14',
        '2020/09/29',
        2500,
        '2020/09/28',
        2000,
        02);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            data_pagamento,
                            valor_pagamento,
                            codigo_vendas)
VALUES (302,
        '2020/10/23',
        '2020/10/26',
        1200,
        '2020/10/26',
        1200,
        03);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            data_pagamento,
                            valor_pagamento,
                            codigo_vendas)
VALUES (303,
        '2020/01/23',
        '2020/01/30',
        3000,
        '2020/01/29',
        3000,
        04);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            data_pagamento,
                            valor_pagamento,
                            codigo_vendas)
VALUES (305,
        '2020/03/02',
        '2020/03/10',
        2700,
        '2020/03/10',
        2700,
        05);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            data_pagamento,
                            valor_pagamento,
                            codigo_vendas)
VALUES (306,
        '2020/05/16',
        '2020/05/30',
        5000,
        '2020/05/29',
        5000,
        06);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            codigo_vendas)
VALUES (307, '2020/08/13', '2020/08/22', 7000, 07);
INSERT INTO contas_receber (cod,
                            data_lancamento,
                            data_vencimento,
                            valor,
                            codigo_vendas)
VALUES (308, '2020/10/05', '2020/10/10', 3200, 08);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (01, 200, 160, 'aparelho de pressão', 'p', 500);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (02, 50, 35, 'atadura', 'p', 500);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (03, 250, 180, 'estetoscópio', 'p', 100);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (04, 110, 65, 'termômetro auricular', 'p', 500);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (05, 35, 10, 'tesoura cirúrgica 15 cm', 'p', 500);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (06, 500, 350, 'autoclave 4L analógico', 's', 400);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (07,
        1800,
        1450,
        'centrífuga de bancada com rotor velocidade 0-4000RPM K14-4000',
        'p',
        500);
INSERT INTO itens (codigo, valor, custo, descricao, tipo, estoque)
VALUES (08, 850, 600, 'desumidificador', 'p', 500);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (01, 03, 01, 20, 4000);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (02, 01, 03, 10, 2500);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (03, 02, 04, 5, 550);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (04, 04, 02, 3, 150);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (05, 06, 05, 100, 300);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (06, 05, 02, 250, 8750);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (07, 08, 07, 15, 27000);
INSERT INTO venda_itens (sequencial, codvenda, codigo, quantidade, valor)
VALUES (08, 07, 05, 20, 175);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (01, 02, 03, 2, 600, 600);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (02, 03, 02, 3, 2400, 2400);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (03, 01, 01, 1, 300, 300);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (04, 04, 06, 4, 800, 800);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (05, 08, 05, 5, 1500, 1500);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (06, 07, 04, 2, 2400, 2400);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (07, 05, 08, 3, 90, 90);
INSERT INTO ordens_itens (sequencial,
                          numero,
                          codigo,
                          quantidade,
                          valor,
                          valor_total)
VALUES (08, 06, 07, 2, 300, 300);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (01,
        'Bento e Cia',
        'Dom Pedro II',
        32254896,
        83848582000198);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (02,
        'Mendes Araújo',
        'Av. Dom Joaquim',
        32275692,
        52236265000197);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (03,
        'Bezerra Júnior',
        'Av. Fernando Osório',
        32226578,
        75112555000124);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (04,
        'Fonseca Ltda.',
        'Praça XX de setembro',
        32273370,
        46631334000164);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (05,
        'Joaquim e Cia',
        'Av. Duque de Caxias',
        32227343,
        820824420001 - 99);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (06,
        'Barroso e Barroso',
        'General Osório',
        32296548,
        45995532000144);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (07,
        'Padilha Ltda.',
        'Marechal Deodoro',
        32252571,
        098467580001 - 10);
INSERT INTO fornecedores (codigo, descricao, endereco, contato, cnpj)
VALUES (08,
        'JJ e Cia.',
        'Dom Pedro II',
        32258691,
        22065998000145);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (100, 01, '2016/05/12', 5000, 2568412);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (101, 05, '2016/09/12', 7500, 5647823);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (102, 07, '2016/12/23', 20000, 8457693);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (103, 08, '2017/02/18', 5750, 3254812);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (104, 02, '2017/05/26', 7200, 69854714);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (105, 04, '2017/09/30', 6000, 2145795);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (106, 03, '2017/11/17', 2000, 25478591);
INSERT INTO compras (codigo,
                     codfornecedor,
                     data,
                     valor_total,
                     numero_nota)
VALUES (107, 06, '2017/12/22', 2500, 36547823);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (01, 102, 03, 5, 4000, 4000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (02, 103, 02, 2, 7000, 7000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (03, 105, 07, 3, 4000, 4000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (04, 103, 08, 7, 9000, 9000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (05, 101, 04, 4, 8000, 8000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (06, 106, 01, 2, 5000, 5000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (07, 104, 06, 6, 15000, 15000);
INSERT INTO compras_itens (sequencial,
                           codcompra,
                           coditem,
                           quantidade,
                           valor,
                           valor_total)
VALUES (08, 107, 05, 9, 9000, 9000);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (01,
        2354,
        1,
        '2016/05/15',
        '2016/05/15',
        5000,
        5000,
        '2016/05/10',
        100);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (02,
        2664,
        1,
        '2017/02/22',
        '2017/02/22',
        5750,
        5750,
        '2017/02/18',
        103);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (03,
        2354,
        1,
        '2017/10/15',
        '2017/10/15',
        6000,
        6000,
        '2016/09/30',
        105);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (04,
        5689,
        1,
        '2017/11/23',
        '2017/11/23',
        2000,
        2000,
        '2017/11/17',
        106);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (05,
        1458,
        1,
        '2017/12/25',
        '2017/12/25',
        2500,
        2500,
        '2017/12/22',
        107);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (06,
        6985,
        1,
        '2017/09/26',
        '2017/09/26',
        7500,
        7500,
        '2016/09/16',
        101);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (07,
        7584,
        2,
        '2016/05/27',
        '2016/05/27',
        20000,
        20000,
        '2017/12/23',
        102);
INSERT INTO contas_pagar (numero,
                          num_boleto,
                          tipo,
                          data_vencimento,
                          data_pagamento,
                          valor_pago,
                          valor,
                          data_lancamento,
                          compra)
VALUES (08,
        3658,
        2,
        '2017/05/10',
        '2017/05/30',
        7200,
        7200,
        '2017/05/26',
        104);
INSERT INTO despesas (codigo, descricao)
VALUES (01, 'água');
INSERT INTO despesas (codigo, descricao)
VALUES (02, 'luz');
INSERT INTO despesas (codigo, descricao)
VALUES (03, 'funcionários');
INSERT INTO despesas (codigo, descricao)
VALUES (04, 'produtos de limpeza');
INSERT INTO despesas (codigo, descricao)
VALUES (05, 'material de escritório');
INSERT INTO despesas (codigo, descricao)
VALUES (06, 'telefone');
INSERT INTO despesas (codigo, descricao)
VALUES (07, 'limpeza');
INSERT INTO despesas (codigo, descricao)
VALUES (08, 'seguraça');