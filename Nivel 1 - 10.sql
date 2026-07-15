SELECT ROUND(AVG(t.amount),2) AS promedio, cr.iban, co.company_name 
FROM transactions AS t 
INNER JOIN credit_cards AS cr ON t.card_id = cr.id
INNER JOIN companies AS co ON t.business_id = co.company_id
WHERE co.company_name = 'Donec Ltd'
GROUP BY cr.iban;