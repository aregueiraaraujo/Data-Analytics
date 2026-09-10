CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_gold.dim_transactions_flat` AS

WITH Produtos_Numerados AS (
  SELECT 
    name,
    CONCAT(
      'SKU_', 
      CASE 
        WHEN ROW_NUMBER() OVER (ORDER BY name) <= 26 THEN CHR(64 + ROW_NUMBER() OVER (ORDER BY name)) 
        ELSE CONCAT(CHR(64 + DIV(ROW_NUMBER() OVER (ORDER BY name) - 1, 26)), CHR(65 + MOD(ROW_NUMBER() OVER (ORDER BY name) - 1, 26))) 
      END
    ) AS product_sku
  FROM (
    SELECT DISTINCT name
    FROM `sprint3-analytics-alexregueira.sprint3_silver.products_clean`
    WHERE name IS NOT NULL
  )
),

Transacciones_Explodidas AS (
  SELECT
    transaction_id, 
    timestamp,
    amount AS total_ticket,
    id_produto_extraido 
  FROM `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean`
  CROSS JOIN UNNEST(product_ids) AS id_produto_extraido
)

SELECT 
  t.transaction_id,
  t.timestamp,
  t.total_ticket,
  sku.product_sku, 
  p.name AS product_name,
  p.price AS product_price
FROM Transacciones_Explodidas AS t
LEFT JOIN `sprint3-analytics-alexregueira.sprint3_silver.products_clean` AS p
  ON t.id_produto_extraido = CAST(p.product_id AS INT64)
LEFT JOIN Produtos_Numerados AS sku
  ON p.name = sku.name
ORDER BY t.transaction_id;