-- transação (T1)
BEGIN;
	SELECT numero, data_vencimento 
	FROM contas_pagar
	WHERE numero = 2;
	
	UPDATE contas_pagar 
	SET data_vencimento = '2017-02-24' 
	WHERE numero = 2;
	
	SELECT numero, data_vencimento 
	FROM contas_pagar
  WHERE numero = 2;

--transação (T2)
BEGIN;
	SELECT codigo, numero_nota 
	FROM compras
	WHERE codigo = 100;
	 
	UPDATE compras 
	SET numero_nota = 2568413 
	WHERE codigo = 100;
	
	SELECT codigo, numero_nota 
	FROM compras
	WHERE codigo = 100;

-- transação (T1)
  UPDATE compras 
  SET numero_nota = 2568413 
  WHERE codigo = 100;

-- transação (T2)
  UPDATE contas_pagar 
  SET data_vencimento = '2017-12-24'
  WHERE numero = 2;