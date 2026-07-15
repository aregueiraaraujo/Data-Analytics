SELECT id, company_name
FROM company 
WHERE NOT EXISTS (
    SELECT 1 FROM transaction 
    WHERE transaction.company_id = company.id
);
