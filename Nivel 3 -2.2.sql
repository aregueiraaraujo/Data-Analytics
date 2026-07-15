DROP TABLE IF EXISTS product_sales;

CREATE TABLE product_sales AS
SELECT ps.id_producto, p.product_name, ps.total_vendas
FROM (
    SELECT jt.id_producto, COUNT(*) AS total_vendas
    FROM transactions t 
    CROSS JOIN JSON_TABLE(
        CAST(CONCAT('[', t.product_ids, ']') AS JSON),
        '$[*]' COLUMNS(id_producto INT PATH '$')
    ) jt
    WHERE t.product_ids IS NOT NULL AND t.product_ids != ''
    GROUP BY jt.id_producto
) ps
JOIN products p
ON ps.id_producto = p.id
ORDER BY ps.id_producto;

SELECT * FROM product_sales;