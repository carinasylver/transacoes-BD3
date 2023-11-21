-- transacao T1
BEGIN;
	SELECT numero, data_vencimento
	FROM contas_pagar
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';

-- transacao T2
BEGIN;
	UPDATE contas_pagar
	SET data_vencimento = data_vencimento + INTERVAL '5 days'
	WHERE TO_CHAR(data_vencimento, 'YYYY-MM') = '2023-12';
COMMIT;