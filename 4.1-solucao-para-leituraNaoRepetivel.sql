-- transação T1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	SELECT numero, data_vencimento
	FROM contas_pagar
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';

-- transação 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	UPDATE contas_pagar
	SET data_vencimento = data_vencimento + INTERVAL '5 days'
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';
COMMIT;

-- transação T1
  COMMIT; 
	SELECT numero, data_vencimento
	FROM contas_pagar
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';	