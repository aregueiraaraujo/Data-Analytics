CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_silver.transactions_recent` AS
SELECT * 
  EXCEPT(timestamp),
  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL CAST(RAND() * 50 AS INT64) DAY) AS timestamp
FROM `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean`;