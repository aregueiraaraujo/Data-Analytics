SELECT co.company_name, co.country, DATE(t.timestamp), t.amount
FROM `sprint3-analytics-alexregueira.sprint3_bronze.companies_raw` AS co
JOIN `sprint3-analytics-alexregueira.sprint3_bronze.transactions_raw` AS t
ON t.business_id = co.company_id
WHERE t.amount > 100 AND t.amount <200 AND (
DATE (timestamp) IN ('2015-04-29', '2018-07-20', '2024-03-13'))
ORDER BY amount;