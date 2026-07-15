SELECT COUNT(DISTINCT country) AS Total_Paises_con_Ventas
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE transaction.declined = 0;
