SELECT COUNT(*) AS productos_sin_venta
FROM `sprint3-analytics-alexregueira.sprint3_gold.product_sales_ranking` 
WHERE total_sold = 0;