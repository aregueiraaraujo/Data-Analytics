SELECT *
  EXCEPT(timestamp),
  DATE(timestamp) AS timestamp
FROM `sprint3-analytics-alexregueira.sprint3_sprint3_silver.transactions_recent`
WHERE DATE(timestamp) >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
ORDER BY timestamp DESC;