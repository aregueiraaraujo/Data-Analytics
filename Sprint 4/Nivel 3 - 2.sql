SELECT COUNT(product_name) AS unidades_vendidas, product_name
FROM `sprint3-analytics-alexregueira.sprint3_gold.dim_transactions_flat`
GROUP BY product_name
ORDER BY unidades_vendidas DESC
LIMIT 5;