SELECT COUNT(id) AS total_de_transaciones
FROM transaction
WHERE company_id IN (SELECT id
	FROM company
	WHERE country = "Germany")
AND declined = 0;
