BEGIN;
  SELECT * FROM funcionarios;

  INSERT INTO funcionarios (codfunc, nome, endereco, cpf, tipo)
  VALUES (201, 'Mariana Costa', 'José Bonifácio', 77486491460, 2);

	SAVEPOINT funcionario_201;
	
	INSERT INTO ordens_servico (numero, data, valor_total, status, codfunc, codCliente)
  VALUES (04, '2023/11/20', 3000, 'f', 201, 104);
	
	
	INSERT INTO vendas (codigo, valor_total_venda, dt_venda, codfunc, codcliente, numero)
		VALUES(04, 3000, '2023-11-20', 201, 104, 00);
	
  SELECT * FROM vendas; 

	ROLLBACK TO funcionario_201;

  SELECT * FROM funcionarios;
COMMIT;