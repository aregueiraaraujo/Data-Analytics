SELECT ROUND(SUM(t.amount),2) AS total, t.time_stamp
FROM transactions AS t
INNER JOIN companies AS co ON co.company_id = t.business_id
WHERE t.declined = 0
GROUP BY t.time_stamp
ORDER BY total DESC
LIMIT 5;
