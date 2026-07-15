SELECT amount, (
	SELECT company_name 
	FROM company
    WHERE company.id = transaction.company_id
	) AS Company_name
FROM transaction
WHERE amount > (SELECT AVG(amount) FROM transaction);