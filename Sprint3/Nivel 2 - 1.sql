CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_silver.products_clean` AS
SELECT 
  id AS product_id, 
  product_name AS name, 
  colour AS colour, 
  brand AS brand, 
  category AS category, 
  launch_date AS launch_date, 
  weight AS weight,
  CAST(REPLACE(warehouse_id, 'WH-', '') AS INT64) AS warehouse_id, 
   CAST(price AS FLOAT64) AS price
FROM `sprint3-analytics-alexregueira.sprint3_bronze.products_raw`;


SELECT column_name, data_type
FROM `sprint3-analytics-alexregueira.sprint3_silver`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'products_clean'
ORDER BY ordinal_position;


SELECT * FROM `sprint3-analytics-alexregueira.sprint3_silver.products_clean`
LIMIT 10
