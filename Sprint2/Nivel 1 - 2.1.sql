SELECT DISTINCT country FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE transaction.declined = 0;
