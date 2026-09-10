CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_gold.fact_transactions_optimized`
PARTITION BY DATE(timestamp)
CLUSTER BY business_id
AS
SELECT * 
FROM `sprint3-analytics-alexregueira.sprint3_silver.transactions_recent`;