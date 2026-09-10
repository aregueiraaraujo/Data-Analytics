CREATE TEMP FUNCTION calculate_tax(precio FLOAT64, tasa_iva FLOAT64) 
RETURNS FLOAT64 AS (
  precio * (1 + tasa_iva)
);

SELECT 
transaction_id,
product_name,
product_price AS precio_sin_iva,
ROUND(calculate_tax(product_price, 0.21), 2) AS precio_con_iva

FROM `sprint3-analytics-alexregueira.sprint3_gold.dim_transactions_flat`
ORDER BY transaction_id;