SELECT *
  EXCEPT(timestamp),
  DATE(timestamp) AS timestamp
FROM `sprint3-analytics-alexregueira.sprint3_gold.fact_transactions_optimized`
WHERE DATE(timestamp) >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
ORDER BY timestamp DESC;