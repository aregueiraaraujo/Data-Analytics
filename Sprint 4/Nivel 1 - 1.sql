SELECT t.amount, t.declined, DATE(t.timestamp) AS date
FROM `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean` AS t
JOIN `sprint3-analytics-alexregueira.sprint3_silver.companies_clean` AS co
ON t.business_id = co.company_id
WHERE co.country = 'Germany'AND DATE(t.timestamp) = '2022-03-12'
ORDER BY t.amount DESC;