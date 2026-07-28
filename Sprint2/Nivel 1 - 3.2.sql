SELECT amount, (
	SELECT company_name 
	FROM company co
    WHERE co.id = t.company_id AND t.declined = 0 
	) AS Company_name
FROM transaction t
WHERE amount > (SELECT AVG(amount) FROM transaction);
