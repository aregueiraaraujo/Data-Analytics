CREATE OR REPLACE MATERIALIZED VIEW `sprint3-analytics-alexregueira.sprint3_gold.mv_daily_sales` AS
SELECT DATE(timestamp) AS date,
  SUM(amount) AS total_sales
FROM `sprint3-analytics-alexregueira.sprint3_gold.fact_transactions_optimized`
GROUP BY date;