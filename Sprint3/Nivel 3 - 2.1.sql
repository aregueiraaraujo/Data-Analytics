CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_gold.product_sales_ranking` AS 
WITH product_sales AS (
   SELECT product_id_sold, COUNT(*) total_sold
   FROM `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean`,
      UNNEST(product_ids) AS product_id_sold
   GROUP BY product_id_sold
)
SELECT 
   p.product_id,
   p.name,
   p.price,
   p.colour,
   IFNULL(ps.total_sold, 0) AS total_sold
FROM `sprint3-analytics-alexregueira.sprint3_silver.products_clean` AS p
LEFT JOIN product_sales AS ps
ON  p.product_id = ps.product_id_sold
ORDER BY total_sold DESC;
