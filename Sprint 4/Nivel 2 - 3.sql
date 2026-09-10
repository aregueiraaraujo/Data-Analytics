WITH Calculo_ventas AS (
  SELECT 
    date AS Fecha,
    total_sales AS Ventas_Hoy,
    SUM(total_sales) OVER (
      PARTITION BY EXTRACT(YEAR FROM date) 
      ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Ventas_acumuladas
  FROM `sprint3-analytics-alexregueira.sprint3_gold.mv_daily_sales`
)

SELECT 
  Fecha,
  ROUND(Ventas_Hoy, 2) AS Ventas_Hoy,
  ROUND(Ventas_acumuladas, 2) AS Ventas_acumuladas
FROM Calculo_Ventas
ORDER BY Fecha DESC
LIMIT 5;