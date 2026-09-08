SELECT CAST(timestamp AS DATE) AS date, ROUND(SUM(amount),2) AS total_amount
FROM `sprint3-analytics-alexregueira.sprint3_bronze.transactions_raw`
WHERE timestamp IN (SELECT timestamp 
  FROM `sprint3-analytics-alexregueira.sprint3_bronze.transactions_raw`
  WHERE EXTRACT (YEAR FROM timestamp) = 2021
  ORDER BY DATE(timestamp))
GROUP BY CAST(timestamp AS DATE)
ORDER BY total_amount DESC
LIMIT 5;