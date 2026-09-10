SELECT
  date,
  ROUND(total_sales, 2) AS total_sales
FROM `sprint3-analytics-alexregueira.sprint3_gold.mv_daily_sales`
ORDER BY date DESC
LIMIT 10;