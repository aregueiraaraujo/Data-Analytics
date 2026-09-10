WITH Datos_usuarios AS(
  SELECT 
    user_id, 
    CONCAT(name,' ',surname) AS nombre_completo, 
    email
  FROM `sprint3-analytics-alexregueira.sprint3_silver.users_combined` AS u
),

Primeras_3_Compras AS (
  SELECT 
    user_id,
    DATE(timestamp) AS fecha,
    amount,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp ASC) AS num_compra
  FROM `sprint3-analytics-alexregueira.sprint3_gold.fact_transactions_optimized`
  QUALIFY num_compra <= 3
),

Calculo_Final AS (
  SELECT
    user_id,
    fecha AS fecha_3ra_compra,
    amount AS importe_3ra_compra,
    AVG(amount) OVER (PARTITION BY user_id) AS media_3_primeras,
    num_compra
  FROM Primeras_3_Compras
  QUALIFY num_compra = 3
)

SELECT 
  u.user_id,
  u.nombre_completo,
  u.email,
  c.fecha_3ra_compra,
  ROUND(c.importe_3ra_compra, 2) AS importe_3ra_compra,
  ROUND(c.media_3_primeras, 2) AS media_3_primeras
FROM Datos_usuarios AS u
JOIN Calculo_Final AS c
  ON u.user_id = c.user_id
ORDER BY u.user_id;