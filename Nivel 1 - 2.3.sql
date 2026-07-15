SELECT company.company_name, ROUND(AVG(amount),2) AS media_de_ventas FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE transaction.declined = 0
GROUP BY company.company_name
ORDER BY media_de_ventas DESC
LIMIT 1;

