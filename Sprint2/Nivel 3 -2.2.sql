DROP TABLE IF EXISTS product_sales;

CREATE TABLE product_sales AS
SELECT 
    t.id AS transaction_id, 
    jt.id_producto AS product_id
FROM transactions t 
CROSS JOIN JSON_TABLE(
    CAST(CONCAT('[', t.product_ids, ']') AS JSON),
    '$[*]' COLUMNS(id_producto INT PATH '$')
) jt
WHERE t.product_ids IS NOT NULL 
  AND t.product_ids != '';
  
  SELECT * FROM product_sales;
