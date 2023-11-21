-- transação T1
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

	SELECT f.nome, v.* 
  FROM vendas v
	JOIN funcionarios f USING(codfunc)
	WHERE f.nome ILIKE 'mariana costa';

-- transação T2
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

	INSERT INTO ordens_servico (numero, data, valor_total, status, codfunc, codCliente)
	  VALUES (09, '2023/11/20', 3000, 'f', 201, 105);
	--DELETE FROM ordens_servico WHERE numero = 09;
	
	SELECT * FROM ordens_servico;	
		
	INSERT INTO vendas (codigo, valor_total_venda, dt_venda, codfunc, codcliente, numero)
		VALUES(09, 3000, '2023-11-20', 201, 105, 09);
	--DELETE FROM vendas WHERE numero = 09;
COMMIT;

-- transacao T1
COMMIT; 

SELECT f.nome, v.* 
FROM vendas v
JOIN funcionarios f USING(codfunc)
WHERE f.nome ILIKE 'mariana costa';
