SELECT id, company_name
FROM company co 
WHERE id IN (
    SELECT company_id
    FROM transaction t
    WHERE t.company_id = co.id AND declined = 1
) 
AND id NOT IN (
    SELECT company_id
    FROM transaction t
    WHERE t.company_id = co.id AND declined = 0
);
