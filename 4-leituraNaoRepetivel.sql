-- transacao T1
BEGIN;
	SELECT numero, data_vencimento
	FROM contas_pagar
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';

-- transacao 2
BEGIN;
	UPDATE contas_pagar
	SET data_vencimento = data_vencimento + INTERVAL '5 days'
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';
COMMIT;

-- transacao T1
	SELECT numero, data_vencimento
	FROM contas_pagar
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';